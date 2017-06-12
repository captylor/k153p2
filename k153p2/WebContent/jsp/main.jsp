<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환영합니다</title>
<script type="text/javascript" src='/k153p2/js/ajax.js'></script>
<script type="text/javascript">
function member_load(x){
	sendRequest('/k153p2/member.do', 'action='+x, member_loaded, 'POST');
}

function member_loaded(){
	if(xhr.readyState==4 && xhr.status==200){
		var body = document.getElementById('body');
		var htmlText = xhr.responseText;
		body.innerHTML = htmlText;
	}
}

function load(x){
		sendRequest('/k153p2/main.do', 'action='+x, loaded, 'POST');
}

function loaded(){
	if(xhr.readyState==4 && xhr.status==200){
		var body = document.getElementById('body');
		var htmlText = xhr.responseText;
		body.innerHTML = htmlText;
	}
}


/* function newWindow(){
	var sStatus = 'toolbar=no,location=no,status=no,menubar=no,scrollbars=no,resizable=no,'
		+ 'width=400,height=10,top=100,left=100';
	window.open('/TomTest/index.do?hpage=xxx', '', sStatus);
} */
</script>
</head>
<body>
	<center>
	<table width="1024" height="768" border='0' cellpadding="0" cellspacing="0">
		<tr height='10'>
			<td align='right'>
				<c:if test="${login == null}">
					<div id='login'><%@include file="login.jsp" %></div>
				</c:if>
				<c:if test="${login != null }">
					<div id='logout'><%@include file="logout.jsp" %></div>
				</c:if>
			</td>
		</tr>
		<tr height="90">
			<td>
				<div id='head'><%@include file="head.jsp" %></div>
			</td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<div id='body'>
				<table>
				<!-- <img style="height: 200px; width: auto;"> -->
				<!-- http://localhost:8282/k153p2/product/product_Info.jsp?product=281 -->
					<tr>
						<td width="33%" align="center" valign="middle">
							<a href="/k153p2/product.do?action=item${list[0].item_no}">
								<img style="height: 200px; width: auto;" src="/k153p2${list[0].item_photo }" />
							</a>
						</td>
						<td width="33%"></td>
						<td width="33%" align="center" valign="middle">
							<a href="/k153p2/product.do?action=item${list[1].item_no}">
								<img style="height: 200px; width: auto;" src="/k153p2${list[1].item_photo }" />
							</a>
						</td>
					</tr>
					<tr>
						<td width="33%"></td>
						<td width="33%" align="center" valign="middle">
							<a href="/k153p2/product.do?action=item${list[2].item_no}">
								<img style="height: 200px; width: auto;" src="/k153p2${list[2].item_photo }" />
							</a>
						</td>
						<td width="33%"></td>
					</tr>
					<tr>
						<td width="33%" align="center" valign="middle">
							<a href="/k153p2/product.do?action=item${list[3].item_no}">
								<img style="height: 200px; width: auto;" src="/k153p2${list[3].item_photo }" />
							</a>
						</td>
						<td width="33%"></td>
						<td width="33%" align="center" valign="middle">
							<a href="/k153p2/product.do?action=item${list[4].item_no}">
								<img style="height: 200px; width: auto;" src="/k153p2${list[4].item_photo }" />
							</a>
						</td>
					</tr>
				</table>
				</div>
			</td>
		</tr>
	</table> 
	</center>
</body>
</html>