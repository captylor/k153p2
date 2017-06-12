<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
function logout(){
	alert('로그아웃하였습니다');
	location.href='/k153p2/member.do?action=logout';
}
</script>
<span id='memberid'>${login}</span> [ <span id='membergrade'>${grade }</span> ] 님 안녕하세요
<a href="javascript:logout();">로그아웃</a>
<a href='/k153p2/member.do?action=memberupdate'>회원정보</a>