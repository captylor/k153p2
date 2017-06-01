<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function join(){
		
		location.href="member.do?action=join";
	}
	 $(document).on('click', '#login', function() {
		$.ajax({
			url : "/k153p2/init2/result2.jsp",
			type : "post",
			data : {
				id : $('#id').val(),
				pass : $('#pass').val()
			},			
			//dataType : "html",
			success : function(result) {
						if(result.match("로그인성공")){
							document.frm.submit();
							
						}else{
							result="<font color=red>아이디가 존재하지 않거나,<br> 비밀번호가 일치하지 않습니다.</font>"
							document.frm.id.value='';
							document.frm.pass.value='';
							
							$('#d1').html(result);
						} 
			}
			
			
		});
	});
</script>
</head>
<%-- login.jsp --%>
<body>
	<center>
		<font size="20">로그인</font><br> <br>
		<form method="post" name="frm" action="member.do?action=beginning">
			<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" name="id" id="id"> </td>
			</tr>
			<tr>
				<td align="right">PASS :</td>
				<td><input type="password" size="20" name="pass" id="pass"></td>
			</tr>
			
			<tr>
				<td></td>
				<td><input type="button" value="확인" id="login"> <input type="button" value="회원가입" onclick="join()"> 
				<div id=d1></div></td>
				
			</tr>
			
			</table>
		</form>
	</center>
</body>
</html>