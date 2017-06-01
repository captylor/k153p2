<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
.input[type=button] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}

button {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
}
#subSideM1, #subSideM2, #subSideM3{
display: none;
}
</style>

<button id="sideMenu1">
	<span style="font-size: 1.5em; color: green;">매장 관리</span>
</button>
<div id="subSideM1">
	<input type="button" value="가맹 안내" id="franchiseIntro" class="input"> <br />
</div>

<button id="sideMenu2">
	<span style="font-size: 1.5em; color: green;">지점장</span>
</button>
<div id="subSideM2">
	<input type="button" value="지점 관리" id="branch_office_Manager" class="input"> <br />
	<input type="button" value="물품 구매" id="product_order" class="input">
</div>

<button id="sideMenu3">
	<span style="font-size: 1.5em; color: green;">관리자</span>
</button>
<div id="subSideM3">
	<input type="button" value="지점별 매출" id="branch_office_Net_Sales" class="input"> <br />
	<input type="button" value="물품 보내기" id="product_send" class="input">
</div>