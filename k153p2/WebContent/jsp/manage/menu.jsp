<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
$(function(){
	$("#menu1").click(function(){
		$("#menudiv2").hide(300);
		$("#menudiv3").hide(300);
		$("#menudiv1").toggle(300);
	});
});
$(function(){
	$("#menu2").click(function(){
		$("#menudiv1").hide(300);
		$("#menudiv3").hide(300);
		$("#menudiv2").toggle(300);
	});
});
$(function(){
	$("#menu3").click(function(){
		$("#menudiv1").hide(300);
		$("#menudiv2").hide(300);
		$("#menudiv3").toggle(300);
	});
});

</script>


<br/><br/><br/><br/><br/>
<table>
<tr><th align='right' id='menu1'><font style="font-size: 24px;">매장관리</font></th></tr>
<tr><td align='right'><div id='menudiv1' class='menudiv'><a href='/k153p2/manage_store.do'>가맹 안내</a><br/>
<a href='javascript:load("certifyForm")'>지점장 관리자 인증</a><br/>
</div></td></tr>

<tr><td><br/></td></tr>

<tr><th align='right' id='menu2'><font style="font-size: 24px;">지점장</font></th></tr>
<tr><td align='right'><div id='menudiv2' style="display: none;" class='menudiv'>
<a href='javascript:load("sell")'>판매관리</a>
<br/>
지점관리
<br/>
<a href='javascript:load("orderForm")'>물품구매</a><br/>
<a href='javascript:load("buyBoard")'>주문이력</a>
</div></td></tr>
<tr><td><br/></td></tr>

<tr><th align='right' id='menu3'><font style="font-size: 24px;">관리자</font></th></tr>
<tr><td align='right'>
	<div id='menudiv3' style="display: none;" class='menudiv'>
		<a href='javascript:load("orderCheckForm")'>물품보내기</a>
	</div>
</td></tr>
</table>