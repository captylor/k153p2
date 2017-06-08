<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.admin.dao.StoreInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	StoreInfoDao dao = new StoreInfoDao();
	List<String> returnList = dao.sel_All_Type();
	JSONArray jArray = new JSONArray();

	for (int i = 0; i < returnList.size(); i++) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("type_name", returnList.get(i));
		jArray.add(jsonObj);
	}

	String str = jArray.toString();
	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>