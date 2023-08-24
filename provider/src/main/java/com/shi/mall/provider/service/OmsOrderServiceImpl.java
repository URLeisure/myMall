package com.shi.mall.provider.service;

import com.alibaba.dubbo.config.annotation.Service;
import com.github.pagehelper.PageHelper;
import com.shi.api.dto.OmsOrderQueryParam;
import com.shi.api.dto.OmsReceiverInfoParam;
import com.shi.api.model.*;
import com.shi.api.service.IOmsOrderService;
import com.shi.common.response.CommonPage;
import com.shi.mall.provider.component.CancelOrderSender;
import com.shi.mall.provider.mapper.OmsOrderItemMapper;
import com.shi.mall.provider.mapper.OmsOrderMapper;
import com.shi.mall.provider.mapper.OmsOrderOperateHistoryMapper;
import com.shi.mall.provider.mapper.PmsSkuStockMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.CacheManager;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.util.CollectionUtils;

import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/09/21 22:26
 **/
@Service(
        version = "1.0.0",
        interfaceName = "com.shi.api.service.IOmsOrderService",
        interfaceClass = IOmsOrderService.class
)
//@Transactional
public class OmsOrderServiceImpl implements IOmsOrderService {

    @Autowired
    private CacheManager cacheManager;
    @Autowired
    private OmsOrderMapper orderMapper;

    @Autowired
    private CancelOrderSender cancelOrderSender;
    @Autowired
    private OmsOrderOperateHistoryMapper orderOperateHistoryMapper;

    @Autowired
    private OmsOrderItemMapper orderItemMapper;

    @Autowired
    private PmsSkuStockMapper pmsSkuStockMapper;

    @Cacheable(cacheNames= {"OrderList"},unless="#result == null",
            key="T(String).valueOf(#pageNum+'-'+#pageSize)" +
                    ".concat(#queryParam.orderSn!=null?#queryParam.orderSn:'os')"+//得有字母占位，否则 多条件查询 条件不一样 会出现雷同的结果
                    ".concat(#queryParam.receiverKeyword!=null?#queryParam.receiverKeyword:'r') "+
                    ".concat(#queryParam.status!=null?#queryParam.status:'s') "+
                    ".concat(#queryParam.orderType!=null ?#queryParam.orderType:'ot') "+
                    ".concat(#queryParam.sourceType!=null ?#queryParam.sourceType:'st')"+
                    ".concat(#queryParam.createTime!=null?#queryParam.createTime:'ct')"
    ) //当结果为空时不缓存
    @Override
    public CommonPage list(OmsOrderQueryParam queryParam, Integer pageSize, Integer pageNum) {
        PageHelper.startPage(pageNum, pageSize);
        List<OmsOrder> list=orderMapper.getOrderList(queryParam);
        return CommonPage.restPage(list);
    }

    @Cacheable(cacheNames = {"Order"}, unless = "#result == null", key = "#id")
    @Override
    public OmsOrder detail(Long id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    @Override
    public void clearOrder() {
        cacheManager.getCache("OrderList").clear();//删除::之前叫BrandList的所有集合
    }

    @CacheEvict(cacheNames = {"Order"},
            key = "#id", allEntries = true, beforeInvocation = false)//先刪 mysql 再刪緩存
    @Override
    public int delete(Long id) {
        OmsOrder record = new OmsOrder();
        record.setDeleteStatus(1);
        OmsOrderExample example = new OmsOrderExample();
        example.createCriteria().andDeleteStatusEqualTo(0).andIdEqualTo(id);

        clearOrder();
        return orderMapper.updateByExampleSelective(record, example);
    }

    @CachePut(cacheNames = {"Order"}, key = "#result.id")
    @Override
    public OmsOrder updateReceiverInfo(OmsReceiverInfoParam receiverInfoParam) {
        clearOrder();
        OmsOrder order = this.detail(receiverInfoParam.getOrderId());
        order.setId(receiverInfoParam.getOrderId());
        order.setReceiverName(receiverInfoParam.getReceiverName());
        order.setReceiverPhone(receiverInfoParam.getReceiverPhone());
        order.setReceiverPostCode(receiverInfoParam.getReceiverPostCode());
        order.setReceiverDetailAddress(receiverInfoParam.getReceiverDetailAddress());
        order.setReceiverProvince(receiverInfoParam.getReceiverProvince());
        order.setReceiverCity(receiverInfoParam.getReceiverCity());
        order.setReceiverRegion(receiverInfoParam.getReceiverRegion());
        order.setModifyTime(new Date());
        int count = orderMapper.updateByPrimaryKeySelective(order);

        //插入操作记录
        OmsOrderOperateHistory history = new OmsOrderOperateHistory();
        history.setOrderId(receiverInfoParam.getOrderId());
        history.setCreateTime(new Date());
        history.setOperateMan("后台管理员");
        history.setOrderStatus(receiverInfoParam.getStatus());
        history.setNote("修改收货人信息");
        orderOperateHistoryMapper.insert(history);
        return order;
    }

    @Override
    public void sendDelayMessageCancelOrder(Long orderId,int minute) {
        //获取所有订单的超时时间
        //OmsOrderSetting orderSetting = orderSettingMapper.selectByPrimaryKey(1L);
        //long delayTimes = orderSetting.getNormalOrderOvertime() * 60 * 1000;
        //此处是改了一下 用的是每笔订单 均有自己的超时时间 因为 我们仅是做个消息的功能罢了，
        // 没有移动端APP，慢慢就有了
        //发送延迟消息
        long delayTimes=minute*60*1000;
        cancelOrderSender.sendMessage(orderId, delayTimes);
    }

    @CachePut(cacheNames = {"Order"}, key = "#orderId")
    @Override
    public OmsOrder cancelOrder(Long orderId) {
        clearOrder();
        OmsOrder cancelOrder =this.detail(orderId);

        if (cancelOrder != null) {
            //修改订单状态为取消
            cancelOrder.setStatus(4);
            orderMapper.updateByPrimaryKeySelective(cancelOrder);

            OmsOrderItemExample orderItemExample = new OmsOrderItemExample();
            orderItemExample.createCriteria().andOrderIdEqualTo(orderId);
            List<OmsOrderItem> orderItemList = orderItemMapper.selectByExample(orderItemExample);
            //解除订单商品库存锁定
            /**
             * 解除取消订单的库存锁定
             */

            List<Long> productIdList=orderItemList.stream().map(c->c.getProductId()).collect(Collectors.toList());

            if (!CollectionUtils.isEmpty(orderItemList)) {
                PmsSkuStock pmsSkuStock=new PmsSkuStock();
                PmsSkuStockExample example1=new PmsSkuStockExample();
                example1.createCriteria().andProductIdIn(productIdList);

                pmsSkuStock.setLockStock(0);//把数量释放
                pmsSkuStockMapper.updateByExampleSelective(pmsSkuStock,example1);
            }


        }
        return cancelOrder;
    }

}
