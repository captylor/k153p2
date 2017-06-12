<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%--store_StoreSearch.jsp
	매장검색.jsp	
--%>
	<form name="frm" method="post">

	<h3>매장검색</h3><br>
	<table>
	<tr>
	  <td align="right" colspan="2">
	   <select name="location" id="location" onchange="submit_action()">
		   <option>==선택==</option>
	   </select>
	  </td>
	</tr>
	<c:forEach items="${list }" var="storeInfo" varStatus="storeIdx"> 
	  <tr> 												<!--'/k153p2/img/store/store1.jpg'  -->
	    <td><a href="find_store.do?action=result&storeNo=${storeInfo.store_no }"><img alt="" src='/k153p2${storeInfo.store_photo }'></a></td>
	    <td>
	      <ul>
	        <li><font size="4">지점명: ${storeInfo.store_name }</font></li>
	        <c:forEach items="${addrList }" var="addrInfo" varStatus="addrIdx">
	          <c:if test="${storeIdx.index eq addrIdx.index }">
	            <li><font size="4">주   소: ${addrInfo.ds_sido } ${addrInfo.ds_gugun } ${addrInfo.ds_dong } ${addrInfo.store_addr2 }</font></li>
	          </c:if>
	        </c:forEach>
	        <li><font size="4">전화번호: ${storeInfo.store_tel }</font>
	        <input type="hidden" name="storeNo" value=${storeInfo.store_no }>
	        </li>
	      </ul>
	    </td>
	  </tr>
	</c:forEach>
	</table>
	<br>
	 <c:if test="${location == null }">
	  <c:choose>
	    <c:when test="${page==1 }">
	             이전
	    </c:when>
	    <c:otherwise>
	      <a href="find_store.do?action=storeSearch&page=${page-1 }">이전</a>
	    </c:otherwise>
	  </c:choose>
	  
	  <%--페이지가 11이상이면 startPage viewPage--%>
	  <c:if test="${totalPage<viewPage }">
	  <c:forEach begin="1" end="${totalPage }" var="i">
		  <a href="find_store.do?action=storeSearch&page=${i }">${i }</a>
	  </c:forEach>
	  </c:if>
	  
	  <c:if test="${totalPage>viewPage }">
	   <c:if test="${totalPage<=temp+(viewPage-1) }">
	    <c:forEach begin="${startPage }" end="${totalPage }" var="i">
	  	   <a href="find_store.do?action=storeSearch&page=${i }">${i }</a>	 
	   </c:forEach>
	   </c:if>
	   
	   <c:if test="${totalPage>temp+(viewPage-1) }">
	    <c:forEach begin="${startPage }" end="${temp+(viewPage-1) }" var="i">
	  	   <a href="find_store.do?action=storeSearch&page=${i }">${i }</a>	 
	    </c:forEach>
	   </c:if>
	   
	  </c:if>
	  
	  <c:if test="${page<totalPage }">
	     <a href="find_store.do?action=storeSearch&page=${page+1 }">다음</a>  
	  </c:if>
	  <c:if test="${page==totalPage }">
	         다음
	  </c:if>
	 </c:if>
	</form>
