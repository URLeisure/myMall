package com.shi.mall.provider.component;

import com.shi.api.service.IOmsOrderService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.amqp.rabbit.annotation.RabbitHandler;
import org.springframework.amqp.rabbit.annotation.RabbitListener;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/09/22 12:56
 **/
@Component
@RabbitListener(queues = "mall.order.cancel")
public class CancelOrderReceiver {
    private static Logger LOGGER = LoggerFactory.getLogger(CancelOrderReceiver.class);
    @Autowired
    private IOmsOrderService service;//不用dubbo，所以不用Reference
    @RabbitHandler
    public void handle(Long orderId){
        service.cancelOrder(orderId);
        LOGGER.info("process orderId:{}",orderId);
    }
}
