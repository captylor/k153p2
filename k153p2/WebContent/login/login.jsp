<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

</script>
<center>
	<font size="20">로그인</font><br> <br>
	<form method="post" name="frm" action="member.do?action=beginning">
		<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" name="id" id="id"></td>
			</tr>
			<tr>
				<td align="right">PASS :</td>
				<td><input type="password" size="20" name="pass" id="pass"></td>
			</tr>

			<tr>
				<td></td>
				<td><input type="button" value="확인" id="login"> <input
					type="button" value="회원가입" id="signBt">
					<div id="d1"></div></td>

			</tr>

		</table>
	</form>
</center>
