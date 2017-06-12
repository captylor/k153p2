<%@page import="com.kosta.k153p2.dao.StoreInfoDao"%>
<%@page import="com.kosta.k153p2.dao.AddrInfoDao"%>
<%@page import="com.kosta.k153p2.dto.AddrInfo"%>
<%@page import="com.kosta.k153p2.dto.StoreInfo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%	
	List<StoreInfo> list = null;
	List<AddrInfo> addrList = null;
	String location = request.getParameter("location");
	System.out.println(location);
	AddrInfoDao addrDao = new AddrInfoDao();
	StoreInfoDao dao = new StoreInfoDao();
	
	if(location == null){//검색하지 않음, 전체 데이터 출력
		addrDao.select_all();
		list = dao.select_all();
	}else{//검색어 입력 했을시
		addrList = addrDao.addrSearch(location);
		list = dao.select_store(location);
	}

%>
</body>
</html>