<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/basic.css">
<%--스타일 시트 적용 --%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/ajax.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="${pageContext.request.contextPath}/js/productMenu.js"></script>

<script type="text/javascript">


	$(document).ready(function() {

		var menu = "${menu}";
		console.log("현재 " + menu);
		if (menu.match("true")) {
			side_load('product_Menu.jsp');
		}
	});

	$(document).on('click', 'input', function() {
		var side = $(this).val();
		var sideMenu = 0;
		var htmlText = '';
		if (side.match("빵")) {
			sideMenu = 1;
		} else {
			sideMenu = 2;
		}
		alert(side);
		$.ajax({
			type : "post",
			url : "testDB.jsp",
			data : {
				sideMenu : sideMenu
			},
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
/* 					htmlText += "<tr>"
						+ "<td>" + data[i].item_no + "</td>"
						+ "<td>" + data[i].item_name + "</td>"
						+ "<td>" + data[i].item_userPrice + "</td>"
						+ "<td>" + data[i].item_type + "</td>"
						+ "</tr>" */
						htmlText += 
							"<div class=\"gallery\">"
								+"<a target=\"_blank\" href=\"img_mountains.jpg\">" 
								+"<img src=\""+data[i].item_name+".jpg\" alt=\""+data[i].item_name+"\" width=\"600\" height=\"400\"></a>"
								+"<div class=\"desc\">"+data[i].item_no+","+data[i].item_userPrice+"</div>"
							+"</div>"
						
				}
			    $("#content").load("product_List.jsp", function(responseTxt, statusTxt, xhr){
			        if(statusTxt == "success")
			        	//$('table > tbody').html(htmlText);  
			        	$('#div3').html(htmlText);  
			        if(statusTxt == "error")
			            alert("Error: " + xhr.status + ": " + xhr.statusText);
			    });
				$('#div3').html(htmlText);
			},
			complete : function(data) {
				console.log(data[0]);
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error);
				console.log("상태" + status);
			},
		});
	});
	
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

	<div id="testDiv"></div>
</body>


</html>
