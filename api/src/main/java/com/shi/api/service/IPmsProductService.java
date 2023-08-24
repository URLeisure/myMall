package com.shi.api.service;

import com.shi.api.dto.PmsProductQueryParam;
import com.shi.common.response.CommonPage;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 16:10
 **/

public interface IPmsProductService {
    CommonPage list(PmsProductQueryParam productQueryParam,Integer pageSize,Integer pageNum);
}
