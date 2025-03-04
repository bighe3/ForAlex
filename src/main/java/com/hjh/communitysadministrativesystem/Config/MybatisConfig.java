package com.hjh.communitysadministrativesystem.Config;

import com.github.pagehelper.PageInterceptor;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
@MapperScan("com.hjh.communitysadministrativesystem.dao")
public class MybatisConfig {

    @Bean
    public PageInterceptor pageInterceptor(){
        return new PageInterceptor();
    }


}
