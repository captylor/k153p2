<%@page import="com.kosta.k153p2.init2.dto.MemberInfo"%>
<%@page import="com.kosta.k153p2.init2.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberInfo member = (MemberInfo)request.getSession().getAttribute("member");
		member.setMember_id(member.getMember_id());
		member.setMember_pass(member.getMember_pass());
		member.setMember_name(member.getMember_name());
		member.setMember_email(member.getMember_email());
	System.out.print(member.getMember_name());
	MemberInfoDAO dao = new MemberInfoDAO();
		boolean flag = dao.update(member);
		if(flag){ //수정성공!
			request.getSession().invalidate();
			out.print("수정성공");
		}else{ 
			out.print("수정실패");
		} 
	
%>



