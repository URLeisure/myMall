package com.shi.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.shi.api.model.UmsLog;
import com.shi.api.service.IUmsLogService;
import com.shi.mall.provider.mapper.UmsLogMapper;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/04 19:00
 **/
@Service(
        version = "1.0.0",
        interfaceName = "com.shi.api.service.IUmsLogService",//实现多个接口时才用到 interfaceName
        interfaceClass = IUmsLogService.class
)
public class UmsLogServiceImpl implements IUmsLogService {

    @Autowired
    private UmsLogMapper dao;

    @Override
    public Integer insert(UmsLog umsLog) {
        return dao.insert(umsLog);
    }
}
