<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 작성</title>


<style>
.show-content{
	margin-top: 30px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">

	<div class="show-content" style="width:1000px;">
	<form action="/boardWrite.kh" method="post" enctype="multipart/form-data">
	<table>
		<tr class="tr-1"><th>제목</th><td><input type="text" name="boardTitle"><br></td></tr>
		<tr class="tr-1"><th>작성자</th></tr><td><input type="hidden" value="${m.memberId }">${m.memberId }</td></tr>
		<tr><textarea id="summernote" name="fundingDetail"></textarea></tr>
	</table>
		<input type="hidden" name="boardWirter" value="${sessionScope.m.memberId }">
		<input type="submit" value="작성하기">
		
	</form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	/* $(function(){
		 $("#summernote").summernote({
			height:400,
			lang : "ko-KR",
			callbacks:{//이미지 올릴 때 데이터베이스에 아작스 이용해서 업로드
				onImageUpload : function(files){ //이미지가 업로드 되면 files에 들어옴
					uploadImage(files[0],this); //그 이미지를 이 함수를 통해 처리한다.
				}
			}
		 });
	}); */
</script>

</body>
</html>