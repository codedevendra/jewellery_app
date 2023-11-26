package com.app.jewellery.configurations;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class SecurityConfigurationRegister implements WebMvcConfigurer {
	@Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new SecurityConfiguration())
                .addPathPatterns("/admin/**", "/user/**")
                .excludePathPatterns("/unauthorized"); // Exclude paths that handle unauthorized access
    }

}
