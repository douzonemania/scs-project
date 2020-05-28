package com.douzonemania.shop.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;


import com.douzonemania.shop.security.AuthInterceptor;
import com.douzonemania.shop.security.LoginInterceptor;
import com.douzonemania.shop.security.LogoutInterceptor;


@Configuration
@PropertySource("classpath:/com/douzonemania/scs-shop/config/config.properties")
public class WebConfig implements WebMvcConfigurer{

	
	@Autowired
	private Environment env;
	
	@Bean
	public AuthInterceptor authInterceptor() {
		return new AuthInterceptor();
	}
	
	@Bean
	public LoginInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	
	@Bean
	public LogoutInterceptor logoutInterceptor() {
		return new LogoutInterceptor();
	}
		
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(authInterceptor()).addPathPatterns("/**")
		.excludePathPatterns("/assets/**")
		.excludePathPatterns("/error/**")
		.excludePathPatterns("/api/**");

	}
	
}
