<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>지점정보등록</title>
<script type="text/javascript">
 
 
 </script>
</head>
<body><center>
    <form action="store.do?action=update" method="post">
       <input type="hidden" name="store_no" value="${store.store_no }">
	    <table border="1" cellpadding="10">
	    <tr><td colspan="2" align="center"><font size="6">지점정보등록</font></td></tr>
	    <tr><td>지점명</td><td><input type="text" name="store_name" value="${store.store_name }"></td></tr>
	    <tr><td>주소</td><td><input type="text" name="store_addr" value="${store.store_addr }"></td></tr>
	    <tr><td> 연락처</td><td><input type="text" name="store_tel" value="${store.store_tel }"></td></tr>
	    <tr><td>판매아이템</td><td><input type="text" name="store_product" value="${store.store_product }"></td></tr>
	  <tr><td colspan="2" align="center">
	  <input type="submit" value="등록">
	  <button onclick="window.close()">취소</button></td></tr>
	  
	  </table>
  </form>
  </center>
</body>
</html>