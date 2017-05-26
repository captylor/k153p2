<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%-- 제품 카테고리 매뉴
음료를 클릭 시 >>
 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
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
			document.getElementById("c").innerHTML = str;
			alert(str);
		}
	}
	
	side_load("product_Menu.jsp");
</script>
</head>
<style>
#a {
	background-color: gray;
}

#b {
	background-color: blue;
}

#c {
	background-color: red;
}
</style>
<body>
	<span id="a">cccc</span>
	<div id="b">bbbb</div>
	<p id="c">aaaa</p>
	
</body>
</html>