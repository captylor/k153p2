<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.kosta.k153p2.login.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	request.getParameter("id");
	MemberInfoDAO dao = new MemberInfoDAO();
	boolean result = dao.delete(request.getParameter("id"));
	
	JSONObject jsonObj = new JSONObject();
	if (result) {
		jsonObj.put("loginResult", "success");
	} else {
		jsonObj.put("loginResult", "fail");
	}
	String str = jsonObj.toJSONString();
	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>