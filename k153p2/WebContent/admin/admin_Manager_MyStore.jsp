<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>지점정보</title>
<script>
	$(function() {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/admin_MyStore_json.jsp",
			data : {
				id : "${loginInfo.member_id }"
			},
			dataType: "json",
			success : function(data) {
				$("#st_no").text(data.store_id);
				$("#st_name").text(data.store_name);
				$("#st_addr").text(data.store_addr);
				$("#st_tel").text(data.store_tel);
				$("#st_product").text(data.store_product);
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error + " " + "상태" + status);
			},
		});
	});
</script>
</head>
<body>
	<center>
		<form action="">
			<table border="1" cellpadding="10">
				<tr>
					<td colspan="2" align="center"><font size="6">지점정보</font></td>
				</tr>
				<tr>
					<td>지점번호</td>
					<td id="st_no"></td>
				</tr>
				<tr>
					<td>지점명</td>
					<td id="st_name"></td>
				</tr>
				<tr>
					<td>주소</td>
					<td id="st_addr"></td>
				</tr>
				<tr>
					<td>연락처</td>
					<td id="st_tel"></td>
				</tr>
				<tr>
					<td>판매아이템</td>
					<td id="st_product"></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit" value="등록">
						<button onclick="window.close()">취소</button></td>
				</tr>

			</table>
		</form>
	</center>
</body>
</html>