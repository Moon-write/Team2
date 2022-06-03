<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
.flex-wrap {
	display: flex;
	flex-wrap: wrap;
}	
.mypage-header {
	display: flex;
	height: 30px;
}
.page-content{

}
.tbl tr>th{
		border-top: 1px solid #ccc;
		background-color: rgb(204,204,204,0.4);
}
.mypage-content-title>form{
	float: right;
	display: flex;
}
.tbl-hover th, .tbl-hover td{
	border-bottom: 1px solid #A7A7A7;
}
.tbl-hover{
	margin-top: 20px;
}
.delBtn{
	width:100px; 
	height:45px;
	margin-top: 20px;
	line-height: 45px;
	float:right;
}
.searchBtn{
	height: 40px;
	line-height: 40px;
	
}
#pageNavi {
	margin-top: 30px;
}
#tr-00>*{
	padding: 1rem;
}
#tr-01>*{
	padding: 1.2rem;
}
#my_book_list_tbl tr>th:nth-child(1){
	width: 4%;
}
#my_book_list_tbl tr>td:nth-child(1){
	width: 4%;
}
#my_book_list_tbl tr>th:nth-child(2){
	width: 8%;
}
#my_book_list_tbl tr>td:nth-child(2){
	width: 8%;
}
#my_book_list_tbl tr>th:nth-child(3){
	width: 6%;
}
#my_book_list_tbl tr>td:nth-child(3){
	width: 6%;
}
#my_book_list_tbl tr>th:nth-child(4){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(4){
	width: 10%;
}
#my_book_list_tbl tr>th:nth-child(5){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(5){
	width: 10%;
}
#my_book_list_tbl tr>th:nth-child(6){
	width: 8%;
}
#my_book_list_tbl tr>td:nth-child(6){
	width: 8%;
}
#my_book_list_tbl tr>th:nth-child(7){
	width: 6%;
}
#my_book_list_tbl tr>td:nth-child(7){
	width: 6%;
}
#my_book_list_tbl tr>th:nth-child(8){
	width: 8%;
}
#my_book_list_tbl tr>td:nth-child(8){
	width: 8%;
}
#my_book_list_tbl tr>th:nth-child(9){
	width: 8%;
}
#my_book_list_tbl tr>td:nth-child(9){
	width: 8%;
}
#my_book_list_tbl tr>th:nth-child(10){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(10){
	width: 10%;
}
#my_book_list_tbl tr>th:nth-child(11){
	width: 4%;
}
#my_book_list_tbl tr>td:nth-child(11){
	width: 4%;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<div class="mypage-content">
				<div class="mypage-content-title">
					<span style="font-family: ns-bold;">회원 목록</span>
					<form action="/searchMember.do">
						<input type="text" name="searchMember" placeholder="회원 검색(아이디/이름/닉네임)" style="height:29px; width:230px; padding-left:5px;" >
						<button type="submit" class="material-icons">search</button>
					</form>
				</div>
					<!-- 헤더 테이블 -->
					<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
						<tr class="tr-3">
							<th>번호</th><th>아이디</th><th>이름</th><th>핸드폰번호</th><th>주소<th>적립금</th><th>등급</th><th>구매내역</th><th>탈퇴가능여부</th><th>상세보기<th>삭제</th>
						</tr>
					</table>
					<!-- 본문 테이블 -->	
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach items="${memberList }" var="m" varStatus="i">
								<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
									<tr class="tr-00" id="tr-01">
										<td>${m.memberNo }</td>
										<td>${m.memberId }</td>
										<td>${m.memberName }</td>
										<td>${m.memberPhone }</td>
										<td>${m.memberAddr1 }</td>
										<td>${m.memberPoint }</td>
										<c:choose>
											<c:when test="${m.memberLevel eq 2 }">
											<td>일반</td>
											</c:when>
											<c:when test="${m.memberLevel eq 1 }">
											<td>사업자</td>
											</c:when>
										</c:choose>
										<!-- 구매내역이랑 탈퇴가능여부 넣어야함 / orderStatus로 가르면될듯-->
										<td>배송완료</td>
										<td>탈퇴가능</td>
										<td><button class="btn bc2 searchBtn" style="padding: 0 10px;" >상세보기</button></td>
										<td><input type="checkbox" id="delMemberChk"></td>
									</tr>
								</table>
							</c:forEach>
							<button class="btn bc3 delBtn" style="padding: 0;">삭제</button>
							<div id="pageNavi">${pageNavi }</div>
						</c:when>
						<c:otherwise>
							<p class="p-0">회원내역이 없습니다.</p>
						</c:otherwise>
					</c:choose>
			</div>
		</div><!-- flex-wrap -->
	</div><!-- page-content -->
	<%@include file="/WEB-INF/views/common/footer.jsp"  %>
	<script>
		$(".delBtn").on("click",function(){
			const chk = $("#delMemberChk:checked");
			if(chk.length==0){
				alert("선택된 회원이 없습니다.");
				return;
			}
			if(confirm("정말 삭제하시겠습니까?")){
				const memberNoArr = new Array();
				chk.each(function(index,item){
					memberNoArr.push($(item).parent().parent().children().first().text());
				});
				location.href="/delMember.do?memberNoArr="+memberNoArr.join("/");
			}
		});
		
		$(".searchBtn").on("click",function(){
			const memberNo = $(this).parent().parent().children().first().text();
			const memberNick = $(this).parent().parent().children().eq(3).text();
			location.href="searchMemberList.kh?memberNo="+memberNo+"&memberNick="+memberNick+"&reqPage=1&chk=3";
		});
	</script>
</body>
</html>