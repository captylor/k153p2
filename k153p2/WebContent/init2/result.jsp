<%@page import="com.kosta.k153p2.init2.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("id");
	MemberInfoDAO dao = new MemberInfoDAO();
	boolean flag = dao.checkId(id);
	if(flag){
		out.print("<font color=red> ["+id+"] 는 사용중인 아이디입니다!!</font>");
	}else{
		out.print("사용가능");
	}
	
%>



