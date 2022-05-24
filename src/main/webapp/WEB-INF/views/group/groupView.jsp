<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"> 
<style>
	#view-wrap{
		padding-top: 30px;
		width: 1200px;
		margin: 0 auto;
	}
	#view-title{
		width: 1000px;
		margin: 0 auto;
		padding: 30px 0px 30px 0px;
		font-size: xx-large;
		text-align: center;
	}
	#view-head {
		margin: 0 auto;
		width: 1000px;
		height: 400px;
		display: flex;
	}
	.view-slide {
		width: 600px;
	
		background-color: aquamarine;
		
	}
	.view-info {
		width: 400px;
		padding: 20px 0px 20px 0px;
	}
	[name=alarm] {
		width: 300px;
		text-align: center;
	}

	#view-body {
		margin: 0 auto;
		width: 1000px;
		display: flex;
	}
	.view-content {
		width: 680px;
		height: 1000px;
	}
	.view-cart {
		border: 1px solid #191919;
		border-radius: 20px;
		width: 320px;
		height: 500px;
		padding: 20px;
	}
	.view-cart div {
		padding: 5px;
	}
	.price {
		display: flex;
	}
	#view-foot {
		margin: 0 auto;
		width: 1000px;
		display: flex;
	}
	.view-qna{
		margin: 0 auto;
		width: 680px;
		height: 300px;
		background-color: sandybrown;
	}
	.view-empty {
		width: 320px;
	}
	.info{
		width: 330px;
		margin: 0 auto;
		margin-bottom: 15px;
	}
	.info-title{
		font-size: medium;
		font-weight: 300;
	}
	.info-detail {
		font-size: x-large;
		font-weight: 600;
	}
	.due, .discount {
		color: rgba(255, 46, 99, 0.9);
	}



</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="view-wrap">
		<div id="view-title">
			프로젝트명
		</div>
		<div id="view-head">
			<div class="view-slide">
			
			
			
				<!--
				<div class="slide-wrap">
					<ul>
						<li><img src="../../../resources/upload/group/kong1.JPG"></li>
						<li><img src="../../../resources/upload/group/kong2.jpg"></li>
						
					</ul>
					<div class="slide-navi prev">
						<span class="material-icons">arrow_back_ios_new</span>
					</div>
					<div class="slide-navi next">
						<span class="material-icons">arrow_forward_ios_new</span>
					</div>
				</div>
			-->
			</div>
			<div class="view-info">
				<div class="info" name="prj-name"><div class="info-title">남은 기간 <span class="due">2022.8.11</span></div><div class="info-detail">1일</div></div>
				<div class="info" name="prj-date"><div class="info-title">참여 인원</div><div class="info-detail">1명</div></div>
				<div class="info" name="prj-count"><div class="info-title">할인 가격 <span class="discount">0% 적용 중</span></div><div class="info-detail">1원</div></div>
				<div class="info" name="prj-alarm"> <button class="btn bc6" name="alarm">1명만 더 구매하면 1,000원 할인</button></div>
				<div class="info" name="prj-sns">소문내러 가기</div>
			</div>
		</div>
		<div id="view-body">
			<div class="view-content"></div>
			<div class="view-cart">
				<div class="cart price" name="cart-price"><div class="cart-title">현재가</div><div class="cart--detail">10,000원</div></div>
				<div class="cart" name="cart-product">
					<div class="cart-title">상품 선택</div>
					<div class="cart-detail">
						<select>
							<option>땅콩잼</option>
							<option>딸기잼</option>
							<option>카야잼</option>
						</select>
					</div>
				</div>
				<div class="cart" name="cart-opt">
					<div class="cart-title">상품 옵션</div>
					<div class="cart-detail">
						<select>
							<option>300g</option>
							<option>500g</option>
							<option>1kg</option>
						</select>
					</div>
				</div>
				<div class="cart" name="cart-amount">
					<div class="cart-title">수량</div>
					<div class="cart-pick">땅콩잼/300g</div>
					<div>
						<div>
							<button class="amountB"><span class="material-symbols-rounded">remove</span></button>
							<span>1</span>
							<button class="amountB"><span class="material-symbols-rounded">add</span></button>
							<span>10,000</span>
							<span><button>X</button></span>      	
						</div>
					</div>
				</div>
				<div class="cart" name="cart-total"><span>총 금액</span><span>10,000원</span></div>
				<div class="cart" name="cart-dona"><span>사회 환원금(결제금액 5%)</span><span>5,000원</span></div>
				<div class="cart" name="btn">
					<div><button class="btn bc1">구매하기</button></div>
					<div><button class="btn bc3">문의하기</button></div>
				</div>
			</div>
			
		</div>
		<div id="view-foot">
			<div class="view-qna">
				<form action="/insertComment.do" method="post">
						
				</form>
			</div>
			<div class="view-empty"></div>
		</div>
		

	</div>

	
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>

	</script>
</body>
</html>