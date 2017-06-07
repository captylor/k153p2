<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#store_product {
	background-color: #9999FF;
}
</style>
<center>
	<form method="get" id="regitForm" name="ffm">
		<table border="1" cellpadding="10">
			<tr>
				<td colspan="2" align="center"><font size="6">지점정보등록</font></td>
			</tr>
			<tr>
				<td>지점명</td>
				<td><input type="text" id="store_name" name="store_name" value=""></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" id="store_addr" name="store_addr2" value=""></td>
			</tr>
			<tr>
				<td>연락처</td>
				<td><input type="text" id="store_tel" name="store_tel" value=""></td>
			</tr>
			<tr>
				<td>판매아이템</td>
				<td><input type="text" id="store_product" name="itemlist"
					value="클릭 해주세요!!" readonly></td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="button" value="등록" id="regitFormSubmit">
					<input type="reset" value="취소"></td>
			</tr>
		</table>
	</form>
</center>