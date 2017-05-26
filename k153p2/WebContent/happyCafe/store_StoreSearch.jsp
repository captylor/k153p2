<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--store_StoreSearch.jsp
	매장검색.jsp	
--%>
<body>
	<h3>매장검색</h3><br>
	<form action="" name="" method="post">
	<table	border="0">
	<tr>
	  <td align="right" colspan="2">
	   <select name="location">
		 <option>가산</option>
		 <option>독산</option>
		 <option>구로</option>
		 <option>안양</option>
		 <option>수원</option>
		 <option>인천</option>
		 <option>홍대</option>
		 <option>종로</option>
		 <option>신림</option>
	   </select>
	   <input type="text" name="selStore">
	   <input type="submit" value="검색">
	  </td>
	</tr>
	  <tr>
	    <td><a href="/store_Result.jsp"><img alt="" src="../image/shinroot.jpg"></a></td>
	    <td>
	      <ul>
	        <li>지점명: Happy</li>
	        <li>지점위치: 서울특별시 금천구 가산동</li>
	      </ul>
	    </td>
	  </tr>
	</table>
	</form>

</body>
</html>