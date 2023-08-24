package com.shi.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.shi.api.dto.PmsProductQueryParam;
import com.shi.api.model.PmsProductExample;
import com.shi.api.service.IPmsProductService;
import com.shi.api.service.IUmsLogService;
import com.shi.common.response.CommonPage;
import com.shi.mall.provider.mapper.PmsProductMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.ObjectUtils;

import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 16:12
 **/
@Service(
        version = "1.0.0",
        interfaceName = "com.shi.api.service.IPmsProductService",
        interfaceClass = IPmsProductService.class
)
public class PmsProductServiceImpl implements IPmsProductService {

    @Autowired
    private PmsProductMapper dao;

    @Cacheable(cacheNames = {"ProductList"},unless = "#result==null",
        key = "T(String).valueOf(#pageNum+'-'+#pageSize)"+
                ".concat(#productQueryParam.keyword!=null?#productQueryParam.keyword:'k')"+
                ".concat(#productQueryParam.verifyStatus!=null?#productQueryParam.verifyStatus:'v')"+
                ".concat(#productQueryParam.publishStatus!=null?#productQueryParam.publishStatus:'ps')"+
                ".concat(#productQueryParam.productSn!=null?#productQueryParam.productSn:'pn')"+
                ".concat(#productQueryParam.brandId!=null?#productQueryParam.brandId:'bi')"+
                ".concat(#productQueryParam.productCategoryId!=null?#productQueryParam.productCategoryId:'pc')"
    )
    @Override
    public CommonPage list(PmsProductQueryParam productQueryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        //根据前端传入信息，对数据库数据进行条件筛选
        PmsProductExample productExample = new PmsProductExample();
        PmsProductExample.Criteria criteria = productExample.createCriteria();
        //DeleteStatus：0-》未被删除 1-》已被删除
        // 只从未被删除的商品中进行筛选
        criteria.andDeleteStatusEqualTo(0);
        //开始附加条件
        //上架状态
        if (productQueryParam.getPublishStatus() != null) {
            criteria.andPublishStatusEqualTo(productQueryParam.getPublishStatus());
        }
        //审核状态
        if (productQueryParam.getVerifyStatus() != null) {
            criteria.andVerifyStatusEqualTo(productQueryParam.getVerifyStatus());
        }
        //商品模糊关键字
        if (!ObjectUtils.isEmpty(productQueryParam.getKeyword())) {
            criteria.andNameLike("%" + productQueryParam.getKeyword() + "%");
        }
        //商品货号
        if (!ObjectUtils.isEmpty(productQueryParam.getProductSn())) {
            criteria.andProductSnEqualTo(productQueryParam.getProductSn());
        }
        //商品分类编号
        if (productQueryParam.getProductCategoryId() != null) {
            criteria.andProductCategoryIdEqualTo(productQueryParam.getProductCategoryId());
        }
        //商品品牌编号
        if (productQueryParam.getBrandId() != null) {
            criteria.andBrandIdEqualTo(productQueryParam.getBrandId());
        }
        List list = dao.selectByExample(productExample);
        return CommonPage.restPage(list);

    }
}
