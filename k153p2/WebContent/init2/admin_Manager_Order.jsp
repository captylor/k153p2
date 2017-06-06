<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품신청</title>
<script type="text/javascript" src="../js/ajax2.js"></script>
	<script type="text/javascript">
	function requestStorename(){//요청
		new ajax.xhr.Request('storeselect.jsp?action=storeselect', null, resultStorename, 'GET');
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
	</script>
</head>
<body>
	<center>
		<form action="" method="post">
			<table border=1 cellpadding="5">
				<tr>
					<td colspan="2" align="center">제품신청</td>
				</tr>
				<tr>
					<td colspan="2" align="right">지점명								
						<select name="store_name" id="store_name" onclick="requestStorename()">
							<option>==선택=1</option>
						</select>
					</td>
				</tr>
				<tr>
					<th>제품번호</th>
					<th>수량</th>
				</tr>
				<c:forEach var="i" begin="1" end="5">							<!--  지점별 아이템 이진수로한거 받아서 넣기 -->
					<tr>
						<td align="center">${i }</td>
						<td><input type="text" name=""></td>
					</tr>
				</c:forEach>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="발송">
						<button>취소</button></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>