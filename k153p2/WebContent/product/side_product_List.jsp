<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="com.kosta.k153p2.product.dto.ItemInfo"%>
<%@page import="java.util.List"%>
<%@page import="com.kosta.k153p2.product.dao.ItemInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
/*
받아야 하는 파라매터는 
	1. 어떤 사이드 메뉴를 선택했는지
	2. 어떤 페이지를 선택했는지
*/
	//선택한 사이드 메뉴에 따른 제품 정보 json으로 보여줌
	session.removeAttribute("totPage");
	session.removeAttribute("crr_page");
	
	
	ItemInfoDao dao = new ItemInfoDao();
	String sideM_Str = request.getParameter("sideMenu");
	int sideM = Integer.parseInt(sideM_Str);//사이드
	
	String crr_strPage = request.getParameter("crr_page");
	int crr_page = 0;
	if(crr_strPage ==null){
		crr_page=1;	
	}else{
		crr_page =  Integer.parseInt(crr_strPage);//페이지
	}


	int recordCount = 10;// 한 화면에 보여질 페이지 수
	int totRecord = dao.selectCount(sideM); // 사이드에 따른 총 레코드 수
	System.out.println("총 데이터의 갯수");
	int totPage = totRecord / recordCount; // 총 페이지 수
	if (totRecord % recordCount > 0) {
		totPage++;
	}
	session.setAttribute("totPage", totPage);
	session.setAttribute("crr_page", crr_page);
	
	List<ItemInfo> returnList = dao.selectMenu(sideM);//걍 사이드 메뉴에 따른 출력
	returnList = dao.selectPage(crr_page, recordCount, sideM);//페이징용 으로 출력
	///// 불러온 데이터 리스트를 Json객체 형식으로 구현후 다시 클라이언트로 보냄 /////
	JSONArray jArray = new JSONArray();

	for (int i = 0; i < returnList.size(); i++) {
		System.out.println(i + " " + returnList.get(i).getItem_no());
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("item_no", returnList.get(i).getItem_no());
		jsonObj.put("item_name", returnList.get(i).getItem_name());
		jsonObj.put("item_userPrice", returnList.get(i).getItem_userPrice());
		jsonObj.put("item_type", returnList.get(i).getItemtype_no());
		jArray.add(jsonObj);
	}

	String str = jArray.toString();

	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>