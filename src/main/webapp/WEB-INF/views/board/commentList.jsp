<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">나의 리뷰</div>
				<table border="1">
					<tr>
						<th>구분</th><th>프로젝트명</th><th>한마디</th><th>날짜</th><th>구매상태</th>
					</tr>
					<c:forEach items="${commentList }" var="c" varStatus="i">
					<tr>
					<a href=#>
						<td>${c.divNo }</td>
						<td>${c.projectNo }</td>
						<td>${c.commentContent }</td>
						<td>${c.commentDate }</td>
						<td>${c.commentNo }</td>
					</a>
					</tr>
					</c:forEach>
					<tr>
						<th colspan="4" class="pageNavi">${pageNavi }</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>