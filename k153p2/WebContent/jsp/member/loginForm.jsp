<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript" src='/k153p2/js/ajax.js'></script>
<script src='/k153p2/js/jquery-3.2.1.min.js'></script>
<script type="text/javascript">
	function join(){
		location.href="member.do?action=join";
	}
	 $(document).on('click', '#login', function() {
		$.ajax({
			url : "/k153p2/jsp/member/result2.jsp",
			type : "post",
			data : {
				id : $('#id').val(),
				pass : $('#pass').val()
			},			
			//dataType : "html",
			success : function(result) {
						if(result.match("로그인성공")){
							document.frm.submit();
						}else if(result.match("로그인실패")){
							result="<font color=red>아이디가 존재하지 않거나,<br> 비밀번호가 일치하지 않습니다.</font>"
							document.frm.id.value='';
							document.frm.pass.value='';
							
							$('#d1').html(result);
						}
			}
			
		});
	});
</script>
<center>
<br/><br/><br/><br/><br/>
	<font size="20">로그인</font><br><br>
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
				<td><input type="button" value="확인" id="login">
					<input type="button" value="회원가입" onclick="join()"> 
					<div id=d1></div>
				</td>
			</tr>
		</table>
	</form>
</center>