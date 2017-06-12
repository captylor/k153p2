<%@page import="com.kosta.k153p2.dto.OrderInfo"%>
<%@page import="com.kosta.k153p2.dao.OrderInfoDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String order_no = request.getParameter("order_no");
	System.out.println("order_no="+order_no);
	String store_no = request.getParameter("store_no");
	String itemAmount[] = request.getParameter("itemAmount").split("-");
	String item_no =itemAmount[0];
	String order_amount =itemAmount[1];
	
	
	
		OrderInfo order = new OrderInfo();
		order.setOrder_no(Integer.parseInt(order_no));
		order.setStore_no(Integer.parseInt(store_no));
		order.setItem_no(Integer.parseInt(item_no));
		order.setOrder_amount(Integer.parseInt(order_amount));
		order.setOrder_handle("처리됨");
	
	OrderInfoDao dao = new OrderInfoDao();
		if(dao.stockUpdate(order)){
			out.print("성공");
		}else{
			out.print("실패");
		}
			
		 
%>
<%--stock.jsp ( 제품발송 데이터 창) --%>