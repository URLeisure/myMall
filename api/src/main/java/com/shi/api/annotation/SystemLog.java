package com.shi.api.annotation;


import com.shi.api.enums.LogType;

import java.lang.annotation.*;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 日志注解
 * @create: 2023/08/02 19:59
 **/
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Documented
public @interface SystemLog {
    //日志名称，默认为空
    String description() default "";

    //日志类型
    LogType type();
}
