<%@page import="java.util.List"%>
<%@page import="iba.conf.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--storeselect.jsp --%>
<%
	request.setCharacterEncoding("UTF-8");

	SqlMapClient sqlMap = MySqlMapClient.getSqlMapInstance();
	
	String action = request.getParameter("action");
	List<String> list = null;
	if(action.equals("storeselect")){
		list = sqlMap.queryForList("order.storename");

	}
	out.print("<option>==선택=2</option>");
	for(int i=0; i<list.size(); i++){
		out.print("<option>"+list.get(i)+"</option>");
	}	
		
	
	
%>