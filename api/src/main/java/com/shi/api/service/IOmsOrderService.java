package com.shi.api.service;

import com.shi.api.dto.OmsOrderQueryParam;
import com.shi.api.dto.OmsReceiverInfoParam;
import com.shi.api.model.OmsOrder;
import com.shi.common.response.CommonPage;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/09/21 22:25
 **/

public interface IOmsOrderService {
    CommonPage list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum) ;

    /**
     * 获取指定订单详情
     */
    OmsOrder detail(Long id);

    /**
     * 批量删除订单
     */
    int delete(Long id);

    /**
     * 修改订单收货人信息
     */

    OmsOrder updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam);

    /**
     * 发送延迟消息取消订单
     */

    //根据id 取消订单
    void sendDelayMessageCancelOrder(Long orderId,int minute);

    OmsOrder cancelOrder(Long orderId) ;

    void clearOrder();
}
