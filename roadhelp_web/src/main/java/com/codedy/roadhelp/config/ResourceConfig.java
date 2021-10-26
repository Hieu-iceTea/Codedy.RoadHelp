package com.codedy.roadhelp.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.nio.file.Path;
import java.nio.file.Paths;

@Configuration
public class ResourceConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        exposeDirectory("src/main/resources/static/data-images", "data-images", registry);
    }

    public void exposeDirectory(String dirName, String urlName, ResourceHandlerRegistry registry) {
        Path uploadDir = Paths.get(dirName);
        String uploadPath = uploadDir.toFile().getAbsolutePath();

        if (dirName.startsWith("../")) {
            dirName = dirName.replace("../", "");
        }

        if (urlName.startsWith("../")) {
            urlName = urlName.replace("../", "");
        }

        registry.addResourceHandler("/" + urlName + "/**").addResourceLocations("file:/" + uploadPath + "/");
    }

}
