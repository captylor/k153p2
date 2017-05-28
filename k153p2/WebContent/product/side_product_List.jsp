<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.kosta.k153p2.product.dto.ItemInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.product.dao.ItemInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//선택한 사이드 메뉴에 따른 제품 정보 json으로 보여줌
	ItemInfoDao dao = new ItemInfoDao();
	String sideM_Str= request.getParameter("sideMenu");
	int sideM = Integer.parseInt(sideM_Str);
	
	List<ItemInfo> returnList = dao.selectMenu(sideM);

	///// 불러온 데이터 리스트를 Json객체 형식으로 구현후 다시 클라이언트로 보냄 /////
	JSONArray jArray = new JSONArray();

	for (int i = 0; i < returnList.size(); i++) {
		System.out.println(i + " " + returnList.get(i).getItem_no());
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("item_no", returnList.get(i).getItem_no());
		jsonObj.put("item_name", returnList.get(i).getItem_name());
		jsonObj.put("item_userPrice", returnList.get(i).getItem_userPrice());
		jsonObj.put("item_type", returnList.get(i).getItem_type());
		jArray.add(jsonObj);
	}

	String str = jArray.toString();

	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>