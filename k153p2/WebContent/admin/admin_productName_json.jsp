<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.kosta.k153p2.product.dto.ItemInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.product.dao.ItemInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	ItemInfoDao dao = new ItemInfoDao();
	List<ItemInfo> returnList = dao.selectNoNameType();
	
	JSONArray jArray = new JSONArray();
	for (int i = 0; i < returnList.size(); i++) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("i_no", returnList.get(i).getItem_no());
		jsonObj.put("i_name", returnList.get(i).getItem_name());
		jsonObj.put("i_type", returnList.get(i).getItemtype_no());
		jArray.add(jsonObj);
	}
	String str = jArray.toString();

	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>