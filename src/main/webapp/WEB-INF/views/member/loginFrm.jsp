<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
	.page-content-title{
	display: block;
	text-align: center;
	padding-top: 103px;
	padding-bottom: 50px;
	font-size: 36px;
	font-weight: 200;
	}
	h1{
		text-align: center;
		margin-bottom: 30px;
		font-size: 40px; 
	}
	.input-wrap{
		width: 450px;
		margin: 0 auto;
		padding: 40px;
		border: 1px solid rgb(167, 167, 167);
	}
	.login-input{
		padding: 15px;
		padding-left: 30px;
		border: 1px solid rgb(167, 167, 167);
		overflow: hidden;
	}
	.login-input:first-child{
		border-bottom: none;
	}
	.login-input *{
		font-size: 16px;
		color: rgb(167, 167, 167);
		float: left;
	}
	.flex-wrap{
		width: 5%;
		height: 44px;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	.flex-wrap>span{
		font-size: 35px;
	}
	.login-input>input{
		border: none;
		outline: none;
		margin-left: 10px;
		padding: 10px;
		width: 90%;
	}
	.login-button{
		margin-top: 50px;
	}
	.login-button>button{
		height: 60px;
		line-height: 60px;
		border: none;
		padding: 0;
		font-size: 24px;
	}
	.login-p1,.login-p2{
		text-align: center;
		font-size: 18px;
	}
	.login-p2:hover{
		font-weight:bold;
	}
	.login-title{
		text-align: center;
		font-size: 36px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<span class="page-content-title">로그인</span>
		<br><br>
		<form action="/login.kh" method="post">
			<div class=input-wrap>
				<div class="login-input">
					<input type="text" name="memberId" id="memberId" class="input-form" placeholder="이메일(ID)">
				</div>
				<div class="login-input">
					<input type="password" name="memberPw" id="memberPw" class="input-form" placeholder="비밀번호">
				</div>
				<div class="login-button">
					<button type="submit" class="bc1 bs4">로그인하기</button>
				</div>
			</div>
		</form>
		<br><br><br>
		<p class="login-p1" style="color:#333; font-size:18px;">
		회원이 아니신가요?<br>
		신규회원에게 적립금 3000원을 드립니다.
		</p>
		<br><br>
		<p class="login-p2" ><a href="/joinSelect.kh" style="color:#ccc;">회원 가입 하러 가기</a></p>
		<br><br><br><br>
	</div>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>