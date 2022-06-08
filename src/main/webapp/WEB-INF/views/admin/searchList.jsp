<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원목록</title>
<style>
.p-0{
	text-align: center;
	font-size: 18px;
	font-weight: bold;
	padding: 45px 0px;
}
.my_book_list_tbl>*{
	text-align: center;
}
.noticemenu{
    width: 800px;
    margin: 0 auto;
    padding: 0;
}
.noticemenu>ul{
    list-style-type: none;
    border-right: none;
}
.noticemenu>ul>li{
    height: 40px;
    text-align: center;
    float: left;
    width: 180px;
    border-right: solid 0px #333333;
}
.noticemenu>ul>li>a:hover{
	color: rgb(30,144,255);
}
.noticemenu>ul>li>a{
    margin: 0 auto;
    vertical-align: middle;
    text-decoration: none;
    font-size: 18px;
    color: #333333;
    line-height:40px;
}
.noticemenu>ul>li:last-child{
    border: none;
}
.noticemenu>ul{
	display: flex;
	justify-content: space-between;	
}
.title-div-line{
	 line-height:40px;
	 font-size:12px;
}
.flex-wrap {
	display: flex;
	flex-wrap: wrap;
}	
.mypage-header {
	display: flex;
	height: 30px;
}
.mypage-content{
	margin-top: 100px;
	margin-bottom: 100px;
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
	padding: 1.0rem;
}
#tr-01>*{
	padding: 1.0rem;
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
	word-break: break-all
}
#my_book_list_tbl tr>th:nth-child(3){
	width: 5%;
}
#my_book_list_tbl tr>td:nth-child(3){
	width: 5%;
}
#my_book_list_tbl tr>th:nth-child(4){
	width: 6%;
}
#my_book_list_tbl tr>td:nth-child(4){
	width: 6%;
}
#my_book_list_tbl tr>th:nth-child(5){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(5){
	width: 10%;
}
#my_book_list_tbl tr>th:nth-child(6){
	width: 7%;
}
#my_book_list_tbl tr>td:nth-child(6){
	width: 7%;
}
#my_book_list_tbl tr>th:nth-child(7){
	width: 6%;
}
#my_book_list_tbl tr>td:nth-child(7){
	width: 6%;
}
#my_book_list_tbl tr>th:nth-child(8){
	width: 9%;
}
#my_book_list_tbl tr>td:nth-child(8){
	width: 9%;
}
#my_book_list_tbl tr>th:nth-child(9){
	width: 4%;
}
#my_book_list_tbl tr>td:nth-child(9){
	width: 4%;
}
form{
	margin-top: 20px; 
	margin-bottom: 20px; 
}
tr,td{
	text-align: center;
}
table{
	table-layout: fixed;
}
#searchBtn{
	padding: 0 10px; 
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<div class="mypage-content">
				<div class="mypage-content-title">
				<div class="noticemenu">
			        <ul>
			            <li><a href="/selectMemberList.kh?reqPage=1&memberLevel=2">회원목록</a></li>
			            <li class="title-div-line">|</li>
			            <li><a href="/selectBizList.kh?reqPage=1&memberLevel=1">사업자목록</a></li>
			        </ul>
			    </div> 
					<form action="/searchMemberList.kh?reqPage=1">
						<input type="hidden" name=reqPage value="1">
						<input type="hidden" name=memberLevel value="2">
						<input type="text" name="keyword" placeholder="회원 아이디/이름 " style="height:29px; width:230px; padding-left:5px;" >
						<button class="bc4" id="searchBtn" type="submit" class="material-icons">검색</button>
					</form>
				</div>
					<!-- 헤더 테이블 -->
					<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
						<tr class="tr-3">
							<th>번호</th><th>아이디</th><th>이름</th><th>핸드폰번호</th><th>주소<th>적립금</th><th>등급</th><th>상세보기<th>삭제</th>
						</tr>
					</table>
					<!-- 본문 테이블 -->	
					<c:choose>
						<c:when test="${not empty memberList}">
							<c:forEach items="${memberList }" var="m" varStatus="i">
								<table class="tbl tbl-hover my_book_tbl" id="my_book_list_tbl">
									<tr class="tr-00" id="tr-01">
										<td>${m.memberNo }</td>
										<td id="memberId">${m.memberId }</td>
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
											<c:when test="${m.memberLevel eq 0 }">
											<td>관리자</td>
											</c:when>
										</c:choose>
										<td><button class="btn bc2 searchBtn" style="padding: 0 10px;" >상세보기</button></td>
										<!-- 상세보기 누르면 slide down되도록 -->
										<td><input type="checkbox" id="delMemberChk"></td>
									</tr>
								</table>
							</c:forEach>
							<button class="btn bc4 delBtn" style="padding: 0;">삭제</button>
							<div id="pageNavi">${pageNavi }</div>
						</c:when>
						<c:otherwise>
							<p class="p-0">회원내역이 없습니다.</p>
						</c:otherwise>
					</c:choose>
			</div>
		</div><!-- flex-wrap -->
	</div><!-- page-content -->
	<script type="text/javascript">
	$(".delBtn").on("click",function(){
		const chk = $("#delMemberChk:checked");
		if(chk.length == 0){
			alert("선택된 회원이 없습니다.");
			return;
		}
		if(confirm("정말 삭제하시겠습니까?")){
			const memberIdArr = new Array();
			chk.each(function(index,item){
				memberIdArr.push($(item).parent().siblings("#memberId").text());
			});
			location.href="/deleteMemberList.kh?memberIdArr="+memberIdArr.join("/");
		}
	});
	
	$(".searchBtn").on("click",function(){
		const keyword = $(this).siblings("[name=keyword]").val();
		console.log(keyword);
		if(keyword == ''){
			alert("검색어를 입력하세요.");
			return;
		}else{
			location.href="/searchMemberList.kh?keyword="+keyword+"&reqPage=1&chk=3";
		}
	});
	</script>
	<script>
	$(".delBtn").on("click",function(){
		const chk = $("#delMemberChk:checked");
		if(chk.length == 0){
			alert("선택된 회원이 없습니다.");
			return;
		}
		if(confirm("정말 삭제하시겠습니까?")){
			const memberIdArr = new Array();
			chk.each(function(index,item){
				memberIdArr.push($(item).parent().siblings("#memberId").text());
			});
			location.href="/deleteMemberList.kh?memberIdArr="+memberIdArr.join("/");
		}
	});
	
	$(".searchBtn").on("click",function(){
		console.log("이건 나오ㅗ냐?");
		const keyword = $(this).siblings("[name=keyword]").val();
		console.log(keyword);
		if(keyword == ''){
			alert("검색어를 입력하세요.");
			return;
		}else{
			location.href="/searchMemberList.kh?keyword="+keyword+"&reqPage=1&chk=3";
			/*
			$.ajax({
				url : "/ajaxAllMember.do",
				success : function(data){
					const table = $("#result>table");
					table.empty();
					const titleTr = $("<tr>");
					titleTr.append("<th>번호</th><th>아이디</th><th>비밀번호</th><th>이름</th><th>전화번호</th><th>이메일</th>");
					table.append(titleTr);
					for(let i=0;i<data.length;i++){
						//멤버데이터 ajax에서 읽어올떄마다 테이블 열 생성해서 데이터 넣는것
						const tr = $("<tr>");
						tr.append("<td>"+data[i].memberNo+"</td>");
						tr.append("<td>"+data[i].memberId+"</td>");
						tr.append("<td>"+data[i].memberPw+"</td>");
						tr.append("<td>"+data[i].memberName+"</td>");
						tr.append("<td>"+data[i].phone+"</td>");
						tr.append("<td>"+data[i].email+"</td>");
						table.append(tr);
					}
				}
			});
			*/
		}
	});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"  %>
</body>
</html>