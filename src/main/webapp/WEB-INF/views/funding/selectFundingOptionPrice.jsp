<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩옵션가격선택</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<style>

.material-symbols-outlined {/*경고표시*/
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}

	.main{
		width: 1200px;
		margin: 0 auto;
		margin-top: 40px;
		/*나중에 삭제*/
		
	}
	.option-price-select{
		width: 100%;
		padding: 30px 0;
		overflow: hidden;
		background-color: rgba(30,144,255,0.2);
		border: 2px solid rgba(30,144,255,0.15);
		border-radius: 5px;
		margin-bottom: 15px;
		padding-left: 130px;
		height: 240px;

	}
	.check-box-wrap{
		float: left;
		width: 15%;
		height: 150px;
		
	}
	.funding-content{
		float: left;
		width: 85%;
		height: 150px;
		
	}
	.funding-content>div:nth-of-type(1){
		margin-bottom: 5px;
		color: #686868;
	}
	.funding-content>div:nth-of-type(1)>span:nth-of-type(1){
		font-size: 22px;
	}
	.funding-content>div:nth-of-type(1)>span:nth-of-type(2){
		
		margin-left: 5px;
	}
	.funding-content>div:nth-of-type(2){
		margin-bottom: 5px;
		color: #686868;
	}
	.funding-content>div:nth-of-type(3){
		margin-bottom: 5px;
		color: #686868;
	}
	.funding-Name-price{
		margin: 60px auto;
		font-size: 24px;
		
	}
	.total-name-price{
		color : rgba(30,144,255,0.8);
	}
	.submit-wrap{
		margin: 0 auto;
	}
	.divPrice{
		margin-top: 10px;
	}
	.divPrice>span{
		font-size: 22px;
		font-weight: bold;
		color : rgba(30,144,255,0.8);
	}
	
	.select-buy-wrap{
		background-color: red;
		display: hidden;
		margin-left:420px;
		
		
	}
	.reward-select{
	background-color:rgb(30,144,255);
	width:120px;
	height:120px;
	border-radius:60px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:120px;
	color: white;
	font-size: 20px;
	float: left;
	margin-bottom: 30px;
	}
	.dotted-line{
		width: 120px;
		height: 60px;
		box-sizing: border-box;
		border-bottom: 2px dotted #686868;
		float: left;
	}
	.dotted-circle{
	width:120px;
	height:120px;
	border: 2px dotted #686868;
	border-radius:60px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:120px;
	font-size: 20px;
	float: left;
	
	}
	.precaution{
		margin: 10px 0;

	}
	.precaution>span:nth-of-type(1){
		font-weight: 700;
		font-size: 20px;
		margin-right: 10px;
	}
	.precaution>span:nth-of-type(3){
		line-height: 30px;
		float: right;
		color: rgb(30,144,255);
	}
	.precaution>span:nth-of-type(4){
		font-size: 20px;
		float: right;
		margin-top: 5px;
		color: rgb(30,144,255);
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
	
	
	<form action="/fundingOrder.kh" method="post">
	<div class="hidden-data">
		<input type="hidden" name="fundingName" value="${f.fundingName }">
		<input type="hidden" name="fundingNo" value="${list[0].fundingNo}">
		<input type="hidden" name="memberNo" value="${f.memberNo }">
	</div>
		<div class="main">
		<div class="precaution"><span>리워드 선택</span><span>펀딩해주시는금액에 따라 감사의 의미로 리워드를 제공해 드립니다.</span><span><u> 펀딩하기는 쇼핑하기가 아닙니다</u></span><span class="material-symbols-outlined">error</span></div>
		<div class="select-buy-wrap">
			<div class="reward-select"><span>리워드 선택</span></div>
			<div class="dotted-line"></div>
			<div class="dotted-circle"><span>결제</span></div>
		</div>
		<div>
			
		<c:forEach items="${list}" var="sfop" varStatus="i">
		<div class="option-price-select">


			<div class="funding-content">
				<div><span>${sfop.fundingOptionPrice}</span><span>원 입니다</span></div>
				<div><span>옵션 : </span><span>${sfop.fundingOptionList}</span></div>
				<div><span>배송비 무료 | 리워드 제공 예상일 : 2022년 펀딩종료일 이후 순차적 배송</span></div>
				
				<div class="addAmount">
					<button class="amountB amount-decrease" type="button"><span class="material-symbols-rounded">remove</span></button>
					<span class="amount-num"><input name="amountNum" value="0" readonly=""></span>
					<button class="amountB amount-increase" type="button"><span class="material-symbols-rounded">add</span></button>
				</div>
				<div class="divPrice">
					<span class="spanPrice">0</span><span class="spanPriceWon"> 원 펀딩합니다.</span>
					<input type="hidden" name="amountNumPrice" value="${sfop.fundingOptionPrice}">
					<input type="hidden" name="optionNameList" value="${sfop.fundingOptionList}">
					<input type="hidden" name="optionPriceNo" value="${sfop.fundingOptionPriceNo }">
					
				</div>
			</div>
		</div>
		</c:forEach>
		<div class="funding-Name-price"><span class="total-name-price">${f.fundingName } </span> 에 <span class="total-price total-name-price">0</span><span> 원 펀딩합니다.</span></div>
		
		<div class="submit-wrap">
			<input type="submit" class="btn bc1 funding-btn"  value="다음 단계로 >">
		</div>
		</form>
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

			$(".amount-increase").each(function (index, item) {
				/*증가할때*/
				
       			let amountNumber =  $(item).prev().children().val();
				const spanPrice = $(item).parent().next().children().eq(0);
				const spanPriceOne = $(item).parent().prev().prev().prev().children().eq(0);
				$(item).on("click" ,function(){
					console.log("+버튼눌렀읍니다");
					amountNumber++;
					$(item).prev().children().attr("value",amountNumber);
					spanPrice.text(spanPriceOne.text()*amountNumber);
					
					let totalPrice = 0;
					for(let i = 0 ; i < $(".spanPrice").length ; i ++){
						console.log("스판프라이스배열값"+i+" : "+$(".spanPrice").eq(i).text());
						totalPrice = totalPrice+Number($(".spanPrice").eq(i).text());
					}
					console.log("토탈가격 : "+totalPrice);
					$(".total-price").text(totalPrice);
					
				});

				/*감소할때*/
				const decrease = $(item).prev().prev();
				let decreaseSpanPrice = decrease.parent().next().children().eq(0);
				let decreaseSpanPriceOne = decrease.parent().prev().prev().prev().children().eq(0);
				
				decrease.on("click" , function(){
					
					console.log("-버튼눌렀읍니다");
						if(amountNumber != 0){
						amountNumber--;
						decrease.next().children().attr("value",amountNumber);
						decreaseSpanPrice.text(decreaseSpanPriceOne.text()*amountNumber);	
							
						let totalPrice = 0;
						for(let i = 0 ; i < $(".spanPrice").length ; i ++){
							console.log("스판프라이스배열값"+i+" : "+$(".spanPrice").eq(i).text());
							totalPrice = totalPrice+Number($(".spanPrice").eq(i).text());
						}
						console.log("토탈가격 : "+totalPrice);
						$(".total-price").text(totalPrice);		
						}else{
							amountNumber=0;
							
						}

				});
		
   			 });

		});
			


		/*
			let amountNumber = $("input[name=amountNum]").val();





			$(".amount-increase").on("click",function(){
					console.log("+버튼눌렀읍니다");
					amountNumber++;
					$(this).prev().children().attr("value",amountNumber);
				});
				$(".amount-decrease").on("click",function(){
					console.log("-버튼눌렀읍니다");
					if(amountNumber != 0){
					amountNumber--;
					$(this).next().children().attr("value",amountNumber);					
					}else{
						amountNumber=0;
					}
				});

		});
		*/
		/*
		$(function(){
			$(".check-box").on("click",function(){
				
				
				if($(this).prop("checked")){
				$(this).parent().parent().css("background-color","rgba(30,144,255,0.2)");//해당하는 체크박스 클릭시 백그라운드컬러 추가	
					console.log($(this).parent().next().children().eq(2).text());
				let fundingContent = $(this).parent().next();
				let fundingContentDiv = $("<div>").attr("class","addAmount");
				let amountDecrease = $("<button>").attr("class","amountB amount-increase").attr("type","button");
				let materialSymbolsRounded1 = $("<span>").attr("class","material-symbols-rounded").append("add");
				let amountNumSpan=$("<span>").attr("class","amount-num");
				let amountNumInput=$("<input>").attr("name","amountNum").attr("value",amountNumber).prop('readonly', true);
				let amountIncrease = $("<button>").attr("class","amountB amount-decrease").attr("type","button");
				let materialSymbolsRounded2 =$("<span>").attr("class","material-symbols-rounded").append("remove");

					amountDecrease.append(materialSymbolsRounded1);
					amountNumSpan.append(amountNumInput);
					amountIncrease.append(materialSymbolsRounded2);
					fundingContentDiv.append(amountIncrease).append(amountNumSpan).append(amountDecrease);
					fundingContent.append(fundingContentDiv);
				}else{
					if($(this).parent().next().children().eq(4)){//5번째 div 즉 가격이 존재한다면
						$(this).parent().parent().removeAttr("style");//스타일 제거
						$(this).parent().next().children().eq(4).remove();
						$(this).parent().next().children().eq(3).remove();
					}else{
						$(this).parent().parent().removeAttr("style");//스타일 제거
						$(this).parent().next().children().eq(3).remove();
					}
				}
			*/	
			//이게 왜 check-box함수 안에 있어야 할까 
				
				/*
				$("#check-boxer:checked").each(function(){
					$(".amount-increase").on("click",function(){
					console.log($(this).prev().children().val());
					console.log($(this).parent().prev().prev().prev().children().eq(0).text());
					console.log("가격 : "+$(this).prev().children().val()*$(this).parent().prev().prev().prev().children().eq(0).text());
					
					const standard = $(this).parent().parent();
					const price = $(this).prev().children().val()*$(this).parent().prev().prev().prev().children().eq(0).text();
					const optionNameList = $(this).parent().prev().prev().children().eq(1).text();
					const amountNumPrice = $(this).parent().prev().prev().prev().children().eq(0).text();
					const OptionPriceNo = $(this).parent().prev().children().eq(1).val();
					
					const div = $("<div class=\"divPrice\">");
					const span1 = $("<span class=\"spanPrice\">");
					const span2 = $("<span class=\"spanPriceWon\"> 원 펀딩합니다.</span>");
					const inputHidden = $("<input type=\"hidden\" name=\"amountNumPrice\">");
					const inputHiddenOptionNameList = $("<input type=\"hidden\" name=\"optionNameList\">")
					const inputHiddenOptionPriceNo = $("<input type=\"hidden\" name=\"optionPriceNo\">")
					
					$(this).parent().next().remove();
					span1.append(price);
					div.append(span1).append(span2).append(inputHidden.attr("value",amountNumPrice)).append(inputHiddenOptionNameList.attr("value",optionNameList)).append(inputHiddenOptionPriceNo.attr("value",OptionPriceNo));
					standard.append(div);
					
					
					});*/
					/*
					$(".amount-decrease").on("click",function(){
						console.log($(this).next().children().val());
						console.log($(this).parent().prev().prev().prev().children().eq(0).text())
						console.log("가격 : "+$(this).next().children().val()*$(this).parent().prev().prev().prev().children().eq(0).text());
						
						const standard = $(this).parent().parent();
						const price = $(this).next().children().val()*$(this).parent().prev().prev().prev().children().eq(0).text();
						const amountNumPrice = $(this).parent().prev().prev().prev().children().eq(0).text();
						const optionNameList = $(this).parent().prev().prev().children().eq(1).text();
						const OptionPriceNo = $(this).parent().prev().children().eq(1).val();

						const div = $("<div class=\"divPrice\">");
						const span1 = $("<span class=\"spanPrice\">");
						const span2 = $("<span class=\"spanPriceWon\"> 원 펀딩합니다.</span>");
						const inputHidden = $("<input type=\"hidden\" name=\"amountNumPrice\">");
						const inputHiddenOptionNameList = $("<input type=\"hidden\" name=\"optionNameList\">");
						const inputHiddenOptionPriceNo = $("<input type=\"hidden\" name=\"optionPriceNo\">")
						
						$(this).parent().next().remove();
						span1.append(price);
						div.append(span1).append(span2).append(inputHidden.attr("value",amountNumPrice)).append(inputHiddenOptionNameList.attr("value",optionNameList)).append(inputHiddenOptionPriceNo.attr("value",OptionPriceNo));
						standard.append(div);
					});
				});
				*/
				/*
				let chkArray = new Array();//배열 선언
				let priceVal = 0;
				let amountVal = 0;
				$("input:checkbox[name=check-boxer]:checked").each(function(){*/
					/* //alert("check");
					console.log($(this).parent().next().children().children().eq(0).text());//가격
					console.log($(this).parent().next().children().eq(3).children().eq(1).children().val());
					let abc = $(this).parent().next().children().eq(3).children().eq(1).children();
					abc.on("change",function(){
						amountVal=$(this).val();
						console.log(amountVal);
					});
					priceVal = amountVal*$(this).parent().next().children().children().eq(0).text();
					console.log(priceVal); */
					/*const inputVal = $(this).parent().next().children().eq(3).children().eq(1).children()
					inputVal.bind("input", function() {
					    $(this).val(); // get the current value of the input field.
					    alert("change");
					});
					 
				});*/
			
				
				/*
				let ind = 1;
				$(".divPrice").each( function() {
				  $( this ).addClass( "divPrice" + ind );
				  ind = ind + 1;//ind++로 쓸수있음
				});
				*/
				/*배열방식인데안될듯
				let spanPriceArr = new Array();
				let spanPrice = $(".spanPrice").text();
				$.each(spanPrice,function(index,item){
					spanPriceArr.push($(item).total());
					console.log("spanPriceArr : "+spanPriceArr);
				 });
				
				$(".amountB ").on("click",function(){
				
				
				});
			});
	
			

		});//온로드
		*/

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
			height: 60px;
			margin-bottom: 40px;
		}
	[name=amountNum]{
			width: 50px;
			text-align: center;
			outline-color: blue;
		}
	</style>

   
</body>
</html>