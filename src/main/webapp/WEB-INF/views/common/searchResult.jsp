<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
	.content-wrap{
		width: 50%;
		display: flex;
		padding: 50px;
		box-sizing: border-box;
	}
	.content-img{
		height: 100px;
		width: 100px;
	}
	.content-img>img{
		width: 100%; height: 100%;
		object-fit: cover;
	}
	.content-info{
		flex-grow: 1;
		padding-left: 20px;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
	}
	.content-info>span{
		text-align: right;
	}
	.info-title{
		font-size: 1.1em;
	}
	.info-price{
		text-align: right;
		font-size : 1.2em;
		color:  rgb(255,130,171);
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<c:choose>
			<c:when test="${keyword=='' }">
				<div class="page-titleC">전체 검색결과</div>
			</c:when>
			<c:otherwise>
				<div class="page-titleC">${keyword }의 검색결과</div>			
			</c:otherwise>
		</c:choose>
		<c:choose>
			<c:when test="${empty list }">
				<div style="text-align: center; margin-top: 100px;">검색결과가 없습니다!</div>
			</c:when>
			<c:otherwise>
				<div style="display: flex; flex-wrap: wrap; margin-bottom: 150px;">
					<c:forEach items="${list }" var="l" varStatus="i">
						<div class='content-wrap'>
							<input type="hidden" id="projectNo" value="${l.projectNo}">
							<input type="hidden" id="divNo" value="${l.divNo }">
							<div class='content-img'>
								<img src=
									<c:choose>
										<c:when test="${l.divNo eq 1 }"> ""</c:when>
										<c:when test="${l.divNo eq 2 }"> "/resources/upload/donation/${l.projectImg }" </c:when>
										<c:when test="${l.divNo eq 3 }"> "/resources/upload/group/${l.projectImg }" </c:when>
										<c:when test="${l.divNo eq 4 }"> "/resources/upload/auction/${l.projectImg }" </c:when>
									</c:choose>	
								>
							</div>
							<div class="content-info">
								<div class="info-title">
									<c:choose>
										<c:when test="${l.projectEnd=='0' }">
											<span class='badge-pink'>
												<c:choose>
													<c:when test="${l.divNo eq 1 }">펀딩</c:when>
													<c:when test="${l.divNo eq 2 }">기부</c:when>
													<c:when test="${l.divNo eq 3 }">공동구매</c:when>
													<c:when test="${l.divNo eq 4 }">경매</c:when>												
												</c:choose>
											</span>
										</c:when>
										<c:otherwise>
											<span class='badge'>
												<c:choose>
													<c:when test="${l.divNo eq 1 }">펀딩</c:when>
													<c:when test="${l.divNo eq 2 }">기부</c:when>
													<c:when test="${l.divNo eq 3 }">공동구매</c:when>
													<c:when test="${l.divNo eq 4 }">경매</c:when>												
												</c:choose>
											</span>
										</c:otherwise>
									</c:choose>
									${l.projectName }							
								</div>
								<c:choose>
									<c:when test="${l.projectEnd=='0' }">
										<span>프로젝트 마감</span>									
									</c:when>
									<c:otherwise>
										<span>~ ${l.projectEnd }</span>
									</c:otherwise>
								</c:choose>					
								<div class="info-price">
									모금액 ${l.projectPrice }
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</c:otherwise>
		</c:choose>
		
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
	<script type="text/javascript">
		$(".content-wrap").on("click",function(){
			const projectNo = $(this).children("input#projectNo").val();
			const divNo = $(this).children("input#divNo").val();

			if(divNo==1){
				location.href= "/fundingDetailStory.kh?fundingNo="+projectNo;
			}else if(divNo==2){
				location.href= "/donationClick.kh?projectNo="+projectNo;
			}else if(divNo==3){
				location.href= "/groupView.kh?projectNo="+projectNo;
			}else if(divNo==4){
				location.href= "/auctionView.kh?projectNo="+projectNo;
			}
		})
	</script>
</body>
</html>