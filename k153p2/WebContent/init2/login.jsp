<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<script type="text/javascript">
	function join(){
		location.href="member.do?action=join";
	}
</script>
</head>
<%-- login.jsp --%>
<body>
	<center>
		<font size="20">로그인</font><br> <br>
		<form action="member.do?action=beginning" method="post">
			<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" name="id"></td>
			</tr>
			<tr>
				<td align="right">PASS :</td>
				<td><input type="password" size="20" name="pass"></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="submit" value="확인"> <input type="button" value="회원가입" onclick="join()"></td>
			</tr>

			</table>
		</form>
	</center>
</body>
</html>