<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환영합니다</title>
<script type="text/javascript" src='/k153p2/js/ajax.js'></script>
<script src='/k153p2/js/jquery-3.2.1.min.js'></script>
<script type="text/javascript">
function load(x){
		sendRequest('/k153p2/manage_store.do', 'action='+x, loaded, 'POST');
}

function loaded(){
	if(xhr.readyState==4 && xhr.status==200){
		//var body = document.getElementById('body');
		var htmlText = xhr.responseText;
		//body.innerHTML = htmlText;
		$("#body").html(xhr.responseText);
		$(".orderrow:even").css('background-color', '#F1F1F2');
	    $(".orderrow:odd").css('background-color', '#BCBABE');
	}
}

var count=0;
$(document).ready(function(){
	$(document).on("click", "button[id][class=itemtype]", function(){
		var id = $(this).attr('id').replace('button', 'itemtype');
		var selector = "div[class=itemtype][id!="+id+"]";
		$(selector).hide(300);
		$("#"+id).toggle(300);
	});
	
	
	$(document).on("click", "button[class=del]", function(){
		var selector = "#" + $(this).attr('id').replace("del", "selected");

		var price = parseInt($("#totalprice").text()) - parseInt($(selector).children().eq(2).text())
		$("#totalprice").text(price);

		$(selector).remove();
		if($("#selectedTable").find("td").length==0){
			$("#middlebody").html("");
			$("#endbody").html("");
		}
	});
	
	
	$(document).on("click", "font[id]", function(){
		if($("#middlebody").text()==""){
			var table = $("<table id='selectedTable'></table>");
			$("#middlebody").append(table);
			table.append("<tr><th>상품번호</th><th>상품명</th><th>상품가격</th><th>삭제</th></tr>");
		}
		count++;
		var htmlText = "<tr id=selected"+count+" class=selected><td align=center>"+$(this).attr('id').replace("item", "")+"</td><td align=center>"
					+$(this).text()+"</td><td align=center>"+$(this).attr('class')
					+"</td><td align=center><button class=del id=del"+count+">삭제</button></td></tr>";
		$("#selectedTable").append(htmlText);
		if($("#endbody").text()==""){
			$("#endbody").html("총 결재 금액<hr/><div id='totalprice'></div><br/><button id='submit'>결재</button>");
		}
		var price;
		if($("#totalprice").text()==""){
			price=0;
		}else{
			price = parseInt($("#totalprice").text());
		}
		$("#totalprice").text(price+parseInt($(this).attr('class')));
	});
	
	
	$(document).on("click", "button[id=submit]", function(){
	var json={};
	var i=0;
		$(".selected").each(function(){
			i++;
			json[i+""] = $(this).children().eq(0).text();//상품번호
		});
		json["0"] = Object.keys(json).length;//0번지에 데이터 사이즈를 격납
	count=0;
	
		$.ajax({
			"url":"/k153p2/manage_store.do?action=submit",
			"type":"POST",
			"data":json,//전달 파라메타
			"success":function(){
				alert("성공");
				$("#endbody").html("");
				$("#middlebody").html("");
				load("sell");
			},
			"error":function(){alert("실패");}
		});//ajax
	});//물건 판매버튼 클릭시
	
	
	$(document).on("click", "button[id=order]", function(){
		var json={};
		var i=0;
			$("input[type=text][size=2]").each(function(){
				if($(this).val()!=""){
					i++;
					var item_no = $(this).attr("id").replace("item", ""); 
					json[i+""] =  item_no + "," + $(this).val();
				}
			});
			json["0"] = Object.keys(json).length;//0번지에 데이터 사이즈를 격납
			
			$.ajax({
				"url":"/k153p2/manage_store.do?action=order",
				"type":"POST",
				"data":json,//전달 파라메타
				"success":function(){
					alert("성공");
					$("input[type=text][size=2]").text("");
					load("orderForm");
				},
				"error":function(){alert("실패");}
			});//ajax
		});//물건 주문버튼 클릭시
	
	
	$(document).on("click", "button[id=certify]", function(){
		var json = {};
		json["cerpass"] = $("input[id=cerpass1]").val()
				+$("input[id=cerpass2]").val()
				+$("input[id=cerpass3]").val()
				+$("input[id=cerpass4]").val();
		$.ajax({
			"url":"/k153p2/manage_store.do?action=certify",
			"type":"POST",
			"data":json,//전달 파라메타
			"success":function(data){
				if(data=="0"){
					$("input[id]").val("");
					$("div[id=certifydiv4]").show();
				}else if(data=="1"){
					$("div[id=certifydiv1]").hide();
					$("div[id=certifydiv2]").show();
					$("div[id=certifydiv4]").hide();
				}else if(data=="2"){
					$("div[id=certifydiv1]").hide();
					$("div[id=certifydiv3]").show();
					$("div[id=certifydiv4]").hide();
				}
			},
			"error":function(){}
		});//ajax
	});
});//window.onload
</script>
</head>
<body>
	<center>
	<table width="1024" height="768" border='0' cellpadding="0" cellspacing="0">
		<tr height='10'>
			<td align='right' colspan='2'>
				<c:if test="${login == null}">
					<div id='login'><%@include file="/jsp/login.jsp" %></div>
				</c:if>
				<c:if test="${login != null }">
					<div id='logout'><%@include file="/jsp/logout.jsp" %></div>
				</c:if>
			</td>
		</tr>
		
		<tr height="90">
			<td colspan='2'>
				<div id='head'><%@include file="/jsp/head.jsp" %></div>
			</td>
		</tr>
		
		<tr>
			<td width="200" valign="top" align="center">
				<div id='menu'><%@include file="menu.jsp" %></div>
			</td>
			<td valign="top" align="center">
				<div id='body'><br/><br/><br/><img width='80%' src='/k153p2/img/가맹안내.jpg'></div>
			</td>
		</tr>
	</table> 
	</center>
</body>
</html>