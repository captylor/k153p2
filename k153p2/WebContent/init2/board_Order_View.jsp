<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>발주게시판</title>
<!--board_Order_View -->

</head>
<body>
<h3>발주게시판</h3>
<br><br>
<table cellspacing=1 width=600 border=1>
	<tr>	
		<td width=50 align=center>번호</td>
		<td width=320  align=center>제목</td>
		<td width=100 align=center>등록일</td>
		<td width=100 align=center>처리결과</td>
	</tr>
	
	<c:forEach items="${list }" var="info">
		<tr>
		  <td>${info.board_no }</td>
		  <td><a href="boards?action=edit&=${info.board_no }">${info.board_title }</a></td>
		  <td>${info.board_date }</td>
	    </tr>			
	</c:forEach>
</table>

<table width=700>
	<tr>
		<td><input type=button value="뒤로"></td>
	</tr>
</table>

</html>