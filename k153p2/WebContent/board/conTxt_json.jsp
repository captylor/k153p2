
<%@page import="com.kosta.k153p2.board.dto.BoardInfo"%>
<%@page import="com.kosta.k153p2.board.dao.BoardInfoDao"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="org.json.simple.JSONArray"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int article_no = Integer.parseInt(request.getParameter("article_no"));
	BoardInfoDao dao = new BoardInfoDao();
	BoardInfo rowConTxt = dao.select(article_no);

	JSONObject jsonObj = new JSONObject();
	jsonObj.put("b_no", rowConTxt.getBoard_no());
	jsonObj.put("b_id", rowConTxt.getMember_id());
	jsonObj.put("b_title", rowConTxt.getBoard_title());
	jsonObj.put("b_conTxt", rowConTxt.getBoard_text());
	String str = jsonObj.toString();

	out.print(str);
	out.flush();//버퍼를 모두 지운다
%>