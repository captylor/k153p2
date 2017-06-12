<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<center>
<br><br>
<table border='0' cellspacing='0' cellspacing='0'>
	<tr>
		<th width=120>발주번호</th>
		<th width=120>지점번호</th>
		<th width=150>아이템번호</th>
		<th width=120>주문수량</th>
		<th width=380>주문일시</th>
		<th width=120>처리상태</th>
	</tr>
	<c:forEach items="${list }" var="order" varStatus="status">
		<tr class="orderrow" id="orderrow"${status.count }>
			<td align=center>${order.order_no }</td>
			<td align=center>${order.store_no }</td>
			<td align=center>${order.item_no }</td>
			<td align=center>${order.order_amount }</td>
			<td align=center>${order.order_date }</td>
			<td align=center>${order.order_handle }</td>
		</tr>
	</c:forEach> 
</table>
    <br>
    <c:forEach begin="1" end="${totalPage }" var="i">
       [<a href=javascript:load("buyBoard&page=${i}")>${i}</a>]
    </c:forEach>
    <br/><br/>
</center>