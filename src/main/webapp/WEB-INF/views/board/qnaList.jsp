<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/boardMain.css">
<style>
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
	width: 7%;
} 
.my_book_list_tbl tr>th:nth-child(3){
	width: 24%;
}
.my_book_list_tbl tr>th:nth-child(4){
	width: 10%;
}
.my_book_list_tbl tr>th:nth-child(5){
	width: 12%;
}
#my_book_list_tbl tr>td:nth-child(1){
	width: 7%;
}
#my_book_list_tbl tr>td:nth-child(2){
	width: 7%;
} 
#my_book_list_tbl tr>td:nth-child(3){
	width: 24%;
}
#my_book_list_tbl tr>td:nth-child(4){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(5){
	width: 12%;
}
select{
	float: right;
	margin: 20px 0;
}
.tbl th, .tbl>td {
    padding: 1rem;
    text-align: center;
    
}
#tr-00>*{
	padding: 1rem;
}
#tr-01>*{
	padding: 1.2rem;
}
#pageNavi>*{
	margin-top: 60px;
	margin-bottom: 30px;
}
.content-title{
	background-image: url(/resources/img/board/banner10.jpg);
	background-size: cover;
	background-position: center;
}
.title-txt {
    margin: auto;
    padding: 10px;
    width: 1000px;
    text-align: center;
    font-size: 35px;
    color: white;
    background-color: rgba(39, 39, 39, 0.5);
    animation-name: up;
    animation-duration: 1.5s;
    animation-fill-mode: forwards;
    animation-direction: alternate;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">나의 Q&A</div>
				<div class="content-title">
					<div class="title-txt">내가 쓴 질문을 확인해보세요</div>
				</div>
					<!-- 헤더 테이블 -->
					<table class="tbl my_book_list_tbl">
						<tr class="tr-2 tr-head" id="tr-00">
							<th>질문번호</th>
							<th>구분</th>
							<th>프로젝트명</th>
							<th>날짜</th>
							<th>답변상태</th>
						</tr>
					</table>
					<!-- 본문 테이블 -->
					<c:choose>
						<c:when test="${not empty qnaList}">
							<c:forEach items="${qnaList }" var="bo" varStatus="i">
								<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
									<tr class="tr-00" id="tr-01">
										<td>${bo.qnaNo }</td>
										<c:choose>
											<c:when test="${bo.divNo eq 1}"><td>펀딩</td></c:when>
											<c:when test="${bo.divNo eq 2}"><td>기부</td></c:when>
											<c:when test="${bo.divNo eq 3}"><td>공동구매</td></c:when>
											<c:when test="${bo.divNo eq 4}"><td>경매</td></c:when>
										</c:choose>
										<td>${bo.projectName }</td>
										<td>${bo.qnaDate }</td>
										<c:choose>
											<c:when test="${bo.qnaComplete eq 0}"><td>답변대기</td></c:when>
											<c:when test="${bo.qnaComplete eq 1}"><td>답변완료</td></c:when>
										</c:choose>
									</tr>
								</table>
							</c:forEach>
							<div id="pageNavi">${pageNavi }</div>
						</c:when>
						<c:otherwise>
							<p class="p-0">Q&A내역이 없습니다.</p>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>