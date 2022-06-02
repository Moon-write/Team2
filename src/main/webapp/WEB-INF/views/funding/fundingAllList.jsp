<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩리스트</title>
<style>

	.photoWriteBtn{
		float:right; 
		}
	.page-title{
		margin-top : 50px;
	}
	.product-simple{
		overflow : hidden;
/* 		border : 3px solid red; */
		margin-top :20px;
	}
	.product-simple-detail{
		/* border : 3px solid black; */
	 	float : left; 
	 	padding : 20px;
	 	padding-bottom : 20px;
	 	width : 400px;
		box-sizing: border-box;
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
	.text-box>div>span:nth-child(1){
		font-size:13px;
		color: rgba(75, 75, 75, 0.5);
	
	}
	.text-box>div:nth-child(2)>span{
		font-size:15px;
		color: #424242;
	}
	.text-box>div:nth-child(3)>span{
		color: rgb(30,144,255);
	    font-size: 19px;
	    font-family: ns-medium;
	}
	.text-box>div:nth-child(3)>span:nth-child(2){
		font-size: 23px;
    	font-family: ns-medium;
    	color : #424242;
    	margin-left : 3px;
	}
	.text-box>div:nth-child(4)>span{
		font-size: 13px;
		font-weight:300;
		margin-left : 1px;

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
			</tr>
		</c:forEach>
	</table>

	
	<div class="page-content">
		<div class="page-title"><a href="/foodList.do?reqPage=1">그냥링크임</a>	<a href="/fundingInsert.kh">상품등록으로 이동</a></div>
			<div class="product-simple">
						<c:forEach items="${list }" var="fjf">
							<a href="/fundingDetailStory.kh?fundingNo=${fjf.fundingNo }">
								<div class="product-simple-detail">
									<div class="img-box">								
										<img src="/resources/upload/funding/${fjf.fundingFilePath}">
									</div>
									<div class="text-box">
										<div><span>${fjf.memberNo}회사명</span></div>	
										<div><span>${fjf.fundingName}</span></div>
										<c:choose>
											<c:when test="${fjf.fundingSumRate gt 100 }">
												<div class="bar-back"><div class="bar" style="width:100%;"></div></div>
											</c:when>
											<c:otherwise>
												<div class="bar-back"><div class="bar" style="width: ${fjf.fundingSumRate}%;"></div></div>
											</c:otherwise>
										</c:choose>		
										<div><span>${fjf.fundingSumRate}%</span><span>${fjf.fundingCurrentSum}</span></div>	
										<div><span>${fjf.fundingDeadline}일 남음</span></div>						
									</div>
								</div>
							</a>
						</c:forEach>
					</div> 
	</div>
		
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>