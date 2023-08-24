package com.shi.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.shi.api.model.PmsBrand;
import com.shi.api.model.PmsBrandExample;
import com.shi.api.service.IPmsBrandService;
import com.shi.common.response.CommonPage;
import com.shi.mall.provider.mapper.PmsBrandMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 19:28
 **/
@Service(
        version = "1.0.0",
        interfaceName = "com.shi.api.service.IPmsBrandService",
        interfaceClass = IPmsBrandService.class
)
public class PmsBrandServiceImpl implements IPmsBrandService {

    @Autowired
    private PmsBrandMapper dao;
    @Cacheable(cacheNames = {"BrandList"},unless = "#result==null",
        key = "#keyword!=null?#keyword+'-'+#pageNum+'-'+#pageSize:#pageNum+'-'+#pageSize"
    )
    @Override
    public CommonPage listBrand(String keyword, Integer pageNum, Integer pageSize) {
        PageHelper.startPage(pageNum,pageSize);

        PmsBrandExample pmsBrandExample = new PmsBrandExample();
        pmsBrandExample.setOrderByClause("id");
        PmsBrandExample.Criteria criteria= pmsBrandExample.createCriteria();
        if(!ObjectUtils.isEmpty(keyword)){
            criteria.andNameLike("%"+keyword+"%");
        }
        List<PmsBrand> brandList = dao.selectByExample(pmsBrandExample);
        return CommonPage.restPage(brandList);
    }
}
