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
				    <input type="checkbox" class="save_id" name="checkId" id="saveId" >
				    <label for="saveId">아이디 저장</label>
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
     $(function() {
           fnInit();
     });
     function frm_check(){
         saveid();
     }
    function fnInit(){
        var cookieid = getCookie("saveid");
        console.log(cookieid);
        if(cookieid !=""){
            $("input:checkbox[id='saveId']").prop("checked", true);
            $('#logId').val(cookieid);
        }
    } 
    function setCookie(name, value, expiredays) {
        var todayDate = new Date();
        todayDate.setTime(todayDate.getTime() + 0);
        if(todayDate > expiredays){
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + expiredays + ";";
        }else if(todayDate < expiredays){
            todayDate.setDate(todayDate.getDate() + expiredays);
            document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
        }
        console.log(document.cookie);
    }
    function getCookie(Name) {
        var search = Name + "=";
        console.log("search : " + search);
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            console.log("offset : " + offset);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                // set index of beginning of value
                end = document.cookie.indexOf(";", offset);
                console.log("end : " + end);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1)
                    end = document.cookie.length;
                console.log("end위치  : " + end);
                
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
    function saveid() {
        var expdate = new Date();
        if ($("#saveId").is(":checked")){
            expdate.setTime(expdate.getTime() + 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#logId").val(), expdate);
            }else{
           expdate.setTime(expdate.getTime() - 1000 * 3600 * 24 * 30);
            setCookie("saveid", $("#logId").val(), expdate);
        }
    }
</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>