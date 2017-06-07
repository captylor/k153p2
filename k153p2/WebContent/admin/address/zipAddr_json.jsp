<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.addr.dao.Dao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String data = request.getParameter("data");
	Dao dao = new Dao();
	JSONArray jArray = new JSONArray();

	if (data.equals("sido")) {
		List<String> returnList = dao.selectSido();
		System.out.println(returnList.get(0));
		for (int i = 0; i < returnList.size(); i++) {
			JSONObject jsonObj = new JSONObject();
			jsonObj.put("sido", returnList.get(i));
			jArray.add(jsonObj);
		}
	}

	String str = jArray.toString();
	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>