<%@page import="java.util.List"%>
<%@page import="iba.conf.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--storeselect.jsp --%>
<%
	request.setCharacterEncoding("UTF-8");

	SqlMapClient sqlMap = MySqlMapClient.getSqlMapInstance();
	String id = (String)request.getSession().getAttribute("login");
	List<String> list = null;
	System.out.println(id);
	list = sqlMap.queryForList("order.storename",id);
	
	
	if(request.getSession().getAttribute("selectStore")==null){
		out.print("<option>==선택==</option>");
	}else{
		out.print("<option>"+request.getSession().getAttribute("selectStore")+"</option>");
	}
	
	String selectStore = (String)request.getSession().getAttribute("selectStore");
	list.remove(selectStore);
	for(int i=0; i<list.size(); i++){
		out.print("<option>"+list.get(i)+"</option>");
	}	
	
		
	
	
%>