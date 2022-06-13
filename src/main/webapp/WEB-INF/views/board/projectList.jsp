<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/boardMain.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<style>
.content-title{
	background-image: url(/resources/img/board/banner3.jpg);
	background-size: cover;
	background-position: 10% 65%;
    margin-bottom: 30px;
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
	width: 9%;
} 
.my_book_list_tbl tr>th:nth-child(3){
	width: 20%;
}
.my_book_list_tbl tr>th:nth-child(4){
	width: 36%;
}
.my_book_list_tbl tr>th:nth-child(5){
	width: 13%;
}
.my_book_list_tbl tr>th:nth-child(6){
	width: 11%;
}
#my_book_list_tbl tr>td:nth-child(1){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(2){
	width: 9%;
} 
#my_book_list_tbl tr>td:nth-child(3){
	width: 20%;
}
#my_book_list_tbl tr>td:nth-child(4){
	width: 36%;
}
#my_book_list_tbl tr>td:nth-child(5){
	width: 13%;
}
#my_book_list_tbl tr>td:nth-child(6){
	width: 11%;
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">진행중인 프로젝트</div>
				<div class="content-title">
					<div class="title-txt">현재 참여중인 프로젝트를 확인해보세요</div>
				</div>
				<!-- 카테고리 사용금액 -->
				<div class="amount-chart">
					<!-- divNo/memberNo으로 order_tbl에서 카테고리별 금액 -->
					<p>카테고리별 사용 금액</p>
						<p>이번달 경매와 펀딩에서 총 ₩27,000 썼어요.</p>
						<canvas id="amount-chart" width="200" height="112"></canvas>
				</div>
				<hr>
				<!-- 지난달과 비교순위 -->
				<div class="amount-chart">
					<!-- divNo/memberNo으로 order_tbl에서 카테고리별 금액 -->
					<p>순위가 바뀌었어요!</p>
					<!-- 돈 많이쓴 카테고리 순위 지난달과 비교해서 바뀌었으면 표시 아니면 다른말 -->
					<p>지난 달은 경매에 가장 많이 지출했어요.</p>
				</div>
				<hr>
				<!-- 나의 단골매장 -->
				<div class="amount-chart">
					<!-- divNo/sellerNo으로 order_tbl에서 카테고리별 금액 -->
					<p>나의 단골 매장</p>
					<p>길냥이를 사랑하는 모임에서 2번 결제하여, 총 ₩27,000 썼어요.</p>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	const myChartOne = document.getElementById("amount-chart").getContext("2d");

	const barChar = new Chart(myChartOne, {
		type: 'doughnut',
	    data: {
	      labels: ["Africa", "Asia", "Europe", "Latin America", "North America"],
	      datasets: [
	        {
	          label: "Population (millions)",
	          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
	          data: [2478,5267,734,784,433]
	        }
	      ]
	    },
	    options: {
	      title: {
	        display: true,
	        text: 'Predicted world population (millions) in 2050'
	      }
	    }
	});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>