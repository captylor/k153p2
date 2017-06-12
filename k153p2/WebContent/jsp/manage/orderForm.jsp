<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<br/><br/>
<table cellpadding='5'>
	<tr>
		<th>아이템타입</th>
		<th>아이템이름</th>
		<th>주문수량</th>
	</tr>
	<c:forEach items="${list }" var="item" varStatus="status">
	<tr>
		<td align='center'>${item.itemType_no }</td>
		<td align='center'>${item.item_name }</td>
		<td align='center'><input type='text' size="2" id="item${item.item_no }"></td>
	</tr>
	</c:forEach>
</table>
<button id="order">주문하기</button>