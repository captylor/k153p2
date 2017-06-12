<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<script type="text/javascript" src="/js/ajax2.js"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>

	 	//시도 출력
		/* function requsetSido() { //요청
			new ajax.xhr.Request('localhost/k153p2/jsp/store/sido.jsp', null, resultSido, 'GET');
		}

		function resultSido(xhr) { //콜백
			if (xhr.readyState == 4 && xhr.status == 200) {
				var str = xhr.responseText;
				var location = document.getElementById('location');
				location.innerHTML = str;
			}
		} */
		//================================================================

		function submit_action() { //select 체인지시 submit
			document.frm.submit();
		}

		/* window.onload = function() {
			requsetSido();
		}  */

	$(function() {
		var htmlText = "";
		$.ajax({
			type : "post",
			url : "/k153p2/find_store.do?action=sido",
			success : function(data) {
				htmlText = data;
				$('#location').html(htmlText);
			}
		});
	});
		
	/* $(function() {
		$.ajax({
			type : "post",
			url : "/k153p2/find_store.do?action=itemtype",
			success : function(data) {
				$("#itemType").html(data);
			}
		});
	}); */
	
</script>
</head>
<%--main.jsp --%>
<body>
	<center>
		<table width="1024" height="768" border='0' cellpadding="0"
			cellspacing="0">
			<tr height='10'>
				<td colspan='2' align='right'><c:if test="${login == null}">
						<div id='login'><%@include file="/jsp/login.jsp"%></div>
					</c:if> <c:if test="${login != null }">
						<div id='logout'><%@include file="/jsp/logout.jsp"%></div>
					</c:if></td>
			</tr>
			<tr height="90">
				<td colspan='2'>
					<div id='head'><%@include file="/jsp/head.jsp"%></div>
				</td>
			</tr>
			<tr>
				<td width="200" valign="top" align="center">
					<div id='menu'><%@include file="/jsp/store/menu.jsp"%></div>
				</td>
				<td valign="top" align="center">
					<div id='body'><%@include
							file="/jsp/store/store_StoreSearch.jsp"%></div>
				</td>
			</tr>
		</table>
	</center>

</body>
</html>