<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	
}
.update-btn{
	font-size:10px;
	width: 60px;
	height: 20px;
	text-align: center;
	border-radius: 3px;
	line-height:20px; 
	margin-left: 20px; 
}

.donation-explanation>div>form{
	width: 100%;
}

h2{
	margin-left: 10px;
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
.commentBox{
	display: flex;
    flex-direction: column;
    width: 60%;
}
.commentBoxView{
	display: flex;
    width: 100%;
    margin: 15px;
    margin-top: 0px;
    justify-content: space-between;
    align-items: center;
}
.commentBoxViewReal>div{
	line-height: 40px;
	margin-left: 15px;
	margin-right: 15px;
}
.commentBoxDiv{
	width: 100%;
    display: flex;
    justify-content: center;
}
.userComment2{
	font-size: 40px;
	margin: 0 0px;
	color: rgb(255, 130, 171);
}
.commentBoxViewReal{
	display: flex;
}
<!---->
.btn-pulse{
	background-color: #ff82ab;
	color: white;
	width: 80px;
	text-align: center;
}
.btn-pulse:hover{
  
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
					<p>
						촣 펀딩 참여 금액 <h3 style="color: blue;">&nbsp;&nbsp;${projectCash}&nbsp;원</h3>
					</p>
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
					<p> 총수량 <span id="resultView">1</span> </p>
					<div>
						<span class="material-icons plusMinus" onclick='count("minus")'>remove_circle</span>
						<span class="donation-count" id="result">1</span>
						<span class="material-icons plusMinus" onclick='count("plus")'>add_circle</span>
					</div>
				</div>
				<div>
						<h3 class="donation-allcash">총 금액</h3>
						<h3 id="resultCash">${donation.donationCash }</h3>&nbsp;<h3>원</h3>
				</div>
				<div>
					<form action=
							<c:if test = "${not empty sessionScope.m.memberId}">
								"/donationOrder.kh"
							</c:if>
							<c:if test = "${empty sessionScope.m.memberId}">
								"/loginFrm.kh"
							</c:if> 
						method="post">
						<button class="btn bc1 donaton-punding" id="donationBtn">펀딩 참여하기</button>
						<input type="hidden" id="sellerNo" value="${member.memberNo }" name="sellerNo">
						<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo}" name="memberNo">
						<input type="hidden" id="projectNo" value="${donation.projectNo }" name="projectNo">
						<input type="hidden" id="donationTitle" value="${donation.donationTitle }" name="donationTitle">
						<input type="hidden" id="divNo" value="${donation.divNo }" name="divNo">
						<input type="hidden" id="orderPrice" value="" name="orderPrice"> <!-- 총금액은 스크립트에서 jquery로 value값 전달 -->
					</form>
				</div>
			</div>
		</div>
		<div class="content-main">
			<div class="donation-content">
				${donation.donationContent }
			</div>
		</div>
	</div>
	<div class="commentFlex">
		<div class="inputCommentBox">
		<h2 style="margin-bottom: 30px;">기부천사들의 한마디</h2>
			<form action=
				<c:if test = "${not empty sessionScope.m.memberId}">
					"/insertDonationComment.kh"
				</c:if>
				<c:if test = "${empty sessionScope.m.memberId}">
					"/loginFrm.kh"
				</c:if>
			method="post">
				<ul>
					<li><span class="material-icons userComment">favorite</span></li>
						<li>
							<input type="hidden" name="projectNo" value="${donation.projectNo }">
							<input type="hidden" name="memberId" value="${sessionScope.m.memberId}">
							<textarea class="project-writer" name="donationCommentContent" style="overflow:hidden;"></textarea>
						</li>
						<li>
							<button type="submit" class="commentSubmit offset" id="commentBtn">
								SUBMIT
							</button>
						</li>
				</ul>
			</form>
		</div>
	</div>
	<div class="commentBoxDiv">
			<div class="commentBox">
				<c:forEach items="${donationComment }" var="comment">
					<div class="commentBoxView">
						<div class="commentBoxViewReal">
							<span class="material-icons userComment2">account_circle</span>
							<div>${comment.memberId }</div>
							<div>${comment.donationCommentContent }</div>
						</div>
						<c:set var="sessionScopeMemberId" value="${sessionScope.m.memberId}"/>
						<c:set var="donationCommentMemberId" value="${comment.memberId}"/>
						<c:if test="${sessionScopeMemberId eq donationCommentMemberId}">
							<a href="/donationCommentDelete.kh?donationCommentNo=${comment.donationCommentNo }" class="btn-pulse">DELETE</a>
						</c:if>
					</div>
				</c:forEach>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	$("#commentBtn").click(function(){
		const memberId = '${sessionScope.m.memberId}';
		if(memberId === ""){
			alert("로그인 이후에 댓글 입력이 가능합니다.");
		}
	});
	$("#donationBtn").click(function(){
		const memberId = '${sessionScope.m.memberId}';
		if(memberId === ""){
			alert("로그인 이후에 펀딩참여가 가능합니다.");
		}
	});
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
			  if(number < 2){
				  number = 1;
				  numberResult = 1;
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
		  resultElement3.innerText = cashResult;
		  // 총 금액 값 전달
		  $('input[name=orderPrice]').attr('value',cashResult);
		}
	</script>
</body>
</html>