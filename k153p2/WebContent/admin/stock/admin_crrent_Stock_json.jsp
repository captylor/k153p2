<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="com.kosta.k153p2.admin.dto.Item_Stock"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.login.dto.MemberInfo"%>
<%@page import="com.kosta.k153p2.admin.dao.StoreInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	StoreInfoDao dao = new StoreInfoDao();
	MemberInfo member = (MemberInfo) session.getAttribute("loginInfo");
	System.out.println(member.getMember_id());
	List<Item_Stock> returnList = dao.sel_crr_stock(member.getMember_id());
	JSONArray jArray = new JSONArray();
	for (int i = 0; i < returnList.size(); i++) {
		JSONObject jsonObj = new JSONObject();//일단 STORE_NO까지는 가져오긴 하지만 안씀
		jsonObj.put("i_no", returnList.get(i).getItem_no());
		jsonObj.put("i_name", returnList.get(i).getItem_name());
		jsonObj.put("i_stock", returnList.get(i).getStock_amount());
		jArray.add(jsonObj);
	}
	String str = jArray.toString();

	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>