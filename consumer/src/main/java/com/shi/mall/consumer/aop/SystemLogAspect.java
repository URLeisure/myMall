package com.shi.mall.consumer.aop;

import com.alibaba.dubbo.config.annotation.Reference;
import com.alibaba.fastjson.JSON;
import com.shi.api.annotation.SystemLog;
import com.shi.api.model.UmsAdmin;
import com.shi.api.model.UmsLog;
import com.shi.api.service.ITokenService;
import com.shi.api.service.IUmsLogService;
import com.shi.api.service.IUserService;
import com.shi.common.util.IpInfoUtil;
import com.shi.common.util.ThreadPoolUtil;
import lombok.extern.slf4j.Slf4j;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.NamedThreadLocal;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.servlet.HandlerInterceptor;


import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: 扑腾的江鱼
 * @description: TODO AOP实现日志管理
 * @create: 2023/08/02 20:09
 **/
@Aspect
@Component
@Slf4j
public class SystemLogAspect implements HandlerInterceptor {

    private static final ThreadLocal<Date> beginTimeThreadLocal = new NamedThreadLocal<>("ThreadLocal beginTime");

    @Value("${jwt.tokenHeader}")
    private String tokenHeader;

    @Reference(
            version = "1.0.0",
            interfaceName = "com.shi.api.service.IUserService",//实现多个接口时才用到 interfaceName
            interfaceClass = IUserService.class,
            timeout = 120000
    )
    private IUserService userService;

    @Reference(
            version = "1.0.0",
            interfaceName = "com.shi.api.service.ITokenService",//实现多个接口时才用到 interfaceName
            interfaceClass = ITokenService.class,
            timeout = 120000
    )
    private ITokenService tokenService;

    @Reference(
            version = "1.0.0",
            interfaceName = "com.shi.api.service.IUmsLogService",//实现多个接口时才用到 interfaceName
            interfaceClass = IUmsLogService.class,
            timeout = 120000
    )
    private IUmsLogService umsLogService;

    @Pointcut("@annotation(com.shi.api.annotation.SystemLog)")
    public void controllerAspect() {
        System.out.println();
    }

    @Before("controllerAspect()")
    public void before() {
        Date beginTime = new Date();
        beginTimeThreadLocal.set(beginTime);
    }

    @AfterReturning("controllerAspect()")
    public void after(JoinPoint joinPoint) {
        try {
            //获取当前操作用户 token
            ServletRequestAttributes attributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
            HttpServletRequest request = attributes.getRequest();
            String token = request.getHeader(tokenHeader);
            //防 hacker
            if (token == null) {
                throw new RuntimeException("无 token，请重新登录");
            }
            //去掉 token 头
            token = token.split("@")[1];

            //判断 token 是否合法 ->获取用户名和密码，判断是否与数据库中数据一致
            Long userId = Long.parseLong(tokenService.getUserid(token));
            UmsAdmin user = userService.findUserById(userId);
            if (user == null) {
                throw new RuntimeException("用户不存在，请重新登录");
            }
            if (!tokenService.checkSign(token, user.getPassword())) {
                throw new RuntimeException("token 验证失败");
            }

            //验证完毕 将日志存入数据库
            UmsLog umsLog = new UmsLog();
            umsLog.setUserid(Math.toIntExact(userId));
            //获取当前连接点的描述和类型->存入日志名字和类型
            Map<String, Object> map = getControllerMethodInfo(joinPoint);
            umsLog.setName(map.get("description").toString());
            umsLog.setLogType(Integer.parseInt(map.get("type").toString()));
            //存入操作路径和操作方法名
            umsLog.setRequestUrl(request.getRequestURI());
            umsLog.setRequestType(request.getMethod());
            //存入请求参数（操作内容）
            Map<String, String[]> requestParams = request.getParameterMap();
            String objectStr = JSON.toJSONString(requestParams).replace(",","&&");
            umsLog.setRequestParam(objectStr.replace("\"","\'"));
            //存入用户 ip    IpInfoUtil自己写的
            umsLog.setIp(IpInfoUtil.getIpAddr(request));
            //存入创建时间
            umsLog.setCreateTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            //存入更新时间
            umsLog.setUpdateTime(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            //计算耗时
            Long beginTime = beginTimeThreadLocal.get().getTime();
            Long endTime = System.currentTimeMillis();
            Long cost = (endTime - beginTime);
            umsLog.setCostTime(cost.intValue());
            //使用线程池多线程存入数据库 ThreadPoolUtil、SaveSystemLogThread自己写的
            ThreadPoolUtil.getPool().execute(new SaveSystemLogThread(umsLog,umsLogService));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private Map<String, Object> getControllerMethodInfo(JoinPoint joinPoint) {
        Map<String, Object> map = new HashMap<>();
        //获取当前连接点签名
        MethodSignature methodSignature = (MethodSignature) joinPoint.getSignature();
        //获取该连接点的反射 method
        Method method = methodSignature.getMethod();

        //获取该方法的注解描述
        String description = method.getAnnotation(SystemLog.class).description();
        //获取该方法的注解类型 的编号
        int type = method.getAnnotation(SystemLog.class).type().ordinal();

        map.put("description", description);
        map.put("type", type);
        return map;
    }
}
