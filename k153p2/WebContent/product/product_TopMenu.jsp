<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
ul {
	list-style-type: none;
	margin: 0;
	padding: 0;
	overflow: hidden;
	background-color: #333;
}

li {
	float: left;
}

li a {
	display: block;
	color: white;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
}

li a :hover:not (.active ){
	background-color: #111;
}

.active {
	background-color: #4CAF50;
}
</style>
</head>
<body>
	<ul style="float: right">
		<li><a href="#login" id="login">로그인</a></li>
		<li><a href="#signUp" id="signUp">회원가입</a></li>
	</ul>
	<ul>
		<li style="float: left"><a class="active" href="/k153p2/intro.do" id="home">Happy
				Cafe</a></li>
		<li><a href="/k153p2/item.do?itemMenu=true" id="page1">제품</a></li>
		<li><a href="#st" id="page2">매장 찾기</a></li>
		<li><a href="#contact" id="page3">매장 관리</a></li>
		<li><a href="#contact" id="page4">게시판</a></li>
	</ul>
</body>
</html>