<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매</title>
<style>
	.page-title{
		text-align: center;
		font-size: 0.8em;
	}
	.likeList-wrap{
		display: flex;
		justify-content: center;
		margin: 30px;
	}
	.likeList-content{
		width: 20%;
		margin: 0px 10px;
		border: 1px solid #ccc;
		padding: 20px;
		position: relative;
	}
	.likeList-content>span{
		position: absolute;
		right: 30px; top: 30px;
		font-size: 2em;
		background-color: white;
		border-radius: 30%;
	}
	.likeList-content>div:first-child{
		width: 100%;
		margin-bottom: 20px;
	}
	.likeList-content>div>img{
		width: 100%;
		object-fit: cover;
		border-radius: 10px;
	}
	.likeList-title{
		text-align: left;
	}
	.likeList-price{
		text-align: right;
	}


	.array-wrap{
		display: flex;
		justify-content: flex-end;
		align-items: center;
		width: 80%;
		margin: 0 auto;
		margin-top: 30px;
	}
	.input-form{
		width: 150px !important; height: 30px;
		margin-left: 10px;
		padding: 0px 15px !important;
	}
	#searchBtn{
		margin-left: 5px;
		height: 30px;
		width: 50px;
		padding: 0px;
	}
	#searchBtn>span{
		margin-top: 2px;
	}
	.auctionList-wrap{
		margin-bottom: 20px;
	}
	.auction-content{
		display: flex;
		padding: 30px;
		width: 80%;
		margin: 0px auto;
		border-bottom: 1px solid #ccc;
	}
	.auction-pic{
		width: 35%; height: 250px;
		text-align: center;
	}
	.auction-pic>img{
		height: 100%;
		object-fit: cover;
		border-radius: 20px;
	}
	.auction-title{
		position: relative;
	}
	.auction-title>span{
		position: absolute;
		top: 0px; right: 0px;
		font-size: 2.5em;
	}
	.auction-title>h4{
		margin-top: 5px;
	}
	.auction-info{
		width: 65%;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		padding: 10px 0px;
	}
	.auction-info>h4{
		font-family: ns-light;
	}
	.auction-time>h3{
		margin-bottom: 10px;
		color: #ff82ab;
	}
	.auction-time>span{
		margin-right: 10px;
		font-family: ns-light;
	}
	.auction-price{
		margin-top: 10px;
		text-align: right;
	}
	.auction-price>h1{
		text-align: right;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%@include file="/WEB-INF/views/auction/msg.jsp" %>
		<div class="page-content">
			<div class="page-title">관심상품 모아보기</div>
			<a href="/addAuction.kh">경매 등록</a>
			<div class="likeList-wrap">
				<div class="likeList-content">
					<span class="material-symbols-rounded likeB">star</span>
					<div>
						<img src="../../../resources/img/auction/preview.jpg">
					</div>
					<div class="likeList-title">
						<h4>[프로젝트명]</h4>
						<h5 style="font-family: ns-light;">상품명</h5>
					</div>
					<div class="likeList-price">
						<h5 style="font-family: ns-light;">판매마감</h5>
						<h4>현재가 10,000원</h4>
					</div>
				</div>
			</div>
			<hr>
			<div class="page-title">전체 경매상품</div>
			<div class="auctionList-wrap">
				<div class="array-wrap">
					<input type="checkbox" id="endItem"><label for="endItem">종료 프로젝트 제외하기</label>
					<select id="listArray" class="input-form">
						<option value="1">최근등록순</option>
						<option value="2">마감임박순</option>
						<option value="3">관심순</option>
					</select>
					<input type="text" id="listSearch" placeholder="상품명 입력" class="input-form">
					<button class="btn bc11" id="searchBtn"><span class="material-symbols-outlined" >search</span></button>
				</div>
				<div class="auction-content">
					<div class="auction-pic">
						<img src="../../../resources/img/auction/preview.jpg">
					</div>
					<div class="auction-info">
						<div class="auction-title">
							<h3>[프로젝트명]</h3>
							<h4>상품명</h4>
							<span class="material-symbols-rounded likeB">star</span>
						</div>
						<h4>입찰 0회</h4>
						<div class="auction-time">
							<h3><span id="last-hour">3</span>시간 <span id="last-minute">00</span>분 뒤 종료</h3>
							<span class="badge">유기동물 구조</span><span class="badge-pink">입찰 10건 이상</span><span class="badge-pink">오늘마감</span>
						</div>
						<div class="auction-price">
							<s>시작가 5,000원</s>
							<h2 style="font-family: ns-light;">현재가 <span style="color: red;">10000</span> 원</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>