<%@page import="java.util.List"%>
<%@page import="iba.conf.MySqlMapClient"%>
<%@page import="com.ibatis.sqlmap.client.SqlMapClient"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%  
	request.setCharacterEncoding("UTF-8");

	SqlMapClient sqlMap = MySqlMapClient.getSqlMapInstance();
	
	List<String> list = null;
	list = sqlMap.queryForList("store.itemType");
	out.print("<option>==선택==</option>");
	for(int i=0; i<list.size(); i++){
		out.print("<option>"+list.get(i)+"</option>");
	}
%>
