<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.shop-content{
	width:700px;
	margin:0 auto;	
}
.shop-pic>img{
	height:350px;
	background-size:contain;
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header_.jsp" %>
		<div class="page-content">
			<div class="shop-content">
				<div class="shop-pic">
					<c:forEach var="sp" items="${shop.fileList }">												
						<img src="/resources/upload/shopPic/${sp.shopFilepath}">												
					</c:forEach>									
				</div>
				<div class="info-detail">
					<h1>${shop.shopName}</h1>
					<c:forEach var="c" items="${category }">
						<span style="background-color:rgb(30,144,255); font-size:15px;color:white; padding-left:4px;padding-right:4px;">${c.category }</span>
					</c:forEach>
					<div style="margin-top:30px;height:100px;">${shop.shopIntro }</div>
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
		                		<c:forEach var="c" items="${category }" varStatus="status">
		                		<c:if test="${!status.last}">
									<span>${c.category }${comma} </span>									
								</c:if>
								<c:if test="${status.last}">
									<span>${c.category }</span>
								</c:if>										
								</c:forEach>
							</div>
		                	<div>${shop.shopBirth }</div>
		                	<div>주소</div>
		                	<div>전화번호</div>
		                	<div>이메일</div>
		                	<div>사업자등록번호</div>
		                </div>
		            </div>			            
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
		</script>
	<%@include file="/WEB-INF/views/common/footer_.jsp"%>
</body>
</html>