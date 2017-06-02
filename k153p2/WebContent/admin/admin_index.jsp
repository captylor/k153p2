<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css"></link>
<%--스타일 시트 적용 --%>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>

<script>
	//-------------------------------가맹 안내 슬라이드-----------------------------------------
	var bg = new Array();
	bg[0] = "/k153p2/img/까페1.png";
	bg[1] = "/k153p2/img/까페2.png";
	bg[2] = "/k153p2/img/까페3.png";
	var i = 0;
	//-------------------------------------------------------------------------------------

	$(function() {
		$("#sidebar").load("${pageContext.request.contextPath}/admin/admin_Menu.jsp");
		setInterval(function() {
			$("#table001_id").css({'background-image':'url('+bg[i]});
			i = (i < 2) ? i+1 : 0;
			}, 3000);
	});
	$(document).on('click', '#sideMenu1', function() { //토글 기능
		$("#subSideM1").toggle();
	});
	$(document).on('click', '#sideMenu2', function() { //토글 기능
		$("#subSideM2").toggle();
	});
	$(document).on('click', '#sideMenu3', function() { //토글 기능
		$("#subSideM3").toggle();
	});

	$(document).on('click', '.input', function() { //토글 기능
		var subSideMenu_id = $(this).attr("id");
		if (subSideMenu_id.match("franchiseIntro")) { //가맹 안내를 선택
			$("#content").load("${pageContext.request.contextPath}/admin/index_franchiseIntro.jsp");
		} else if (subSideMenu_id.match("branch_office_Manager")) { //지점 관리를 선택

		} else if (subSideMenu_id.match("product_order")) { //물품 구매를 선택

		} else if (subSideMenu_id.match("branch_office_Net_Sales")) { //지점별 매출를 선택

		} else { //물품 보내기를 선택

		}
	});
</script>

<title>Insert title here</title>
</head>
<body>
	<div id="header">a</div>
	<div id="header2">
		<jsp:include page="/product/product_TopMenu.jsp"></jsp:include>
	</div>
	<div id="sidebar">b</div>
	<div id="content">c</div>
	<div id="testDiv"></div>
</body>
</html>