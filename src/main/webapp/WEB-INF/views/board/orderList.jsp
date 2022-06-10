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
.content-title{
	background-image: url(/resources/img/board/banner.jpg);
	background-size: cover;
	background-position: 0% 17%;
    margin-bottom: 30px;
}
.title-txt {
    margin: 10px auto;
    margin-top: 10px;
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
	width: 10%;
}
.my_book_list_tbl tr>th:nth-child(2){
	width: 10%;
} 
.my_book_list_tbl tr>th:nth-child(3){
	width: 30%;
}
.my_book_list_tbl tr>th:nth-child(4){
	width: 10%;
}
.my_book_list_tbl tr>th:nth-child(5){
	width: 10%;
}
.my_book_list_tbl tr>th:nth-child(6){
	width: 12%;
}
#my_book_list_tbl tr>td:nth-child(1){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(2){
	width: 10%;
} 
#my_book_list_tbl tr>td:nth-child(3){
	width: 30%;
}
#my_book_list_tbl tr>td:nth-child(4){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(5){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(6){
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
.payBtn{
	margin-top: 5px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">나의 결제</div>
				<div class="content-title">
					<div class="title-txt">나의 결제내역을 확인해보세요</div>
				</div>
					<!-- 헤더 테이블 -->
					<table class="tbl my_book_list_tbl">
						<tr class="tr-2 tr-head" id="tr-00">
							<th>구분</th>
							<th>주문번호</th>
							<th>프로젝트명</th>
							<th>금액</th>
							<th>날짜</th>
							<th>주문상태</th>
						</tr>
					</table>
					<!-- 본문 테이블 -->
					<c:choose>
						<c:when test="${not empty orderList}">
							<c:forEach items="${orderList }" var="bo" varStatus="i">
								<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
									<tr class="tr-00" id="tr-01">
										<td>
											<c:choose>
												<c:when test="${bo.divNo eq 1}">펀딩</c:when>
												<c:when test="${bo.divNo eq 2}">기부</c:when>
												<c:when test="${bo.divNo eq 4}">경매</c:when>
											</c:choose> 
										</td>
										<td id="orderNo">${bo.orderNo }</td>
										<td>${bo.projectName }</td>
										<td id="price">${bo.orderPrice }</td>
										<td>${bo.orderDate }</td>
										<c:choose>
											<c:when test="${bo.orderStatus eq 1}"><td>결제완료</td></c:when>
											<c:when test="${bo.orderStatus eq 2}"><td>배송완료</td></c:when>
											<c:when test="${bo.orderStatus eq 3}"><td>입찰완료</td></c:when>
											<c:when test="${bo.orderStatus eq 4}">
												<td>
												결제대기
												<button class="btn bc11 payBtn">결제하기</button>
												</td>
											</c:when>
											<c:when test="${bo.orderStatus eq 5}"><td>주문취소</td></c:when>
										</c:choose>
									</tr>
								</table>
							</c:forEach>
							<div id="pageNavi">${pageNavi }</div>
						</c:when>
						<c:otherwise>
							<p class="p-0">주문내역이 없습니다. WeNeedYou를 더 즐겨보세요!</p>
						</c:otherwise>
					</c:choose>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script type="text/javascript">
		$("#my_book_list_tbl tr").on("click",function(){
			const orderNo = $(this).children("td#orderNo").text();
			location.href = "/orderView.kh?orderNo="+orderNo;
		})
		$(".payBtn").on("click",function(event){
			window.event.stopPropagation();			
			const orderNo = $(this).parent().prev().prev().prev().prev().text();
			location.href = "/addOrder.kh?orderNo="+orderNo;
		})
		//(천단위)콤마 찍는 함수(첫번째꺼에밖에 적용안됨 - 이유 알아내서 모든 리스트에 적용되도록 수정!)
		$(function(){
			const num = $("#price").text();
		    	//아이디 tag인 태그의 text를 읽어온다 
			const num2 = $.numberWithCommas(num);
		  	// 받아온 text값을 정수로 변환하여 numberwithCommas 함수의 인자값으로 넣는다
		  	$("#price").text(num2+"원");
		});
		$.numberWithCommas = function (x) {
			  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
		};
		//인자값을 문자열로 변환한 뒤, 정규식을 활용하여 3자리마다 콤마를 삽입해준다.
	</script>
</body>
</html>