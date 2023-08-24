package com.shi.api.dto;

import lombok.Data;

import java.io.Serializable;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/09/22 12:34
 **/
@Data
public class OmsReceiverInfoParam implements Serializable {
    private Long orderId;
    private String receiverName;
    private String receiverPhone;
    private String receiverPostCode;
    private String receiverDetailAddress;
    private String receiverProvince;
    private String receiverCity;
    private String receiverRegion;
    private Integer status;
}
