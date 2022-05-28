<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.info-tbl{
	margin: 0 auto;
	margin-top: 170px;
}
.mypage-header {
	display: flex;
	height: 30px;
}
.mypage-content{
	min-height: 800px;
}
.flex-wrap {
	display: flex;
	flex-wrap: wrap;
}
.info-tbl input{
	width: 360px;
	display:inline;
}

.info-tbl tr>td:first-child{
	width: 28%;
}
.info-tbl tr:nth-child(2)>td:last-child{
	text-align: left;
}
.info-tbl tr:last-child a{
	text-decoration: underline;
}
.updateInfo-btn{
	width: 100%;
	height: 50px;
	font-size: 18px;
	border: none;
}
.check-msg{
	text-align: left;
	color: #c87431;
	font-size: 12px;
	height: 30px;
	padding-left: 10px;
	vertical-align: top;
}
.member-info{
	margin: auto;
}	
</style>
<meta charset="UTF-8">
<title>:: 회원 페이지 ::</title>
</head>
<body>
<!--  마이페이지 기본템플릿  -->
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">비밀번호 변경</div>
				<div class="member-info">
					<form action="/pwChange.kh" method="post">
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>현재 비밀번호</td>
								<td><input class="input-form" type="password"id="currentPw"></td>
							</tr>
							<tr>
								<td><input type="hidden" id="memberId" value=${sessionScope.m.memberId }></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>새 비밀번호</td>
								<td><input class="input-form" type="password" id="changePw" name="memberPw" placeholder="6~15자의 영문 대소문자,숫자,특수문자만 가능합니다."></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>새 비밀번호(확인)</td>
								<td><input class="input-form" type="password" id="changePw-check" name="memberPwNew" placeholder="정확한 확인을 위해 한번 더 입력해주세요."></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><input type="button" class="btn bc1 updateInfo-btn" value="비밀번호 변경하기"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>


<script>
//ajax 사용템플릿
$.ajax({
	url: '', // Controller의 mapping값
	type: '',  // get, post 방식 中
	data: '',  // Controller로 보낼 데이터
	contentType: '',  // 보내는 data의 타입
	dataType: '', // 받을 데이터 타입
	success: function() {},  // 정상적으로 return 받았을 때 실행할 함수
	error: function(){} // 실패했을 때 작동할 함수
});

</script>
</body>
</html>