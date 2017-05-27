<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
div.gallery {
	margin: 5px;
	border: 1px solid #ccc;
	float: left;
	width: 180px;
}

div.gallery:hover {
	border: 1px solid #777;
}

div.gallery img {
	width: 100%;
	height: auto;
}

div.desc {
	padding: 15px;
	text-align: center;
}

#paging {
	text-align: center;
}

a.pagings-item, a.pagings-side {
	margin: 0 .25em;
}

a.pagings-item.selected {
	font-weight: bold;
}
</style>

<div id="div3"></div>