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
		//config ---> web.xml�� ���
		 encType = config.getInitParameter("encType");
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		//System.out.println("doFilter()");
		
		//��û �ѱ��Ķ���� ó��
		//req.setCharacterEncoding("UTF-8");
		if(encType != null)
		  req.setCharacterEncoding(encType); //web.xml�� ������ ��������
		else{
			req.setCharacterEncoding("UTF-8"); //�⺻��
		}
		
		chain.doFilter(req, resp);//�ٸ� ���� Ȥ�� ��û���������� ����
		
	}

	@Override
	public void destroy() {
		//System.out.println("destroy()");
		
	}

}
