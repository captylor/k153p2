<%@page import="com.kosta.k153p2.store.dto.AddrInfo"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.store.dao.AddrInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	AddrInfoDao dao = new AddrInfoDao();
	JSONArray jArray = new JSONArray();

	if (request.getParameter("data").equals("location")) {
		List<String> returnList = dao.selectSido();
		for (int i = 0; i < returnList.size(); i++) {
			JSONObject jsonObj = new JSONObject();//일단 STORE_NO까지는 가져오긴 하지만 안씀
			jsonObj.put("location", returnList.get(i));
			jArray.add(jsonObj);
		}
	} else if (request.getParameter("data").equals("loc_store")) {
		List<AddrInfo> returnList = dao.addrSearch(request.getParameter("loc"));
		for (int i = 0; i < returnList.size(); i++) {
			JSONObject jsonObj = new JSONObject();//일단 STORE_NO까지는 가져오긴 하지만 안씀
			jsonObj.put("s_sido", returnList.get(i).getDs_sido());
			jsonObj.put("s_gugun", returnList.get(i).getDs_gugun());
			jsonObj.put("s_dong", returnList.get(i).getDs_dong());
			jsonObj.put("s_addr2", returnList.get(i).getStore_addr2());
			jsonObj.put("s_id", returnList.get(i).getDs_id());
			jsonObj.put("s_name", returnList.get(i).getStore_name());
			jsonObj.put("s_tel", returnList.get(i).getStore_tel());
			jsonObj.put("s_st_no", returnList.get(i).getStore_no());
			jArray.add(jsonObj);
		}
		System.out.println("loc_store 실행 끝");
	}

	String str = jArray.toString();
	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>