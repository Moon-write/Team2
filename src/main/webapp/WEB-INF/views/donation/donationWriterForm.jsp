<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 신규 작성 페이지</title>

</head>
<style>
.sub-title {
	text-align: left;
	margin: 20px;
	display: inline-block;
}

.page-content {
	text-align: center;
}

.donation-input {
	width: 80%;
	display: inline-block;
}

.donation-select {
	margin: 10px;
}

form {
	width: 100%;
}

h3 {
	margin: 0 0px;
}

.donation-content {
	margin: 10px;
	text-align: left;
}

.donation-content>* {
	display: inline-block;
}

input[type="text"] {
	font-family: inherit;
	width: 80%;
	height: 30px;
	border: 0;
	border-bottom: 1px solid black;
	outline: 0;
	font-size: 15px;
	color: black;
	padding: 1px 0;
}

input[type="date"] {
	width: 80%;
	height: 100%;
	border: none;
	color: black;
	padding: 3px;
	font-size: 15px;
}

input[type="radio"] {
	margin-left: 30px;
	margin-right: 30px;
	width: 12px;
	height: 12px;
}

select {
	border: none;
	font-size: 15px;
	width: 80%;
	height: 100%;
	text-align: center;
}

.submit-btn {
	margin: 10px;
}

.subtn {
	width: 50%;
}
input:disabled {
  background: white;
  color: #ff82ab;
}
#guide{
	display: inline-block;
}
#guide>h4{
	color: #ff82ab;
}
.content-name{
	width: 100%;
	text-align: left;
}
.note-editor .note-editing-area .note-editable {
    outline: none;
    text-align: left;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="/resources/js/summernote-lite.js"></script>
	<script src="/resources/js/lang/summernote-ko-KR.js"></script>
	<link rel="stylesheet" href="/resources/css/summernote-lite.css">

	<div class="page-content">
		<div class="donation-input">
			<div class="content-name">
				<h1 class="sub-title">기부펀딩 등록</h1>
				<span id="guide"><h4>일반기부는 천원으로 고정됩니다.</h4></span>
			</div>
			<form action="/insertDonation.kh" method="post" enctype="multipart/form-data" id="forminsert">
				<table class="tbl">
					<tr>
						<th>종류</th>
						<td colspan="4">
							<input type="radio" name="donationDivision" id="donationGeneral" value="1" checked>일반기부
							<input type="radio" name="donationDivision" id="donationCash" value="2">판매기부
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td colspan="3"><input type="text" name="donationTitle"
							id="donationTitle" class="donationTitle"></td>
					</tr>
					<tr>
						<th>카테고리</th>
						<td><select name="donationCategory" id="donationCategory">
								<option value="pet">애견</option>
								<option value="child">아동</option>
								<option value="female">여성</option>
								<option value="help">불우이웃</option>
								<option value="old">독거노인</option>
						</select></td>
						<th><label for="donationEnddate" min="0">종료날짜</label></th>
						<td><input type="date" id="donationEnddate" name="donationEnddate"></td>
					</tr>
					<tr>
						<th>상품대표이미지</th>
						<td><input type="file" name="upfile" id="upfile" multiple></td>
					</tr>
					<tr>
						<th>목표금액</th>
						<td><input type="text" name="donationTarget"
							id="donationTarget" class="donationTarget"></td>
						<th>상품가격</th>
						<td><input type="text" name="donationCash" id="donationCash" class="donationCash" value="1000" disabled></td>
					</tr>
					<tr>
						<th>내용</th>
						<td colspan="3">
						<textarea name="donationContent" id="donationContent" class="input-form" style="width:100%"></textarea></td>
					</tr>
				</table>
				<div class="submit-btn">
					<button type="submit" name="signUp" class="bc1 btn subtn">등록하기</button>
				</div>
				<!-- <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo}"> -->
			</form>
		</div>
	</div>
	<script>
		//섬머노트
		$("#donationContent").summernote({
			height : 400,
			lang : "ko-KR",
			callbacks : {
				onImageUpload : function(files) {
					uploadImage(files[0], this);
				}
			}
		});
		function uploadImage(file, editor) {

			const form = new FormData();
			form.append("file", file);
			$.ajax({
				url : "/uploadImage.kh",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data) {
					//결과로받은 이미지파일 경로를 에디터에 추가
					$(editor).summernote("insertImage", data);
				}
			});

		}
		//jquery
		$("input:radio[name=donationDivision]").click(function(){
        if($("input[name=donationDivision]:checked").val() == "1"){
            $("input:text[name=donationCash]").attr("disabled",true);
            $("input:text[name=donationCash]").val(1000);
            $("#guide").html("<h4>일반기부는 천원으로 고정됩니다.</h4>")
        }else if($("input[name=donationDivision]:checked").val() == "2"){
              $("input:text[name=donationCash]").attr("disabled",false);
              $("input:text[name=donationCash]").val(0);
              $("#guide").html(" ")
        }
    });
		
		document.getElementById('forminsert').addEventListener('submit', function(e){
            if(document.getElementById('donationTitle').value == ''){
              e.preventDefault()//제출완료 페이지로 넘어가는 것 방지
              alert('제목을 입력하세요')} 
            else if(document.getElementById('donationTitle').value.length > 16) {
                e.preventDefault()
                alert('제목은 16글자 미만으로 입력하세요')}
                
            else if(document.getElementById('donationEnddate').value == ''){
              e.preventDefault()
              alert('종료날짜를 입력하세요')}
            
            else if(document.getElementById('upfile').value == ''){
                e.preventDefault()
                alert('메인페이지 사진을 등록해주세요')}
            
            else if(document.getElementById('donationTarget').value == ''){
                e.preventDefault()
                alert('목표금액을 작성해주세요')}
            
            else if(document.getElementById('donationCash').value == ''){
                e.preventDefault()
                alert('상품금액을 입력해주세요')}
            
            else if(document.getElementById('donationContent').value == ''){
                e.preventDefault()
                alert('내용을 입력해주세요')}
 	 });
			//$('#donationEnddate').setAttribute("min",0); -> 추가 수정예정

	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>

</body>
</html>