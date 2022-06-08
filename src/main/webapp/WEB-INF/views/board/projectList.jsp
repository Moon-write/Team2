<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/board/boardMain.css">
<style>
.content-title{
	background-image: url(/resources/img/board/banner3.jpg);
	background-size: cover;
	background-position: 10% 65%;
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
.my_book_list_tbl tr>th:nth-child(1){
	width: 10%;
}
.my_book_list_tbl tr>th:nth-child(2){
	width: 9%;
} 
.my_book_list_tbl tr>th:nth-child(3){
	width: 20%;
}
.my_book_list_tbl tr>th:nth-child(4){
	width: 36%;
}
.my_book_list_tbl tr>th:nth-child(5){
	width: 13%;
}
.my_book_list_tbl tr>th:nth-child(6){
	width: 11%;
}
#my_book_list_tbl tr>td:nth-child(1){
	width: 10%;
}
#my_book_list_tbl tr>td:nth-child(2){
	width: 9%;
} 
#my_book_list_tbl tr>td:nth-child(3){
	width: 20%;
}
#my_book_list_tbl tr>td:nth-child(4){
	width: 36%;
}
#my_book_list_tbl tr>td:nth-child(5){
	width: 13%;
}
#my_book_list_tbl tr>td:nth-child(6){
	width: 11%;
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
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">진행중인 프로젝트</div>
				<div class="content-title">
					<div class="title-txt">현재 참여중인 프로젝트를 확인해보세요</div>
				</div>
			</div>
		</div>
	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>