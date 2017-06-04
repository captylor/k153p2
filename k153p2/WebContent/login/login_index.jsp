<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 여기서 계속 한글이 깨지네 -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"></meta>
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css"></link>
<%--스타일 시트 적용 --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).on('click', '#login', function() { //로그인 버튼 클릭
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/login/result/login_process_json.jsp",
			data : {
				id : $("#id").val(),
				pass : $("#pass").val()
			},
			dataType : "json",
			success : function(data) {
				htmlText = data.loginResult; //
				if (htmlText.match("success")) {
					console.log("id : " + "${loginInfo.member_id}");
					console.log("pass : " + "${loginInfo.member_grade}");
					$("#login").text("${loginInfo.member_name}" + "님, 환영합니다");
					$(location).attr('href', '/k153p2/intro.do');
				} else {
					$("#d1").html("아이디 또는 비밀번호가 맞지 않습니다");
				}
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error + " " + "상태" + status);
			},
		});
	});
	
	$(document).on('click', '#signBt', function() {
		$(location).attr('href', '/k153p2/login/login_sign_index.jsp');
	});
</script>

</head>
<body>
	<div id="header"></div>
	<div id="header2">
		<jsp:include page="/product/product_TopMenu.jsp"></jsp:include></div>
	<div id="sidebar"></div>
	<div id="content">
		<jsp:include page="/login/login.jsp"></jsp:include>
	</div>
</body>
</html>