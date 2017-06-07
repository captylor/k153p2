<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<style>
.buttonFM {
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

.buttonFM span {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.buttonFM span:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 25%;
	right: -20px;
	transition: 0.5s;
}

.buttonFM:hover span {
	padding-right: 25px;
}

.buttonFM:hover span:after {
	opacity: 1;
	right: 0;
}

#admin_select {
	text-align: center;
	position: absolute;
	top: 30%;
	left: 35%;
}
</style>

<div id="admin_select">
	<button class="buttonFM" style="vertical-align: middle" id="F_manager">
		<span>매장 관리 </span>
	</button>

	<button class="buttonFM"
		style="vertical-align: middle; background-color: #6699FF;" id="F_regit">
		<span>매장 등록 </span>
	</button>
</div>