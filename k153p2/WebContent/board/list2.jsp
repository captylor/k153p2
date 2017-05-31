<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록: 리스트</title>
  <script type="text/javascript">
 function input(){
	 
	 location.href="/k153p2/boardinfo.do?action=form";
 }
 </script>
  <script type="text/javascript">
 $(document).ready(function(){
	    $(".title:first").click(function(){
	        $(".text:first").toggle();
	    });
	    $(".tr:even").css('background-color','yellow');
	    $(".tr:odd").css('background-color','orange');
	});
 

</script>
</head>
<%--list2.jsp --%>
<body>
  <center>

   
    <br><br>
    <table border="0" cellspacing=1 widrth=600>
      <tr class="td">
 
        
         <th width=50 align=center>번호</th>
         <th width=100 align=center>아이디</th>
         <th width=320 align=center>제목</th>
         <!-- <th width=320 align=center>내용</th> -->
         <th width=100 align=center>최초작성일</th>
         <th width=100 align=center>마지막수정일</th>
     
      </tr>
     <c:forEach items="${list }" var="board">
      <tr class="tr">
         <td width=50 align=center>${board.board_no }</td>
         <td width=100 align=center>${board.member_id }</td>
         <%-- <a href="/TomTest/boardinfo.do?action=edit&board_no=${board.board_no }"></a> --%>
         <td width=320 align=center class="title">
         	${board.board_title }
       		</td>
         <%-- <td width=100 align=center>${board.board_text }</td> --%>
         <td width=100 align=center>${board.board_date }</td>
         <td width=100 align=center>${board.board_lastupdate }</td>
      </tr>
      <tr class="tr">
      	<td></td>
      	<td></td>
      	<td align=center><a href="/TomTest/boardinfo.do?action=edit&board_no=${board.board_no }">
      	<div class="text">${board.board_text }</a></div></td>
      	<td></td>
      	<td></td>
      </tr>
     </c:forEach> 
    </table>
    <br>
    <c:forEach begin="1" end="${totalPage }" var="i">
       [<a href="/k153p2/boardinfo.do?page=${i}">${i }</a>]
    </c:forEach>
    <br>
      <table width=700 cellspacing=1>
	<tr>
		<td><input type=button value="글쓰기" OnClick="input()"></td>
	</tr>
</table>
  </center>
</body>
</html>








