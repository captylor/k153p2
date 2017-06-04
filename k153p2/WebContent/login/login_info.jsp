<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css"></link>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/buttonStyle.css"></link>
<%--스타일 시트 적용 --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).on("click", "#m_info", function() {
		$("div.wrap").load("${pageContext.request.contextPath}/login/login_m_InfoView.jsp");
	});
</script>
<title>Insert title here</title>
</head>
<body>
	<div id="header"></div>
	<div id="header2">
		<jsp:include page="/product/product_TopMenu.jsp"></jsp:include></div>
	<div id="content">
		<div class="wrap">
			<a href="#" class="button" id="m_info">회원 정보 보기</a> <a href="#"
				class="button2">뭔가 쓸게 있는데 생각이 안남</a>
		</div>
	</div>

</body>
</html>