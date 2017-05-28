<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.kosta.k153p2.product.dto.ItemInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.product.dao.ItemInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//������ ���̵� �޴��� ���� ��ǰ ���� json���� ������
	ItemInfoDao dao = new ItemInfoDao();
	String sideM_Str= request.getParameter("sideMenu");
	int sideM = Integer.parseInt(sideM_Str);
	
	List<ItemInfo> returnList = dao.selectMenu(sideM);

	///// �ҷ��� ������ ����Ʈ�� Json��ü �������� ������ �ٽ� Ŭ���̾�Ʈ�� ���� /////
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
	out.flush();//���۸� ��� �����
%>