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
		font-family: ns-light;
		font-size : 0.8em;
	}
	#history-modal .modal-content{
		max-height: 500px;
		overflow: auto;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<input type="hidden" id="projectNo" value="${auction.projectNo}">
		<div class="page-content">
			<div class="page-titleC">${auction.projectName }</div>
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
					<span id="likeCount">${auction.totallike}</span>
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
						<span class="material-symbols-rounded" style="color: rgb(30,144,255)">storefront</span>
						<div>
							<h5>판매자 정보</h5>
							${auction.bizName}
						</div>
					</div>				
				</div>
				<div class="auction-right">
					<div class="info-time">
						<h2>
								<c:if test="${auction.lastDay ge 0 }">
									<c:if test="${auction.lastDay ne 0 }">
										<span id="last-day">${auction.lastDay }</span>일 
									</c:if>
									<c:if test="${auction.lastHour ne 0 }">
										<span id="last-hour">${auction.lastHour }</span>시간 
									</c:if>
									<span id="last-min">${auction.lastMin }</span>분
									<span id="last-sec">${auction.lastSec }</span>초 뒤 종료
								</c:if>
						</h2>
					</div>
					<h1>
						<c:choose>
							<c:when test="${auction.lastDay ge 0}">현재가</c:when>
							<c:otherwise>최종가</c:otherwise>
						</c:choose>
						<span id="bestPrice">${auction.bestPrice }</span>원</h1>
					<div class="info-history">
						<h4 id="historyBtn">입찰 <span id="bidCount"></span>회 (전체 기록 보기)</h4>
						<table id="bid-rank" class="tbl">
							<thead>
								<tr class="tr-2">
									<th>순위</th>
									<th>입찰자명</th>
									<th>수량</th>
									<th>입찰액</th>
								</tr>															
							</thead>
							<tbody>
								
							</tbody>
						</table>
						<c:choose>
							<c:when test="${empty sessionScope.m}">
								<button class="btn bc22" style="width:100%;" onclick="login()">로그인 후 참여해 주세요!</button>
							</c:when>
							<c:when test="${not empty sessionScope.m}">
								<button class="btn bc2" style="width:100%;" id="bidBtn">입찰하기</button>
							</c:when>
						</c:choose>
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
				<button class="btn bc11" onclick="gotoback()">목록으로</button>
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
					<table id="bid-history" class="tbl">
						<thead>
							<tr class="tr-3">
								<th style="width:5%">No.</th>
								<th style="width:20%">입찰시각</th>
								<th style="width:15%">입찰자명</th>
								<th style="width:15%">입찰수량</th>
								<th style="width:15%">입찰액</th>
								<th style="width:20%">한마디</th>
							</tr>							
						</thead>
						<tbody>
						</tbody>
					</table>
				</div>
				<div class="modal-foot">
					<button class="btn bc11 modal-close">닫기</button>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(function () {
			bidUpdate();
			
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
				const bidAmount = $("input[name=bidAmount]").val();
				const bidPrice = $("input[name=bidPrice]").val();
				const projectNo = $("input#projectNo").val();
				const memberNo = $("input#memberNo").val();
				const bidMsg = $("input[name=bidMsg]").val();

				if(bidAmount!=""&&regExp.test(bidAmount)&&bidPrice!=""&&regExp.test(bidPrice)){
					if(bidAmount<=$("span#amountVal").text()){
						if(bidPrice>=$("span#bestPrice").text()){
							
							const data = {
								type : "bid",
								bidAmount : bidAmount,
								bidPrice : bidPrice,
								bidMsg : bidMsg,
								projectNo : projectNo,
								memberNo : memberNo
							};
							console.log(data);
							ws.send(JSON.stringify(data));
							$("#bidding-modal").css("display","none");
							$("input[name=bidMsg]").val("");		

							
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
				showBidHistory();
			});
			$(document).on("click", ".modal-close", function () {
				$(this).parents(".modal-wrap").parent().css("display", "none");
			});  
		});
		$(function(){
			// 오늘이 참여가능한 날짜인지 계산
			const today = new Date();
			const start = new Date($("#auctionStart").text());
			const end = new Date($("#auctionEnd").text());

			if(today<start){
				//시작이 더 크면 뒤면
				$(".info-time>h2").text("경매 오픈 전");
				$("button#bidBtn").text("경매 시작 후 참여해 주세요!").prop("disabled","true").toggleClass("bc2").toggleClass("bc4");
			}else if(end<today){
				$(".info-time>h2").text("경매 마감");
				$("button#bidBtn").text("경매 마감").prop("disabled","true").toggleClass("bc2").toggleClass("bc4");
			}else{
				const stopWatch = setInterval(function(){
			let sec = $("#last-sec").text();
						
			if(sec-1<0){
				let min = $("#last-min").text();
				if(min-1<0){
					let hour = $("#last-hour").text();
					if(hour-1<0||hour==null){
						let day = $("#last-day").text();
						if(day-1<0||day==null){
							$(".info-time>h2").text("경매 마감");
							clearInterval(stopWatch);							
						}else{
							$("#last-day").text(day-1);
							$("#last-hour").text(23);
							$("#last-min").text(59);
							$("#last-sec").text(59);
						}
						
					}else{
						$("#last-hour").text(hour-1);
						$("#last-min").text(59);
						$("#last-sec").text(59);
					}
					
				}else{
					$("#last-min").text(min-1);
					$("#last-sec").text(59);	
				}
				
			}else{
				$("#last-sec").text(sec-1);				
			}
		},1000)
			}
		})
		
		$(document).on("click","span.likeB",function(){
			if(checkLogin()){
				const value = $("input#projectNo").val();			
	
				$(this).addClass("likeB-yellow").removeClass("likeB");
				
				$.ajax({
					url: "/addLike.kh",
					data : {
						projectNo : value
					},
					type : "post",
					success: function(data){
						if(data==-1){
							alert("관심상품 업데이트 실패!");
						}
						$("#likeCount").text(data);
					}
				})							
			}else{
				return false;
			}
		})
		$(document).on("click","span.likeB-yellow",function(){
			if(checkLogin()){
				const value = $("input#projectNo").val();		
				$(this).removeClass("likeB-yellow").addClass("likeB");			
				
				$.ajax({
					url: "/removeLike.kh",
					data : {
						projectNo : value
					},
					type : "post",
					success: function(data){
						if(data==-1){
							alert("관심상품 업데이트 실패!");
						}else{				
							$("#likeCount").text(data);					
						}
					}
				})			
			}else{
				return false;
			}
		})
		function checkLogin(){
			const id = $("input#memberNo").val();
			if(id==""){
				location.href = "/loginFrm.kh";
				return false;
			}else{
				return true;
			}
		}
		function login(){
			location.href = "/loginFrm.kh";
		}
		
		function bidUpdate(){
			const projectNo = $("input#projectNo").val();
			$.ajax({
				url : "/getBidCount.kh",
				type : "post",
				data : {
					projectNo : projectNo
				},
				success : function(data){
					$("span#bidCount").text(data);
				}
			});
			$.ajax({
				url : "/bidUpdate.kh",
				type : "post",
				data : {
					projectNo : projectNo
				},
				success : function(list){

					$("table#bid-rank>tbody").empty();
					
					if(list==""){
						const row = $("<tr class='tr-1'>");
						const td = $("<td colspan='4' style='height: 4em;'>");
						td.text("등록된 경매가 없습니다!");
						row.append(td);
						$("table#bid-rank>tbody").append(row);
						
					}else{
						for(let i=0;i<list.length;i++) {
							let row;

							if(list[i].bidSuccess==0){
								row = $("<tr class='tr-1'>");
							}else{
								row = $("<tr class='tr-3' style='border-top: 2px solid rgb(30,144,255);'>");
							}
							row.attr("title",list[i].bidMsg);
							const tdNo = $("<td>");
							tdNo.text(i+1);
							const tdName = $("<td>");
							tdName.text(list[i].memberName);
							const tdAmount = $("<td>");
							tdAmount.text(list[i].bidAmount);
							const tdPrice = $("<td>");
							tdPrice.text(list[i].bidPrice);
							row.append(tdNo).append(tdName).append(tdAmount).append(tdPrice);				

							$("table#bid-rank>tbody").append(row);
						}						
						$("span#bestPrice").text(list[0].bidPrice);
						$("div#bidding-modal input[name=bidPrice]").val(list[0].bidPrice);
					}					
				}
			})
		}
		function showBidHistory(){
			const projectNo = $("input#projectNo").val();
			
			$.ajax({
				url : "/bidHistory.kh",
				type : "post",
				data : {
					projectNo : projectNo
				},
				success : function(list){

					$("table#bid-history>tbody").empty();
					
					if(list==""){
						const row = $("<tr class='tr-1'>");
						const td = $("<td colspan='6' style='height: 4em;'>");
						td.text("등록된 경매 기록이 없습니다!");
						row.append(td);
						$("table#bid-history>tbody").append(row);
						
					}else{
						for(let i=0;i<list.length;i++) {
							let row;

							if(list[i].bidSuccess==0){
								row = $("<tr class='tr-1'>");
							}else{
								row = $("<tr class='tr-1' style='color: rgb(30,144,255);'>");
							}
							const tdNo = $("<td>");
							tdNo.text(i+1);
							const tdDate = $("<td>");
							tdDate.text(list[i].bidDate);
							const tdName = $("<td>");
							tdName.text(list[i].memberName);
							const tdAmount = $("<td>");
							tdAmount.text(list[i].bidAmount);
							const tdPrice = $("<td>");
							tdPrice.text(list[i].bidPrice);
							const tdMsg = $("<td>");
							tdMsg.text(list[i].bidMsg);
							row.append(tdNo).append(tdDate).append(tdName).append(tdAmount).append(tdPrice).append(tdMsg);				
						
							$("table#bid-history>tbody").append(row);
						}						
					}					
				}
			})
		}
		function gotoback(){
			history.back();
		}
	</script>
</body>
</html>