package com.shi.api.service;

import com.shi.common.response.CommonPage;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 19:27
 **/

public interface IPmsBrandService {
    CommonPage listBrand(String keyword,Integer pageNum,Integer pageSize);
}
