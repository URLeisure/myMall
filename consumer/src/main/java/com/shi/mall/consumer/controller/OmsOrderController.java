package com.shi.mall.consumer.controller;

import com.alibaba.dubbo.config.annotation.Reference;
import com.shi.api.annotation.SystemLog;
import com.shi.api.annotation.UserLoginToken;
import com.shi.api.dto.OmsOrderQueryParam;
import com.shi.api.dto.OmsReceiverInfoParam;
import com.shi.api.enums.LogType;
import com.shi.api.model.OmsOrder;
import com.shi.api.service.IOmsOrderService;
import com.shi.common.response.CommonPage;
import com.shi.common.response.CommonResult;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/09/21 22:23
 **/
@Controller
@Api(tags = "OmsOrderController", description = "订单管理")
@RequestMapping("/order")
@CrossOrigin
public class OmsOrderController {

    @Reference(
            version = "1.0.0",interfaceClass = IOmsOrderService.class,
            interfaceName = "com.shi.api.service.IOmsOrderService",
            timeout =120000
    )
    private IOmsOrderService orderService;

    @ApiOperation("查询订单")
    @RequestMapping(value = "/list", method = RequestMethod.GET)
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "查询订单", type = LogType.ORDER_LIST)
    public CommonResult<CommonPage<OmsOrder>> list(OmsOrderQueryParam queryParam,
                                                   @RequestParam(value = "pageSize", defaultValue = "5") Integer pageSize,
                                                   @RequestParam(value = "pageNum", defaultValue = "1") Integer pageNum) {

        //调用orderService的list方法查询订单
        return CommonResult.success(orderService.list(queryParam, pageSize, pageNum));
    }

    @ApiOperation("获取订单详情:订单信息、商品信息、操作记录")
    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "获取订单详情:订单信息、商品信息、操作记录", type = LogType.ORDER_DETAIL)
    public CommonResult<OmsOrder> detail(@PathVariable Long id) {
        OmsOrder orderDetailResult = orderService.detail(id);
        return CommonResult.success(orderDetailResult);
    }


    @ApiOperation("删除订单")
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "批量删除订单", type = LogType.ORDER_DELETE)
    public CommonResult delete(@RequestParam("ids") List<Long> ids) {

        CommonResult commonResult;
        try{
            ids.forEach(c-> orderService.delete(c));
            commonResult = CommonResult.success(1);//修改成功一条记录
        }catch(Exception e){
            commonResult = CommonResult.failed();
            e.printStackTrace();
        }
        return commonResult;
    }


    @ApiOperation("修改收货人信息")
    @RequestMapping(value = "/update/receiverInfo", method = RequestMethod.POST)
    @ResponseBody
    @UserLoginToken
    //@SystemLog(description = "修改收货人信息", type = LogType.ORDER_RECEIVER_UPDATE)
    public CommonResult updateReceiverInfo(@RequestBody OmsReceiverInfoParam receiverInfoParam) {
        CommonResult commonResult;
        try{
            orderService. updateReceiverInfo(receiverInfoParam);
            commonResult = CommonResult.success(1);//修改成功一条记录
        }catch(Exception e){
            commonResult = CommonResult.failed();
            e.printStackTrace();
        }
        return commonResult;
    }
    @ApiOperation("取消单个超时订单")
    @RequestMapping(value = "/cancelOrder",method = RequestMethod.POST)
    @ResponseBody
    @UserLoginToken
    @SystemLog(description = "取消单个超时订单", type = LogType.ORDER_CANCEL)
    public CommonResult cancelOrder(@RequestParam("ids") List<Long> ids,@RequestParam("minute") int minute){
        //演示之前 先把OmsOrder中的 status改为0，这样就可以演示自动取消订单了
        orderService.sendDelayMessageCancelOrder(ids.get(0),minute);
        return CommonResult.success(null);
    }
}
