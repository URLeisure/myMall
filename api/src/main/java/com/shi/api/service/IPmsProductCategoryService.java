package com.shi.api.service;

import com.shi.api.model.PmsProductCategory;
import com.shi.common.response.CommonPage;

import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 类描述
 * @create: 2023/08/07 19:45
 **/

public interface IPmsProductCategoryService {
    CommonPage getList(Long parentId, Integer pageSize, Integer pageNum);

    List<PmsProductCategory> listWithChildren();
}
