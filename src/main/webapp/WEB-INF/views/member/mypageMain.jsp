<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.flex-wrap {
	display: flex;
	flex-wrap: wrap;
}	
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">콘텐츠 제목입니다. 제목쓰시면 콘텐츠영역 줄 위에 쓰여집니다.</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>