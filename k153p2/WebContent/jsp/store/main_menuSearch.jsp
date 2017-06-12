<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title> 
<script type="text/javascript" src="/js/ajax2.js"></script>
<script type="text/javascript">
  //제품군 선택
  function requsetItemType(){//요청
  	new ajax.xhr.Request('/k153p2/jsp/store/ItemType.jsp', null, resultItemType, 'GET');
  }//requsetItemType
  
  function resultItemType(xhr){//콜백
  	if(xhr.readyState==4 && xhr.status==200){
  		var str = xhr.responseText;
  		var itemType = document.getElementById('itemType');
  		itemType.innerHTML=str;
  	}
  }//resultItemType
  
  //==============================================================
  
  	
  window.onload=function(){
  	requsetItemType();
  }
</script>
</head>
<%--main_menuSearch.jsp --%>
<body>
  <center>
	<table width="1024" height="768" border='0' cellpadding="0" cellspacing="0">
		<tr height='10'>
			<td colspan='2' align='right'>
				<c:if test="${login == null}">
					<div id='login'><%@include file="/jsp/login.jsp" %></div>
				</c:if>
				<c:if test="${login != null }">
					<div id='logout'><%@include file="/jsp/logout.jsp" %></div>
				</c:if>
			</td>
		</tr>
		<tr height="90">
			<td colspan='2'>
				<div id='head'><%@include file="/jsp/head.jsp" %></div>
			</td>
		</tr>
		<tr>
			<td width="200" valign="top" align="center">
				<div id='menu'><%@include file="/jsp/store/menu.jsp" %></div>
			</td>
			<td valign="top" align="center">
				<div id='body'><%@include file="/jsp/store/store_MenuSearch.jsp" %></div>
			</td>
		</tr>
	</table> 
  </center>

</body>
</html>