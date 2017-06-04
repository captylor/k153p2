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
	function validCheck(){
		var passPattern = new RegExp('^[a-zA-Z0-9]{4,8}$','g');
		var emailPattern = new RegExp('^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.[a-z\.]{2,6}$','g');
		var id = document.frm.id.value;
		var pass = document.frm.pass.value;
		var pass2 = document.frm.pass2.value;
		var name = document.frm.name.value;
		var email = document.frm.email.value;
		
		if(pass==''){
			alert('비밀번호를 입력하세요!!');
			document.frm.pass.focus();
		}else if(!passPattern.test(pass)){	//비밀번호는 4~8 영문숫자조합
			alert('비밀번호는 4~8로 구성된 영문 숫자 조합입니다!!');
			document.frm.pass.focus();
		}else if(pass2==''){
			alert('비밀번호를 입력하세요!!');
			document.frm.pass2.focus();
		}else if(pass !== pass2){
			alert('비밀번호가 일치하지 않습니다!!');
			document.frm.pass.value='';
			document.frm.pass2.value='';
			document.frm.pass2.focus();
		}else if(name == ''){
			alert('이름을 입력해주세요!!');
			document.frm.name.focus();
		}else if(email == ''){
			alert('E-Mail을 입력해주세요!!');
			document.frm.email.focus();
		}else if(!emailPattern.test(email)){  //이메일은 4~8자의 영문자숫자조합+@+영문자+.+영문자조합
			alert('이메일형식이 올바르지 않습니다!!');
			document.frm.email.focus(); 
		}else{
			return true;
		}
		return false;
	}
	
	
</script>
<%--memberUpdate --%>
<body>
	<center>
		<font size="20">정보수정</font><br> <br>
		<form method="post" name="frm" action="../member.do?action=updateEnd">
			<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" readonly="readonly" value="${loginInfo.member_id }" name="id" onclick="msg()"></td>
				
			</tr>
			<tr>
				<td align="right">비밀번호 :</td>
				<td><input type="password" size="20" value="${loginInfo.member_pass }" name="pass"></td>
			</tr>
			<tr>
				<td align="right">비밀번호확인 :</td>
				<td><input type="password" size="20" value="${loginInfo.member_pass }" name="pass2"></td>
			</tr>
			<tr>
				<td align="right">이름 :</td>
				<td><input type="text" size="20" value="${loginInfo.member_name }" name="name"></td>
			</tr>
			<tr>
				<td align="right">E-mail :</td>
				<td><input type="text" size="20" value="${loginInfo.member_email }" name="email"></td>
			</tr>
			<br>
			<tr>
				<td></td>
				<td><input type="submit" value="수정"  id="updatebt" onclick="return validCheck()"> <input type="reset" value="취소"></td>
				<td></td>
			</tr>
			</table>
		</form>
	</center>
</body>
</html>