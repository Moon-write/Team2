<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.notice-tbl a:hover {
	text-decoration: underline;
}
.notice-tbl tr {
	border-bottom: 1px solid #ccc;
}

.notice-tbl tr>th:first-child {
	width: 10%;
}

.notice-tbl tr>th:nth-child(2) {
	width: 45%;
}

.notice-tbl tr>td:nth-child(2) {
	text-align: left;
}

.notice-tbl tr>th:nth-child(3) {
	width: 15%;
}

.notice-tbl tr>th:nth-child(4) {
	width: 20%;
}

.notice-tbl tr>th:nth-child(5) {
	width: 10%;
}
#pageNavi {
	margin: 30px;
}
.hr-0{
	color: #ac9e89;
}
.p-0{
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	padding: 45px 0px;
}
.test-modal{
	top: 0px;
	left: 0px;
}
.my_book_list_tbl tr>th:nth-child(1){
	width: 7%;
} 
.my_book_list_tbl tr>th:nth-child(2){
	width: 10%;
}
.my_book_list_tbl tr>th:nth-child(3){
	width: 24%;
}
.my_book_list_tbl tr>th:nth-child(4){
	width: 12%;
}
.my_book_list_tbl tr>th:nth-child(5){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(1){
	width: 7%;
} 
#my_book_list_tbl tr>td:nth-child(2){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(3){
	width: 24%;
}
#my_book_list_tbl tr>td:nth-child(4){
	width: 12%;
}
#my_book_list_tbl tr>td:nth-child(5){
	width: 10%;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">나의 리뷰</div>
					<!-- 헤더 테이블 -->
					<table class="tbl my_book_list_tbl">
						<tr class="tr-2 tr-head">
							<th>구분</th>
							<th>프로젝트명</th>
							<th>한마디</th>
							<th>날짜</th>
							<th>구매상태</th>
						</tr>
					</table>
					<!-- 본문 테이블 -->
					<c:choose>
						<c:when test="${not empty commentList}">
							<c:forEach items="${commentList }" var="c" varStatus="i">
								<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
									<tr class="tr-0">
										<a href=#>
											<td>${c.divNo }</td>
											<td>${c.projectNo }</td>
											<td>${c.commentContent }</td>
											<td>${c.commentDate }</td>
											<td>${c.commentNo }</td>
										</a>
									</tr>
								</table>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<p class="p-0">예약내역이 없습니다.</p>
						</c:otherwise>
					</c:choose>
				<div id="pageNavi" class="pagination">${pageNavi }</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>