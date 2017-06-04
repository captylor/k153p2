<%@page import="com.kosta.k153p2.login.dto.MemberInfo"%>
<%@page import="com.kosta.k153p2.login.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String how = request.getParameter("how");
	if (how == null) {
		String id = request.getParameter("id");
		MemberInfoDAO dao = new MemberInfoDAO();
		boolean flag = dao.checkId(id);
		if (flag) {
			out.print("<font color=red> [" + id + "] 는 사용중인 아이디입니다!!</font>");
		} else {
			out.print("사용가능");
		}
	} else {//회원 가입을 하려고 함
		MemberInfoDAO dao = new MemberInfoDAO();
		request.getParameter("id");
		MemberInfo member = new MemberInfo(request.getParameter("id"), request.getParameter("pass"),
				request.getParameter("name"), request.getParameter("email"));
		member.setMember_icon(request.getParameter("photo"));
		boolean result = dao.insert(member);
		if (result) {
			out.print("success");
		} else {
			out.print("fail");
		}
	}
%>



