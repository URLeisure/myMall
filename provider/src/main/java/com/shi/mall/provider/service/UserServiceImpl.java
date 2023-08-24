package com.shi.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.shi.api.dto.PmsProductQueryParam;
import com.shi.api.model.PmsProductExample;
import com.shi.api.model.UmsAdmin;
import com.shi.api.service.IUserService;
import com.shi.common.response.CommonPage;
import com.shi.mall.provider.mapper.PmsProductMapper;
import com.shi.mall.provider.mapper.UmsAdminMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/07/30 22:53
 **/
@Service(
        version = "1.0.0",
        interfaceName = "com.shi.api.service.IUserService",//实现多个接口时才用到 interfaceName
        interfaceClass = IUserService.class
)
public class UserServiceImpl implements IUserService {

    @Autowired
    private UmsAdminMapper dao;

    @Autowired
    private TokenServiceImpl service;
    @Override
    public UmsAdmin findByUsername(String username) {
        return dao.findByUsername(username);
    }

    @Override
    public UmsAdmin findByToken(String token) {
        String userId = service.getUserid(token);
        return findUserById(Long.parseLong(userId));
    }

    @Override
    public UmsAdmin findUserById(Long userId) {
        return dao.selectByPrimaryKey(userId);
    }

    @Override
    public UmsAdmin reg(UmsAdmin admin) {
        admin.setIcon("https://tupian.qqw21.com/article/UploadPic/2020-12/2020122122203578674.jpg");
        dao.insert(admin);
        return admin;
    }
}
