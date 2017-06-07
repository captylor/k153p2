<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원정보보기</title>
</head>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function order(){
		location.href="/k153p2/member.do?action=order"
	}
	function guest(){
		location.href="/k153p2/member.do?action=guest"
	}


	function leave(){
		var passcheck = prompt('탈퇴하시려면 비밀번호를 입력하세요');
		if(passcheck==='${member.member_pass }'){
			if(confirm('정말 탈퇴하시겠습니까??')){
				alert('그 동안 저희 HappyCafee를 이용해 주셔서 대단히 갑사합니다.\n 좋은 서비스로 다시 찾아뵙겠습니다. :) ');
				location.href="/k153p2/member.do?action=leave"
			
			}else{
				alert('탈퇴가 취소되었습니다');
			}
		}else{
			alert("비밀번호가 일치하지 않습니다!!");
		}
	}
</script>
<%--memberUpview.jsp --%>
<body>
	<center>
		<font size="20">정보보기</font><br> <br>
		<form action="member.do?action=memberupdate" method="post">
			<table cellpadding="5">
			<tr>
				<td align="right">I D :</td>
				<td><input type="text" size="20" readonly="readonly" value="${member.member_id }" style="border:0;"></td>
				
			</tr>    
			<tr>
				<td align="right">비밀번호 :</td>
				<td><input type="password" size="20" readonly="readonly" value="${member.member_pass }" style="border:0;"></td>
			</tr>
			<tr>
				<td align="right">이 름 :</td>
				<td><input type="text" size="20" readonly="readonly" value="${member.member_name }" style="border:0;"></td>
			</tr>
			<tr>
				<td align="right">E-mail :</td>
				<td><input type="text" size="20" readonly="readonly" value="${member.member_email }" style="border:0;"></td>
			</tr>
			<tr>
				<td align="right">유저등급 :</td>
				<td><input type="text" size="20" readonly="readonly" value="${member.member_grade }" style="border:0;"></td>
			</tr>
			<br>
			<tr>
				<td></td>
				<td><input type="submit" value="수정"> <input type="button" value="탈퇴" onclick="leave()"></td><br>
			</tr>

			<tr><!--기능추가용-->
				<td><input type="button" value="제품신청 테스트용 ㅎㅎ" onclick="order()"></td>
				<td><input type="button" value="게시판 테스트용" onclick="guest()"></td>
			</tr>
			
			</table>
		</form>
	</center>
</body>
</html>