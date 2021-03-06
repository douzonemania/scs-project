package com.douzonemania.scs.config;

import java.util.List;

import javax.servlet.http.HttpSessionListener;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.douzonemania.security.AuthUserHandlerMethodArgumentResolver;
import com.douzonemania.security.AuthUserInterceptor;
import com.douzonemania.security.LoginInterceptor;
import com.douzonemania.security.LogoutInterceptor;
import com.douzonemania.security.SessionListener;

@Configuration
@PropertySource("classpath:com/douzonemania/scs/config/config.properties")
public class WebConfig implements WebMvcConfigurer {
	@Autowired
	private Environment env;

	//Argument Resolver
	@Bean
	public HandlerMethodArgumentResolver authUserHandlerMethodArgumentResolver() {
		return new AuthUserHandlerMethodArgumentResolver();
	}
	@Override
	public void addArgumentResolvers(List<HandlerMethodArgumentResolver> resolvers) {
		resolvers.add(authUserHandlerMethodArgumentResolver());
	}

	
	// Interceptors
	@Bean
	public HandlerInterceptor loginInterceptor() {
		return new LoginInterceptor();
	}
	@Bean
	public HandlerInterceptor logoutInterceptor() {
		return new LogoutInterceptor();
	}
	@Bean
	public HandlerInterceptor authInterceptor() {
		return new AuthUserInterceptor();
	}
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry
		.addInterceptor(loginInterceptor())
		.addPathPatterns(env.getProperty("security.auth-url"));

		registry
		.addInterceptor(logoutInterceptor())
		.addPathPatterns(env.getProperty("security.logout-url"));

		registry
		.addInterceptor(authInterceptor())
		.addPathPatterns("/**")	
		.excludePathPatterns("/assets/**")
		.excludePathPatterns("/error/**")
		.excludePathPatterns("/main/index")
		.excludePathPatterns("/user/recover")
		.excludePathPatterns("/user/signup");
	}

	// Mvc Resources(URL Magic Mapping)
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler(env.getProperty("fileupload.resourceMapping")).addResourceLocations("file:" + env.getProperty("fileupload.uploadLocation"));
	}
	
	@Bean
	public MappingJackson2JsonView jsonView() {
		return new MappingJackson2JsonView();

	}

	// session timeout
	@Bean
	  public HttpSessionListener httpSessionListener(){
	    return new SessionListener();
	 }
	
}