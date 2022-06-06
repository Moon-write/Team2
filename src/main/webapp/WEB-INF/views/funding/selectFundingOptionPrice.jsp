<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩옵션가격선택</title>
<style>
	.main{
		width: 1200px;
		height: 1200px;/*나중에 삭제*/
		margin: 0 auto;
		background-color: aqua;/*나중에 삭제*/
	}
	.option-price-select{
		width: 100%;
		background-color: brown;
		padding: 30px 0;
	}
	.option-price-select{
		overflow: hidden;
	}
	.check-box-wrap{
		float: left;
		width: 15%;
		height: 150px;
		background-color: crimson;
	}
	
	.funding-content{
		float: left;
		width: 85%;
		height: 150px;
		background-color: darkkhaki;
	}
	.funding-Name-price{
		margin: 0 auto;
	}
	.submit-wrap{
		margin: 0 auto;
	}
</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>

	<table border="1">
		<tr>
			<th>펀딩옵션프라이스번호</th>
			<th>펀딩옵션리스트</th>
			<th>펀딩옵션가격</th>
			<th>펀딩번호</th>
			<th>펀딩이름</th>
			<th>멤버이름</th>
		</tr>
		<c:forEach items="${list }" var="sfop" >
			<tr>
				<td>${sfop.fundingOptionPriceNo }</td>
				<td>${sfop.fundingOptionList}</td>
				<td>${sfop.fundingOptionPrice}</td>
				<td>${sfop.fundingNo}</td>
				<td>${f.fundingName }</td>
				<td>${f.memberNo }</td>		
			</tr>
		</c:forEach>
	</table>
	
	


	<div class="main">
		<div>리워드 선택</div>
		<div><span>리워드 선택 펀딩해주시는금액에 따라 감사해서 리워드제공</span><span>! 펀딩하기는 쇼핑하기아닙니다</span></div>
		<c:forEach items="${list}" var="sfop" varStatus="i">
		<div class="option-price-select">

			<div class="check-box-wrap">
				<input type="checkbox" class="check-box">
			</div>
			<div class="funding-content">
				<div>${sfop.fundingOptionPrice}원 펀딩합니다</div>
				<div>${sfop.fundingOptionList}</div>
				<div>배송비 무료</div>
				<!--
				<div>
					<button class="amountB amount-decrease"><span class="material-symbols-rounded">remove</span></button>
					<span class="amount-num"><input name="amount-num" value="0"></span>
					<button class="amountB amount-increase"><span class="material-symbols-rounded">add</span></button>
				</div>
			-->
			</div>
		</div>
		</c:forEach>
		<div class="funding-Name-price"><span>${f.fundingName } 에 (개수*가격의 합)원 펀딩합니다</span></div>
		<div class="submit-wrap">
			<input type="submit" class="btn bc1 funding-btn"  value="다음 단계로 >">
		</div>
	</div>
			

	
	<div></div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script>
		/*
		$(function(){
			$(".amount-increase:nth-child(1)").on("click",function(){
				let amountNum =$(".amount-num:nth-child(1)").text();
				console.log(amountNum);
				let amountNumP = parseInt(amountNum);
				console.log(amountNumP);
				amountNumP++;
				$(".amount-num:nth-child(1)").text(amountNumP);

			});
		});
		*/
		$(function(){
			$(".check-box").on("click",function(){
				if($(this).prop("checked")){
					
					
					console.log($(this).parent().next().children().eq(2).text());
				let fundingContent = $(this).parent().next();
				let fundingContentDiv = $("<div>").attr("class","addAmount");
				let amountDecrease = $("<button>").attr("class","amountB amount-decrease");
				let materialSymbolsRounded1 = $("<span>").attr("class","material-symbols-rounded").append("add");
				let amountNumSpan=$("<span>").attr("class","amount-num");
				let amountNumInput=$("<input>").attr("name","amountNum").attr("value","0");	
				let amountIncrease = $("<button>").attr("class","amountB amount-increase");
				let materialSymbolsRounded2 =$("<span>").attr("class","material-symbols-rounded").append("remove");

					amountDecrease.append(materialSymbolsRounded1);
					amountNumSpan.append(amountNumInput);
					amountIncrease.append(materialSymbolsRounded2);
					fundingContentDiv.append(amountIncrease).append(amountNumSpan).append(amountDecrease);
					fundingContent.append(fundingContentDiv);
				}else{
					$(this).parent().next().children().eq(3).remove();
				}
			});
		});

	</script>
    <style>
		.check-box-wrap{
			text-align: center;
			line-height: 150px;
		}
		.check-box-wrap>input{
			text-align: center;
			margin:0;
			width: 25px;
			height: 25px;
		}
		.submit-wrap{
			width: 220px;
			height: 45px;
		}
	[name=amountNum]{
			width: 50px;
			text-align: center;
		}
	</style>

   
</body>
</html>