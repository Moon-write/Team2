<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매상품 보기</title>
<style type="text/css">
	.page-title{
		text-align: center;
		font-size: 0.8em;
	}
	.auction-setting{
		padding: 30px 0px;
		border-bottom: 1px solid #ccc;
		position: relative;
	}
	.auction-like{
		position: absolute;
		right: 10px; top: 30px;
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
		justify-content: center;
	}
	.info-seller>span{
		font-size: 3em;
		text-align: right;
		margin-right: 20px;
	}
	.auction-right>h1{
		text-align: right;
	}
	.info-history>h3{
		font-family: ns-light;
		margin: 10px 0px;
	}
	.info-history>table{
		width: 100%;
		margin-bottom: 20px;
	}

	.auction-notice{
		padding: 30px 20px;
		border-top: 1px solid #ccc;
		border-bottom: 1px solid #ccc;
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%@include file="/WEB-INF/views/auction/msg.jsp" %>
	<input type="hidden" id="projectNo" value="${auction.projectNo}">
		<div class="page-content">
			<div class="page-title">${auction.projectName }</div>
			<div class="auction-setting">
				<div class="auction-like">
					<c:choose>
						<c:when test="${auction.like eq 0 }">
							<span class="material-symbols-rounded likeB">star</span>									
						</c:when>
						<c:when test="${auction.like eq 1 }">
							<span class="material-symbols-rounded likeB-yellow">star</span>									
						</c:when>
					</c:choose>
					<span id="likeCount">30</span>
				</div>
				<h3>${auction.auctionItem }</h3>
				<h4>프로젝트 기간 ${auction.auctionStart } ~ ${auction.auctionEnd }</h4>
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
				<c:if test="${auction.bidCount ge 10 }">
					<span class="badge-pink">입찰 10건 이상</span>
				</c:if>
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
						<span class="material-symbols-rounded">storefront</span>
						<div>
							<h5>판매자 정보</h5>
							${info.sellerName}주시고히사 왑왑
						</div>
					</div>				
				</div>
				<div class="auction-right">
					<div class="info-time">
						<h2>
							<c:if test="${l.lastDay ne 0 }">
								<span id="last-day">${auction.lastDay }</span>일 
							</c:if>
							<c:if test="${l.lastHour ne 0 }">
								<span id="last-hour">${auction.lastHour }</span>시간 
							</c:if>
							<span id="last-minute">${auction.lastMin }</span>분
							<span id="last-sec">${auction.lastSec }</span>초
							뒤 종료
						</h2>
					</div>
					<h1>현재가  <span id="bestPrice">${auction.bestPrice }</span> 원</h1>
					<div class="info-history">
						<h3 id="historyBtn">입찰 <span>${auction.bidCount }</span>회 (전체 기록 보기)</h3>
						<table id="bid-rank" class="tbl">
							<tbody>
								<tr class="tr-2">
									<th>순위</th>
									<th>입찰자명</th>
									<th>수량</th>
									<th>입찰액</th>
								</tr>
								<tr class="tr-3">
									<td>dd</td>
								</tr>
								<tr class="tr-1">
									<td>dd</td>
								</tr>
							</tbody>
						</table>
						<c:choose>
							<c:when test="${empty sessionScope.m}">
								<button class="btn bc1" style="width:100%;">로그인 후 참여해 주세요!</button>
							</c:when>
							<c:when test="${not empty sessionScope.m}">
								<button class="btn bc1" style="width:100%;" id="bidBtn">입찰하기</button>
							</c:when>
						</c:choose>
					</div>
				</div>
			</div>
			<div class="auction-notice">
				<h4>경매 참여 과정 안내</h4>
				<p>어쩌구저쩌구 규칙</p>
			</div>
			<div class="auction-content">
				${auction.auctionContent }
			</div>
			<div class="auction-comment">
				<div class="page-title">회원 한마디</div>
			</div>
			<div class="auction-direct">
				<a href="/auctionList.kh" class="btn bc11">목록으로</a>
			</div>
		</div>
		<div id="bidding-modal" class="modal-bg"  style="display: none;">
			<div class="modal-wrap">
				<div class="modal-head">
					<h2>입찰하기</h2>
					<span class="material-symbols-rounded close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<span style="padding: 0px 16px;">입찰 수량 및 금액</span>
					<div style="border: none;">
						<input type="number" value="1" class="input-form" name="bidAmount"><span> 개 / 개당 </span><input type="text" placeholder="${auction.bestPrice}" class="input-form" name="bidPrice"><span>원</span>
					</div>
					<div style="border: none; padding: 16px;">
						<span>입찰자의 한마디</span>
						<input type="text" name="bidMsg" placeholder="내용을 입력해주세요" class="input-form" style="height: 40px;">
					</div>
					<div class="bid-policy" style="padding-top: 0px;">
						<span>입찰 규정</span>
						<textarea>(1) 복수 구매시 개당 구매금액은 따로 조정이 불가능합니다. 금액을 다르게 입찰하고 싶을 경우 여러 번 입찰해 주세요.
(2) 입찰 현황에 따라 전 수량이 아닌 일부 수량만 낙찰될 수 있습니다.
(3) 낙찰 후 24 시간 이내에 결제해야 정상 구매 처리됩니다.
(4) 낙찰 후 구매하지 않을 경우 일시적으로 활동이 제한됩니다.</textarea>
						<div style="display: flex; justify-content: center; padding: 3px 0px;">
							<input type="checkbox" id="policyChk"><label for="policyChk"><b>입찰 관련 규정</b>을 확인했습니다. (필수)</label>
						</div>
					</div>
					<div class="modal-foot">
						<button class="btn bc4" id="sendBidBtn" disabled>입찰하기</button>
						<button class="btn bc11 modal-close">취소</button>
					</div>
				</div>
			</div>
		</div>
		<div id="history-modal" class="modal-bg"  style="display: none;">
			<div class="modal-wrap">
				<div class="modal-head">
					<h2>입찰 내역</h2>
					<span class="material-symbols-rounded close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<p>모달내용</p>
					<p>모달내용</p>
					<p>모달내용</p>
					<p>모달내용</p>
				</div>
				<div class="modal-foot">
					<button class="btn bc1">확인</button>
					<button class="btn bc11 modal-close">취소</button>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(function () {
			$("input#policyChk").on("click",function(){
				$("#sendBidBtn").toggleClass("bc4").toggleClass("bc1");
				if($(this).prop("checked")==true){
					$("#sendBidBtn").removeAttr("disabled");
				}else{
					$("#sendBidBtn").attr("disabled");
				}
			})
			$("#sendBidBtn").on("click",function(){
				let regExp = /^[0-9]+$/;
				// 수량체크
				const bidAmount = $("input[name=bidAmount]");
				const bidPrice = $("input[name=bidPrice]");
				if(bidAmount.val()!=""&&regExp.test(bidAmount.val())&&bidPrice.val()!=""&&regExp.test(bidPrice.val())){
					if(bidAmount.val()<=$("span#amountVal").text()){
						if(bidPrice.val()>=$("span#bestPrice").text()){
							const form = $("<form action='/insertBid.kh?projectNo="+$("input#projectNo").val()+"' method='post'>");
							$("body").append(form);
							form.append(bidAmount);
							form.append(bidPrice);
							form.append($("input[name=bidMsg]"));
							form.submit();
						}else{
							alert("구입 가능 가격을 입찰해야 합니다.")
						}
					}else{
						alert("기준 수량 이상의 상품을 입찰하실 수 없습니다.")
					}
				}else{
					alert("정확한 수량과 금액을 입력해 주세요!");
				}
			})
			$("#bidBtn").on("click",function(){
				$("#bidding-modal").css("display", "flex");
			});
			$("#historyBtn").on("click",function(){
				$("#history-modal").css("display", "flex");
			});
			$(document).on("click", ".modal-close", function () {
				$(this).parents(".modal-wrap").parent().css("display", "none");
			});  
		});
	</script>
</body>
</html>