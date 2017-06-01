<%@page import="com.kosta.k153p2.init2.dto.MemberInfo"%>
<%@page import="com.kosta.k153p2.init2.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("id");
	String pass =request.getParameter("pass");
	
	MemberInfoDAO dao = new MemberInfoDAO();
	
	boolean flag = dao.selectLogin(id,pass);
	if(flag){ //로그인성공!
		out.print("로그인성공");
	}else{ 
		out.print("로그인실패");
	} 
%>

