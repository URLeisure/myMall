package com.shi.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.shi.api.model.PmsProductCategory;
import com.shi.api.service.IPmsProductCategoryService;
import com.shi.common.response.CommonPage;
import com.shi.mall.provider.mapper.PmsProductCategoryMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;

import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 19:49
 **/
@Service(
        version = "1.0.0",
        interfaceName = "com.shi.api.service.IPmsProductCategoryService",
        interfaceClass = IPmsProductCategoryService.class
)
public class PmsProductCategoryServiceImpl implements IPmsProductCategoryService {
    @Autowired
    private PmsProductCategoryMapper dao;

    @Override
    public CommonPage getList(Long parentId, Integer pageSize, Integer pageNum) {
        return null;
    }
    @Cacheable(cacheNames = {"ProductCategoryList"},unless = "#result==null")
    @Override
    public List<PmsProductCategory> listWithChildren() {
        return dao.listWithChildren();
    }
}
