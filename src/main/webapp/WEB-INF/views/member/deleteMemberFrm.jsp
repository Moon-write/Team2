<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
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
.info-tbl{
	width: 60%;
	margin: 170px auto;
}
.info-tbl tr{
	height: 50px;
}
.info-tbl tr>td:first-child{
	width: 10%;
	text-align: right;
}

.info-tbl tr>td:nth-child(2){
	width: 20%;
}
.info-tbl tr:nth-child(3)>td{
	vertical-align: top;
}

.updateInfo-btn{
	width: 100%;
	height: 50px;
	font-size: 18px;
	border: none;
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
				<div class="mypage-content-title">회원탈퇴</div>
				<div class="member-info">
					<form action="/deleteMember.kh" method="post">
						<table class="info-tbl">
							<tr class="tr-3">
								<td></td>
								<td>
									<h4>정말로 탈퇴하시겠습니까?</h4>
									<h6 style="color: #a7a7a7;">탈퇴하시면 정보를 복구할 수 없습니다.</h6>
								</td>
							</tr>
							<tr class="tr-3">
								<td>비밀번호 확인</td>
								<td>
									<input type="password" class="input-form" name="memberPw" id="memberPw">
									<td><p class="fc-9" name="pwChk"></p></td>								
								</td>
							</tr>
							<tr>
								<td><input type="hidden" id="memberId" name="memberId" value=${sessionScope.m.memberId }></td>
							</tr>
							<tr class="tr-3">
								<td><input type="button" class="btn bc4 updateInfo-btn" value="탈퇴하기"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	//비밀번호 확인
	$(function(){
		let inputCheck = false;
		$("[name=memberPw]").on("change", function(){
			$.ajax({
				url: "/pwcheck.kh", // Controller의 mapping값
				type: "post",  // get, post 방식 中
				data: {memberId : memberId, memberPw : memberPw},  // Controller로 보낼 데이터
				success: function(data) {
					if(data == "0"){
						$(".fc-9").text("비밀번호가 일치합니다.").css("color","blue");
						inputCheck = true;
					}else if(data == "1"){
						$(".fc-9").text("비밀번호를 확인해주세요.").css("color","red");
						inputCheck = false;
					}
				}
			});
		});
		//탈퇴실행
		$(".updateInfo-btn").on("click", function(){
			if(inputCheck){
				const memberId = $("[name=memberId]").val();
				$.ajax({
					url: "/deleteMember.kh", // Controller의 mapping값
					type: "get",  // get, post 방식 中
					data: {memberId : memberId},  // Controller로 보낼 데이터
					success: function(data) {
						location.href = "/";
					}  // 정상적으로 return 받았을 때 실행할 함수
				});
			}else{
				alert("비밀번호를 확인해주세요"); 
			}
		});
	});
	
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>