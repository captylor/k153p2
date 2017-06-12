<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script type="text/javascript">
	function sendProduct(index,order_no,store_no,itemAmount) {
		if(confirm("제품을 보내시겠습니까??")){
		 $('#order_no'+index).val(order_no);		//input에 value 주기
		 $('#store_no'+index).val(store_no);
		 $('#itemAmount'+index).val(itemAmount);
		 
		
		 
		/*  alert($('#order_no'+index).attr("name")+"="+$('#order_no'+index).val());  //확인용
		 alert($('#store_no'+index).attr("name")+"="+$('#store_no'+index).val());
		 alert($('#itemAmount'+index).attr("name")+"="+$('#itemAmount'+index).val()); */
		 
		
		
		$.ajax({
			url : '/k153p2/manage_store.do?action=stock'  ,
			data : {
				order_no : $('#order_no'+index).val(),
				store_no : $('#store_no'+index).val(),
				itemAmount : $('#itemAmount'+index).val()
			},
			success : function(result){
				if(result.match("성공")){
					alert('제품 보내기에 성공하였습니다.');
					load('orderCheckForm');
				}else{
					alert('제품 보내기에 실패하였습니다.');
				}
			}
		});
		}
	}
	
</script>
<br/><br/>
		<h3>제품신청현황</h3>
		<table cellspacing='1' border='1'>
			<tr>
				<td width=60 align=center>번호</td>
				<td width=120 align=center>지점번호</td>
				<td width=400 align=center>신청내역</td>
				<td width=400 align=center>신청일</td>
				<td width=120 align=center>처리결과</td>
				<td width=120 align=center>승인하기</td>
			</tr>

			<c:forEach items="${list }" var="order" varStatus="i">
				<tr>
					<td align="center"><input type="hidden" id="order_no${i.index+1 }">${order.order_no }</td>
					<td align="center"><input type="hidden" id="store_no${i.index+1 }">${order.store_no }</td>
					<td align="center"><input type="hidden" id="itemAmount${i.index+1 }">제품번호:${order.item_no } 주문량:${order.order_amount }</td>
					<td align="center">${order.order_date}</td>
					<td align="center">${order.order_handle }</td>
					<td align="center"><button id="bt${i.index+1 }" onclick="sendProduct(${i.index+1 },${order.order_no },${order.store_no },${order.item_no }+'-'+${order.order_amount })">승인</button></td>
				</tr>
			</c:forEach>
		</table>