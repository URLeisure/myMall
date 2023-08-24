package com.shi.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shi.api.annotation.SystemLog;
import com.shi.api.annotation.UserLoginToken;
import com.shi.api.enums.LogType;
import com.shi.api.model.PmsProductCategory;
import com.shi.api.service.IPmsProductCategoryService;
import com.shi.common.response.CommonPage;
import com.shi.common.response.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 19:42
 **/
@Api(tags = "PmsProductCategoryController",description = "商品分类管理")
@RestController
@RequestMapping("/productCategory")
@CrossOrigin
public class PmsProductCategoryController {

    @Reference(
            version = "1.0.0",
            interfaceName = "com.shi.api.service.IPmsProductCategoryService",
            interfaceClass = IPmsProductCategoryService.class
    )
    private IPmsProductCategoryService productCategoryService;

    @ApiOperation("查询所有一级跟类及其子类")
    @RequestMapping(value = "/list/withChildren",method = RequestMethod.GET)
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "分页查询商品分类",type = LogType.PRODUCT_CATEGORY_LIST)
    public CommonResult<List<PmsProductCategory>> listWithChildren(){
        return CommonResult.success(productCategoryService.listWithChildren());
    }
}
