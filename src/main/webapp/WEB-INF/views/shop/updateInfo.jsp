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
	margin:0 auto;	
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
   width: 800px;
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
	width:1200px;
    margin:0 auto;
}
.tabcontent{
    width: 95%;
    margin: 0 auto;
    padding: 30px 0px;
    display: none;
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
</style>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.m.memberLevel == 1 }"><%@include file="/WEB-INF/views/common/bizHeader.jsp" %></c:when>
		<c:otherwise><%@include file="/WEB-INF/views/common/header.jsp" %></c:otherwise>
	</c:choose>
		<div class="page-content">
		
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
				</div>
				
				<div class="tab-wrap">
			        <ul class="tabs">
			            <li>프로젝트</li>
			            <li>리뷰</li>
			            <li>사업자 정보</li>
			        </ul>
			    </div>
			    
			    <div class="content-wrap">
		            <div class="tabcontent" id="html">         
		                <strong>지금껏 본 적 없는 마블의 극한 상상력!<br>
						5월, 광기의 멀티버스가 깨어난다!</strong>
						<br><br> 
						<p>끝없이 균열되는 차원과 뒤엉킨 시공간의 멀티버스가 열리며<br>
						오랜 동료들, 그리고 차원을 넘어 들어온 새로운 존재들을 맞닥뜨리게 된 ‘닥터 스트레인지’.<br>
						대혼돈 속, 그는 예상치 못한 극한의 적과 맞서 싸워야만 하는데….</p>
		            </div>
		            <div class="tabcontent" id="css">            
			            <div class="photoWrapper posting-wrap">
							<c:forEach items="${mv.fileList }" var="f">
								<div style="box-sizing: border-box; width: calc(100%/ 3); padding: 20px;">
									<div>
										<img src="/resources/upload/stillcut/${f.filepath}" style="height: 300px;">
									</div>
								</div>
							</c:forEach>
						</div>
		            </div>
		            <div class="tabcontent" id="javascript">
		                <div style="float:left;">
		                	<div>상호명</div>
		                	<div>주요제품</div>
		                	<div>설립일</div>
		                	<div>주소</div>
		                	<div>전화번호</div>
		                	<div>이메일</div>
		                	<div>사업자등록번호</div>
		                </div>
		                <div style="float:left; margin-left:40px;">
		                	<div>${shop.shopName }</div>
		                	<c:set var="comma" value=","/>
		                	<div>
			                	<c:if test="${empty category }">
			                		없음
			                	</c:if>
			                	<c:if test="${!empty category }">
			                		<c:forEach var="c" items="${category }" varStatus="status">
			                		<c:if test="${!status.last}">
										<span>${c.category }${comma} </span>									
									</c:if>
									<c:if test="${status.last}">
										<span>${c.category }</span>
									</c:if>										
									</c:forEach>
			                	</c:if>		                			                		
							</div>
		                	<div>
		                		<c:if test="${empty shop.shopBirth }">
			                		없음
			                	</c:if>
		                	</div>
		                	<div>주소</div>
		                	<div>전화번호</div>
		                	<div>이메일</div>
		                	<div>사업자등록번호</div>
		                </div>
		            </div>			            
		        </div>
			</div>			
		</div>
		
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
					<input type="text" name="category" id="category" class="input-form2" placeholder="카테고리 입력" style="width:80%;">
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
				location.href="/deleteCategory.kh?categories="+categories.join("/");
			});
			let length=$("input[name=category]").length;
			$(".addInput").on("click", function(){
				const category=$("<div class=\"input-box\"><input type=\"text\" name=\"category\" id=\"category\" class=\"input-form2\" placeholder=\"카테고리 입력\" style=\"width:80%;\"><button class=\"btn bc1 deleteInput\" style=\"float:right;padding: 0.8rem;\">삭제</button></div>");
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
				const category=$("div #category");
				if(category.val().length==0){
					alert("카테고리 이름을 입력하십시오.");
					return;
				}
				const categories=new Array();
				category.each(function(index,item){
					categories.push($(item).val());
				});
				location.href="/insertCategory.kh?shopNo="+shopNo+"&categories="+categories.join("/");
			});
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>