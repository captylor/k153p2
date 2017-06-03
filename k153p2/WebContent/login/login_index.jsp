<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>Insert title here</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css"></link>
<%--��Ÿ�� ��Ʈ ���� --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	$(document).on('click', '#login', function() { //�α��� ��ư Ŭ��
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
					console.log("id : "+ "${loginInfo.member_id}");
					console.log("pass : "+"${loginInfo.member_grade}");
					$("#login").text("${loginInfo.member_name}"+"��, ȯ���մϴ�");

				} else {
					$("#d1").html("���̵� �Ǵ� ��й�ȣ�� ���� �ʽ��ϴ�");
				}
			},
			error : function(xhr, status, error) {
				console.log("����!: " + error + " " + "����" + status);
			},
		});
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

	<div id="testDiv"></div>
</body>
</html>