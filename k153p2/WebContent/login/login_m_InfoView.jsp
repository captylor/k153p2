<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script type="text/javascript">
	$(document).on('click', '#m_view_update', function() {
		alert("a");
		var w = 500;
		var h = 400; //Update  폼은 350
		var left = (screen.width / 2) - (w / 2);
		var top = (screen.height / 2) - (h / 2);
		window.open("login_m_Update.jsp", "정보 수정", 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width=' + w + ', height=' + h + ', top=' + top + ', left=' + left);

	});
	function leave(){
		var passcheck = prompt('탈퇴하시려면 비밀번호를 입력하세요');
		if(passcheck==='${loginInfo.member_pass }'){
			if(confirm('정말 탈퇴하시겠습니까??')) {
				alert('그 동안 저희 HappyCafee를 이용해 주셔서 대단히 갑사합니다.\n 좋은 서비스로 다시 찾아뵙겠습니다. :) ') ;
				$.ajax({
					type : "post",
					url : "${pageContext.request.contextPath}/login/result/login_leave_json.jsp",
					data : {
						id : "${loginInfo.member_id }"
					},
					dataType : "json",
					success : function(data) {
						htmlText = data.loginResult; //
						if (htmlText.match("success")) {
							$(location).attr('href', '/k153p2/intro.do');
						} else {
							$("#d1").html("서버 오류에 따라 정상적으로 탈퇴하지 못하였습니다");
						}
					},
					error : function(xhr, status, error) {
						console.log("에러!: " + error + " " + "상태" + status);
					},
				});
				location.href="/k153p2/login/result/login_process_json.jsp?logout=true"; //로그아웃 날려버리고
			
			}else{
				alert('탈퇴가 취소되었습니다');
			}
		}else{
			alert("비밀번호가 일치하지 않습니다!!");
		}
	}
</script>

<center>
	<font size="20">정보보기</font><br> <br>
	<form method="post">
		<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" readonly="readonly"
					value="${loginInfo.member_id }" style="border: 0;"></td>

			</tr>
			<tr>
				<td align="right">비밀번호 :</td>
				<td><input type="password" size="20" readonly="readonly"
					value="${loginInfo.member_pass }" style="border: 0;"></td>
			</tr>
			<tr>
				<td align="right">이 름 :</td>
				<td><input type="text" size="20" readonly="readonly"
					value="${loginInfo.member_name }" style="border: 0;"></td>
			</tr>
			<tr>
				<td align="right">E-mail :</td>
				<td><input type="text" size="20" readonly="readonly"
					value="${loginInfo.member_email }" style="border: 0;"></td>
			</tr>
			<tr>
				<td align="right">유저등급 :</td>
				<td><input type="text" size="20" readonly="readonly"
					value="${loginInfo.member_grade }" style="border: 0;"></td>
			</tr>
			<br>
			<tr>
				<td></td>
				<td><input type="button" value="수정" id="m_view_update">
					<input type="button" value="탈퇴" id="m_view_leave" onclick="leave()"></td>
				<td></td>
			</tr>
		</table>
	</form>
</center>
