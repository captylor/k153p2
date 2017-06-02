<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="/TomTest/js/ajax.js"></script>
<script type="text/javascript">
function load(x){
	sendRequest('index.do', 'hpage='+x, loaded, 'POST');
}

function loaded(){
if(xhr.readyState==4 && xhr.status==200){
	var body = document.getElementById('body');
	var htmlText = xhr.responseText;
	body.innerHTML = htmlText;
}
}

function showhide(x){
if(document.getElementById(x).style.display==''){
	document.getElementById(x).style.display='none';
}else if(document.getElementById(x).style.display=='none'){
	document.getElementById(x).style.display='';
}
}
</script>
</head>
<body>
	<center>
	<table width="1024" height="768" border='0' cellpadding="0" cellspacing="0">
		<tr height='10' bgcolor="blue">
			<td colspan='2' align='right'>
				<div id='login'><%@include file="login.jsp" %></div>
			</td>
		</tr>
		<tr height="90">
			<td colspan='2'>
				<div id='head'><%@include file="head1.jsp" %></div>
			</td>
		</tr>
		<tr>
			<td width="200" valign="top" align="center">
				<div id='menu'><%@include file="menu1.jsp" %></div>
			</td>
			<td valign="top" align="center">
				<div id='body'><%@include file="head1.jsp" %></div>
			</td>
		</tr>
	</table> 
	</center>
</body>

</body>
</html>
<%-- <img src="${pageContext.request.contextPath}/checkId/happp.jpg" width='500'><br> --%>
<!-- 대한민국에서 가장 특별한 커피 연구소~! HappyCafe에서<br> -->
<!-- 여러분에게 더욱 큰 행복을 주기위해 노력하겠습니다!! -->

