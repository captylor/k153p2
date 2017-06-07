<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.button {
	background-color: #4CAF50; /* Green */
	border: none;
	color: white;
	padding: 16px 32px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	-webkit-transition-duration: 0.4s; /* Safari */
	transition-duration: 0.4s;
	cursor: pointer;
}

.button2 {
	background-color: white;
	color: black;
	border: 2px solid #008CBA;
}

.button2:hover {
	background-color: #008CBA;
	color: white;
}

.button3 {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
}

.button3:hover {
	background-color: #f44336;
	color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	var htmlText = "";
	$.ajax({
		type : "post",
		url : "admin_productName_json.jsp",
		dataType : "json",
		success : function(data) {
			for (var i = 0; i < data.length; i++) {
				if (i % 9 == 0) {
					htmlText += "<tr>"
				}
				htmlText += "<td>" + data[i].i_name + "</td><td><input type=\"checkbox\" id=\"" + data[i].i_no + "\" name=\"box\"></td>"
			}
			$("table > tbody").html(htmlText);
		},
		complete : function(data) {},
		error : function(xhr, status, error) {
			console.log("에러!: " + error);
			console.log("상태" + status);
		}
	});

	var itemlist = "";
	function sendItemList() {
		$("input:checkbox[name=box]:checked").each(function() {
			itemlist += $(this).attr("id") + "%";
		});
		if (itemlist.length <= 0) {
			alert("아이템을 선택하지 않았습니다.");
			self.close()
		} else {
			var cofirmItem = confirm("지금 선택한 제품을 해당 지점에 판매하시겠습니까?");
			if (cofirmItem) {
				window.opener.document.getElementById("store_product").value = itemlist.substr(0, itemlist.length - 1);
				self.close()
			}
		}
	}
</script>
<title>판매할 제품 선택</title>
</head>
<body>
	<center>
		<form action="" method="post">
			<table border=1 cellpadding="5">
				<thead>
					<tr>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
						<th>제품명</th>
						<th>선택</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
				<tfoot>
					<tr>
						<td colspan="18" align="center"><button
								class="button button2" onclick="sendItemList()">선택</button>
							<button class="button button3">취소</button>
					</tr>
				</tbody>
			</table>
		</form>
	</center>
</body>
</html>