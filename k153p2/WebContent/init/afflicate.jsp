<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="${pageContext.request.contextPath}/css/basic.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="header">
<center>
happycafe
</center>
</div>
<div id="header2">
<ul style="list-type-type:none">
<li style="display:inline"><a href=''>HappyCafe</a></li>
<li style="display:inline"><a href='product_Menu.jsp'>제품</a></li>
<li style="display:inline"><a href='store_Menu.jsp'>매장찾기</a></li>
<li style="display:inline"><a href='admin_Menu.jsp'>매장관리</a></li>
<li style="display:inline"><a href='board_menu.jsp'>게시판</a></li>
</ul>
</div>
<div id="sidebar" style="text-align:right"> 
<Strong>매장관리</Strong><br>
<a href="afflicate.do">가맹안내</a><br>
<Strong>지점장</Strong><br>
<a href="afflicate.do?manage=manage">지점관리</a><br>
<a href="afflicate.do?buy=buy">물품구매</a><br>
<Strong>관리자</Strong><br>
<a href="afflicate.do?sold=sold">지점별매출</a><br>
<a href="afflicate.do?send=send">물품보내기</a><br></div>
<div id="content">가맹안내<br>
<img src="${pageContext.request.contextPath}/checkId/가맹안내.jpg" width='500'><br>
가맹안내 페이지입니다.
</div>
</body>
</html>