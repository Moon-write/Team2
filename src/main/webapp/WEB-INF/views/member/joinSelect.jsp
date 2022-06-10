<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
.page-content-title{
	display: block;
	text-align: center;
	padding-top: 103px;
	padding-bottom: 50px;
	font-size: 36px;
	font-weight: 200;
	}
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
.select-wrap{
	display: flex;
	margin-bottom: 60px;
}
.select-wrap>*{
	flex-grow: 1;
	border: solid black 2px;
	margin: 60px;
	width: 300px;
	height: 400px;
	padding: 30px;
	text-align: center;
}
.select-wrap>*:hover{
	flex-grow: 1;
	border: solid #1E90FF 2px;
	margin: 60px;
	width: 300px;
	height: 400px;
	padding: 30px;
	text-align: center;
	cursor: pointer;
}
.select-btn-wrap{
	display: block;
	text-align: center;
	margin: 0 auto;
	margin-bottom: 200px;
}
.select-wrap .member-title{
	font-size: 25px;
	padding-bottom: 15px;
}
.select-wrap .member-intro{
	font-size: 21px;
}
.select-wrap .material-symbols-outlined {
	font-size: 75px;
	color: rgb(30,144,255);
	margin-top: 46px;
	margin-bottom: 42px;
}
.bs5{
	padding: 13px 65px;
	font-size: 15px;
}
.select-member-form .btn{
	display: block;
	width: 70%;
	margin: 30px auto;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<span class="page-content-title">회원가입</span>
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
						<a type="button" class="btn bc1 bs5" href="/joinFrmMember.kh">다음</a>
					</div>
					<div class="select-biz">
						<span class="material-symbols-outlined">apartment</span><br>
						<span class="member-title">사업자회원</span><br>
						<span class="member-intro">사업자/법인회원 가입</span>
						<a type="button" class="btn bc1 bs5" href="/joinFrmBiz.kh">다음</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>