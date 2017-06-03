<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
</head>
<%--userInput.jsp --%>
<script type="text/javascript">
	
	function duplicate(){
		dpwin = window.open('member.do?action=duplicate','width=150,height=150, top=100 ,left=100');
		
	}
	
	function validCheck(){
		var idPattern = new RegExp('^[a-zA-Z][a-zA-Z0-9]{5,10}$','g');
		var passPattern = new RegExp('^[a-zA-Z0-9]{4,8}$','g');
		var emailPattern = new RegExp('^[a-z][a-z0-9_-]{3,11}@([a-z\d\.-]+)\.[a-z\.]{2,6}$','g');
		var id = document.frm.id.value;
		var pass = document.frm.pass.value;
		var pass2 = document.frm.pass2.value;
		var name = document.frm.name.value;
		var email = document.frm.email.value;
		
		if(id==""){
			alert('ID를 입력하세요!!');
			document.frm.id.focus();
		}else if(!idPattern.test(id)){  //아이디는 6~10자리 
			alert('ID는 영문자를 시작으로하는 6~10자리로 작성해 주세요!!'); 
			document.frm.id.focus();
		}else if(pass==''){
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
<body>
	<center>
		<font size="20">회원가입</font><br> <br>
		<form action="member.do?action=start" method="post" name="frm">
			<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" name="id" readonly="readonly" onclick="duplicate()"> <input type="button" value="중복확인" onclick="duplicate()"></td>
				
			</tr>
			<tr>
				<td align="right">비밀번호 :</td>
				<td><input type="password" size="20" name="pass"></td>
			</tr>
			<tr>
				<td align="right">비밀번호확인 :</td>
				<td><input type="password" size="20" name="pass2"></td>
			</tr>
			<tr>
				<td align="right">이 름 :</td>
				<td><input type="text" size="20" name="name"></td>
			</tr>
			<tr>
				<td align="right">E-mail :</td>
				<td><input type="text" size="20" name="email"></td>
			</tr>
			<tr>
				<td align="right">사진 :</td>
				<td><input type="file"></td>
			</tr>
			<br>
			<tr>
				<td></td>
				<td><input type="submit" value="확인" onclick="return validCheck()"> <input type="button" value="취소"></td>
				<td></td>
			</tr>
		</table>
		</form>
	</center>
</body>
</html>