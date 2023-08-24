package com.shi.api.service;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/07/30 23:18
 **/

public interface ITokenService {
    public String getToken(String userId,String password);

    String getUserid(String token);

    boolean checkSign(String token, String password);
}
