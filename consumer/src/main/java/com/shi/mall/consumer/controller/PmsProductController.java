package com.shi.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shi.api.annotation.SystemLog;
import com.shi.api.annotation.UserLoginToken;
import com.shi.api.dto.PmsProductQueryParam;
import com.shi.api.enums.LogType;
import com.shi.api.model.PmsProduct;
import com.shi.api.service.IPmsProductService;
import com.shi.api.service.IUserService;
import com.shi.common.response.CommonPage;
import com.shi.common.response.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

import java.util.List;


/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 15:48
 **/

@RestController
@Api(tags = "PmsProductController",description = "商品管理")
@RequestMapping("/product")
@CrossOrigin
public class PmsProductController {

    @Reference(
            version = "1.0.0",
            interfaceName = "com.shi.api.service.IPmsProductService",
            interfaceClass = IPmsProductService.class
    )
    private IPmsProductService productService;

    @ApiOperation("查询商品")
    @GetMapping("/list")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "查询商品",type = LogType.PRODUCT_LIST)
    public CommonResult<CommonPage<PmsProduct>> getList(
            PmsProductQueryParam pmsProductQueryParam,
            @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
            @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum
    ){
        return CommonResult.success(productService.list(pmsProductQueryParam,pageSize,pageNum));
    }
}
