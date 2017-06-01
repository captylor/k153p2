<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
.line{border-bottom:1px solid;}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
var bg = new Array();
bg[0] = "까페1.png";
bg[1] = "까페2.png";
bg[2] = "까페3.png";

var table_change_time = 1500; //테이블 배경이미지 변경시간
var table_change_id = 'table001_id';  // 테이블에 지정된 id='table001_id' 부분의 id값으로 지정

function change_table_background()
{
 var now = new Date();
 var sec = now.getSeconds() % bg.length;

 var table_obj = document.getElementById(table_change_id);

 if ( table_obj )
 {
  table_obj.style.background = 'url('+bg[sec]+')';
  setTimeout("change_table_background()",table_change_time);
 }
}
</script>
<title>Insert title here</title>
</head>
<body onLoad="change_table_background()">
<table text='b2222' link='000000' vlink='0000aa' width='100%' height='300' id='table001_id'>
<tr>
	<td height="100" width="100" align="center"><span class="style1"></span></td>
</tr>

</table>
<center>
<img src="${pageContext.request.contextPath}/init/가맹안내.jpg" width='800'><br>
</center>
<center>
<h1><Strong>가맹점 개설비용</Strong></h1><hr>
</center>

<center>

<table style = "text-align:center;">
	<tr>
		<td class="line" width="33%">가맹비</td>
		<td class="line" width="33%">1,000만원</td>
		<td class="line" width="33%">가맹점 문구사용, 경영노하우 제공 및 교육비 포함</td>
	</tr>
	<tr>
		<td class="line">물류보증금</td>
		<td class="line">500만원</td>
		<td class="line">물류보증금(가맹 해지시 환불)</td>
	</tr>
	<tr>
		<td class="line">인테리어</td>
		<td class="line">8,000만원</td>
		<td class="line">가설공사 기타 등등</td>
	</tr>	
	<tr>
		<td class="line">주방기기/집기류</td>
		<td class="line">6,800만원</td>
		<td class="line">POS, 제빙기, 커피클라인더, 커피머신 등</td>
	</tr>	
	<tr>
		<td class="line">간판/사인물</td>
		<td class="line">1,100만원</td>
		<td class="line">전면 12M기준 1SET</td>
	</tr>	
	<tr>
		<td class="line">의자/테이블</td>
		<td class="line">1,800만원</td>
		<td class="line">좌석수 약 50석</td>
	</tr>
	<tr>
		<td class="line">가구류</td>
		<td class="line">450만원</td>
		<td class="line">서비스테이블, MD장 등</td>
	</tr>
	<tr>
		<td class="line"><font color='red'>합계</font></td>
		<td class="line"><font color='red'>19,650만원</font></td>
		<td class="line"><font color='red'>40평 기준, 부가세 별도</font></td>
	</tr>
	
</table>
</center>
</body>
</html>