<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사업자 정보 관리</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
.show-content2{
	float:left;
	margin-top:50px;
	margin-left:200px;
}
.info-tbl{
	margin: 0 auto;
	width:620px;
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
	margin-bottom: 50px;
}
.check-msg{
	text-align: left;
	color: #c87431;
	font-size: 12px;
	height: 30px;
	padding-left: 10px;
	vertical-align: top;
}
tr td{
	border:none;
}
.ui-datepicker-trigger{
	display:none;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
		<h2 style="margin-top:50px;margin-left:520px;">사업자 정보 관리</h1>
		<div class="show-content2">
			<form method="post">
						<table class="info-tbl" id="info-tbl">
							<tr class="tr-3">
								<td>사업자번호</td>
								<td><input class="input-form" type="text" id="bizNo" value="${sessionScope.m.bizNo }" readonly></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td>상호명</td>
								<td><input class="input-form" type="text" id="bizName" value="${sessionScope.m.bizName }" readonly></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>	
							<tr class="tr-3">
								<td>설립일</td>
								<td><input type="text" name="shopBirth" class="input-form datepicker" id="datepicker" value="${shop.shopBirth }" readonly></td>
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
								<td><input type="text" id="member_postcode" name="member_postcode" class="input-form" value="${sessionScope.m.memberPostcode }" placeholder="우편번호" readonly></td>
								<td><button class="btn bc2 bs1" id="address_kakao" onclick="execDaumPostcode()" value="우편번호 찾기" type="button">우편번호 찾기</button></td>							
							</tr>
							<tr class="tr-3">
								<td></td>
								<td colspan="2"><input type="text" id="member_addr1" name="member_addr1" class="input-form" value="${sessionScope.m.memberAddr1 }" placeholder="주소" readonly></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td colspan="2"><input type="text" id="member_addr2" name="member_addr2" class="input-form" value="${sessionScope.m.memberAddr2 }" placeholder="상세주소"></td>
							</tr>
							<tr>
								<td></td>
								<td class="check-msg"></td>
							</tr>
							<tr class="tr-3">
								<td></td>
								<td colspan="2"><input type="button" class="btn bc1 updateInfo-btn" value="정보 수정하기"></td>
							</tr>
							<input type="hidden" id="memberId" value="${sessionScope.m.memberId }">
						</table>
					</form>
		</div>
	</div>
	<script>
		window.onload = function(){
		    document.getElementById("address_kakao").addEventListener("click", function(){ //주소입력칸을 클릭하면
		        //카카오 지도 발생
		        new daum.Postcode({
		            oncomplete: function(data) { //선택시 입력값 세팅
		            	document.getElementById("member_postcode").value = data.zonecode; //우편번호 넣기
		                document.getElementById("member_addr1").value = data.address; // 주소 넣기
		                document.querySelector("input[name=member_addr2]").focus(); //상세입력 포커싱
		            }
		        }).open();
		    });
		}
		$(".updateInfo-btn").on("click",function(){
			const memberId = $("#memberId").val();
			const memberPostcode=$("#member_postcode").val();
			const memberAddr1 = $("#member_addr1").val();
			const memberAddr2 = $("#member_addr2").val();
			const memberPhone = $("#changePhone").val();
			const shopBirth=$("input[name=shopBirth]").val();
			$.ajax({
				url: "/updateBizMember.kh",
				type: "post",
				data: {memberId: memberId, memberPostcode:memberPostcode, memberAddr1:memberAddr1,memberAddr2:memberAddr2, memberPhone: memberPhone, shopBirth:shopBirth},
				success: function(data){
					if(data == "0"){
						alert("수정이 완료되었습니다.");
					}else if(data == "1"){
						alert("수정에 실패했습니다. 관리자에게 문의 바랍니다.");
					}	
				},
			})
		});
		$(function() {
	        $("#datepicker").datepicker({
	        	dateFormat: 'yy-mm-dd'
	                ,showOtherMonths: true
	                ,showMonthAfterYear:true
	                ,changeYear: true
	                ,changeMonth: true                
	                ,showOn: "both"  
	                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
	                ,buttonImageOnly: true
	                ,buttonText: "선택"            
	                ,yearSuffix: "년"
	                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	                ,dayNamesMin: ['일','월','화','수','목','금','토']
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	                ,minDate: "-5y"
	                ,maxDate: 0   
	        });                           
	    });
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>