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
	function login(){
		
		location.href="member.do?action=beginning";
	}
	 $(document).on('click', '#login', function() {
		var id = $('#id').val();
		var pass = $('#pass').val();
		var htmlText = '';
		
		
		$.ajax({
			type : "post",
			url : "/k153p2/init2/result2.jsp",
			data : {
				id : id
			},
			
			dataType : "html",
			success : function(data) {
					htmlText += data;
							alert(htmlText);
						if(htmlText.match("로그인성공")){
							login();
						}else{
							htmlText="<font>아이디와 비밀번호를 확인후 입력해 주세요</font>"
							
							$('#d1').html(htmlText);
						}
							
							 
			},
			complete : function(data) {
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error);
				console.log("상태" + status);
			},
		});
	});
</script>
</head>
<%-- login.jsp --%>
<body>
	<center>
		<font size="20">로그인</font><br> <br>
		<form method="post">
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
				<td><input type="button" value="확인" id="login"> <input type="button" value="회원가입" onclick="join()"><div id=d1>asd</div></td>
				
			</tr>
			
			</table>
		</form>
	</center>
</body>
</html>