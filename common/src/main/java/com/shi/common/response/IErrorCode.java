package com.shi.common.response;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 封装API的错误码
 * @create: 2023/08/04 19:57
 **/

public interface IErrorCode {
    long getCode();

    String getMessage();
}
