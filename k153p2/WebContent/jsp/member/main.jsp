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
</script>
</head>
<body>
	<center>
	<table width="1024" height="768" border='0' cellpadding="0" cellspacing="0">
		<tr height='10'>
			<td align='right'>
				<c:if test="${login == null}">
					<div id='login'><%@include file="/jsp/login.jsp" %></div>
				</c:if>
				<c:if test="${login != null }">
					<div id='logout'><%@include file="/jsp/logout.jsp" %></div>
				</c:if>
			</td>
		</tr>
		<tr height="90">
			<td>
				<div id='head'><%@include file="/jsp/head.jsp" %></div>
			</td>
		</tr>
		<tr>
			<td valign="top" align="center">
				<div id='body'>
					<c:if test="${action == null}"><%@include file="/jsp/member/loginForm.jsp" %></c:if>
					<c:if test="${action == 'join'}"><%@include file="/jsp/member/memberInput.jsp" %></c:if>
					<c:if test="${action == 'start'}"><%@include file="/jsp/member/start.jsp" %></c:if>
					<c:if test="${action == 'begin'}"><%@include file="/jsp/member/beginning.jsp" %></c:if>
					<c:if test="${action == 'memberinfo'}"><%@include file="/jsp/member/memberInfoview.jsp" %></c:if>
					<c:if test="${action == 'memberupdate'}"><%@include file="/jsp/member/memberUpdate.jsp" %></c:if>
				</div>
			</td>
		</tr>
	</table> 
	</center>
</body>
</html>