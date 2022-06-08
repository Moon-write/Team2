<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
.main-product{
	width: 30%;
	text-align: center;
}
.main-product>h4{
	display: inline-block;
	
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
.update-btn:hover{
	transition: 0.5s;
	
}

/*---------- 덧글입력관련 CSS ----------*/
.userComment{
	font-size: 50px;
	margin: 10px;
	color: #1e90ff;
}

.inputCommentBox {
	width: 80%;
	margin: 50px;
	border-top:1px solid black;
	padding-top: 25px;
}

.commentFlex{
	width:100%;
	display:flex;
	justify-content: center;
}

.inputCommentBox>form>ul {
	list-style-type: none;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 0 0;
}

.project-writer{
	resize: none;
	width: 600px;
	height: 50px;
	font-size: large;
    line-height: 50px;
    padding: 3px;
}
.commentSubmit{
	width: 80px;
	height: 40px;
	margin: 10px;
	background-color: white;
	cursor: pointer;
}

.offset{
	border:none;
	border-radius: 0px;
    box-shadow: 6px 6px 0 0 rgb(30, 144, 255), inset 6px 6px 0 0 rgb(30, 144, 255);
    transition: 0.3s;
    color: rgb(30, 144, 255);
}
.offset:hover{
	box-shadow: 0 0 0 0 rgb(30, 144, 255), inset 108px 72px 0 0 rgb(30, 144, 255);
    color:white;
}
/**/
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="content-header">
			<div class="main-product">
				<div class="main-img">
					<img src="${donation.donationImgpath }" class="donationMainImg">
				</div>
				<h4>상품가 ${donation.donationCash }</h4>
			</div>
			<div class="donation-explanation">
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
						<span class="donation-count" id='result'>0</span>
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
			<!-- <div class="testtest">
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
			</div>-->
			
			<div class="donation-content">
				${donation.donationContent }
			</div>
		</div>
	</div>
		<div class="commentFlex">
			<div class="inputCommentBox">
			<h2>기부천사들의 한마디</h2>
				<form action="/insertDonationComment.kh" method="post">
					<ul>
						<li><span class="material-icons userComment">favorite</span></li>
						<li>
							<input type="hidden" name="projectNo" value="${donation.projectNo }">
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId}">
							<textarea class="project-writer" name="donationCommentContent"></textarea>
						</li>
						<li>
							<button type="submit" class="commentSubmit offset">
								SUBMIT
							</button>
						</li>
					</ul>
				</form>
			</div>
		</div>
		<div class="commentBox">
			
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