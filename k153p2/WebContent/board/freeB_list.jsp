<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/paging.css">
<style>
.td1 {width =50;
	text-align: center;
	color: red;
}

.td2 {width =100;
	text-align: center;
}

.td3 {width =320;
	text-align: center;
}
</style>

<center>
	<table border="1" cellspacing="5" widrth=600 id="list">
		<thead>
			<tr>
				<th width=50 align=center>번호</th>
				<th width=100 align=center>아이디</th>
				<th width=320 align=center>제목</th>
				<th width=100 align=center>최초작성일</th>
				<th width=100 align=center>마지막수정일</th>
			</tr>
		</thead>
		<tbody>
		</tbody>
	</table>
	<br>

	<table width=700 cellspacing=1>
		<tr>
			<td><input type=button value="글쓰기" id="writingBt"></td>
		</tr>	
	</table>
	<br>

	<div class="pagination">
		<%--페이징용 --%>
		<a href="#">&laquo;</a>
		<c:forEach var="i" begin="1" end="${totPage }">
			<c:if test="${i ==crr_page}">
				<a href="#" class="active">${i}</a>
			</c:if>
			<c:if test="${i !=crr_page}">
				<a href="#">${i}</a>
			</c:if>
		</c:forEach>
		<a href="#">&raquo;</a>
</center>