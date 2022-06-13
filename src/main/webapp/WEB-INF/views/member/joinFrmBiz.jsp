<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자회원가입</title>
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
  padding: 12px 16px;
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
	<!-- date-picker사용을 위한 jquery ui/css(jquery 선언 후 위치해야함) -->
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<div class="page-content">
		<span class="page-content-title">사업자 회원가입</span>
		<div class="index-wrap">
		<ul class= "index">
			<li>───<span>1</span>회원 선택</li>
			<li class="selected">───<span>2</span>회원 정보 입력</li>
			<li>───<span>3</span>회원 가입 완료</li>
		</ul>
		</div>
		<div class="join-wrap">
			<br><br>
			<form action="/joinMember.kh" method="post">
				<table class="join-table">
					<!-- 멤버레벨 -->
						<input type="hidden" name="memberLevel" value="1" class="input-form" >
					<!-- 사업자번호 -->
					<tr class="form-name">
						<th colspan="4" class="join-pass" required>사업자번호<span class="bizNoChk"></span></th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" name="bizNo" class="input-form" placeholder="사업자번호를 입력하세요(숫자 10자리만 가능)" required></td>
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
						<td>
						<input type="hidden" name="memberId" class="input-form">
						<input type="text" name="emailId" class="input-form" required></td>
						<td>@</td>
						<td>
							<select name="emailAddr" class="input-form select" required>
								<option value="" disabled selected>이메일</option>
								<option value="@naver.com">naver.com</option>
								<option value="@gmail.com">gmail.com</option>
								<option value="@nate.com">nate.com</option>
							</select>
						</td>
						<td><button class="btn bc1 bs1" name="authSendBtn">인증번호 받기</button></td>
					</tr>
					<tr class="form-name">
						<th colspan="4">인증번호<span class="authMsg"></span></th>
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
						<td colspan="3"><input type="text" id="memberPostcode" name="memberPostcode" class="input-form" placeholder="우편번호" readonly required></td>
						<td><button class="btn bc2 bs1" id="address_kakao" value="우편번호 찾기" type="button">우편번호 찾기</button></td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" id="memberAddr1" name="memberAddr1" class="input-form" placeholder="주소" readonly required></td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" id="memberAddr2" name="memberAddr2" class="input-form" placeholder="상세주소" required></td>
					</tr>
					<!-- 생년월일 -->
					<tr class="form-name">
						<th colspan="4">생년월일</th>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="text" id="datepicker" class="input-form" name="memberBirth" required></td>
					</tr>
					<!-- 성별 -->
					<tr class="form-name">
						<th colspan="4">성별</th>
					</tr>
					<tr class="form-input form-select-wrap select"">
						<td colspan="4">
							<select name="memberGender" class="input-form select" required>
								<option value="" disabled selected>성별</option>
								<option value="여성">여성</option>
								<option value="남성">남성</option>
							</select>
						</td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="submit" class="bc5 bs4" id="join-submit" value="가입하기"></td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="button" class="bc2 bs4" id="join-check" value="체크버튼"></td>
					</tr>
					<tr class="form-input">
						<td colspan="4"><input type="button" class="bc3 bs4" id="join-final" value="최종확인"></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<br><br><br><br><br><br>
		
	<script>
	//전체 input체크
	const checkArr = [false,false,false,false,false,false,false,false,false,false,false,false,false];//13
	//인증 체크
	let authChk = 0;//1
	
	//사업자 번호 API+정규식
	const bizNo = $("[name=bizNo]");
	bizNo.on("change",function(){
		const bizNoReg = /^[0-9]{10}$/;
		const bizNoVal = bizNo.val();
		//사업자번호가 정규표현식을 통과한다면 ajax실행
		if(bizNoReg.test(bizNoVal)){
			var data = {
				    "b_no": [bizNoVal] // 사업자번호 "xxxxxxx" 로 조회 시,
				   }; 
			$.ajax({
				  url: "https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=nULoJ90g2NsBoSIxzRYcZJntXFgbU8jLZp7vppurDRP0CzdTTjFzM7D7FcLQiFKB7OhG8Fuyy%2BRPO9%2B8bnScHw%3D%3D",  // serviceKey 값을 xxxxxx에 입력
				  type: "POST",
				  data: JSON.stringify(data), // json 을 string으로 변환하여 전송
				  dataType: "JSON",
				  contentType: "application/json",
				  accept: "application/json",
				  success: function(result) {
					  const bizState = result.data[0].b_stt; // 사업자번호 있으면 값있고 없으면 null임
				      if(bizState == ''){
				    	  const span = $(".bizNoChk");
					      const text = span.text("등록되지않은 사업자번호입니다.").css("color","red");
				      }else{
				      const span = $(".bizNoChk");
				      const text = span.text("사용가능한 사업자번호입니다.").css("color","blue");
				      if(!confirm("이 사업자번호를 사용하시겠습니까?")){
				    	    $("[name=bizNo]").val('');
				    	    $("[name=bizNo]").focus();
				    	}else{
				    	    $("[name=bizNo]").attr("readonly",true);
				    	    checkArr[0] = true;
				    	}
				      }
				  },
				  error: function(result) {
				      console.log(result.responseText); //responseText의 에러메세지 확인
				  }
			});//사업자번호 ajax끝
		}else{ //정규표현식 통과하지 못하면 메세지 출력
			$(".bizNoChk").text("사업자번호는 공백없는 10자리 숫자만 가능합니다.");
			$(".bizNoChk").css("color","red");
		};
	});
		//사업자 상호명 정규식(1~200자 한글/영어대소/공백/숫자/특수문자 다 가능)
		const bizName = $("[name=bizName]");
		bizName.on("change",function(){
			const bizNameReg = /[a-z0-9가-힣`~!@#$%^&*()-_=+\s]{1,200}/i;
			const bizNameVal = bizName.val();
			if(bizNameReg.test(bizNameVal)){
				$(".bizNameChk").text("사용할 수 있는 상호명 입니다.");
				$(".bizNameChk").css("color","blue");
				checkArr[1] = true;
			}else{
				$(".bizNameChk").text("상호명은 최대 영어 200자/한글 66자까지 가능합니다.");
				$(".bizNameChk").css("color","red");
				checkArr[1] = false;
			}
		});
		//다음 주소찾기 API
		const postcode = document.getElementById("memberPostcode").value;
		const addr1 = document.getElementById("memberAddr1").value;
		const addr2 = document.getElementById("memberAddr2").value;
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면 카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		            	document.getElementById("memberPostcode").value = data.zonecode; //우편번호 넣기
		                document.getElementById("memberAddr1").value = data.address; // 주소 넣기
		                if(postcode != null && addr1 != null){
		                	checkArr[8] = true;
				    		checkArr[9] = true;
		                }
		                console.log(data);
		                console.log(data.zonecode);//우편번호
		                console.log(data.address);//도로명주소(상세주소는 입력받음)
		            }
		        }).open();
                document.getElementById("memberAddr2").focus(); //상세입력 포커싱
                if(addr2 != null){
                	checkArr[10] = true;
                }else{
                	checkArr[10] = false;
                }
		    });
		};
		//비밀번호 정규식
		const pw = $("[name=memberPw]");
		pw.on("change", function(){
			const pwReg = /[a-zA-Z0-9]{4,6}/;
			const pwVal = pw.val();
			if(pwReg.test(pwVal)){
				$(".pwChk").text("사용할 수 있는 패스워드 입니다.");
				$(".pwChk").css("color","blue");
				checkArr[4] = true;
			}else{
				$(".pwChk").text("4자~6자 영어대소문자 또는 숫자를 사용하세요.");
				$(".pwChk").css("color","red");
				checkArr[4] = false;
			}
		});
		//비밀번호 일치확인
		const pwRe = $("[name=memberPwRe]");
		pwRe.on("change", function(){
			const pwVal = $("[name=memberPw]").val();
			const pwReVal = pwRe.val();
			if(pwVal == pwReVal){
				$(".pwReChk").text("두 비밀번호가 일치합니다.");
				$(".pwReChk").css("color","blue");
				checkArr[5] = true;
			}else{
				$(".pwReChk").text("두 비밀번호가 일치하지 않습니다.");
				$(".pwReChk").css("color","red");
				checkArr[5] = false;
			}
		});
		
		//회원 이름 정규식(2~7자 한글)
		const name = $("[name=memberName]");
		name.on("change",function(){
			const nameReg = /^[가-힣]{2,7}$/;
			const nameVal = name.val();
			if(nameReg.test(nameVal)){
				$(".nameChk").text("사용할 수 있는 이름입니다.");
				$(".nameChk").css("color","blue");
				checkArr[6] = true;
			}else{
				$(".nameChk").text("이름은 2~7 글자의 한글만 가능합니다.");
				$(".nameChk").css("color","red");
				checkArr[6] = false;
			};
		});
		//휴대폰번호 정규식		
		const phone = $("[name=memberPhone]");
		phone.on("change",function(){
			const phoneReg = /^010-?([0-9]{4})-?([0-9]{4})$/;
			const phoneVal = phone.val();
			if(phoneReg.test(phoneVal)){
				$(".phoneChk").text("사용할 수 있는 연락처입니다.");
				$(".phoneChk").css("color","blue");
				checkArr[7] = true;
			}else{
				$(".phoneChk").text("연락처 형식을 맞춰주세요.(010-1234-1234)");
				$(".phoneChk").css("color","red");
				checkArr[7] = false;
			};
		});
		//이메일 정규식		
		const mailId = $("[name=emailId]");
		mailId.on("change", function(){
			const mailIdReg = /\w{2,49}/;
			const mailIdVal = mailId.val();
			if(mailIdReg.test(mailIdVal)){
				$(".idChk").text("메일주소 선택 후 인증을 완료해주세요.");
				$(".idChk").css("color","blue");
				checkArr[7] = true;
			}else{
				$(".idChk").text("영어소문자 및 숫자만 입력 가능합니다.");
				$(".idChk").css("color","red");
				checkArr[7] = false;
			};
		});
		//인증메일 받기
		let mailCode;
		$("[name=authSendBtn]").on("click", function(){
			//이메일주소 선택
			const emailId = $("[name=emailId]").val();
			const emailAddr = $("[name=emailAddr]").val();
			const email = emailId+emailAddr;
			console.log(email);
			if(emailId != '' && emailAddr != null){
				const title = "입력하신 아이디를 조회중입니다.";
				$.ajax({
					url : "/sendMail.kh",
					data : {email : email},
					type : "post",
					success : function(data){
						if(data == "null"){
							alert("이미 가입된 이메일입니다.");
						}else{
							alert("입력하신 이메일로 인증번호가 발송되었습니다.");
							/*
							const title = "입력하신 이메일로 인증번호가 발송되었습니다.";
							const icon = "success";
							const msgTime = 2500;
							toastShow(title,icon,msgTime);
							*/
							mailCode = data;
							console.log(mailCode);
							console.log(data);
							authTime();	
						}
					},
					error : function(){
						console.log("sendMail 에러");
					}
				});//ajax끝
				
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
						msg.text("인증시간이 만료되었습니다.");
						msg.css("color","red");
					}else{
						if($("[name=memberIdChk]").val() == mailCode){
							console.log(mailCode);
							if(confirm("인증이 성공하였습니다. 이 아이디를 사용하시겠습니까?")){
								$("[name=emailId]").attr("readonly",true);
								$("[name=emailAddr] option:selected").siblings().hide();
								$("[name=memberIdChk]").attr("readonly",true);
								$("[name=memberId]").val(email);
								clearInterval(intervalId);
								msg.text("");
								authChk++;
								checkArr[2] = true;
								checkArr[3] = true;
							}
						}else{
							console.log($("[name=memberIdChk]").val());
							console.log(mailCode);
							alert("인증코드를 확인하세요");
						}
					}
				});
			}else{//이메일 id나 주소 입력x 시
				alert("이메일 주소를 확인하세요.");
			}
		});
		
	   //달력 API
	   $(function() {
       //input을 datepicker로 선언
       $("#datepicker").datepicker({
           dateFormat: 'yy-mm-dd' //달력 날짜 형태
           ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true // 월- 년 순서가아닌 년도 - 월 순서
           ,changeYear: true //option값 년 선택 가능
           ,changeMonth: true //option값  월 선택 가능                
           ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //버튼 이미지만 깔끔하게 보이게함
           ,buttonText: "선택" //버튼 호버 텍스트              
           ,yearSuffix: "년" //달력의 년도 부분 뒤 텍스트
           ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip
           ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 텍스트
           ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 Tooltip
           ,minDate: "-70Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
           ,maxDate: "-14Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후) 
       	   ,yearRange: "1930:2022"
       	   
       }); 
       
       //초기값을 오늘 날짜로 설정해줘야 합니다.
       $('#datepicker').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)            
      });
	   //datePicker 날짜값 얻어오기
	   $(function() {
            $( "#datepicker" ).datepicker();
            
            $("#datepicker").val();
            
            $("#datepicker").on("change",function(){
                const selected = $(this).val();
                alert("생년월일이 "+selected+" 맞습니까?");
                $("#datepicker").val(selected);
                checkArr[11] = true;
            });
         });
	   
		 //회원가입 버튼
			$("#join-submit").on("click",function(e){
				let count = 0;
				for(let i = 0;i<checkArr.length;i++){
					if(checkArr[i]){
						count++;
					}
				}
				if(count != 13 || authChk < 1){
					e.preventDefault();//form의 submit을 중단시키는 코드
					alert("모든 항목을 입력해야 합니다.");
				}
			});
		 
		 //성별
		 const gender = $("select[name=memberGender]");
		 gender.on("change", function(){
		  if(gender.val() != null){
			  checkArr[12] = true;
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
		   console.log("1. 사업자번호 : "+$("[name=bizNo]").val());
		   console.log("2. 사업자이름 : "+$("[name=bizName]").val());
		   console.log("3. 이메일(풀값) : "+$("[name=memberId]").val());
		   console.log("4. 메일주소 : "+$("[name=emailAddr]").val());
		   console.log("5. 비밀번호 : "+$("[name=memberPw]").val());
		   console.log("6. 비밀번호확인 : "+$("[name=memberPwRe]").val());
		   console.log("7. 이름 : "+$("[name=memberName]").val());
		   console.log("8. 전화번호 : "+$("[name=memberPhone]").val());
		   console.log("9. 우편번호 : "+$("[name=memberPostcode]").val());
		   console.log("10. 주소 : "+$("[name=memberAddr1]").val());
		   console.log("11. 상세주소 : "+$("[name=memberAddr2]").val());
		   console.log("12. 생년월일 : "+$("[name=memberBirth]").val());
		   console.log("13. 성별 : "+$("[name=memberGender]").val());
	   });
		
	 //토스트 알림 함수		
		function toastShow(title,icon,msgTime){
			const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: msgTime,
		    timerProgressBar: true,
		    didOpen: (toast) => {
		     // toast.addEventListener('mouseenter', Swal.stopTimer)
		      toast.addEventListener('mouseleave', Swal.resumeTimer)
		    }
		 	})
		
		  Toast.fire({
		    title: title,
		    icon: icon
		  })
		}//토스트 끝
	</script>
	<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>