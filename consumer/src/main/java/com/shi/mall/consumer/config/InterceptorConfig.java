package com.shi.mall.consumer.config;

import com.shi.mall.consumer.aop.SystemLogAspect;
import com.shi.mall.consumer.interceptor.AuthenticationInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * @author: 扑腾的江鱼
 * @description: TODO 拦截器配置
 * @create: 2023/08/04 19:04
 **/
@Configuration
public class InterceptorConfig implements WebMvcConfigurer {

    @Autowired
    private AuthenticationInterceptor authenticationInterceptor;//身份验证
    @Autowired
    private SystemLogAspect systemLogAspect;//日志

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(systemLogAspect).addPathPatterns("/**");
        registry.addInterceptor(authenticationInterceptor).addPathPatterns("/**");
    }
}
