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
							+ "<td id=\"" + data[i].b_no + "\" class=\"td3\">" + data[i].b_title + "</td>"
							+ "<td class=\"td2\">" + data[i].b_firstD + "</td>"
							+ "<td class=\"td2\">" + data[i].b_lastD + "</td>"
							+ "</tr>"
							+ "<tr><td colspan=5 id=\"conTxt_" + data[i].b_no + "\"  class=\"panel\"></td></tr>";
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
						+ "<td id=\"" + data[i].b_no + "\" class=\"td3\">" + data[i].b_title + "</td>"
						+ "<td class=\"td2\">" + data[i].b_firstD + "</td>"
						+ "<td class=\"td2\">" + data[i].b_lastD + "</td>"
						+ "</tr>"
						+ "<tr><td colspan=5 id=\"conTxt_" + data[i].b_no + "\"  class=\"panel\"></td></tr>";
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
			}
		});
	});

	$(document).on('click', '#writingBt', function() {
		var w = 500;
		var h = 300; //Update  폼은 350
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2);
		window.open("board_Free_Input.jsp", "글쓰기", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
	});

	$(document).on('click', '.td3', function() { //게시판 제목을 클릭
		var article_no = $(this).attr("id");
		var conTxt = "conTxt_" + article_no;
		//ajax써서 값 가져오고
		$.ajax({
			url : "conTxt_json.jsp",
			dataType : "json",
			data : {
				title : "title",
				article_no : article_no
			},
			success : function(data) {
				$("#conTxt_" + article_no).html(data.b_conTxt);
				$("#conTxt_" + article_no).slideToggle("slow");
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error);
				console.log("상태" + status);
			}
		});
	});

	$(document).on('click', ".panel", function() { // 게시판 본문을 클릭 수정 또는 삭제 요청
		var article_no = $(this).attr("id").substring(7);
		var passcheck = null;
		$.ajax({
			url : "conTxt_json.jsp",
			dataType : "json",
			data : {
				article_no : article_no
			},
			success : function(data) {
				passcheck = data.m_pass;
				if (passcheck == '${loginInfo.member_pass }') {
					var w = 500;
					var h = 370; //Update  폼은 350
					var left = (screen.width / 2) - (w / 2);
					var top = (screen.height / 2) - (h / 2);
					var updataForm = window.open("board_Free_Update.jsp?no=" + article_no, "글쓰기", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

				} else {
					alert("수정할 권한이 없습니다");
				}
			}
		});
	});

	$(document).on('click', '#sideMenu', function() { // 토글기능
		$(".inputB").toggle();
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