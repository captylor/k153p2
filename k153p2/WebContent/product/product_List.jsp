<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/paging.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
div.gallery {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}

#paging {
	text-align: center;
}

a.pagings-item, a.pagings-side {
	margin: 0 .25em;
}

a.pagings-item.selected {
	font-weight: bold;
}
</style>
<div id="div3"></div>
<br>
<br>
<br>
<div class="pagination">
 	<a href="#">&laquo;</a>
	<c:forEach var="i" begin="1" end="${totPage }">
		<c:if test="${i ==crr_page}">
			<a href="#" class="active" >${i}</a>
		</c:if>
		<c:if test="${i !=crr_page}">
			  <a href="#">${i}</a>
		</c:if>
	</c:forEach>
  <a href="#">&raquo;</a>
</div>
