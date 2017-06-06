<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품신청</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/ajax2.js"></script>
	<script type="text/javascript">
		function requestStorename(){//요청
			new ajax.xhr.Request('../k153p2/init2/storeselect.jsp', null, resultStorename, 'GET');
		}
		function resultStorename(xhr){//콜백
			if(xhr.readyState==4 && xhr.status==200){
				var str = xhr.responseText;
				var store_name = document.getElementById("store_name");
				store_name.innerHTML=str;
			}
		}
		
		window.onload=function(){
			requestStorename();
		}
		
		function showstore(){
			document.frm.submit();
		}
	</script>
</head>
<body>
	<center>
			<table border=1 cellpadding="5">
				<tr>
					<td colspan="2" align="center">제품신청</td>
				</tr>
				<tr>
		<form method="post" name="frm" action="member.do?action=showstore">
					<td colspan="2" align="right">지점명								
						<select name="store_name" id="store_name" onchange="showstore()">
							<option >==선택==</option>
						</select>
		</form>
					</td>
				</tr>
				<tr>
					<th>제품명</th>
					<th>수량</th>
				</tr>
		<form method="post" action="member.do?action=inputguest">
				<c:forEach items="${product }" var="product" varStatus="names">							
					<tr>
						<td align="center">${product}</td>
						<td><input type="text" name="${names.index}" id="${product.substring(4)}"> 개</td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="발송">
						<input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>