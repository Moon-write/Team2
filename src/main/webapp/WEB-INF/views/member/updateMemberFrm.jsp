<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
<style>
.info-tbl{
	margin: 0 auto;
	margin-top: 170px;
}
.info-tbl input{
	width: 360px;
	display:inline;
}
#memberId{
	color: #757279;
}
.info-tbl tr>td:first-child{
	width: 20%;
}
.info-tbl tr:nth-child(2)>td:last-child{
	text-align: left;
	text-decoration: underline;
}
.info-tbl tr:last-child a{
	text-decoration: underline;
}
.updateInfo-btn{
	width: 100%;
	height: 50px;
	font-size: 18px;
	border: none;
	margin-bottom: 100px;
}
.check-msg{
	text-align: left;
	color: #c87431;
	font-size: 12px;
	height: 30px;
	padding-left: 10px;
	vertical-align: top;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.3.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
<!-- 회원정보 관리 페이지입니다. -->
	<%@ include file="/WEB-INF/views/common/header.jsp" %>
	<div class="page-content">
		<div class="flex-wrap">
			<%@include file="/WEB-INF/views/member/mypage_common.jsp"%>
			<div class="mypage-content">
				<div class="mypage-content-title">내정보관리</div>
				<div class="member-info" id="member-info">
					<form method="post">
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>이메일(ID)</td>
								<td><input class="input-form" type="text" id="memberId" value="${sessionScope.m.memberId }" readonly></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>이름</td>
								<td><input class="input-form" type="text" id="changeName" value="${sessionScope.m.memberName }"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>휴대폰번호</td>
								<td><input class="input-form" type="text" id="changePhone" value="${sessionScope.m.memberPhone }"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>주소</td>
								<td><input type="text" id="changePostcode" name="memberPostcode" class="input-form" value="${sessionScope.m.memberPostcode }" placeholder="우편번호" readonly></td>
								<td><button class="btn bc2 bs1" id="address_kakao" value="우편번호 찾기" type="button">우편번호 찾기</button></td>							
							</tr>
							<tr class="tr-3">
								<td></td>
								<td colspan="2"><input type="text" id="changeAddr1" name="memberAddr1" class="input-form" value="${sessionScope.m.memberAddr1 }" placeholder="주소" readonly></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td colspan="2"><input type="text" id="changeAddr2" name="memberAddr2" class="input-form" value="${sessionScope.m.memberAddr2 }" placeholder="상세주소"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>생년월일</td>
								<td colspan="2"><input class="input-form" type="text" id="changePhone" value="${sessionScope.m.memberBirth }" readonly></td>				
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>성별</td>
								<td colspan="2"><input class="input-form" type="text" id="changeGender" value="${sessionScope.m.memberGender }" readonly></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td colspan="2"><input type="button" class="btn bc1 updateInfo-btn" value="정보 수정하기"></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
	//다음 주소찾기 API
	window.onload = function(){
	    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	document.getElementById("changePostcode").value = data.zonecode; //우편번호 넣기
	                document.getElementById("changeAddr1").value = data.address; // 주소 넣기
	                document.getElementById("changeAddr2").focus(); //상세입력 포커싱
	                console.log(data);
	                console.log(data.zonecode);//우편번호
	                console.log(data.address);//도로명주소(상세주소는 입력받음)
	            }
	        }).open();
	    });
	}
	//정보 전송 ajax
	$(function(){
		let inputCheck = new Array(5).fill(true);
		let checkAll = true;
		$(".updateInfo-btn").on("click",function(){
			checkAll = true;
			for(let i = 0; i < inputCheck.length; i++){
				if(inputCheck[i] == false){
					checkAll = false;
				}
			}
			if(checkAll){
				const memberId = $("#memberId").val();
				const memberName = $("#changeName").val();
				const memberPhone = $("#changePhone").val();
				const memberPostcode = $("#changePostcode").val();
				const memberAddr1 = $("#changeAddr1").val();
				const memberAddr2 = $("#changeAddr2").val();
				$.ajax({
					url: "/updateMember.kh",
					type: "post",
					data: {memberId : memberId, memberName : memberName, memberPhone : memberPhone, memberPostcode : memberPostcode, memberAddr1 : memberAddr1, memberAddr2 : memberAddr2},
					success: function(data){
						if(data == "0"){
							alert("수정이 완료되었습니다.");
						}else if(data == "1"){
							alert("수정에 실패했습니다. 관리자에게 문의 바랍니다.");
						}	
					},
				})
			}else{
				alert("입력값을 확인해주세요.");
			}
		});
//유효성검사 코드
		$("#changeName").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^[가-힣]{2,5}$/;
			if(!regExp.test(value)){
				$(this).parent().parent().next().children().eq(1).text("2-7글자 한글만 입력가능합니다.");
				inputCheck[0] = false;
			}else{
				inputCheck[0] = true;
			}
		});
		$("#changePhone").change(function(){
			$(this).parent().parent().next().children().eq(1).text("");			
			const value = $(this).val();
			let regExp;
			regExp = /^\d{3}-\d{3,4}-\d{4}$/;
			if(!regExp.test(value)){
				$(this).parent().parent().next().children().eq(1).text("010-0000-0000 형식으로 입력해주세요.");
				inputCheck[2] = false;
			}else{
				inputCheck[2] = true;
			}
		});
//토스트 알림 함수		
		function toastShow(title, icon){
			const Toast = Swal.mixin({
		    toast: true,
		    position: 'center-center',
		    showConfirmButton: false,
		    timer: 1500,
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
	});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>