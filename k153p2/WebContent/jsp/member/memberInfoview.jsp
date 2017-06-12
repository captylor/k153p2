<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
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
<br/><br/><br/><br/><br/>
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
			<tr>
				<td></td>
				<td><input type="submit" value="수정"> <input type="button" value="탈퇴" onclick="leave()"></td>
			</tr>
			</table>
		</form>