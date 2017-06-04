<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
var article_no = 0;

	$(function() {
		var arrlocation = location.search.split("=");
		article_no =  arrlocation[1];//글 번호
		$.ajax({
			url : "conTxt_json.jsp",
			dataType : "json",
			data : {
				title : "title",
				article_no : article_no
			},
			success : function(data) {
				$("#board_no").val(data.b_no);
				$("#board_title").val(data.b_title);
				$("#board_text").val(data.b_conTxt);
			},
			error : function(xhr, status, error) {
				console.log("에러!: " + error);
				console.log("상태" + status);
			}
		});
	});
	
	$(document).on('click', '#delete', function() {
		$("#ffm").attr("action","/k153p2/boardinfo.do?board=0&delete=0");
		$("#ffm").submit();
	});
//	/k153p2/boardinfo.do?board=0&update=0
</script>
<title>수정폼</title>
</head>
<body>
	<center>
		<font size="12" color="#F5A9D0">[<a
			onclick="javascript:self.close();">게시물 목록으로 </a>]
		</font><br> <br> <br>
		<form name="editForm" method="post" id="ffm" action="/k153p2/boardinfo.do?board=0&update=0">
			<input type="hidden" id="board_no" name="board_no" value="">
			<table border="1" cellpadding="5">
				<tr>
					<td class="td">제목</td>
					<td id="td"><input type="text" id="board_title"
						name="board_title" value=""></td>
				</tr>
				<tr>
					<td colspan="2"><textarea rows="10" cols="50" id="board_text"
							name="board_text"></textarea></td>
				</tr>

				<tr>
					<td colspan="2" align="center"><input type="submit" value="수정">
						<input type="reset" value="취소"> <input type="button" id="delete"
						value="삭제"></td>
				</tr>
			</table>
		</form>
	</center>
</body>
</html>





