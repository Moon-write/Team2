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
								<td class="check-msg"><span class="pwReChk"></span></td>
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
	<script>
		//비밀번호 정규식
		//비밀번호 재확인 일치체크
		$("[name=memberPwNew]").on("change",function(){
			const pwVal = $("[name=memberPw]").val();
			const pwReVal = $("[name=memberPwNew]").val();
			if(pwVal == pwReVal){
				$(".pwReChk").text("두 비밀번호가 일치합니다.");
				$(".pwReChk").css("color","blue");
				checkArr[2] = true;
			}else{
				$(".pwReChk").text("두 비밀번호가 일치하지 않습니다.");
				$(".pwReChk").css("color","red");
				checkArr[2] = true;
			}
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>