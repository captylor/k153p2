<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.kosta.k153p2.login.dto.MemberInfo"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.kosta.k153p2.login.dao.MemberInfoDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String logout = request.getParameter("logout");

	if (logout == null) {//현재 로그인을 한건지 로그아웃을 한건지 판단
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		MemberInfoDAO dao = new MemberInfoDAO();
		boolean loginResult = dao.selectLogin(id, pass);

		JSONObject jsonObj = new JSONObject();
		if (loginResult) {
			jsonObj.put("loginResult", "success");
			MemberInfo info = dao.selectinfo(id);
			session.setAttribute("loginInfo", info);
		} else {
			jsonObj.put("loginResult", "fail");
		}
		String str = jsonObj.toJSONString();
		out.print(str);
		out.flush();//버퍼를 모두 지운다
	} else {
		//로그아웃을 선택
		session.invalidate(); //현재 사용되고 있는 세션 값을 모두 지움
		request.getRequestDispatcher("/login/login_index.jsp").forward(request, response);
	}
%>