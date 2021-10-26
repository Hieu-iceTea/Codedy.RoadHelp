package com.codedy.roadhelp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.ViewControllerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
//@EnableWebMvc
public class MvcConfig implements WebMvcConfigurer {

    public void addViewControllers(ViewControllerRegistry registry) {
        //registry.addViewController("/login").setViewName("front/account/login");
        //registry.addViewController("/access-denied").setViewName("front/account/access-denied");
    }

    @Override
    public void addCorsMappings(CorsRegistry registry) {
        WebMvcConfigurer.super.addCorsMappings(registry);

        //Thêm dòng này để xử lý lỗi chạy app ở chế độ WEB trên Chrome
        //https://stackoverflow.com/questions/35091524/spring-cors-no-access-control-allow-origin-header-is-present
        registry.addMapping("/**");
    }

}