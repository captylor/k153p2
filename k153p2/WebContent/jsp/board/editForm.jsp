<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<br/><br/>
[<a href="boardinfo.do?action=list">게시물 목록으로</a>]
<br/><br/>    

<table border="0" cellpadding="5">
	<tr>
		<td align='center'>게시글번호</td>
		<td><input type="text" name="board_no" size='8' value="${board.board_no }" readonly></td>
	</tr>
	<tr>
        <td class="td" align='center'>제목</td>
        <td id="td"><input type="text" size='50' name="board_title" value="${board.board_title }"></td>
	</tr>
    <tr>
    	<td align='center' valign='top'>내용</td>
        <td colspan="1"><textarea rows="10" cols="50" name="board_text">${board.board_text}</textarea></td>
    </tr>
 
    <tr>
        <td colspan="2" align="center">
            <input type="button" value="수정">
            <input type="button" value="취소" onclick="location.href='/k153p2/board.do'">
            <input type="button" value="삭제">
        </td>
	</tr>
</table>