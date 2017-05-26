<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/basic.css">
<%--스타일 시트 적용 --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/js/productMenu.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div id="header">a</div>
	<div id="header2">
		<jsp:include page="product_TopMenu.jsp"></jsp:include>
	</div>
	<div id="sidebar">b</div>
	<div id="content">c</div>
</body>

<script type="text/javascript">

	var menu = "${menu}";
	console.log("현재 " + menu);
	if (menu.match("true")) {
		side_load('product_Menu.jsp');
	}

	var side = "${side}";
	if (side.match("drink")) {
		$("#content").load("product_List.jsp");
	} else if (side.match("bread")) {
		$("#content").load("product_List.jsp");
	}
</script>

</html>
