<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<style>
.shop-content{
	width:700px;
	margin:30px auto;	
}
.shop-pic>img{
	height:350px;
	max-width:700px;
	display: block; 
	margin: 0px auto;
}
.info-detail{
	width:640px;
	margin:0 auto;
	margin-top:30px;
}

.movie-header{
	width:1200px;
	height:300px;
	margin:0 auto;
	display:flex;
}
.tab-wrap{
	width:300px;
	margin: 30px auto;
}
.tabs{
    list-style-type: none;    
    overflow: hidden;
}
.tabs>li{
    float: left;
    width: 100px;
    text-align: center;
    height: 30px;
    line-height: 30px;
    background-color: rgb(30,144,255);
   	color: white;
}
.tabs>li:hover{
    font-size: 1.1em;
    cursor: pointer;
}
.content-wrap{
    margin:0 auto;
}
.tabcontent{
    margin: 0 auto;
    padding: 30px 0px;
    display: none;
    text-align:center;
}
.tabcontent:first-of-type{
    display:block;
}
.tabs>li:first-of-type{
    background-color:#fffbe9;
   	color:white;
}
.posting-wrap {
display: flex;
flex-wrap: wrap;
}

.photoWrapper {
	clear: right;
	margin: 0 auto;
	width:1200px;
}
label {
   cursor: pointer;
   /* Style as you please, it will become the visible UI component. */
}

#upload-photo {
   opacity: 0;
   position: absolute;
   z-index: -1;
}
.input-form2 {
  width: 100%;
  padding: 0.8rem;
  background-color: #fff;
  outline: none;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
tr th, tr td{
	border-bottom:1px solid #ccc;
	width:200px;
	padding:10px;
}
tr th{
	border-right:1px solid #ccc;
}
table{
	border:1px solid #ccc;
	border-collapse: collapse;
	margin:0 auto;
	margin-bottom:30px;
}
.auction-content{
	float:left;
	margin-top:30px;
	width:calc(100%/3 - 20px);
	margin-bottom:30px;
}
.auction-content:first-child{
	margin-left:10px;
}
.auction-content:nth-child(2), .auction-content:last-child{
	margin-left:20px;
}
.auction-content div>img{
	width: 100%; height: 213px;
	object-fit: cover;
	border-radius: 10px;
}
</style>
</head>
<body>
	<div id="memberNo" style="display:none;">${sessionScope.m.memberNo }</div>
	<c:choose>
		<c:when test="${sessionScope.m.memberLevel == 1 }"><%@include file="/WEB-INF/views/common/bizHeader.jsp" %></c:when>
		<c:otherwise><%@include file="/WEB-INF/views/common/header.jsp" %></c:otherwise>
	</c:choose>
	<c:if test="${shop.memberNo==sessionScope.m.memberNo }">
		<div class="page-content">
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
			<div class="shop-content">
			
				<div class="shop-pic" style="text-align: center;">
					<c:if test="${fn:length(shop.fileList) eq 0 }">
						<img class="mySlides" src="/resources/img/logo/WNYlogo1.png">
					</c:if>
					<c:if test="${fn:length(shop.fileList) gt 0 }">
						<c:forEach var="sp" items="${shop.fileList }">												
								<img class="mySlides" src="/resources/upload/shopPic/${sp.shopFilepath}">												
						</c:forEach>	
					</c:if>																						
				</div>
				
				<div style="text-align:center; margin-top:10px;">
					<button class="btn bc3 size1">
						<a href="/managePic.kh?memberNo=${sessionScope.m.memberNo }" style="color:white;">배경사진 관리</a>
					</button>
				</div>	
							
				<div class="info-detail">
					<h1>${shop.shopName}</h1>
					<c:forEach var="c" items="${category }">
						<input type="checkbox" class="chk" style="height:14px;">
						<input type="hidden" name="shopCategoryNo" value="${c.shopCategoryNo }">
						<span style="background-color:rgb(30,144,255); font-size:15px;color:white; padding-left:4px;padding-right:4px;margin-left:-15px;margin-right:10px;">${c.category }</span>
					</c:forEach>
				<div>				
					<c:if test="${fn:length(category) lt 5 }">
						<span><button class="btn bc3 modal-open-btn editCategory" style="margin-top:5px;" target="#test-modal">카테고리 추가</button></span>
					</c:if>					
					<span><button class="btn bc3 deleteCategory" style="margin-top:5px;">카테고리 삭제</button></span>
				</div>					
					<form action="/editIntro.kh" method="post">
						<div style="margin-top:30px;height:100px;">
							<input type="text" name="shopIntro" value="${shop.shopIntro }" style="width:580px;height:80px;">
							<input type="hidden" name="shopNo" value="${shop.shopNo }">
							<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
							<span><button class="btn bc3" style="margin-top:5px;">자기소개 수정</button></span>
						</div>
					</form>
					<div style="margin-top:40px;">								
						<c:choose>
							<c:when test="${100000000<=shop.grossIncome and shop.grossIncome <100000000000}">
								<fmt:parseNumber var="grossIncome" value="${shop.grossIncome/100000000}" integerOnly="true" />
								<span>누적금액 </span>${grossIncome}<span>억원 ↑</span>
							</c:when>
							<c:when test="${10000<=shop.grossIncome and shop.grossIncome <100000000}">
								<fmt:parseNumber var="grossIncome" value="${shop.grossIncome/10000}" integerOnly="true" />
								<span>누적금액 </span>${grossIncome}<span>만원 ↑</span>
							</c:when>
							<c:when test="${shop.grossIncome <10000}">
								<span>누적금액 </span>${shop.grossIncome}<span>원</span>
							</c:when>
						</c:choose>
					</div>
					<br><br><br><br>
				</div>				
			</div>			
		</div>
	</c:if>
		
		
		<!-- 모달 -->
		<div id="test-modal" class="modal-bg">
	      <div class="modal-wrap">
	        <div class="modal-head">
	          <h2>카테고리 입력</h2>
	          <span class="material-icons close-icon modal-close">close</span>
	        </div>
	        
	        <div class="modal-content">
	        	<div style="padding-bottom:50px;margin-top:-20px;"><button class="btn bc1 addInput" style="float:right;">카테고리 추가</button></div>
	        	<div class="input-box">	
	        		<c:forEach var="c" items="${category }">
	        			<input type="hidden" name="category" class="input-form2" placeholder="카테고리 입력" style="width:80%;" value="${c.category }">						
					</c:forEach>	        						
					<input type="text" name="category" class="input-form2 category" placeholder="카테고리 입력" style="width:80%;">
					<button class="btn bc1 deleteInput" style="float:right;padding: 0.8rem;">삭제</button>
				</div>
			</div>
			
	        <div class="modal-foot">
	          <button class="btn bc1 insertCategory">등록</button>
	          <button class="btn bc11 modal-close">취소</button>
	        </div>
	      </div>
	    </div>
		<script>
			const memberNo=$("#memberNo").text();
			$(function(){
			    const tabs=$(".tabs>li");
			    tabs.on("click",function(){
			    	tabs.css("color", "white").css("backgroundColor","rgb(30,144,255)");
			        $(this).css("color","white").css("backgroundColor","rgba(24, 116, 205, 1)");
			        const content=$(".tabcontent");
			        content.hide();
			        const index=tabs.index(this);
			        content.eq(index).show();
			    })
			    tabs.first().click();
			})
			var slideIndex = 0;
			carousel();
			
			function carousel() {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";
			  }
			  slideIndex++;
			  if (slideIndex > x.length) {slideIndex = 1}
			  x[slideIndex-1].style.display = "block";
			  setTimeout(carousel, 2000); // Change image every 2 seconds
			}
			$(function () {
			  $(document).on("click", ".modal-open-btn", function () {
			    $($(this).attr("target")).css("display", "flex");
			  });
			  $(document).on("click", ".modal-close", function () {
			    $(this).parents(".modal-wrap").parent().css("display", "none");
			  });  
			  $(".sub-navi").prev().after("<span class='material-icons dropdown'>expand_more</span>");
			});
			$(".deleteCategory").on("click",function(){
				const check=$(".chk:checked");
				if(check.length==0){
					alert("선택된 카테고리가 없습니다.");
					return;
				}
				const categories=new Array();
				check.each(function(index,item){
					categories.push($(item).next().val());
				});
				location.href="/deleteCategory.kh?memberNo="+memberNo+"&categories="+categories.join("/");
			});
			let length=$("input[name=category]").length;
			$(".addInput").on("click", function(){
				const category=$("<div class=\"input-box\"><input type=\"text\" name=\"category\" class=\"input-form2 category\" placeholder=\"카테고리 입력\" style=\"width:80%;\"><button class=\"btn bc1 deleteInput\" style=\"float:right;padding: 0.8rem;\">삭제</button></div>");
				const modalContent=$(".modal-content");						
				if(length<5){
					modalContent.append(category);
					length++;
				}else{
					alert("최대 5개까지 추가할 수 있습니다.");
				}
			});
			$(document).on("click", ".deleteInput", function() {
				$(this).parent().remove();
				$(this).prev().remove();
				$(this).remove();
				length--;
			});
			$(".insertCategory").on("click", function(){
				const shopNo=$("input[name=shopNo]").val();
				const category=$(".category");
				for(let i=0;i<category.length;i++){
					if(category.eq(i).val().length==0){
						alert("카테고리 이름을 입력하십시오.");
						return;
					}else if(category.eq(i).val().length>6){
						alert("6글자 이하로 입력하십시오.");
						return;
					}
				}
				const categories=new Array();
				category.each(function(index,item){
					categories.push($(item).val());
				});
				location.href="/insertCategory.kh?memberNo="+memberNo+"&shopNo="+shopNo+"&categories="+categories.join("/");
			});
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>