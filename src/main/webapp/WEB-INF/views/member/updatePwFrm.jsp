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
<title>비밀번호 수정</title>
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
					<form action="/pwChange.kh" method="post" id="form">
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>현재 비밀번호</td>
								<td><input class="input-form" type="password" id="currentPw" name="currentPw" required></td>
							</tr>
							<tr>
								<td><input type="hidden" id="memberId" name="memberId" value="${sessionScope.m.memberId }"></td>
								<td class="check-msg"><span class="pwChk"></span></td>
							</tr>
							<tr class="tr-3">
								<td>새 비밀번호</td>
								<td><input class="input-form" type="password" id="memberPwNew" name="memberPwNew" placeholder="4~6자의 영문 대소문자,숫자만 가능합니다." required></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"><span class="newPwChk"></span></td>
							</tr>
							<tr class="tr-3">
								<td>새 비밀번호(확인)</td>
								<td><input class="input-form" type="password" id="memberPwNewRe" name="memberPwNewRe" placeholder="정확한 확인을 위해 한번 더 입력해주세요." required></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"><span class="newPwReChk"></span></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td><button type="submit" class="btn bc1 updateInfo-btn" value="비밀번호 변경하기">비밀번호 변경하기</button></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		const checkArr = [false,false,false];
			
		//현재 비밀번호 확인
		const currentPw = $("#currentPw");
		currentPw.on("change", function(){
			const memberId = $("#memberId").val();
			const memberPw = $("#currentPw").val();
			$.ajax({
				url: "/selectOneMember.kh", // Controller의 mapping값
				type: "post",  // get, post 방식 中
				data: {memberId : memberId , memberPw : memberPw},  // Controller로 보낼 데이터
				success: function(data) {
					if(data == "0"){
						$(".pwChk").text("비밀번호가 일치합니다.");
						$(".pwChk").css("color","blue");
						checkArr[0] = true;
					}else{
						$(".pwChk").text("비밀번호를 확인해주세요.");
						$(".pwChk").css("color","red");	
						checkArr[0] = false;
					}
				},
				error : function(){
					console.log("pwCheck 에러");
				}  
			});
		});
		//새 비밀번호 정규식 및 현재비밀번호 일치여부 확인
		$("#memberPwNew").on("change", function(){
			const pwReg = /[a-zA-Z0-9]{4,6}/;
			const pwVal = $("#memberPwNew").val();
			const pwReVal = $("#memberPwNewRe").val();
			const memberPw = $("#currentPw").val();
			if(pwVal == memberPw){
				$(".newPwChk").text("현재 비밀번호와 같은 비밀번호를 사용할 수 없습니다.");
				$(".newPwChk").css("color","red");
				checkArr[1] = false;
			}else{
				if(pwReg.test(pwVal)){
					$(".newPwChk").text("사용할 수 있는 패스워드 입니다.");
					$(".newPwChk").css("color","blue");
					checkArr[1] = true;
				}else{
					$(".newPwChk").text("4자~6자 영어대소문자 또는 숫자를 사용하세요.");
					$(".newPwChk").css("color","red");
					checkArr[1] = false;
				}
			}
		});
		$("#memberPwNewRe").on("change", function(){
			const pwVal = $("#memberPwNew").val();
			const pwReVal = $("#memberPwNewRe").val();
			if(pwVal == pwReVal){
				$(".newPwReChk").text("두 비밀번호가 일치합니다.");
				$(".newPwReChk").css("color","blue");
				checkArr[2] = true;
			}else if(pwVal != pwReVal){
				$(".newPwReChk").text("두 비밀번호가 일치하지 않습니다.");
				$(".newPwReChk").css("color","red");
				checkArr[2] = false;
			}
		});	
		//비번수정 버튼
		$(".updateInfo-btn").on("click", function(e){
			let count = 0;
			for(let i = 0;i<checkArr.length;i++){
				if(checkArr[i]){
					count++;
				}
			}
			if(count != 3){
				e.preventDefault();//form의 submit을 중단시키는 코드
				alert("항목을 다시 확인해주세요.");
			}
		});
		//arraycheck 버튼(회원가입 완성되면 삭제)
		   $("#join-check").on("click",function(){
			   for(let i=0;i<checkArr.length;i++){
			   		console.log("checkArr"+i+"번째값: "+checkArr[i]);
			   	}
		   });
		//arraycheck 버튼(회원가입 완성되면 삭제)
		   $("#join-final").on("click",function(){
			   console.log("1. 현재 비밀번호 : "+$("[name=currentPw]").val());
			   console.log("2. 새 비밀번호 : "+$("[name=memberPwNew]").val());
			   console.log("3. 새 비밀번호(확인) : "+$("[name=memberPwNewRe]").val());
		   });   
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>