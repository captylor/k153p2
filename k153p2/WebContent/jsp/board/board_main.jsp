<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>환영합니다</title>
<script type="text/javascript" src='/k153p2/js/ajax.js'></script>
<script type="text/javascript" src='/k153p2/js/jquery-3.2.1.min.js'></script>
<script type="text/javascript">
function load(x){
		sendRequest('/k153p2/board.do', 'action='+x, loaded, 'POST');
}

function loaded(){
	if(xhr.readyState==4 && xhr.status==200){
		var body = document.getElementById('body');
		var htmlText = xhr.responseText;
		body.innerHTML = htmlText;
	}
}

$(document).ready(function(){
    $(".boardrow:even").css('background-color', '#F1F1F2');
    $(".boardrow:odd").css('background-color', '#BCBABE');
    
    $(document).on("click", "td[id][class=title]", function(){
		var id = $(this).attr('id').replace('title', 'text');
		var selector = "tr[class=text][id!="+id+"]";
		$(selector).hide();
		$("#"+id).toggle();
	});
    
    $(":button").click(function(){
    	var login = $("#memberid").text();
    	if(login==""){
    		alert('로그인이 필요합니다');
    		return;
    	}else{
    		load("inputForm");
    	}

	});
    
    
	$(document).on("click", "input[type=button][value=입력]", function(){
		var json={};
		var title = $("input[type=text][name=board_title]").val();
		var text = $("textarea[rows=5][cols=50][name=board_text]").val();
		
		json["title"] = title;
		json["text"] = text;
		
		if(title==""){
			alert('제목은 필수항목입니다');
			return;
		}else{
			$.ajax({
				"url":"/k153p2/board.do?action=insert",
				"type":"POST",
				"data":json,//전달 파라메타
				"success":function(){
					alert('성공');
					location.href='/k153p2/board.do';
				},
				"error":function(){alert("실패");}
			});//ajax
		}
	});//글쓰기 버튼 클릭시
	
	
	$(document).on("click", "input[type=button][value=수정]", function(){
		var json={};
		var board_no = $("input[type=text][name=board_no]").val();
		var title = $("input[type=text][name=board_title]").val();
		var text = $("textarea[rows=10][cols=50][name=board_text]").val();
		
		json["boardno"] = board_no;
		json["title"] = title;
		json["text"] = text;
		
		if(title==""){
			alert('제목을 넣어주세요');
			return;
		}else if(text==""){
			alert('내용을 입력하세요');
			return;
		}else{
			$.ajax({
				"url":"/k153p2/board.do?action=update",
				"type":"POST",
				"data":json,//전달 파라메타
				"success":function(data){
					if(data=="1"){
						alert('수정성공');
					}else if(data=="0"){
						alert('권한이 없습니다');
					}
					location.href='/k153p2/board.do';
				},
				"error":function(){alert("실패");}
			});//ajax
		}
	});//수정 버튼 클릭시
	
	
	$(document).on("click", "input[type=button][value=삭제]", function(){
		var json={};
		var board_no = $("input[type=text][name=board_no]").val();
		json["board_no"] = board_no;
		
			$.ajax({
				"url":"/k153p2/board.do?action=delete",
				"type":"POST",
				"data":json,//전달 파라메타
				"success":function(data){
					if(data=="1"){
						alert('삭제성공');
					}else if(data=="0"){
						alert('권한이 없습니다');
					}
					location.href='/k153p2/board.do';
				},
				"error":function(){alert("실패");}
			});//ajax
	});//수정 버튼 클릭시
});
</script>
</head>
<body>
	<center>
	<table width="1024" height="768" border='0' cellpadding="0" cellspacing="0">
		<tr height='10'>
			<td colspan='2' align='right'>
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
			<td valign="top" align="center" width='200'>
				<div id='menu'>
					<br/><br/>
					<font style="font-size: 24px;">게시판</font>
				</div>
			</td>
			<td valign="top" align="center">
				<div id='body'><%@include file="board.jsp" %></div>
			</td>
		</tr>
	</table> 
	</center>
</body>
</html>