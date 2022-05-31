<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매상품 보기</title>
<style type="text/css">
	.auction-setting{
		padding: 30px;
		border-bottom: 1px solid #ccc;
		position: relative;
	}
	.auction-like{
		position: absolute;
		right: 40px; top: 30px;
		border: 1px solid #ccc;
		border-radius: 15px;
		width: 25px;
		padding: 5px 10px;
		text-align: center;
		display: flex;
		flex-direction: column;
	}
	.auction-like>span{
		width: 25px; height: 25px;
		text-align: center;
	}
	.auction-like>span:first-child{
		font-size: 1.5em;
	}
	.auction-setting>h3{
		margin-bottom: 5px;
	}
	.auction-setting>h4{
		margin-bottom: 10px;
		font-family: ns-light;
	}
	.auction-setting>span{
		margin-right: 10px;
	}
	.auction-info{
		display: flex;
		margin: 30px auto;
	}
	.auction-info>.auction-left{
		width: 40%;
	}
	.auction-info>.auction-right{
		width: 60%;
		padding-right: 30px;
	}
	.info-img{
		padding: 0px 30px;
	}
	.info-img>img{
		width: 100%;
		object-fit: cover;
	}
	.info-seller{
		margin-top: 10px;
		display: flex;
		height: 50px;
		padding: 0px 30px;
	}
	.info-seller>span{
		font-size: 3em;
		text-align: right;
		margin: 0px 20px;
	}
	.info-seller>div>h5{
		color: rgb(30,144,255);
	}
	.info-seller>div>a{
		color: black;
	}
	.auction-right>h1{
		text-align: right;
	}
	.info-history>h4{
		font-family: ns-light;
		margin: 40px 0px 10px 0px;
	}
	.info-history>table{
		width: 100%;
		margin-bottom: 20px;
	}

	.auction-notice{
		padding: 30px;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
	}
	.auction-notice>h4{
		margin-bottom: 10px;
	}
	.auction-notice>p{
		font-family: ns-light;
	}
	.auction-content{
		padding: 30px 20px;
		border-bottom: 1px solid #ccc;
	}
	.auction-direct{
		text-align: center;
		padding: 30px 20px;
	}

	/*모달*/
	.modal-content>span+div{
		display: flex;
		padding: 0px 16px;
		justify-content: space-between;
		margin-top: 5px;
	}
	.modal-content>span+div>span{
		line-height: 40px;
	}
	#bidding-modal .modal-wrap{
		width: 400px;
	}
	#history-modal .modal-wrap{
		width: 800px;
	}
	input[name=bidAmount]{
		width: 100px; height: 40px;
		padding: 0px 10px;
		text-align: center;								
	}
	input[name=bidPrice]{
		width: 140px; height: 40px;
		padding: 0px 10px;
		text-align: right;
	}
	input[name=bidMsg]{
		margin-top: 5px;
	}
	.modal-content textarea{
		overflow: auto;
		resize: none;
		padding: 0.8rem;
		outline: none;
		border: 1px solid #ccc;
		box-sizing: border-box;
		width: 100%; height: 150px;
		font-family: ns-light;
		margin: 5px 0px;
	}
	#bid-rank th, #bid-rank td{
		font-family: ns-light;
		padding: 0.5rem;
	}
	
	table#bid-history tr{
		border-top : 1px solid rgb(30,144,255); border-bottom:1px solid rgb(30,144,255);
	}
	table#bid-history td{
		font-family: ns-light
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<input type="hidden" id="projectNo" value="${auction.projectNo}">
	<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo}">
		<div class="page-content">
			<div class="page-titleC">${auction.projectName }</div>
			<div class="auction-setting">
				<div class="auction-like">
						<span class="material-symbols-rounded likeB">star</span>									
					<span id="likeCount">0</span>
				</div>
				<h3>${auction.auctionItem }</h3>
				<h4>프로젝트 기간 <span id="auctionStart">${auction.auctionStart }</span> ~ <span id="auctionEnd">${auction.auctionEnd }</span></h4>
				<span>수량 <span id="amountVal">${auction.auctionAmount }</span>개 | 시작가 ${auction.auctionPrice }원</span>
				<c:choose>
					<c:when test="${auction.auctionCategory eq 0}">
						<span class="badge">재난구호모금</span>
					</c:when>
					<c:when test="${auction.auctionCategory eq 1}">
						<span class="badge">유기동물 구조</span>
					</c:when>
					<c:when test="${auction.auctionCategory eq 2}">
						<span class="badge">미혼모 지원</span>
					</c:when>
					<c:when test="${auction.auctionCategory eq 3}">
						<span class="badge">장애인 지원</span>
					</c:when>
					<c:when test="${auction.auctionCategory eq 4}">
						<span class="badge">소년가장 후원</span>
					</c:when>
				</c:choose>
				<c:if test="${auction.lastDay eq 0 }">
					<span class="badge-pink">오늘마감</span>
				</c:if>
			</div>
			<div class="auction-info">
				<div class="auction-left">
					<div class="info-img">
						<img src="../../../resources/upload/auction/${auction.auctionPic}">
					</div>
					<div class="info-seller">
						<span class="material-symbols-rounded" style="color: rgb(30,144,255)">storefront</span>
						<div>
							<h5>판매자 정보</h5>
							<a href="/shopInfo.kh?memberNo=${auction.memberNo }">${auction.bizName}</a>
						</div>
					</div>				
				</div>
				<div class="auction-right">
					<div class="info-time">
						<h2>
							잔여시간이 표시됩니다.
						</h2>
					</div>
					<h1>
						현재가
						<span id="bestPrice">${auction.bestPrice }</span>원</h1>
					<div class="info-history">
						<h4 id="historyBtn">입찰 <span>0</span>회 (전체 기록 보기)</h4>
						<table id="bid-rank" class="tbl">
							<tbody>
								<tr class="tr-2">
									<th>순위</th>
									<th>입찰자명</th>
									<th>수량</th>
									<th>입찰액</th>
								</tr>								
								<tr class="tr-3" style="border-top : 2px solid rgb(30,144,255)">
									<td colspan="4" style="text-align: center;">입찰내역이 여기에 나타납니다!</td>
								</tr>									
								<tr class="tr-1">
									<td>2</td>
									<td>홍길동</td>
									<td>1</td>
									<td>${auction.bestPrice }</td>
								</tr>
								<tr class="tr-1">
									<td>3</td>
									<td>최영희</td>
									<td>1</td>
									<td>${auction.bestPrice }</td>
								</tr>
								<tr class="tr-1">
									<td>4</td>
									<td>박철수</td>
									<td>1</td>
									<td>${auction.bestPrice }</td>
								</tr>
								<tr class="tr-1">
									<td>5</td>
									<td>신짱구</td>
									<td>1</td>
									<td>${auction.bestPrice }</td>
								</tr>
							</tbody>
						</table>
						<button class="btn bc2" style="width:100%;" id="bidBtn" disabled>입찰하기 (미리보기 모드에서 사용 불가)</button>
					</div>
				</div>
			</div>
			<div class="auction-notice">
				<h4>경매 참여 과정 안내</h4>
				<p>
(1) 입찰 시 상품 구매 화면으로 이동됩니다. 주문완료 상태로 유지되며 실 결제는 되지 않습니다.<br>
(2) 이벤트 종료 후 낙찰이 확정되면 주문완료에서 결제대기로 이동합니다. 마이페이지에서 주문내역을 확인해 주세요.<br>
(3) 낙찰 확정일부터 다음날 23시 59분 전까지 결제를 완료하지 않을 경우 주문이 취소됩니다.<br>
(4) 한번 입찰 시 주문취소가 불가능하니 신중하게 선택해 주세요.<br>
				</p>
			</div>
			<div class="auction-content">
				${auction.auctionContent }
			</div>
			<div class="auction-comment">
				<div class="page-titleC">회원 한마디</div>
			</div>
			<div class="auction-direct">
				<button class="btn bc11" onclick="closing()" >미리보기 닫기</button>
			</div>
		</div>

	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		function closing(){
			window.close();	
		}
	</script>
</body>
</html>