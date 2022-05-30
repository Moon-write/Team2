<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>일반회원가입</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<style>
.join-wrap{
	width: 450px;
	margin: 0 auto;
}
.form-name>th{
	font-size: 16px;
	text-align: left;
	padding-left: 10px;
}
.form-name>th>span{
	padding-left: 10px;
	font-weight: 400;
}
.form-name>.join-pass{
	padding-top: 10px;
}
.form-name>.join-name{
	padding-top: 30px;
}

.form-input>td:first-child{
	width: 450px;
}
.form-input>td:first-child>input{
	border-radius: 5px;
	border: 1px solid rgb(167, 167, 167);
	margin: 10px 0px;
}
.form-input>td>button{
	margin-left: 5px;
	padding: 0;
	width: 130px;
	height: 45px;
	font-size: 16px;
}
.form-input:last-child>td>input{
	margin-top: 55px;
	margin-bottom: 120px;
	padding: 0;
	height: 60px;
	font-size: 20px;
}
#timeLimit{
	padding-left: 10px;
}
#timeLimit>span{
	color: red;
}
.join-p{
		text-align: center;
		font-size: 18px;
}
.index-wrap{
	width: 565px;
	padding-top: 20px;
	padding-bottom: 60px;
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
.page-content-title{
	display: block;
	text-align: center;
	padding-top: 103px;
	padding-bottom: 50px;
	font-size: 36px;
	font-weight: 200;
}
.form-select-wrap{
	width: 100%;
	justify-content:space-between;
	margin: 10px 0px;
}
.form-select-wrap>select{
  width:30%;
  justify-content:space-between;
  padding: 8px 16px;
  border: 1px solid gray;
  border-radius: 4px;
  font-size: 14px;
}
.form-select-wrap>td>select{
  padding: 8px 16px;
  border: 1px solid gray;
  border-radius: 4px;
  font-size: 14px;
}
.select{
  margin: 10px 0px;
}
.input-0>td:nth-child(1){
	width:33%;
}
.input-0>td:nth-child(2){
	width:4%;
}
.input-0>td:nth-child(3){
	width:33%;
}
.input-0>td:nth-child(4){
	width:30%;
}
</style>
<body>
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<span class="page-content-title">회원가입</span>
		<div class="index-wrap">
		<ul class= "index">
			<li>───<span>1</span>회원 선택</li>
			<li class="selected">───<span>2</span>회원 정보 입력</li>
			<li>───<span>3</span>회원 가입 완료</li>
		</ul>
		</div>
		<div class="join-wrap">
			<br><br>
			<form action="/join.do" method="post">
				<table class="join-table">
					<!-- 사업자번호 -->
					<tr class="form-name">
						<th colspan="4" class="join-pass">사업자번호<span class="bizNoChk"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" name="bizNo" class="input-form" required></td>
					</tr>
					<tr class="form-name">
						<th colspan="4" class="join-pass">사업자상호명<span class="bizNameChk"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" name="bizName" class="input-form" required></td>
					</tr>
					<!-- 이메일 -->
					<tr class="form-name">
						<th colspan="4">이메일(ID)<span class="idChk"></span></th>
					</tr>
					<tr class="form-input input-0 form-select-wrap">
						<td><input type="text" name="memberId" class="input-form" required></td>
						<td>@</td>
						<td>
							<select name="emailAddress" class="input-form select ">
								<option disabled selected>이메일</option>
								<option value="@naver.com">naver.com</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@nate.com">nate.com</option>
							</select>
						</td>
						<td><button class="btn bc1 bs1" onclick="sendMail()" type="button">인증번호 받기</button></td>
					</tr>
					<tr class="form-name">
						<th colspan="4">인증번호<span class="idChkMsg"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="3"><input type="text" name="memberIdChk" class="input-form" placeholder="인증번호를 입력하세요." required></td>
						<td><button class="btn bc1 bs1" id="authBtn" type="button">확인</button></td>
					</tr>
					<tr>
						<td colspan="4"><span id="timeLimit"></span></td>
					</tr>
					<!-- 비밀번호 -->
					<tr class="form-name">
						<th colspan="4" class="join-pass">비밀번호<span class="pwChk"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="password" name="memberPw" class="input-form" required></td>
					</tr>
					<tr class="form-name">
						<th colspan="4">비밀번호 재확인<span class="pwReChk"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="password" name="memberPwRe" class="input-form" required></td>
					</tr>
					
					<!-- 이름 -->
					<tr class="form-name">
						<th colspan="4" class="join-name">이름<span class="nameChk"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" name="memberName" class="input-form" required></td>
					</tr>
					<!-- 전화번호 -->
					<tr class="form-name">
						<th colspan="4">전화번호<span class="phoneChk"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" name="memberPhone" class="input-form" placeholder="ex) 010-1234-1234" required></td>
					</tr>
					<!-- 주소 -->
					<tr class="form-name">
						<th colspan="4">주소</th>
					</tr>
					<tr class="form-input">
						<td colspan="3"><input type="text" id="member_postcode" name="member_postcode" class="input-form" placeholder="우편번호" readonly required></td>
						<td><button class="btn bc2 bs1" id="address_kakao" onclick="execDaumPostcode()" value="우편번호 찾기" type="button">우편번호 찾기</button></td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" id="member_addr1" name="member_addr1" class="input-form" placeholder="주소" readonly required></td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" id="member_addr2" name="member_addr2" class="input-form" placeholder="상세주소" required></td>
					</tr>
					<!-- 생년월일 -->
					<tr class="form-name">
						<th colspan="4">생년월일</th>
					</tr>
					<tr class="form-input">
						<td colspan="4">
							<div class="form-select-wrap select">
								<select class="birthday-year" required>
								</select>
								/ 
								<select class="birthday-month" required>
								</select>
								/
								<select class="birthday-day" required>
								</select>
							</div>
						</td>
					</tr>
					<!-- 성별 -->
					<tr class="form-name">
						<th colspan="4">성별</th>
					</tr>
					<tr class="form-input form-select-wrap select"">
						<td colspan="4">
							<select name="gender" class="input-form select" required>
								<option disabled selected>성별</option>
								<option value="female">여성</option>
								<option value="male">남성</option>
							</select>
						</td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="submit" class="bc5 bs4" id="join-submit" value="가입하기"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<p class="join-p" style="color:#333; font-size:18px;">
	이미 가입된 회원이라고 나오시나요?<br>
	이메일로 비밀번호를 찾을 수 있습니다.
	</p>
	<br><br>
	<p class="join-p" ><a href="/passReset.do" style="color:#ccc;">비밀번호 찾으러 가기</a></p>
	<br><br><br><br>
		
	<script>
		//아이디 중복체크
		$("[name=memberId]").on("change",function(){
			const memberId = $(this).val();
			$.ajax({
				url : "/idCheck.kh",
				data : {memberId : memberId},
				success : function(data){
					if(data == 0){
						$(".idChk").text("사용 가능한 이메일입니다.");
						$(".idChk").css("color","blue");
					}else{
						$(".idChk").text("이미 가입된 이메일입니다.");
						$(".idChk").css("color","red");
					}
				}
			});
		});
		//사업자 번호 API
		var data = {
		    "b_no": ["2208162517"] // 사업자번호 "xxxxxxx" 로 조회 시,
		   }; 
		  console.log(data);
		$("[name=bizNo]").on("change",function(){
			$.ajax({
				  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=nULoJ90g2NsBoSIxzRYcZJntXFgbU8jLZp7vppurDRP0CzdTTjFzM7D7FcLQiFKB7OhG8Fuyy%2BRPO9%2B8bnScHw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
				  type: "POST",
				  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
				  dataType: "JSON",
				  contentType: "application/json",
				  accept: "application/json",
				  success: function(result) {
				      console.log(result);
				      const span = $(".bizNoChk");
				      const text = span.append("사용가능한 사업자번호입니다.");
				  },
				  error: function(result) {
				      console.log(result.responseText); //responseText의 에러메세지 확인
				  }
			});
		});
		
		//다음 주소찾기 API
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		            	document.getElementById("member_postcode").value = data.zonecode; //우편번호 넣기
		                document.getElementById("member_addr1").value = data.address; // 주소 넣기
		                document.querySelector("input[name=member_addr2]").focus(); //상세입력 포커싱
		                console.log(data);
		            }
		        }).open();
		    });
		}
		
		const checkArr = [false,false,false,false,false,false,false,false,false];
		let authChk = 0;
		
		//아이디 형식체크
		/*
		const id = $("[name=memberId]");
		id.on("change",function(){
			const emailReg = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,20}@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z]){3,20}.[a-zA-Z]{2,3}$/i;
			const idVal = id.val();
			if(idVal.match(emailReg) != null){
				$(".idChkMsg").text("올바른 형식의 이메일입니다.");
				$(".idChkMsg").css("color","green");
				checkArr[0] = true;
			}else{
				$(".idChkMsg").text("이메일 형식을 확인하여주세요.");
				$(".idChkMsg").css("color","red");
				checkArr[0] = false;
			};
		});
		*/
		//아이디 중복체크
		$("[name=memberId]").on("change",function(){
			const memberId = $(this).val();
			$.ajax({
				url : "/idCheck.kh",
				data : {memberId : memberId},
				success : function(data){
					if(data == 0){
						$(".idChk").text("사용 가능한 이메일입니다.");
						$(".idChk").css("color","blue");
					}else{
						$(".idChk").text("이미 가입된 이메일입니다.");
						$(".idChk").css("color","red");
					}
				}
			});
		});
		//비밀번호 재확인 일치체크
		$("[name=memberPwRe]").on("change",function(){
			const pwVal = $("[name=memberPw]").val();
			const pwReVal = $("[name=memberPwRe]").val();
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
		
		const pw = $("[name=memberPw]");
		pw.on("change",function(){
			const pwReg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,15}$/;
			const pwVal = pw.val();
			if(pwVal.match(pwReg) != null){
				$(".pwChkMsg").text("사용할 수 있는 패스워드 입니다.");
				$(".pwChkMsg").css("color","green");
				checkArr[1] = true;
			}else{
				$(".pwChkMsg").text("6자~15자 영어, 숫자, 특수기호를 사용하세요.");
				$(".pwChkMsg").css("color","red");
				checkArr[1] = false;
			};
			const pwReVal = $("[name=memberPwRe]").val();
			if(pwReVal != ""){
				if(pwVal == pwReVal){
					$(".pwReChkMsg").text("두 비밀번호가 일치합니다.");
					$(".pwReChkMsg").css("color","green");
					checkArr[2] = true;
				}else{
					$(".pwReChkMsg").text("두 비밀번호가 일치하지 않습니다.");
					$(".pwReChkMsg").css("color","red");
					checkArr[2] = true;
				}	
			}
		});
		

		
		const name = $("[name=memberName]");
		name.on("change",function(){
			const nameReg = /^[가-힣]{2,6}$/;
			const nameVal = name.val();
			if(nameVal.match(nameReg) != null){
				$(".nameChkMsg").text("사용할 수 있는 이름입니다.");
				$(".nameChkMsg").css("color","green");
				checkArr[3] = true;
			}else{
				$(".nameChkMsg").text("이름은 2~6 글자의 한글만 입력가능합니다.");
				$(".nameChkMsg").css("color","red");
				checkArr[3] = false;
			};
		});
				
		const phone = $("[name=memberPhone]");
		phone.on("change",function(){
			const phoneReg = /^010-?([0-9]{4})-?([0-9]{4})$/;
			const phoneVal = phone.val();
			if(phoneVal.match(phoneReg) != null){
				$(".phoneChkMsg").text("사용할 수 있는 연락처입니다.");
				$(".phoneChkMsg").css("color","green");
				checkArr[5] = true;
			}else{
				$(".phoneChkMsg").text("연락처 형식을 맞춰주세요 010-XXXX-XXXX");
				$(".phoneChkMsg").css("color","red");
				checkArr[5] = false;
			};
		});
		
		let mailCode;
		function sendMail(){
			if(checkArr[0]){
				const email = $("[name=memberId]").val();
				const title = "입력하신 아이디를 조회중입니다.";
				const icon = "info";
				const msgTime = 6500;
				toastShow(title,icon,msgTime);
				$.ajax({
					url : "/sendMail.do",
					data : {email:email},
					type : "post",
					success : function(data){
						if(data == "null"){
							const title = "이미 가입된 이메일입니다.";
							const icon = "warning";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
						}else{
							const title = "입력하신 이메일로 인증번호가 발송되었습니다.";
							const icon = "success";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
							mailCode = data;
							authTime();	
						}
					},
					error : function(){
						console.log("sendMail 에러");
					}
				});
				let intervalId;
				function authTime(){
					$("#timeLimit").html("<span id='min'>3</span> : <span id='sec'>00</span>");
					intervalId = window.setInterval(function(){
						timeCount();
					},1000);
				}
				function timeCount(){
					const min = Number($("#min").text());
					const sec = $("#sec").text();
					if(sec == "00"){
						if(min == 0){
							mailCode = null;
							clearInterval(intervalId);
						}else{
							$("#min").text(min-1);
							$("#sec").text(59);
						}
					}else{
						const newSec = Number(sec)-1;
						if(newSec<10){
							$("#sec").text("0"+newSec);
						}else{
							$("#sec").text(newSec);
						}
					}
				}
				$("#authBtn").on("click",function(){
					const msg = $("#timeLimit");
					if(mailCode == null){
						msg.text("인증시간이 만료되엇습니다.");
						msg.css("color","red");
					}else{
						if($("[name=memberIdChk]").val() == mailCode){
							if(confirm("인증이 성공하였습니다. 이 아이디를 사용하시겠습니까?")){
								$("[name=memberId]").attr("readonly",true);
								clearInterval(intervalId);
								msg.text("");
								authChk++;
							}
						}else{
							const title = "인증코드를 확인하세요";
							const icon = "warning";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
						}
					}
				});
			}
		}
		
		
		$("#join-submit").on("click",function(e){
			let count = 0;
			for(let i = 0;i<checkArr.length;i++){
				if(checkArr[i]){
					count++;
				}
			}
			if(count != 6 || authChk < 2){
				e.preventDefault();
			}
		})
		
		//생년월일 시작
		let userBirthdayYear = document.querySelector('.birthday-year');
		let userBirthdayMonth = document.querySelector('.birthday-month');
		let userBirthdayDay = document.querySelector('.birthday-day');
		
		function createOptionForElements(elem, val) {
		  let option = document.createElement('option');
		  option.text = val;
		  option.value = val;
		  elem.appendChild(option);
		}
		
		
		for(let i = 1920; i <= 2022; i++) {
		  createOptionForElements(userBirthdayYear, i);
		}
		for(let i = 1; i <= 12; i++) {
		  createOptionForElements(userBirthdayMonth, i);
		}
		for(let i = 1; i <= 31; i++) {
		  createOptionForElements(userBirthdayDay, i);
		}
		
		function changeTheDay() {
		  userBirthdayDay.innerHTML = '';
		
		  let lastDayOfTheMonth = new Date(userBirthdayYear.value, userBirthdayMonth.value, 0).getDate();
		
		  for(let i = 1; i <= lastDayOfTheMonth; i++) {
		    createOptionForElements(userBirthdayDay, i);
		  }
		}
		userBirthdayYear.addEventListener('change', function() {
		  changeTheDay();
		});
		userBirthdayMonth.addEventListener('change', function() {
		  changeTheDay();
		});
		//생년월일 끝
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>