<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 관리</title>
<style>
.menu {
	margin-top:30px;
	width: 150px;
	height: 100%;
	float: left;
}

.menu ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	text-align: center;
}

.menu a {
	font-size: 14px;
	display: block;
	height: 40px;
	color:black;
	line-height: 40px;
	text-decoration: none;
	position: relative;
}

.sub-menu {
	display: none;
}

.sub-menu a{
	color:gray;
}

.more {
	position: absolute;
	font-size: 20px;
	right: 20px;
	transition-duration: 0.5s;
}

.menu-active {
	transform: rotate(45deg);
}

.page-content {
	float: left;
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
tr td{
	border-bottom:none;
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
.projectName{
 max-width: 132px;
 overflow: hidden;
 text-overflow: ellipsis;
 white-space: nowrap;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
		<div class="show-content">
			<div>
				<h1 style="margin-top:30px;margin-bottom:30px;">문의글 관리</h1>
				<table class="tbl">
						<tr class="tr-2">
							<th>번호</th>
							<th>분류
								<!-- <select onchange="divChange(this)">										
									<option style="display:none;">분류</option>
	               					<option value="0">전체</option>                								
				                    <option value="1">펀딩</option>
				                    <option value="2">기부</option>
				                    <option value="4">경매</option>
				                </select> --> 															
							</th>
							<th>
								<select onchange="statusChange(this)">	
	               					<option style="display:none;">답변상태</option>
	               					<option value="2">전체</option>            								
				                    <option value="0">답변대기</option>
				                    <option value="1">답변완료</option>				                    
				                </select> 															
							</th>
							<th>프로젝트명</th><th>제목</th><th>문의자</th><th>등록일</th>
						</tr>
						<c:choose>
						<c:when test="${not empty qnaList}">
							<c:forEach items="${qnaList }" var="bo" varStatus="i">
								<c:if test="${bo.sellerNo eq sessionScope.m.memberNo }">								
									<tr class="tr-00" id="tr-01">
										<td id="rnum">${bo.rnum }</td>
										<c:choose>
											<c:when test="${bo.divNo eq 1}"><td>펀딩</td></c:when>
											<c:when test="${bo.divNo eq 2}"><td>기부</td></c:when>
											<c:when test="${bo.divNo eq 4}"><td>경매</td></c:when>
										</c:choose>
										<c:choose>
											<c:when test="${bo.qnaStatus eq 0}"><td>답변대기</td></c:when>
											<c:when test="${bo.qnaStatus eq 1}"><td>답변완료</td></c:when>
										</c:choose>
										<c:if test="${!empty bo.fundingPN }"><td class="projectName"><a href="/fundingDetailStory.kh?fundingNo=${bo.projectNo}" style="color:black;">${bo.fundingPN }</a></td></c:if>
										<c:if test="${!empty bo.donationPN }"><td class="projectName"><a href="/donationClick.kh?projectNo=${bo.projectNo}" style="color:black;">${bo.donationPN }</a></td></c:if>
										<c:if test="${!empty bo.auctionPN }"><td class="projectName"><a href="/auctionView.kh?projectNo=${bo.projectNo}" style="color:black;">${bo.auctionPN }</a></td></c:if>
										<c:if test="${empty bo.auctionPN and empty bo.donationPN and empty bo.fundingPN}"><td class="projectName">삭제된 프로젝트</td></c:if>
										<td><a href="#" class="showContent" onclick="return false;" style="color:black;">${bo.qnaTitle }</a></td>
										<td>${bo.memberId }</td>
										<td>${bo.qnaDate }</td>																		
									</tr>
									<tr style="display:none;border:1px solid #ccc;">
										<td colspan="7">
											<table class="tbl" style="margin-bottom:0;">
												<form action="/insertQnaRe.kh" method="post">
													<tr>
														<td style="width:100px;">
															<div style="text-align:right;">문의제목 : </div>
														</td>
														<td><div style="text-align:left;">${bo.qnaTitle }</div></td>				
													</tr>
													<tr>
														<td style="width:100px;">
															<div style="text-align:right;">문의내용 : </div>
														</td>
														<td><div style="text-align:left;">${bo.qnaContent }</div></td>				
													</tr>
													<tr>
														<td style="width:100px;"><div style="text-align:right;">답변내용 : </div></td>
														<td>													
															<c:if test="${bo.qnaStatus eq 1 }">
																<div style="text-align:left;"> ${bo.qnaReContent }</div>
															</c:if>
															<c:if test="${bo.qnaStatus eq 0 }">
																<div style="text-align:left;"><textarea name="qnaReContent" class="input-form" style="min-height: 5rem;"></textarea></div>
															</c:if>
															<input type="hidden" name="qnaNo" value="${bo.qnaNo }">
															<input type="hidden" name="sellerNo" value="${sessionScope.m.memberNo }">
														</td>																																			
													</tr>
													<c:if test="${bo.qnaStatus eq 1 }">
														<tr><td style="width:100px;"><div style="text-align:right;">답변등록일 : </div></td><td><div style="text-align:left;">${bo.qnaReDate }</div></td></tr>
													</c:if>
													<c:if test="${bo.qnaStatus eq 0 }">
														<tr><td colspan="2"><button class="btn bc1 insertQnaRe">등록</button></td></tr>
													</c:if>		
												</form>												
											</table>
										</td>
									</tr>
								</c:if>		
							</c:forEach>
							<tr><td colspan="7" style="border-bottom:none;"><div id="pageNavi">${pageNavi }</div></td></tr>						
						</c:when>
						<c:otherwise>
							<tr><td colspan="7"><p class="p-0">Q&A내역이 없습니다.</p></td></tr>
						</c:otherwise>
					</c:choose>					
					</table>	
			</div>
		</div>
		<div style="display:none;" id="sellerNo">${sessionScope.m.memberNo }</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
	$(document).on("click", "td .showContent",function(event){
		const tr=$(this).parent().parent().next();
		tr.toggle();			
	});
	function statusChange(e) {
		const sellerNo=$("#sellerNo").text();
		if(e.value=="2"){
			location.href="/manageQna.kh?sellerNo="+sellerNo+"&reqPage=1&qnaStatus=2";
		}else if(e.value=="0"){
			location.href="/manageQna.kh?sellerNo="+sellerNo+"&reqPage=1&qnaStatus=0";
		}else if(e.value=="1"){
			location.href="/manageQna.kh?sellerNo="+sellerNo+"&reqPage=1&qnaStatus=1";
		}
	}

	</script>
</body>
</html>