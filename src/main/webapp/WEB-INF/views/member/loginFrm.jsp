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
	.login-title{
		text-align: center;
		font-size: 36px;
	}
	.input-wrap>.logSave{
	margin-top: 15px;
	}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<span class="page-content-title">로그인</span>
		<br><br><form action="/login.kh" id="loginForm" name="loginForm" method="post">
			<div class="input-wrap">
				<div class="login-input">
				    <label class="skip" for="memberId">아이디</label>
				    <input type="text" name="memberId" id="memberId" class="input-form" placeholder="이메일(ID)">
				</div>
				<div class="login-input">
				    <label class="skip" for="memberPw">비밀번호</label>
				    <input type="password" name="memberPw" id="memberPw" class="input-form" placeholder="비밀번호">
			    </div>
			  	<div class="logSave">
				    <input type="checkbox" class="save_id" name="checkId" id="idSaveCheck" >
				    <label for="idSaveCheck">아이디 저장</label>
				</div>
			<div class="login-button"><button type="submit" class="btn bc1 bs4" value="로그인">로그인</button></div>                            
			</div>
		</form>
		<br><br><br>
		<p class="login-p1" style="color:#333; font-size:18px;">
		회원이 아니신가요?<br>
		신규회원에게는 적립금 3000원을 드립니다.
		</p>
		<br><br>
		<p class="login-p2" ><a href="/joinSelect.kh" style="color:rgb(30,144,255);">회원 가입 하러 가기</a></p>
		<br><br><br><br>
	</div>
	<script>
	//아이디 비밀번호 미입력시
	
	//로그인 실패시 
	$.ajax({
		url: "/selectOneMember.kh", // Controller의 mapping값
		type: "post",  // get, post 방식 中
		data: "{memberId : memberId , memberPw : memberPw}",  // Controller로 보낼 데이터
		success: function(data) {
			
		},  // 정상적으로 return 받았을 때 실행할 함수
	});
	
	//아이디 쿠키 저장
    $(document).ready(function(){
    var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
    $("input[name=memberId]").val(userInputId); 
     
    if($("input[name=memberId]").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#idSaveCheck").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#idSaveCheck").change(function(){ // 체크박스에 변화가 발생시
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name=memberId]").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name=memberId]").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#idSaveCheck").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name=memberId]").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
	        }
	    });
	});
 
	function setCookie(cookieName, value, exdays){
	    var exdate = new Date();
	    exdate.setDate(exdate.getDate() + exdays);
	    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
	    document.cookie = cookieName + "=" + cookieValue;
	}
	 
	function deleteCookie(cookieName){
	    var expireDate = new Date();
	    expireDate.setDate(expireDate.getDate() - 1);
	    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
	}
	 
	function getCookie(cookieName) {
	    cookieName = cookieName + '=';
	    var cookieData = document.cookie;
	    var start = cookieData.indexOf(cookieName);
	    var cookieValue = '';
	    if(start != -1){
	        start += cookieName.length;
	        var end = cookieData.indexOf(';', start);
	        if(end == -1)end = cookieData.length;
	        cookieValue = cookieData.substring(start, end);
	    }
	    return unescape(cookieValue);
	}
    
</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>