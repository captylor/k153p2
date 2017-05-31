<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>입력폼</title>
<script type="text/javascript">
 function list2(){
	 
	 location.href="/k153p2/boardinfo.do?action=list2";
 }
</script>
</head>
<%-- inputForm.jsp --%>
<body>
  <center>
    
    [<a href="boardinfo.do?action=list2">게시물 목록으로</a>]
    <br><br>
   <form action="boardinfo.do?action=insert" method="post"> 
    <!-- <input type="hidden" name="name" value="yulan"> -->
    <table border="1" cellpadding="5">
      <tr>
        <td class="td" height="30">제목</td>
        <td id="td"><input type="text" name="board_title"></td>
      </tr>
      <tr>
        <td colspan="2"><textarea rows="5" cols="50" name="board_text"></textarea></td>
      </tr>
      <tr>
        <td colspan="2" align="center">
           <input type="submit" value="입력">
           <input type="reset" value="취소" onclick="list2()" >
        </td>
      </tr>
    </table>
   </form>
  </center>

</body>
</html>





