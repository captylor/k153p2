<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제품신청</title>
</head>
<body><center>
       <form action="" method="post">
       <table border=1 cellpadding="5">
       <tr><td colspan="2" align="center">제품신청</td></tr>
       <tr><th>제품번호</th><th>수량</th></tr>
       <c:forEach var="i" begin="1" end="256">
       <tr><td align="center">${i }</td><td><input type="text" name=""></td></tr>
       </c:forEach>
       
       <tr><td colspan="2" align="center"><input type="submit" value="발송">
       <button onclick="window.close()">취소</button></td></tr>
      </table>
      </form>
      </center>
</body>
</html>