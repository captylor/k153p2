<%@page import="com.kosta.k153p2.board.dto.BoardInfo"%>
<%@page import="com.kosta.k153p2.board.dao.BoardInfoDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	session.removeAttribute("totPage");
	session.removeAttribute("crr_page");//어쩌피 다시 이 페이지에서 계산 하니깐 해당 세션을 지우고
	
	String str_sideM = request.getParameter("sideMenu");//아직 관리자 쪽을 만들지 않았음으로 쓰지 않음
	int crr_page = Integer.parseInt(request.getParameter("crr_page"));//선택한 페이지

	BoardInfoDao dao = new BoardInfoDao();

	int recordCount = 15;// 한 화면에 보여질 페이지 수
	int totRecord = dao.selectCount(); // 사이드에 따른 총 레코드 수
	int totPage = totRecord / recordCount; // 총 페이지 수
	if (totRecord % recordCount > 0) {
		totPage++;
	}
	session.setAttribute("totPage", totPage);
	session.setAttribute("crr_page", crr_page);

	List<BoardInfo> returnList = dao.selectPage(crr_page, recordCount);

	JSONArray jArray = new JSONArray();
	for (int i = 0; i < returnList.size(); i++) {
		JSONObject jsonObj = new JSONObject();
		jsonObj.put("b_no", returnList.get(i).getBoard_no());
		jsonObj.put("b_id", returnList.get(i).getMember_id());
		jsonObj.put("b_title", returnList.get(i).getBoard_title());
		jsonObj.put("b_firstD", returnList.get(i).getBoard_date().toString());
		jsonObj.put("b_lastD", returnList.get(i).getBoard_lastupdate().toString());
		jArray.add(jsonObj);
	}
	String str = jArray.toString();

	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>