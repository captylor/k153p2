<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">

//	opener.document.form이름.id입력name.value=document.aaa.id.value;


function pageClose(){
	self.close();
}
</script>
</head>
<body>
	<form action="/k153p2/checkId/userDuplicate.jsp" method="post" name='aaa'>
		<input type="text" name="id">
		<button>중복체크</button>
	</form>
	${duple }
</body>
</html>