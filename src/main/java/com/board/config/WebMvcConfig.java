package com.board.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.board.interceptor.LoginCheckInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
	
	// 폴더 위치 중요 : 
	//   main() 함수가 있는 클래스(Board6Application.java)의
	//   패키지(com.board) 아래에 .config 를 생성해서 저장
	//   com.board.config
	// 용도 : Spring legacy project 는 설정을 .xml. 에 저장
	// 		  SpringBoot Project 는 
	
	// 각종 설명정보를 저장하는 곳
	

}
