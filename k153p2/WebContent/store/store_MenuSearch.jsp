<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%--store_MenuSearch.jsp
	메뉴검색.jsp	
--%>

<center>
	<h3>메뉴검색</h3>
	<br>
	<table border="0">
		<tr>
			<td align="right" colspan="2"><select name="itemType"
				id="itemType">
					<option>==선택==</option>
			</select> <input type="text" name="item_name" id="item_name"> <input
				type="button" value="검색" id="search_bt"></td>
		</tr>
		<tr>
			<table border="1" id="innerTable">
				<thead>
					<tr align="center">
						<td>매장명</td>
						<td>주소</td>
						<td>전화번호</td>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
		</tr>
	</table>
</center>