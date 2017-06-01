<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript">
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<table>
	<tr><th onclick='showhide("menudiv1");'><Strong>매장관리</Strong></th></tr>
	<tr>
	<td align='right'>
	<div id='menudiv1' style="display: '';">
	<a href='afflicate.do'>가맹안내</a>
	</div>
	</td>
	</tr>
	
	<tr><th onclick='showhide("menudiv2");'><Strong>지점장</Strong></th></tr>
	<tr>
	<td align='right'>
	<div id='menudiv2' style="display:none;">
	<a href='afflicate.do?manage=manage'>지점관리</a>
	<br/>
	<a href='afflicate.do?buy=buy'>물품구매</a>
	</div>
	</td>
	</tr>
	
	<tr><th onclick='showhide("menudiv3");'><Strong>관리자</Strong></th></tr>
	<tr>
	<td align='right'>
	<div id='menudiv3' style="display:none;">
	<a href='afflicate.do?sold=sold'>지점별매출</a>
	<br/>
	<a href='afflicate.do?send=send'>물품보내기</a>
	</div>
	</td>
	</tr>
	
	
	
	
</table>
</body>
</html>