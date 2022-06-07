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
	width: 30%;
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
	cursor: pointer;
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
.donation-content{
	margin: 15px;
	padding: 15px;
}
.donationMainImg{
	width: 100%;
	height: 100%;
}
.donation-update{
	display: flex;
	justify-content: space-between;
}
.update-btn{
	font-size:10px;
	width: 60px;
	height: 20px;
	text-align: center;
	border-radius: 3px;
	line-height:20px; 
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="content-header">
			<div class="main-img">
				<img src="${donation.donationImgpath }" class="donationMainImg">
			</div>
			<div class="donation-explanation">
				<h5>일반 기부 펀딩은 1,000원으로 값이 고정 됩니다.</h5>
				<h3>${donation.donationTitle }</h3>
				<div class="donation-update">
					<p>00%</p>
					<c:set var="sessionScopeMemberNo" value="${sessionScope.m.memberNo}"/>
					<c:set var="donationMemberNo" value="${donation.memberNo}"/>
					<c:if test="${donationMemberNo eq sessionScopeMemberNo}">
						<a class="bc2 update-btn" href="/donationUpdateWriter.kh?projectNo=${donation.projectNo }">수정하기</a>
					</c:if>
				</div>
				<hr>
				<div class="donation-target">
					<p>목표금액 ${donation.donationTarget }원</p>
					<p>${donation.donationCash }원</p>
				</div>
				<div>
					<span class="material-icons">account_circle</span>
					<div>
						<h3>${member.memberId }</h3>
						<p>${member.memberName }</p>
					</div>
				</div>
				<div style="width: 70%" class="donation-target">
					<p> 총수량 <span id="resultView">0</span> </p>
					<div>
						<span class="material-icons plusMinus" onclick='count("plus")'>add_circle</span>
						<span class="donation-count" id="result">0</span>
						<span class="material-icons plusMinus" onclick='count("minus")'>remove_circle</span>
					</div>
				</div>
				<div>
						<h3 class="donation-allcash">총 금액</h3>
						<h3 id="resultCash">0 원</h3>
				</div>
				<div>
					<button class="btn bc1 donaton-punding">펀딩 참여하기</button>
				</div>
			</div>
		</div>
		<div class="content-main">
			<div class="donation-content">
				${donation.donationContent }
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	function count(type)  {
		  const resultElement = document.getElementById('result');
		  const resultElement2 = document.getElementById('resultView');
		  const resultElement3 = document.getElementById('resultCash');
		  
		  // 현재 화면에 표시된 값
		  let number = resultElement.innerText;
		  let numberResult = resultElement2.innerText;
		  let cashResult = resultElement3.innerText;
		  
		  // 더하기/빼기
		  if(type === 'plus') {
		    number = parseInt(number) + 1;
		    numberResult = parseInt(numberResult) + 1;
		    cashResult = parseInt(number) * ${donation.donationCash};
		  }else if(type === 'minus')  {
			  if(number < 1){
				  number = 0;
				  numberResult = 0;
				  cashResult = parseInt(number) * ${donation.donationCash};
			  }else{
				  number = parseInt(number) - 1;
				  numberResult = parseInt(numberResult) - 1;
				  cashResult = parseInt(number) * ${donation.donationCash};
			  }
		  }
		  // 결과 출력
		  resultElement.innerText = number;
		  resultElement2.innerText = numberResult;
		  resultElement3.innerText = cashResult + ' 원';
		}
	</script>
</body>
</html>