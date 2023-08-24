package com.shi.api.service;

import com.shi.api.dto.PmsProductQueryParam;
import com.shi.api.dto.UmsAdminLoginParam;
import com.shi.api.model.UmsAdmin;
import com.shi.common.response.CommonPage;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/07/30 22:50
 **/

public interface IUserService {
    public UmsAdmin findByUsername(String username);

    UmsAdmin findByToken(String token);

    UmsAdmin findUserById(Long userId);
    UmsAdmin reg(UmsAdmin admin);
}
