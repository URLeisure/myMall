package com.shi.common.response;


import com.github.pagehelper.PageInfo;
import lombok.Data;
import org.springframework.data.domain.Page;

import java.io.Serializable;
import java.util.List;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 分页数据封装类
 * @create: 2023/08/07 15:53
 **/

@Data
public class CommonPage<T> implements Serializable {
    private Integer pageNum;//当前页号
    private Integer pageSize;//每页数据数量
    private Integer totalPage;//总页数
    private Long total;//总数据量
    private List<T> list;//数据

    // 将 pageHelper 分页后的 list 转为分页信息
    public static <T> CommonPage<T> restPage(List<T> list){
        CommonPage result = new CommonPage();
        PageInfo pageInfo = new PageInfo(list);
        result.setTotalPage(pageInfo.getPages());
        result.setPageNum(pageInfo.getPageNum());
        result.setPageSize(pageInfo.getPageSize());
        result.setTotal(pageInfo.getTotal());
        result.setList(pageInfo.getList());

        return result;
    }

    //将 SpringData 分页后的 list 转为分页信息
    public static  CommonPage restPage(Page pageInfo){
        CommonPage result = new CommonPage();
        result.setTotalPage(pageInfo.getTotalPages());
        result.setPageNum(pageInfo.getNumber());
        result.setPageSize(pageInfo.getSize());
        result.setTotal(pageInfo.getTotalElements());
        result.setList(pageInfo.getContent());

        return result;
    }
}
