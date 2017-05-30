<%@page import="com.kosta.k153p2.init2.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String str =request.getParameter("id");
	MemberInfoDAO dao = new MemberInfoDAO();
	boolean flag = dao.checkId(str);
	if(flag){
		out.print("<font color=red>사용중인 아이디입니다 다른 아이디를 사용해주세요</font>");
	}else{
		out.print("사용가능");
	}
	
%>



