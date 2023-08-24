package com.shi.mall.consumer.interceptor;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shi.api.annotation.UserLoginToken;
import com.shi.api.model.UmsAdmin;
import com.shi.api.service.ITokenService;
import com.shi.api.service.IUserService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.lang.reflect.Method;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 在核心操作前拦截进行身份验证
 * @create: 2023/08/04 19:08
 **/
@Component
public class AuthenticationInterceptor implements HandlerInterceptor {
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

    @Value("${jwt.tokenHeader}")
    private String tokenHeader;

    @Override//执行核心业务前，验证 token是否正确
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        //获取 token
        String token = request.getHeader(tokenHeader);

        if(!(handler instanceof HandlerMethod)){//判断该方法是否是controller中的
            return true;
        }
        //获取该方法映射
        HandlerMethod handlerMethod = (HandlerMethod) handler;
        Method m = handlerMethod.getMethod();
        //检查该方法需不需要验证 token
        if(m.isAnnotationPresent(UserLoginToken.class)){
            //判断
            UserLoginToken userLoginToken = m.getAnnotation(UserLoginToken.class);
            if(userLoginToken.required()){//需要验证
                if (token == null){
                    throw new RuntimeException("无 token,请重新登录");
                }
                //获取我们需要的 token格式
                token = token.split("@")[1];
                //开始验证 token 是不是符合规范
                //1. 取出userId，判断是否在数据库中
                long userId = Long.parseLong(tokenService.getUserid(token));
                UmsAdmin user = userService.findUserById(userId);
                if(user == null){
                    throw new RuntimeException("用户不存在，请重新登陆！");
                }
                //用户存在，检验 token 密码加密是否正确
                if(tokenService.checkSign(token,user.getPassword())){
                    return true;
                }else {
                    throw new RuntimeException("无效token!");
                }
                

            }
        }
        return true;
    }
}
