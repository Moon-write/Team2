<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="/boardWrite.kh" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="boardTitle"><br>
		첨부파일 : <input type="file" name="upfile" multiple><br>
		내용 : <textarea rows="3" cols="10" name="boardContent"></textarea><br>
		<input type="hidden" name="boardWirter" value="${sessionScope.m.memberId }">
		<input type="submit" value="작성하기">
		
	</form>
</body>
</html>