<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<%--store_Result.jsp
	매장상세정보.jsp	
--%>
<body>
	<center>
	<h3>매장상세정보</h3><br>
	<form action="javascript:history.back()" name="resultForm" method="post">
	<table	border="0">
	  <tr>
	    <td></td>
	    <td align="right"><input type="submit" value="목록"></td>
	  </tr>
	  <tr>
	    <td><img src='/TomTest/${store.store_photo }'></td>
	    <td>
	      <ul>
	        <li>지점명: ${store.store_name }</li>
	        <li>주   소: ${addr.ds_sido } ${addr.ds_gugun } ${addr.ds_dong } ${addr.store_addr2 }</li>
	        <li>전화번호: ${store.store_tel }</li>
	        <li>오픈날짜: ${store.store_openday }</li>
	      </ul>
	    </td>
	  </tr>
	</table>
	<hr><b>판매제품</b><br>
	<table>
	  <tr>
	  <c:forEach items="${product_list }" var="product" varStatus="productIndex">
	    <c:if test="${productIndex.index % 5 == 0 }">
	      </tr><tr>
	    </c:if>
	      <td align="center">
	        <img src='/TomTest${product.item_photo }'><br>    
	        ${product.item_name }
	      </td>
	  </c:forEach>
	 </table>
	</form>
	</center>
</body>
</html>