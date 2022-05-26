<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 상세 페이지</title>
</head>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.content-header {
	width: 100%;
	display: flex;
	margin: 0 0;
	justify-content: center;
	align-items: center;
	margin-top: 20px;
}

.main-img {
	width: 100%;
	height: 300px;
	background-color: lightblue;
}

.donation-explanation {
	width: 30%;
	margin: 15px;
}

.donation-explanation>div {
	display: flex;
	align-items: center;
}

h5 {
	color: #ff82ab;
}

.donation-target {
	display: flex;
	justify-content: space-between;
}

.donation-target>div{
	display: flex;
	align-items: center;
	width: 40%;
}
.donation-count {
    width: 30%;
    text-align: center;
}


.material-icons {
	margin-top: 10px;
	margin-bottom: 10px;
	font-size: 60px;
}
.plusMinus{
	font-size: 20px;
	color: #1e90ff;
}

.donation-allcash{
	margin-right: 20px;
}
.donaton-punding{
	margin-top:20px;
	width: 100%;
}
.div-test{
	width: 100%;
	height: 400px;
	background-color: #1e90ff;
	margin-top:10px;
	margin-bottom: 10px; 
}
.testtest{
	width: 100%;
	text-align: center;	
}
.main-product{
	width: 30%;
	text-align: center;
}
.main-product>h4{
	display: inline-block;
	
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="content-header">
			<div class="main-product">
				<div class="main-img"></div>
				<h4>상품가 200,000</h4>
			</div>
			<div class="donation-explanation">
				<h3>상품이름</h3>
				<p>00%</p>
				<hr>
				<div class="donation-target">
					<p>목표금액 1,000,000원</p>
					<p>100,000원</p>
				</div>
				<div>
					<span class="material-icons">account_circle</span>
					<div>
						<h3>사업자이름</h3>
						<p>사업 or 사업자 간략한 내용</p>
					</div>
				</div>
				<div style="width: 70%" class="donation-target">
					<p> 총수량 0 </p>
					<div>
						<span class="material-icons plusMinus">add_circle</span>
						<span class="donation-count">0</span>
						<span class="material-icons plusMinus">remove_circle</span>
					</div>
				</div>
				<div>
						<h3 class="donation-allcash">총 금액</h3>
						<h3>000,000</h3>
				</div>
				<div>
					<button class="btn bc1 donaton-punding">펀딩 참여하기</button>
				</div>
			</div>
		</div>
		<div class="content-main">
			<div class="testtest">
				<p>
				동방사회복지회는 300여 명의 입양을 기다리는 아기들을 위탁가정과 함께 보호·양육하며 따뜻한 새 가족의 품을 선물하고 있습니다. 안타까운 일은 입양을 기다리는 아기들 중 아픈 아기들의 수가 더욱 늘었다는 것입니다. 저마다의 사연으로 가족의 품을 떠나 혼자가 된 아기들. 아기들의 상처는 그렇게 몸과 마음으로 나타납니다.
				</p>
				<div class="div-test">
				</div>
				<p>
				동방사회복지회는 300여 명의 입양을 기다리는 아기들을 위탁가정과 함께 보호·양육하며 따뜻한 새 가족의 품을 선물하고 있습니다. 안타까운 일은 입양을 기다리는 아기들 중 아픈 아기들의 수가 더욱 늘었다는 것입니다. 저마다의 사연으로 가족의 품을 떠나 혼자가 된 아기들. 아기들의 상처는 그렇게 몸과 마음으로 나타납니다.
				</p>
				<div class="div-test">
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>