package com.hjh.communitysadministrativesystem.Config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // 配置静态资源访问
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
                
        // 配置其他静态资源
        registry.addResourceHandler("/js/**", "/css/**", "/img/**")
                .addResourceLocations(
                    "classpath:/static/js/",
                    "classpath:/static/css/",
                    "classpath:/static/img/"
                );
                
        // 配置图片上传目录访问
        registry.addResourceHandler("/uploads/**")
                .addResourceLocations("file:" + System.getProperty("user.dir") + "/uploads/");
    }
}
