<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<center>
<br><br>
<table border="0" cellspacing='0' cellspacing='0' widrth='600'>
	<tr>
		<th width=50 align=center>번호</th>
		<th width=100 align=center>아이디</th>
		<th width=320 align=center>제목</th>
		<th width=100 align=center>최초작성일</th>
		<th width=120 align=center>마지막수정일</th>
	</tr>
	<c:forEach items="${list }" var="board" varStatus="status">
		<tr class='boardrow' id="boardrow"${status.count }>
			<td width=50 align=center>${board.board_no }</td>
			<td width=100 align=center>${board.member_id }</td>
			<td width=320 align=center class="title" id="title${status.count}">${board.board_title }</td>
			<td width=100 align=center>${board.board_date }</td>
			<td width=100 align=center>${board.board_lastupdate }</td>
		</tr>
		<tr style="display: none;" class="text" id="text${status.count}">
			<td align=center colspan='5'>
				<div>
					<a href="javascript:load('edit&board_no=${board.board_no }')">
						${board.board_text }
					</a>
					<br /><br />
						<c:forEach items="${replyList }" var="reply">
						<c:if test="${reply.board_no eq board.board_no}">
							${reply.reply_id } : ${reply.reply_date } : ${reply.reply_text } : 싫어요!=${reply.reply_dislike}<br />
						</c:if>
						</c:forEach>
				</div>
				<br />
			</td>
		</tr>
	</c:forEach> 
 </table>
    <br>
    <c:forEach begin="1" end="${totalPage }" var="i">
       [<a href="/k153p2/board.do?page=${i}">${i }</a>]
    </c:forEach>
    <br/><br/>
      <table width=700 cellspacing=1>
	<tr>
		<td align='center'><input type=button value="글쓰기"></td>
	</tr>
</table>
</center>