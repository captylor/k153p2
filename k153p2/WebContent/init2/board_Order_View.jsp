<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>발주게시판</title>
<!--board_Order_View -->
<script type="text/javascript"
	src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function sendProduct() {
		$('#bt4').click(function(){				
			$.ajax({
					url : 'response4.jsp',
					type : "post",
					dataType : 'json',				//dataType에 json을 명시하지 않으면 그냥 긴~ String으로 생각하기 때문에 생략불가!!
					success : function(result){		//result : josn 
							var p = result.data.person;
							$('#div1').html('이름 :'+p.name+ '<br>나이 :'+p.age+'<br>직업 :'+p.job);
					},
					
			});
		});
		
	}
</script>

</head>
<body>
	<center>
		<h3>발주게시판</h3>
		<br>
		<br>
		<table cellspacing=1 width=600 border=1>
			<tr>
				<td width=50 align=center>번호</td>
				<td width=80 align=center>지점번호</td>
				<td width=250 align=center>신청내역</td>
				<td width=100 align=center>신청일</td>
				<td width=100 align=center>처리결과</td>
				<td width=80 align=center>승인하기</td>
			</tr>

			<c:forEach items="${list }" var="order" varStatus="i">
					<tr>
						<td align="center">${order.order_no }</td>
						<td align="center">${order.store_no }</td>
						<td align="center">제품번호:${order.item_no } 주문량:${order.order_amount }</td>
						<td align="center">${order.order_date}</td>
						<td align="center">${order.order_handle }</td>
						<td align="center"><button id="${i.index+1 }">승인</button></td>
					</tr>
			</c:forEach>
		</table>
	</center>
</body>
</html>