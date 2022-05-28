<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<div class="mypage-content-title">콘텐츠 제목입니다. 제목쓰시면 콘텐츠영역 줄 위에 쓰여집니다.</div>
				<!-- 헤더 테이블 -->
				<table class="tbl my_book_list_tbl">
					<tr class="tr-2 tr-head">
						<th>구분</th><th>프로젝트명</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>