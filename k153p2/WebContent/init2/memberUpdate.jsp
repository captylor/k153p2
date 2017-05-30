<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보수정</title>
</head>
<script type="text/javascript">
	function msg(){
		alert("ID는 변경할 수 없습니다!!");
	}
	
</script>
<%--memberUpdate --%>
<body>
	<center>
		<font size="20">정보수정</font><br> <br>
		<form action="member.do?action=updateinfo" method="post">
			<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" readonly="readonly" value="${member.member_id }" name="id" onclick="msg()"></td>
				
			</tr>
			<tr>
				<td align="right">비밀번호 :</td>
				<td><input type="password" size="20" value="${member.member_pass }" name="pass"></td>
			</tr>
			<tr>
				<td align="right">비밀번호확인 :</td>
				<td><input type="password" size="20" value="${member.member_pass }" name="pass2"></td>
			</tr>
			<tr>
				<td align="right">이름 :</td>
				<td><input type="text" size="20" value="${member.member_name }" name="name"></td>
			</tr>
			<tr>
				<td align="right">E-mail :</td>
				<td><input type="text" size="20" value="${member.member_email }" name="email"></td>
			</tr>
			<br>
			<tr>
				<td></td>
				<td><input type="submit" value="수정"> <input type="reset" value="취소"></td>
				<td></td>
			</tr>
			</table>
		</form>
	</center>
</body>
</html>