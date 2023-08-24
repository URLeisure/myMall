package com.shi.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shi.api.annotation.SystemLog;
import com.shi.api.annotation.UserLoginToken;
import com.shi.api.enums.LogType;
import com.shi.api.model.PmsBrand;
import com.shi.api.service.IPmsBrandService;
import com.shi.common.response.CommonPage;
import com.shi.common.response.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.web.bind.annotation.*;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 19:25
 **/
@RestController
@Api(tags = "PmsBrandController",description = "品牌管理")
@RequestMapping("/brand")
@CrossOrigin
public class PmsBrandController {
    @Reference(
            version = "1.0.0",
            interfaceName = "com.shi.api.service.IPmsBrandService",
            interfaceClass = IPmsBrandService.class
    )
    private IPmsBrandService brandService;

    @ApiOperation("根据品牌名称分页获取品牌列表")
    @GetMapping("/list")
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "品牌列表",type = LogType.BRAND_LIST)
    public CommonResult<CommonPage<PmsBrand>> getList(
            @RequestParam(value = "keyword",required = false) String keyword,
            @RequestParam(value = "pageSize",defaultValue = "5") Integer pageSize,
            @RequestParam(value = "pageNum",defaultValue = "1") Integer pageNum
    ){
        return CommonResult.success(brandService.listBrand(keyword,pageNum,pageSize));
    }
}
