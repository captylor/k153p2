<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>수정폼</title>
 

</head>
<script type="text/javascript">
	function del(){    	
     
		location.href="/k153p2/boardinfo.do?action=delete&id=${board.board_no}&userid=${board.member_id}" ;
   
  }
  
  function moveList(){
	  //취소누르고 다시 리스트로
	alert('TEST');
	 location.href="/k153p2/boardinfo.do?action=list2";
  }
  
/*   function test(){
	  alert('TEST');
  } */
</script>
<%-- editForm.jsp --%>
<body>
  <center>
    [<a href="boardinfo.do?action=list2">게시물 목록으로</a>]
    
    <br><br>
   <%-- <form method="post" action="/TomTest/boardinfo?action=update&id=${board.board_no }"> --%>
   <form name="editForm" method="post" action="/k153p2/boardinfo.do?action=update">  
    <input type="hidden" name="board_no" value="${board.board_no }">
    <table border="1" cellpadding="5">
      <tr>
        <td class="td">제목</td>
        <td id="td"><input type="text" name="board_title" value="${board.board_title }"></td>
      </tr>
      <tr>
        <td colspan="2"><textarea rows="10" cols="50" name="board_text">${board.board_text}</textarea></td>
      </tr>
 
      <tr>
        <td colspan="2" align="center">
           <input type="submit" value="수정">
           <input type="button" value="취소" onclick="moveList();">
           <input type="button" value="삭제" onclick="del();">
        </td>
      </tr>
    </table>
</form>
  </center>
</body>
</html>





