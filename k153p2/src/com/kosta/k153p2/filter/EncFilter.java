package com.kosta.k153p2.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class EncFilter implements Filter {
	String encType;
	
	
	@Override
	public void init(FilterConfig config) throws ServletException {
		//System.out.println("init()");
		//config ---> web.xml을 얻기
		 encType = config.getInitParameter("encType");
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("doFilter()");
		
		//요청 한글파라미터 처리
		//req.setCharacterEncoding("UTF-8");
		if(encType != null)
		  req.setCharacterEncoding(encType); //web.xml에 설정된 문자집합
		else{
			req.setCharacterEncoding("UTF-8"); //기본값
		}
		
		chain.doFilter(req, resp);//다른 필터 혹은 요청페이지와의 연결
		
	}

	@Override
	public void destroy() {
		//System.out.println("destroy()");
		
	}

}
