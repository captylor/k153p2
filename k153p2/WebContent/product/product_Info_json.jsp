<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.kosta.k153p2.product.dto.ItemInfo"%>
<%@page import="com.kosta.k153p2.product.dao.ItemInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//선택한 사이드 메뉴에 따른 제품 정보 json으로 보여줌
	ItemInfoDao dao = new ItemInfoDao();
	String id_Str= request.getParameter("info");
	int id = Integer.parseInt(id_Str);
	
	ItemInfo info = dao.selEachProduct(id);

		System.out.println("아이템 이름 : "+ info.getItem_name());
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("item_no", info.getItem_no());
		jsonObj.put("item_name", info.getItem_name());
		jsonObj.put("item_userPrice", info.getItem_userPrice());
		jsonObj.put("item_type", info.getItemtype_no());
	String str = jsonObj.toString();

	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>