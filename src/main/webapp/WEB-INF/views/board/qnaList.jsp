<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/boardMain.css">
<style>
.hr-0{
	color: #ac9e89;
}
.p-0{
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	padding: 45px 0px;
}
.test-modal{
	top: 0px;
	left: 0px;
}
.tbl tr>th:nth-child(1){
	width: 6%;
}
.tbl tr>th:nth-child(2){
	width: 8%;
} 
.tbl tr>th:nth-child(3){
	width: 11%;
}
.tbl tr>th:nth-child(4){
	width: 13%;
}
.tbl tr>th:nth-child(5){
	width: 30%;
}
.tbl tr>th:nth-child(6){
	width: 15%;
}
.tbl tr>th:nth-child(7){
	width: 15%;
}

select{
	float: right;
	margin: 20px 0;
}
.tbl th, .tbl>td {
    padding: 1rem;
    text-align: center;
    
}
#tr-00>*{
	padding: 1rem;
}
#tr-01>*{
	padding: 1.2rem;
}
#pageNavi>*{
	margin-top: 60px;
	margin-bottom: 30px;
}
.content-title{
	background-image: url(/resources/img/board/banner10.jpg);
	background-size: cover;
	background-position: 0% 39%;
    margin-bottom: 30px;
}
.title-txt {
    margin: auto;
    padding: 10px;
    width: 1000px;
    text-align: center;
    font-size: 35px;
    color: white;
    background-color: rgba(39, 39, 39, 0.5);
    animation-name: up;
    animation-duration: 1.5s;
    animation-fill-mode: forwards;
    animation-direction: alternate;
}
select{
	background-color:rgb(30,144,255);
	color:white;border:none;
	font-weight: bold;
	font-size:14px;
}
option{
	background-color:white;
	color:black;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">나의 Q&A</div>
				<div class="content-title">
					<div class="title-txt">내가 쓴 질문을 확인해보세요</div>
				</div>
					<!-- 헤더 테이블 -->
					<table class="tbl">
						<tr class="tr-2">
							<th>번호</th><th>분류</th><th><select onchange="statusChange(this)">	
	               					<option style="display:none;">답변상태</option>
	               					<option value="2">전체</option>            								
				                    <option value="0">답변대기</option>
				                    <option value="1">답변완료</option>				                    
				                </select></th><th>프로젝트명</th><th>제목</th><th>문의자</th><th>등록일</th>
						</tr>
						<c:choose>
						<c:when test="${not empty qnaList}">
							<c:forEach items="${qnaList }" var="bo" varStatus="i">
								<c:if test="${bo.memberId eq sessionScope.m.memberId }">									
									<tr class="tr-00" id="tr-01">
										<td>${bo.rnum }</td>
										<c:choose>
											<c:when test="${bo.divNo eq 1}"><td>펀딩</td></c:when>
											<c:when test="${bo.divNo eq 2}"><td>기부</td></c:when>
											<c:when test="${bo.divNo eq 4}"><td>경매</td></c:when>
										</c:choose>
										<c:choose>
											<c:when test="${bo.qnaStatus eq 0}"><td>답변대기</td></c:when>
											<c:when test="${bo.qnaStatus eq 1}"><td>답변완료</td></c:when>
										</c:choose>
										<c:if test="${!empty bo.fundingPN }"><td><a href="/fundingDetailStory.kh?fundingNo=${bo.projectNo}" style="color:black;">${bo.fundingPN }</a></td></c:if>
										<c:if test="${!empty bo.donationPN }"><td><a href="/donationClick.kh?projectNo=${bo.projectNo}" style="color:black;">${bo.donationPN }</a></td></c:if>
										<c:if test="${!empty bo.auctionPN }"><td><a href="/auctionView.kh?projectNo=${bo.projectNo}" style="color:black;">${bo.auctionPN }</a></td></c:if>
										<td><a href="#" class="showContent" onclick="return false;" style="color:black;">${bo.qnaTitle }</a></td>
										<td>${bo.memberId }</td>
										<td>${bo.qnaDate }</td>																		
									</tr>
									<tr style="display:none;border:1px solid #ccc;">
										<td colspan="7">
											<table class="tbl">
												<tr>
													<td>
														<div style="text-align:left;margin-left:40px;">문의내용 : ${bo.qnaContent }</div>
													</td>													
												</tr>
												<tr>
													<td>
														<div style="text-align:left;margin-left:40px;">답변내용 : ${bo.qnaReContent }</div>
													</td>													
												</tr>			
											</table>
										</td>
									</tr>
								</c:if>		
							</c:forEach>
							<tr><td colspan="7"><div id="pageNavi">${pageNavi }</div></td></tr>						
						</c:when>
						<c:otherwise>
							<tr><td colspan="7"><p class="p-0">Q&A내역이 없습니다.</p></td></tr>
						</c:otherwise>
					</c:choose>					
					</table>																
			</div>
		</div>
		<div style="display:none;" id="memberId">${sessionScope.m.memberId }</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(document).on("click", "td .showContent",function(event){
			const tr=$(this).parent().parent().next();
			tr.toggle();			
		});
		function statusChange(e) {
			const memberId=$("#memberId").text();
			if(e.value=="2"){
				location.href="/qnaList.kh?reqPage=1&memberId="+memberId+"&qnaStatus=2";
			}else if(e.value=="0"){
				location.href="/qnaList.kh?reqPage=1&memberId="+memberId+"&qnaStatus=0";
			}else if(e.value=="1"){
				location.href="/qnaList.kh?reqPage=1&memberId="+memberId+"&qnaStatus=1";
			}
		}
	</script>
</body>
</html>