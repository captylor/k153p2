<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="../css/basic.css">
<%--스타일 시트 적용 --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script type="text/javascript">

	function side_load(pageName) { //요청
		alert("사이드 페이지 : " + pageName);
		sendRequest(pageName, null, side_loaded, 'POST');
	//document.getElementById("sidebar").innerHTML = "aaaa"; //왜 이 부분이 들어가냐 사이드 바 메뉴가 나오는??/
	}
	function side_loaded() { //콜백
		//데이터요청한 후 할일
		if (xhr.readyState == 4 && xhr.status == 200) {
			var str = xhr.responseText; //str: String ==> "Hello,Ajax~!!" 
			console.log(str);
			var content = document.getElementById('sidebar');
			console.log(typeof (content));
			content.innerHTML = str;
		}
	}
	//$("#div 아이디").load("로딩할 페이지 URL", {넘길 파라메터});
</script>
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
	alert(side);
	if (side.match("drink")) {
		$("#content").load("product_List.jsp");
	} else if (side.match("bread")) {
		$("#content").load("product_List.jsp");
	}
</script>

</html>
