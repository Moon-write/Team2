<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
	.info-tbl{
		width: 60%;
		margin: 150px auto;
	}
	.info-tbl tr{
		height: 50px;
	}
	.info-tbl input{
		border: 1px solid #a7a7a7;
	}
	
	.info-tbl tr>td:first-child{
		width: 10%;
		text-align: center;
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
<title>회원탈퇴</title>
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
								<td><input type="password" class="input-form" name="memberPw" id="memberPw"></td>
							</tr>
							<tr>
								<td><input type="hidden" name="memberId" id="memberId" value=${sessionScope.m.memberId }></td>
								<td><p class="fc-9" name="pwChk"></p></td>	
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button type="submit" class="btn bc4 updateInfo-btn" value="탈퇴하기">탈퇴하기</td>
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
			const memberId = $("#memberId").val();
			const memberPw = $("#memberPw").val();
			$.ajax({
				url: "/selectOneMember.kh", // Controller의 mapping값
				type: "post",  // get, post 방식 中
				data: {memberId : memberId, memberPw : memberPw},  // Controller로 보낼 데이터
				success: function(data) {
					if(data == "0"){
						$(".fc-9").text("");
						inputCheck = true;
					}else if(data == "1"){
						$(".fc-9").text("비밀번호를 확인해주세요.").css("color","red");
						inputCheck = false;
					}
				}
			});
			console.log(inputCheck);
		});
		//탈퇴실행
		$(".updateInfo-btn").on("click", function(e){
			const memberPw = $("#memberPw").val();
			if(inputCheck == false){
				e.preventDefault();
				alert("비밀번호를 확인하세요"); 
			}
		});
	});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>