<%@page import="com.kosta.k153p2.init2.dto.MemberInfo"%>
<%@page import="com.kosta.k153p2.init2.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id =request.getParameter("id");
	String pass =request.getParameter("pass");

	MemberInfoDAO dao = new MemberInfoDAO();
	MemberInfo member = new MemberInfo();
	
	member = dao.selectLogin(id);
	
	if(member.getMember_id().equals(id) && member.getMember_pass().equals(pass)){ //로그인성공!
		out.print("로그인성공");
	}else if(member.getMember_id().equals(id) && !(member.getMember_pass().equals(pass))){
		out.print("비밀번호불일치");
	}else if(!member.getMember_id().equals(id)){
		out.print("아이디불일치");
	}
%>



