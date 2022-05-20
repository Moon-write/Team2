<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<style>
.menu {
	margin-top:30px;
	width: 150px;
	height: 100%;
	float: left;
}

.menu ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	text-align: center;
}

.menu a {
	font-size: 14px;
	display: block;
	height: 40px;
	color:black;
	line-height: 40px;
	text-decoration: none;
	position: relative;
}

.sub-menu {
	display: none;
}

.sub-menu a{
	color:gray;
}

.more {
	position: absolute;
	font-size: 20px;
	right: 20px;
	transition-duration: 0.5s;
}

.menu-active {
	transform: rotate(45deg);
}

.page-content {
	float: left;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<div class="menu">
			<ul class="main-menu">
				<li>
					<a href="#">펀딩</a>
					<ul class="sub-menu">
						<li><a href="#">펀딩 등록</a></li>
						<li><a href="/manageFunding.kh?memberNo=100">펀딩 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">기부</a>
					<ul class="sub-menu">
						<li><a href="#">기부 등록</a></li>
						<li><a href="/manageDonation.kh?memberNo=100">기부 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">공동구매</a>
					<ul class="sub-menu">
						<li><a href="#">공동구매 등록</a></li>
						<li><a href="/manageGroup.kh?memberNo=100">공동구매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">경매</a>
					<ul class="sub-menu">
						<li><a href="#">경매 등록</a></li>
						<li><a href="/manageAuction.kh?memberNo=100">경매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">Q&A페이지</a>
					
				</li>
				<li>
					<a href="#">통계</a>
					<ul class="sub-menu">
						<li><a href="#">누적 금액</a></li>
						<li><a href="#">성별/연령별</a></li>
						<li><a href="/checkCount.kh?memberNo=100">일별 카운트</a></li>
					</ul>
				</li>
				<li>
					<a href="/shopUploadFrm.kh?memberNo=100">상호등록</a>
				</li>
				<li>
					<a href="/shopInfo.kh?memberNo=100">마이페이지</a>
				</li>
			</ul>
		</div>
		<div class="show-content">
			<div>
				<h3>진행중인 경매</h3><a href="#">더보기</a>
				<table border="1">
					<tr>
						<th>프로젝트명</th><th>상품명</th><th>수량</th><th>시작일</th><th>종료일</th><th>시작가</th><th>현재가</th>
					</tr>
					<c:forEach var="au" items="${au }">
						<tr>
							<td>${au.projectName }</td><td>${au.auctionItem }</td><td>${au.auctionAmount }</td>
							<td>${au.auctionStart }</td><td>${au.auctionEnd }</td><td>${au.auctionPrice }</td><td id="bestPrice">${au.bestPrice }</td>
							<td><button><a href="#">수정하기</a></button></td>
							<td><button id="delete">삭제<div style="display:none;"><input type="hidden" name="projectNo" value="${au.projectNo }">${au.projectNo }</div></button></td>
							
						</tr>
					</c:forEach>									
				</table>
				
			</div>
			
			<div>
				<h3>종료된 경매</h3><a href="#">더보기</a>
				<table border="1">
					<tr>
						<th>프로젝트명</th><th>상품명</th><th>수량</th><th>시작일</th><th>종료일</th><th>시작가</th><th>낙찰가</th><th>판매상태</th>
					</tr>
					<c:forEach var="au" items="${expiredAu }">
						<tr>
							<td>${au.projectName }</td><td>${au.auctionItem }</td><td>${au.auctionAmount }</td>
							<td>${au.auctionStart }</td><td>${au.auctionEnd }</td><td>${au.auctionPrice }</td><td>${au.bestPrice }</td>
							<td>
								<c:choose>
								<c:when test="${au.bestPrice == 0}">
									판매기간만료
								</c:when>
								<c:otherwise>
									낙찰완료
								</c:otherwise>
								</c:choose>
							</td>
						</tr>
					</c:forEach>									
				</table>
			</div>
		</div>
	</div>
	<script>
		$(function() {
			$(".sub-menu").prev().append("<span class='more'></span>")
			$(".more").parent().parent().on(
					"click",
					function(e) {
						$(this).children().last().slideToggle();
						$(this).children().first().children(".more")
								.toggleClass("menu-active");
						e.stopPropagation();
					})
			$("#delete").on("click",function(event){
				const projectNo=$("#delete").children().text();
				const bestPrice=$("#bestPrice").text();
				if(bestPrice>0){
					alert("이미 입찰자가 있습니다.");
				}else{
					confirm("삭제하시겠습니까?");
					if(true){
						$.ajax({
							url : "/deleteAuction.kh",
							data:{projectNo:projectNo},
							success : function(){
								alert("삭제되었습니다.");
								location.href="/manageAuction.kh?memberNo=100";
							},
							error : function(){
								alert("error");
							}
						});
					}
				}
				
			})
		})
		
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>