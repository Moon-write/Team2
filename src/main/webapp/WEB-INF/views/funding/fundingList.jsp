<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩리스트</title>
<style>
	.banner{
		width: 100%;
		height: 300px;
		background-image: url("/resources/upload/funding/3311.jpg");
		background-position: center center;
		background-size: 100% auto;
	}
	.funding-category{
		margin-top: 60px;
		margin-bottom: 60px;
		display: flex;
		justify-content:space-evenly; 
	}
	.sq{
		width: 150px;
		height: 150px;
		
	}
	.sq:last-child{
		text-align: center;
	}
	.tech{
	background-color:#86efef;
	width:100px;
	height:100px;
	border-radius:50px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:100px;
	background-image: url("https://static.wadiz.kr/assets/reward-category/reward_banner_thumb/reward_banner_thumb_287.jpg");
}
.fashion{
	background-color:#86efef;
	width:100px;
	height:100px;
	border-radius:50px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:100px;
	background-image: url("https://static.wadiz.kr/assets/reward-category/reward_banner_thumb/reward_banner_thumb_288.jpg");
}
.home{
	background-color:#86efef;
	width:100px;
	height:100px;
	border-radius:50px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:100px;
	background-image: url("https://static.wadiz.kr/assets/reward-category/reward_banner_thumb/reward_banner_thumb_310.jpg");
}
.food{
	background-color:#86efef;
	width:100px;
	height:100px;
	border-radius:50px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:100px;
	background-image: url("https://static.wadiz.kr/assets/reward-category/reward_banner_thumb/reward_banner_thumb_289.jpg");
}
.beauty{
	background-color:#86efef;
	width:100px;
	height:100px;
	border-radius:50px;
	text-align:center;
	margin:0 auto;
	font-size:12px;
	vertical-align:middle;
	line-height:100px;
	background-image: url("https://static.wadiz.kr/assets/reward-category/reward_banner_thumb/reward_banner_thumb_311.jpg");
}


	.photoWriteBtn{
		float:right; 
	}
	.funding-simple{
		overflow : hidden;
/* 		border : 3px solid red; */
		margin-top :20px;
	}
	.funding-simple-detail{
		/* border : 3px solid black; */
	 	float : left; 
	 	padding : 20px;
	 	padding-bottom : 20px;
	 	width : 400px;
		box-sizing: border-box;
		margin-bottom : 30px;
	}
	
	.img-box{
		width :360px;
		height : 252.5px;
		/* border : 2px solid blue; */
		box-sizing: border-box;
		overflow: hidden;
		border-radius : 15px;
	}
	.img-box>img{
		width : 100%;
		height : 100%;
		border-radius : 15px;
		transition-duration: 0.3s
	}

	/*4 17 3:11 추가*/
	span{
		font-family: ns-bold,맑은고딕;
	}
	.img-box>img:hover{
		transform: scale(1.1,1.1);   
	}
	.text-box{
		margin-top: 15px;
	}
	.text-box>div>span:nth-of-type(1){
		font-size:19px;
		color: #424242;
		
	}
	.text-box>div:nth-of-type(2){
		margin-bottom: 8px;
	}
	.text-box>div:nth-of-type(2)>span{
		font-size:15px;
		color: rgba(75, 75, 75, 0.5);
		
	}
	.text-box>div:nth-of-type(3)>span{
		color: rgb(30,144,255);
	    font-size: 19px;
	    font-family: ns-medium;
	}
	.text-box>div:nth-of-type(3)>span:nth-of-type(2){
		font-size: 23px;
    	font-family: ns-medium;
    	color : #424242;
    	margin-left : 3px;
	}
	.text-box>div:nth-of-type(4)>span:nth-of-type(1){
		font-size: 18px;
		font-weight:300;
		
		color : rgb(30,144,255);

	}
	.text-box>div:nth-of-type(4)>span:nth-of-type(2){
		font-size: 18px;
		font-weight:300;
		margin-left : 5px;
		color: rgba(75, 75, 75, 0.5);

	}
	.bar-back{
		position:relative;
		height:4px;
		background-color:#e6eaed;
	}
	.bar{
		position:absolute;
		height:4px;
		background-color:rgb(30,144,255);
	}
	.sq>div:nth-of-type(2){
		margin-top: 8px;
		color: #424242;
	}
	.selected-search{

		overflow: hidden;
		display: flex;
		justify-content: flex-end;
		height: 70px;
		margin-bottom: 20px;
		border-bottom: 1px solid rgba(75, 75, 75, 0.2);
	}
	#searchBtn{
		
		height: 45px;
	}
	#listSearch{
		width: 200px;
		
		height: 45px;
	}
	#select-inquire{
		width: 150px;
		height: 45px;
		margin-right: 35px;
		padding : 8px;
		
	}
	#precaution{
		margin-top : 5px;
	}
	
	
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>카테고리</th>
			<th>시작날짜</th>
			<th>끝난날짜</th>
			<th>목표금액</th>
			<th>현재모인금액</th>
			<th>달성률</th>
			<th>멤버넘버</th>
			<th>파일패스</th>
			<th>마감날짜</th>
			<th>회사명</th>
		</tr>
		<c:forEach items="${list }" var="fjf">
			<tr>
				<td>${fjf.fundingNo }</td>
				<td>${fjf.fundingName}</td>
				<td>${fjf.fundingCategory}</td>
				<td>${fjf.fundingStartDate}</td>
				<td>${fjf.fundingEndDate}</td>
				<td>${fjf.fundingSum}</td>
				<td>${fjf.fundingCurrentSum}</td>
				<td>${fjf.fundingSumRate}</td>
				<td>${fjf.memberNo}</td>
				<td>${fjf.fundingFilePath}</td>
				<td>${fjf.fundingDeadline}</td>	
				<td>${fjf.bizName }		
			</tr>
		</c:forEach>
	</table>
	<!------------------------------------------------------------------------------------------>	
	<div class="banner"></div>



	<div class="page-content">
		<div class="funding-category">
			<a href="/fundingList.kh?selectedInquire=1&fundingCategory=테크가전">
			<div class="sq">
				<div class="tech"></div>
				<div><h3>테크·가전</h3></div>
			</div>
			</a>
			<a href="/fundingList.kh?selectedInquire=1&fundingCategory=패션잡화">
				<div class="sq">
					<div class="fashion"></div>
					<div><h3>패션·잡화</h3></div>
				</div>
			</a>
			<a href="/fundingList.kh?selectedInquire=1&fundingCategory=홈리빙">
				<div class="sq">
					<div class="home"></div>
					<div><h3>홈·리빙</h3></div>
				</div>
			</a>
			<a href="/fundingList.kh?selectedInquire=1&fundingCategory=식품">
				<div class="sq">
					<div class="food"></div>
					<div><h3>식품</h3></div>
				</div>
			</a>
			<a href="/fundingList.kh?selectedInquire=1&fundingCategory=뷰티">
				<div class="sq">
					<div class="beauty"></div>
					<div><h3>뷰티</h3></div>
				</div>
			</a>
		</div>
			<div class="funding-simple">
				<h2>진행중인 펀딩</h2>
				<br>
				<div class=selected-search>
					<select id="select-inquire" name="selectedInquire" class="input-form">
						<option value="1" <c:if test='${selectedInquire eq 1}'>selected="selected"</c:if>>최근등록순</option>
						<option value="2" <c:if test='${selectedInquire eq 2}'>selected="selected"</c:if>>마감임박순</option>
						<option value="3" <c:if test='${selectedInquire eq 3}'>selected="selected"</c:if>>좋아요순</option>
						<option value="4" <c:if test='${selectedInquire eq 4}'>selected="selected"</c:if>>조회수순</option>
					</select>
					<input type="text" id="listSearch" name="searchKeyword" class="input-form"
						<c:choose>
							<c:when test='${empty keyword}'>
								placeholder="상품명 입력"
							</c:when>
							<c:otherwise>
								value="${keyword}"
							</c:otherwise>
						</c:choose>
						>
						<button class="btn bc11" id="searchBtn"><span class="material-symbols-outlined" >search</span></button>
				</div>
						<c:forEach items="${list }" var="fjf">
							<a href="/fundingDetailStory.kh?fundingNo=${fjf.fundingNo }">
								<div class="funding-simple-detail">
									<div class="img-box">								
										<img src="/resources/upload/funding/${fjf.fundingFilePath}">
									</div>
									<div class="text-box">
										<div><span>${fjf.fundingName}</span></div>
										<div><span>${fjf.fundingCategory} | ${fjf.bizName }</span></div>	
										<c:choose>
											<c:when test="${fjf.fundingSumRate gt 100 }">
												<div class="bar-back"><div class="bar" style="width:100%;"></div></div>
											</c:when>
											<c:otherwise>
												<div class="bar-back"><div class="bar" style="width: ${fjf.fundingSumRate}%;"></div></div>
											</c:otherwise>
										</c:choose>		
										<div><span>${fjf.fundingSumRate}%</span><span>${fjf.fundingCurrentSum}원</span></div>	
										<div><span>종료 ${fjf.fundingDeadline}일 남음</span><c:if test="${fjf.fundingDeadline lt 1}"><span class="badge-pink badge-pinkk">오늘마감</span></c:if></div>
										<!--<div><a href="/fundingUpdateFrm.kh?fundingNo=${fjf.fundingNo }&&memberNo=${fjf.memberNo }">수정하기Test</a></div>-->						
									</div>
								</div>
							</a>
						</c:forEach>
					</div> 
					
	</div>
		<script>
		$(function(){
			$("select#select-inquire").on("change",function(){
				keywordLink();
				alert("${categoryParameter}");
			});
			/* $("button#searchBtn").on("click",function(){
				keywordLink();
			})  */
			
			function keywordLink(){
				//location.href = "/fundingAllList.kh?searchKeyword="+$("input#listSearch").val()+"&&selectedInquire="+$("select#select-inquire").val()+"";
				//location.href = "/fundingListTech.kh?selectedInquire="+$("select#select-inquire").val()+"&fundingCategory="+${categoryParameter}+"";
				  location.href = "/fundingList.kh?selectedInquire="+$("select#select-inquire").val()+"&fundingCategory=${categoryParameter}";
			}
			

		});
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
<style>
	.badge-pinkk{

			float:right;
	}
</style>
</html>