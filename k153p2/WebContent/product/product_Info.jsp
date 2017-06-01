<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%--제품 각각의 상세 정보를 출력 --%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		var dbid = <%=request.getParameter("product")%>
		var htmlText ='';
		$.ajax({
			type : "post",
			url : "product_Info_json.jsp",
			data : {info : dbid},
			dataType : "json",
			success : function(data) {
					htmlText += "제품 번호 : "+data.item_no+"<br>제품명 : "+data.item_name+"<br>소비자 가격 : "+data.item_userPrice+"<br>"
				$('#info_data').html(htmlText);
			},
			complete : function(data) {
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error);
				console.log("상태" + status);
			},
		});
	});
</script>
</head>
<body>
	<div id="info_data"></div>
</body>
</html>