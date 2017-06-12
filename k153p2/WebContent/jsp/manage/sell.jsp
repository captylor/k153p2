<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- item_no, item_name, item_userPrice, item_masterPrice, itemType_no, item_element, item_photo -->
<br/><br/><br/>
<table width="95%"><tr>
	<td width="40%" align="center" valign="top">
		<table>
		<c:forEach items="${typelist }" var="type" varStatus="status">
			<tr>
				<td valign="top">
					<button id="button${status.count }" class="itemtype">${type.itemType}</button><br/>
					<div id="itemtype${status.count }" class="itemtype" style="display: none;">
					<c:forEach items="${list }" var="item" varStatus="status2">
						<c:if test="${item.itemType_no eq type.itemType_no}">
							<font id="item${item.item_no }" class="${item.item_userPrice }">${item.item_name }</font>
							: ${stocklist[status2.index].stock_amount }개 남음<br/>
						</c:if>
					</c:forEach>
					</div>
				</td>
			</tr>
		</c:forEach>
		</table>
	</td>
	<td width="40%" valign="top" align="center">
		<div id='middlebody'></div>
	</td>
	<td width="20%" valign="top" align="center">
		<div id='endbody'></div>
	</td>
</tr></table>