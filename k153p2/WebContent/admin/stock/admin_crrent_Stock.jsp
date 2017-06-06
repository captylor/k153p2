<?xml version="1.0" encoding="EUC-KR" ?>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR" />
<title>현재 재고 정보</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var htmlText = '';
	$(function() {
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/admin/stock/admin_crrent_Stock_json.jsp",
			dataType : "json",
			success : function(data) {
				for (var i = 0; i < data.length; i++) {
					htmlText += "<tr>"
						+ "<td>" + data[i].i_no + "</td>"
						+ "<td>" + data[i].i_name + "</td>"
						+ "<td>" + data[i].i_stock + "</td>"
						+ "</tr>";
				}
				$("table > tbody").html(htmlText);
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error + " " + "상태" + status);
			},
		});
	});
</script>
</head>
<style>
.wrap {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-top: -86px;
	margin-left: -89px;
	text-align: center;
}

table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #4CAF50;
	color: white;
}
</style>
<body>
	<div class="wrap">
		<table>
			<thead>
				<tr>
					<th>제품 번호</th>
					<th>제품 명</th>
					<th>재고 수</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
	</div>
</body>
</html>