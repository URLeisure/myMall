package com.shi.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shi.api.enums.LogType;
import com.shi.api.annotation.SystemLog;
import com.shi.api.annotation.UserLoginToken;
import com.shi.api.dto.UmsAdminLoginParam;
import com.shi.api.model.UmsAdmin;
import com.shi.api.service.ITokenService;
import com.shi.api.service.IUserService;
import com.shi.common.response.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/07/30 21:43
 **/
@RestController
@Api(tags = "UmsUserController", description = "后台用户登录")
@RequestMapping("/admin")
@CrossOrigin//解决跨域问题
public class UmsUserController {

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

    @Value("${jwt.tokenHead}")
    private String tokenHead;

    @Value("${jwt.tokenHeader}")
    private String tokenHeader;


    @ApiOperation(value = "登录后返回token")
    @ResponseBody
    @PostMapping("/login")
    public CommonResult login(@RequestBody UmsAdminLoginParam user) {
        //根据用户名判断该用户是否存在
        UmsAdmin user1 = userService.findByUsername(user.getUsername());
        if (user1 == null) {
            return CommonResult.validateFailed("该用户不存在");
        } else {
            //判断密码是否正确
            if (!user1.getPassword().equals(user.getPassword())) {
                Map<String, String> tokenMap = new HashMap<>();
                tokenMap.put("error_code", "500");
                return CommonResult.failed(tokenMap);
            } else {//返回token
                //获取token
                String token = tokenService.getToken(user1.getId().toString(), user1.getPassword());
                //向前端发送token
                Map<String, String> tokenMap = new HashMap<>();
                tokenMap.put("token", token);
                tokenMap.put("error_code", "200");
                tokenMap.put("tokenHead", tokenHead);
                return CommonResult.success(tokenMap);
            }
        }
    }

    @GetMapping("/info")
    @ApiOperation(value = "前端获取当前登录用户信息")
    @SystemLog(description = "前端获取当前登录用户信息", type = LogType.USER_LOGIN_OUT)
    @UserLoginToken(required = true)
    @ResponseBody
    public CommonResult info(HttpServletRequest request) {
        //获取token
        String token = request.getHeader(tokenHeader);
        //以 @ 为分割，去掉 token 头，获取后面的 token
        UmsAdmin user = userService.findByToken(token.split("@")[1]);

        Map<String, Object> data = new HashMap<>();
        data.put("username", user.getUsername());//用户名
        data.put("roles", new String[]{"TEST"});//用户规则
        data.put("icon", user.getIcon());//用户头像
        return CommonResult.success(data);
    }

    @PostMapping("/logout")
    @ApiOperation(value = "用户登出")
    @SystemLog(description = "用户登出", type = LogType.USER_LOGIN_OUT)
    @UserLoginToken(required = true)
    @ResponseBody
    public CommonResult logout() {
        return CommonResult.success(null);
    }

    @ApiOperation(value = "用户注册")
    @PostMapping("/reg")
    @ResponseBody
    public CommonResult reg(@RequestBody UmsAdmin umsAdmin) {
        //判断该用户是否存在
        if (userService.findByUsername(umsAdmin.getUsername()) != null) {//存在
            Map<String, String> tokenMap = new HashMap<>();
            tokenMap.put("error_cide", "500");
            return CommonResult.failed(tokenMap);
        }

        UmsAdmin admin = new UmsAdmin();
        //不存在，存入数据库
        admin = userService.reg(umsAdmin);//返回后带 主键-》id
        Map<String, String> tokenMap = new HashMap<>();
        tokenMap.put("error_code", "200");

        return CommonResult.success(tokenMap);
    }
}
