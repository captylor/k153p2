<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function() {
	$.ajax({
		type : "post",
		url : "/k153p2/find_store.do?action=itemtype",
		success : function(data) {
			$("#itemType").html(data);
		}
	});
});
</script>
<%--store_MenuSearch.jsp
	메뉴검색.jsp	
--%>
	<h3>메뉴검색</h3><br>
	<form method="post" name="">
	<table>
	<tr>
	  <td align="right" colspan="2">
	   <select name="itemType" id="itemType">
		   <option>==선택==</option>
	   </select>
	   <input type="text" name="item_name" id="item_name">
	   <input type="submit" value="검색">
	  </td>
	</tr>
	  <tr>
	    <table border='1'>
	    	<tr align="center">
	    	  <td>매장명</td>
	    	  <td>주소</td>
	    	  <td>전화번호</td>
	    	</tr>
	       <c:forEach items="${sellStoreList }" var="sellStore" varStatus="sellStoreIndex">
	    	 <tr>
	    	   <td><a href="find_store.do?action=result&storeNo=${sellStore.store_no }">${sellStore.store_name }</a><input type="hidden" name="storeNo" value="${sellStore.store_no }"></td>
	    	   <c:forEach items="${addrList }" var="addr" varStatus="addrIndex">
	    	     <c:if test="${sellStoreIndex.index eq addrIndex.index }">
	    	   <td>${addr.ds_sido } ${addr.ds_gugun } ${addr.ds_dong } ${addr.store_addr2 }</td>
	    	     </c:if>
	    	   </c:forEach>
	    	   <td>${sellStore.store_tel }</td>	    		
	    	 </tr>
	       </c:forEach>
	    </table>
	  </tr>
	</table>
	</form>