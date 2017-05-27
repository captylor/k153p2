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
						htmlText += 
							"<div class=\"gallery\" id=\""+data[i].item_no+" \">"
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
	$(document).on('click', '.gallery', function() {
		var img = $(this).attr("id");
	
		var winHeight = document.body.clientHeight;	// 현재창의 높이
		var winWidth = document.body.clientWidth;	// 현재창의 너비
		var winX = window.screenLeft;	// 현재창의 x좌표
		var winY = window.screenTop;	// 현재창의 y좌표
		
		var popWidth = 300;
		var popHeight = 500;
		var popX = winX + (winWidth - popWidth)/2;
		var popY = winY + (winHeight - popHeight)/2;
		var iteminfoPOP = window.open("./product_Info.jsp","popup","width="+popWidth+"px,height="+popHeight+"px,top="+popY+",left="+popX);
	});
	
	$(document).on('click', '#sideMenu', function() {
		$(".input").toggle();
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
