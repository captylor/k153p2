<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<style>
.buttonPM {
	display: inline-block;
	border-radius: 4px;
	background-color: #FF6699;
	border: none;
	color: #FFFFFF;
	text-align: center;
	font-size: 120px;
	padding: 20px;
	width: 400px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 5px;
}

.buttonPM span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.buttonPM span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 25%;
	right: -20px;
	transition: 0.5s;
}

.buttonPM:hover span {
	padding-right: 25px;
}

.buttonPM:hover span:after {
	opacity: 1;
	right: 0;
}

#admin_select {
	text-align: center;
	position: absolute;
	top: 30%;
	left: 25%;
}
</style>

<div id="admin_select">
	<button class="buttonPM" style="vertical-align: middle" id="p_Stock">
		<span>재고 현황 </span>
	</button>

	<button class="buttonPM"
		style="vertical-align: middle; background-color: #6699FF;"
		id="p_Apply">
		<span>물품 발주 </span>
	</button>

	<button class="buttonPM"
		style="vertical-align: middle; background-color: #81F79F;"
		id="p_list">
		<span>신청 현황 </span>
	</button>
</div>