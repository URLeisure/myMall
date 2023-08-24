package com.shi.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.shi.api.service.ITokenService;

import java.util.Date;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/07/30 23:19
 **/
@Service(
        version = "1.0.0",
        interfaceName = "com.shi.api.service.ITokenService",//实现多个接口时才用到 interfaceName
        interfaceClass = ITokenService.class
)
public class TokenServiceImpl implements ITokenService {

    private static final long time_minute = 1000 * 60;

    private static final long EXPIRE_TIME = time_minute * 5;//5min
    @Override
    public String getToken(String userId, String password) {
        String token = "";
        try{
            Date data = new Date(System.currentTimeMillis() + EXPIRE_TIME);
            token = JWT.create().withAudience(userId).withExpiresAt(data).sign(Algorithm.HMAC256(password));
        }catch (Exception e){
            e.printStackTrace();
        }
        return token;
    }

    @Override
    public String getUserid(String token) {
        try{
            String userId = JWT.decode(token).getAudience().get(0);
            return userId;
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public boolean checkSign(String token, String password) {
        if(token == null){
            throw new RuntimeException("无token，请重新登录");
        }
        try {
            JWTVerifier jwtVerifier = JWT.require(Algorithm.HMAC256(password)).build();
            jwtVerifier.verify(token);

        }catch (Exception e){
            throw new RuntimeException("token无效，请重新登录！");
        }
        return true;
    }
}
