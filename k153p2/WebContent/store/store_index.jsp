<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css"></link>
<%--스타일 시트 적용 --%>
<script src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>Insert title here</title>
<script>
	$(function() {
		$("#sidebar").load("store_Menu.jsp");
	});
	$(document).on('click', '#sideMenu', function() { // 토글기능
		$(".inputS").toggle();
	});

	$(document).on('click', '.inputS', function() { //매장 찾기를 누름
		var sideM = $(this).attr("id");
		if (sideM == "find_Store") {
			var htmlText = "";
			$("#content").load("store_StoreSearch.jsp", function(responseTxt, statusTxt, xhr) {
				if (statusTxt == "success") {
					$.ajax({
						type : "post",
						url : "json/store_Location_json.jsp",
						data : {
							data : "location"
						},
						dataType : "json",
						success : function(data) {
							htmlText += "<option>==선택==</option>";
							for (var i = 0; i < data.length; i++) {
								htmlText += "<option>" + data[i].location + "</option>";
							}
							$('#location').html(htmlText);
						}
					});
				}
			});

		} else { //매장 메뉴 검색
			$("#content").load("store_MenuSearch.jsp", function(responseTxt, statusTxt, xhr) {
				if (statusTxt == "success") {
					$.ajax({
						type : "post",
						url : "json/store_item_json.jsp",
						data : {
							data : "item"
						},
						dataType : "json",
						success : function(data) {
							htmlText += "<option>==선택==</option>";
							for (var i = 0; i < data.length; i++) {
								htmlText += "<option>" + data[i].type_name + "</option>";
							}
							$('#itemType').html(htmlText);
						}
					});
				}

			});
		}
	});

	$(document).on('change', '#location', function() {
		var loc = $(this).val(); //선택한 지역
		var htmlText = "";
		$.ajax({
			type : "post",
			url : "json/store_Location_json.jsp",
			data : {
				data : "loc_store",
				loc : loc
			},
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					htmlText += "<tr>"
						+ "<td><img alt=\"사진\" src='@@@' id=\"" + data[i].s_st_no + "\"></td>"
						+ "<td>"
						+ "<ul class=\"store_each_info\">"
						+ "<li>지점명: " + data[i].s_name + "</li>"
						+ "<li>주 소: " + data[i].s_sido + " " + data[i].s_gugun + " "
						+ data[i].s_dong + " " + data[i].s_addr2 + "</li>"
						+ "<li>전화번호: " + data[i].s_tel + "</li>"
						+ "</ul>"
						+ "</td>"
						+ "</tr>";
				}
				$('table > tbody').html(htmlText);
			}
		});
	});

	$(document).on('click', '#search_bt', function() {
		var htmlText = "";
		$.ajax({
			type : "post",
			url : "json/store_Location_json.jsp",
			data : {
				data : "loc_store",
				loc : loc
			},
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					htmlText += "<tr>"
						+ "<td>${sellStore.store_name }</td>"
						+ "<td>${addr.ds_sido }${addr.ds_gugun }${addr.ds_dong }" + "${addr.store_addr2 }</td>"
						+ "<td>${sellStore.store_tel }</td>"
						+ "</tr>";
				}
				$('#innerTable > tbody').html(htmlText);
			}
		});

	});

	$(document).on('click', 'img', function() {
		var stNo = $(this).attr("id");
		var w = 500;
		var h = 300; //Update  폼은 350
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2);
		var storeInfo = window.open("store_Result.jsp?no=" + stNo, "상세 정보", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);
	});
</script>
</head>
<body>
	<div id="header"></div>
	<div id="header2">
		<jsp:include page="/product/product_TopMenu.jsp"></jsp:include>
	</div>
	<div id="sidebar"></div>
	<div id="content"></div>
</body>
</html>