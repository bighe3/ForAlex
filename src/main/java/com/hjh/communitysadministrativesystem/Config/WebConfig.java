package com.hjh.communitysadministrativesystem.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 添加uploads目录的资源映射
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:uploads/");
    }
}
