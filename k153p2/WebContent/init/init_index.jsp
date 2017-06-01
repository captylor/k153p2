<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css">
<%--스타일 시트 적용 --%>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>init</title>
<script>
	$(function() {//사이드 메뉴 로드
		$("#sidebar").load("${pageContext.request.contextPath}/init/init_menu.jsp");
	});
	$(document).on('click', '#sideMenu', function() { //토글 기능
		$(".input").toggle();
	});
	$(document).on('click', '.input', function() { //사이드 메뉴 선택) 소개 연혁
		var side = $(this).attr("id");
		var htmlText = '';
		if (side.match("intro")) {
			$("#content").load("${pageContext.request.contextPath}/init/init_init.jsp");
		} else {
			$("#content").load("${pageContext.request.contextPath}/init/init_history.jsp");
		}
	});
	
	$(document).on('click', '#f1', function() {
		$("#p1").slideToggle("slow");
	});
	$(document).on('click', '#f2', function() {
		$("#p2").slideToggle("slow");
	});
</script>

</head>
<body>
	<div id="header"></div>
	<div id="header2">
		<jsp:include page="/product/product_TopMenu.jsp"></jsp:include>
	</div>
	<div id="sidebar"></div>
	<div id="content"></div>
	<div id="testDiv"></div>
</body>
</html>