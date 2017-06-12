<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br/><br/>
[<a href="/k153p2/board.do">게시물 목록으로</a>]
<br/><br/>
<table border="0" cellpadding="5">
      <tr>
          <td class="td" height="30">제목</td>
          <td id="td"><input type="text" name="board_title"></td>
      </tr>
      <tr>
          <td colspan="2"><textarea rows="5" cols="50" name="board_text"></textarea></td>
      </tr>
      <tr>
          <td colspan="2" align="center">
             <input type="button" value="입력">
             <input type="reset" value="돌아가기" onclick='location.href="/k153p2/board.do"'>
          </td>
      </tr>
</table>