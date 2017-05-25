<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/basic.css">
<%--스타일 시트 적용 --%>
<title>Insert title here</title>
</head>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script type="text/javascript">

	function side_load(pageName) { //요청
	//	alert(pageName);
		sendRequest(pageName, null, side_loaded, 'POST');
	}
	function side_loaded() { //콜백
		//데이터요청한 후 할일
		if (xhr.readyState == 4 && xhr.status == 200) {
			var str = xhr.responseText; //str: String ==> "Hello,Ajax~!!" 
			var sidebar = document.getElementById('sidebar');
			sidebar.innerHTML = str;
		}
	}

	function contents_load(pageName) { //요청
		sendRequest(pageName, null, contents_loaded, 'POST');
	}
	function contents_loaded() { //콜백
		//데이터요청한 후 할일
		if (xhr.readyState == 4 && xhr.status == 200) {
			var str = xhr.responseText; //str: String ==> "Hello,Ajax~!!" 
			var content = document.getElementById('content');
			content.innerHTML = str;
		}
	}
	var menu = "${menu}";
	if (menu.match("true")) {
		side_load("product_Menu.jsp");
		alert("사이드바 만듦");
	}

	var side = "${side}";
	if (side.match("drink")) {
	//	alert("사이드 바 음료 선택");
		contents_load("product_List.jsp"); //갤러리
		//$("#div 아이디").load("로딩할 페이지 URL", {넘길 파라메터});
		//$("#content").load("product_List.jsp", null);
	} else if (side.match("bread")) {
	//	alert("사이드 바 빵 선택");
		contents_load("product_List.jsp"); //갤러리
		//$("#content").load("product_List.jsp", null);
	}
</script>
<body>
	<div id="header">a</div>
	<div id="header2">
		<jsp:include page="product_TopMenu.jsp"></jsp:include>
	</div>
	<div id="sidebar">b</div>
	<div id="content">c</div>
</body>
</html>