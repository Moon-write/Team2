<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.index-wrap{
	width: 565px;
	padding-top: 20px;
	padding-bottom: 80px;
	margin: 0 auto;
}
.index{
	display: flex;
}
.index>li{
	margin-right: 19px;
	list-style:none;
}
.index>li>span{
	display: inline-block;
	background-color: rgb(224, 224, 224);
	width: 30px;
	height: 30px;
	line-height: 30px;
	text-align: center;
	border-radius: 15px;
	margin-right: 5px;
}
.index>.selected>span{
	background-color: #1E90FF;
}	
.login-title{
	display: block;
	text-align: center;
	padding-top: 103px;
	padding-bottom: 50px;
	font-size: 36px;
	font-weight: 200;
}
.select-wrap{
	display: flex;
}
.select-wrap>.select-member,.select-biz{
	flex-grow: 1;
	border: solid black 1px ;
	margin: 60px;
	width: 300px;
	height: 300px;
	padding: 30px;
	text-align: center;
}
.select-btn-wrap{
	display: block;
	text-align: center;
	margin: 0 auto;
	margin-bottom: 200px;
}
.member-title{
	font-size: 25px;
	padding-top: 50px;
	padding-bottom: 80px;
	margin-top: 50px;
	margin-bottom: 80px;
}
.select-wrap .material-symbols-outlined {
	font-size: 75px;
	color: rgb(30,144,255);
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<span class="login-title">회원가입</span>
			<div class="index-wrap">
				<ul class= "index">
					<li class="selected">───<span>1</span>회원선택</li>
					<li>───<span>2</span>회원정보 입력</li>
					<li>───<span>3</span>회원가입 완료</li>
				</ul>
				</div>
			<form class="select-member-form">
				<div class="select-wrap">
					<div class="select-member">
						<span class="material-symbols-outlined">account_circle</span><br>
						<span class="member-title">일반회원</span><br>
						<span class="member-intro">일반회원 가입</span>
					</div>
					<div class="select-biz">
						<span class="material-symbols-outlined">apartment</span><br>
						<span class="member-title">사업자회원</span><br>
						<span class="member-intro">사업자회원 가입</span>
					</div>
				</div>
				<div class="select-btn-wrap">
					<button type="submit" class="btn bc1 bs5">다음</button>
				</div>
			</form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>