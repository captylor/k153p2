<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.kosta.k153p2.admin.dto.StoreInfo"%>
<%@page import="com.kosta.k153p2.admin.dao.StoreInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	String id = request.getParameter("id");
	StoreInfoDao dao = new StoreInfoDao();
	StoreInfo store = dao.sel_myStore(id);

	JSONObject jsonObj = new JSONObject();
	jsonObj.put("store_id", store.getStore_no());
	jsonObj.put("store_name", store.getStore_name());
	jsonObj.put("store_addr", store.getStore_addr());
	jsonObj.put("store_tel", store.getStore_tel());
	jsonObj.put("store_product", store.getStore_product());
	String str = jsonObj.toString();

	out.print(str);
	System.out.println(str);
	out.flush();//버퍼를 모두 지운다
%>

