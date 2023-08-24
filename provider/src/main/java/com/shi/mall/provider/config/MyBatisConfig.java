package com.shi.mall.provider.config;

import com.github.pagehelper.PageInterceptor;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;
import org.springframework.transaction.annotation.TransactionManagementConfigurer;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * @author: 扑腾的江鱼
 * @description: TODO MyBatis基础配置
 * @create: 2023/08/07 21:20
 **/

@Configuration
@EnableTransactionManagement
@EnableAspectJAutoProxy
//防止出现和 Dubbo 冲突的写法 EnableTransactionManagement 和 EnableAspectJAutoProxy 都可以不写 也行
// 但是就是脱离Spring管理事务了
public class MyBatisConfig implements TransactionManagementConfigurer {

    @Autowired
    DataSource dataSource;

    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactory sqlSessionFactoryBean() {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        bean.setTypeAliasesPackage("com.shi.api.model");//设置扫描的模型包

        PageInterceptor pageInterceptor = new PageInterceptor();// 创建分页拦截器
        Properties properties = new Properties();// 创建属性配置对象
        properties.setProperty("helperDialect","mysql");// 设置数据库方言
        properties.setProperty("offsetAsPageNum", "false");// 不将 offset 参数当成 pageNum 使用
        properties.setProperty("rowBoundsWithCount", "false"); // 不进行 count 查询
        properties.setProperty("reasonable", "false");// 分页参数不合理时是否返回首页或尾页
        pageInterceptor.setProperties(properties);// 将属性配置设置到分页拦截器
//        /* PageHelper分页配置结束 */
//
        bean.setPlugins(new Interceptor[] { pageInterceptor });

        try {
            return bean.getObject();
        } catch (Exception e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Bean("sqlSessionTemplate")
    public SqlSessionTemplate sqlSessionTemplate(SqlSessionFactory sqlSessionFactory) {
        return new SqlSessionTemplate(sqlSessionFactory);
    }

    @Bean
    @Override
    public PlatformTransactionManager annotationDrivenTransactionManager() {
        return new DataSourceTransactionManager(dataSource);
    }
}

