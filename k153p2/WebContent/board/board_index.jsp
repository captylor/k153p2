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

<script>
	$(function() {
		$("#sidebar").load("board_Menu.jsp");
	});
	$(document).on('click', '.inputB', function() { //사이드 메뉴 클릭
		var sideMenu = $(this).attr("id"); //사이드 메뉴 중 어느것을 선택했는지
		var htmlText = "";
		if (sideMenu.match("freeB")) {
			$.ajax({
				type : "post",
				url : "list_json.jsp",
				data : {
					sideMenu : sideMenu,
					crr_page : "1"
				},
				dataType : "json",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {

						htmlText += "<tr>"
							+ "<td class=\"td1\">" + data[i].b_no + "</td>"
							+ "<td class=\"td2\">" + data[i].b_id + "</td>"
							+ "<td class=\"td3\">" + data[i].b_title + "</td>"
							+ "<td class=\"td2\">" + data[i].b_firstD + "</td>"
							+ "<td class=\"td2\">" + data[i].b_lastD + "</td>"
							+ "</tr>";
					}
					$("#content").load("freeB_list.jsp", function(responseTxt, statusTxt, xhr) {
						if (statusTxt == "success")
							$('#list > tbody').html(htmlText);
						if (statusTxt == "error")
							alert("Error: " + xhr.status + ": " + xhr.statusText);
					});
				},
				error : function(xhr, status, error) {
					console.log("에러!: " + error + " " + "상태" + status);
				},
			});
		}
	}); //사이드 메뉴 클릭

	$(document).on('click', '.pagination > a', function() {
		var crr_page = $(this).text();
		var htmlText = '';
		$.ajax({
			type : "post",
			url : "list_json.jsp",
			data : {
				sideMenu : "freeB",
				crr_page : crr_page
			},
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					htmlText += "<tr>"
						+ "<td class=\"td1\">" + data[i].b_no + "</td>"
						+ "<td class=\"td2\">" + data[i].b_id + "</td>"
						+ "<td class=\"td3\">" + data[i].b_title + "</td>"
						+ "<td class=\"td2\">" + data[i].b_firstD + "</td>"
						+ "<td class=\"td2\">" + data[i].b_lastD + "</td>"
						+ "</tr>";
				}
				$("#content").load("freeB_list.jsp", function(responseTxt, statusTxt, xhr) {
					if (statusTxt == "success")
						$('#list > tbody').html(htmlText);
					if (statusTxt == "error")
						alert("Error: " + xhr.status + ": " + xhr.statusText);
				});
			},
			complete : function(data) {},
			error : function(xhr, status, error) {
				console.log("에러!: " + error);
				console.log("상태" + status);
			},
		});
	});

	$(document).on('click', '#writingBt', function() {
		//로그인한 세션이 있다면
		var w = 500;
		var h = 300;//Update  폼은 350
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2);
		window.open("board_Free_Input.jsp", "글쓰기", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
	});
	
	$(document).on('click', '.td3', function() {//내용 클릭
		var pl = $(this).text();
		alert(pl);
	});
</script>
<title>게시판</title>
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