<%@page import="java.net.URLDecoder"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.kosta.k153p2.admin.dto.StoreInfo"%>
<%@page import="com.kosta.k153p2.admin.dao.StoreInfoDao"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%-- admin_Manager_Registration.jsp���� ���� ������ db�� ����  ���� ���--%>
<%
	request.setCharacterEncoding("UTF-8");

	String data[] = URLDecoder.decode( request.getParameter("data"), "UTF-8").split("&");//����ȭ�� ���� �ѱ� ���� ����
	String store_name[] = data[0].split("=");//0=���� 1=���� ��
	String store_addr[] = data[1].split("=");
	String store_tel[] = data[2].split("=");

	String arritemlist[] = data[3].split("=");
	String itemlist[] = arritemlist[1].split("%25");
	System.out.println("store_name :" + store_name[1] + " itemlist ������ : " + itemlist.length);

	StoreInfoDao dao = new StoreInfoDao();
	StoreInfo store = new StoreInfo(store_name[1],store_addr[1],store_tel[1],arritemlist[1]);
	boolean result =  dao.insert(store);
	if(result){
		out.print("success");
	}else{
		out.print("fail");
	}
	out.flush();//���۸� ��� �����
%>
