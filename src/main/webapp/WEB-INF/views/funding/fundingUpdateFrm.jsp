<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩상품 수정</title>

<style>
.main{
    padding: 0;
    margin: 0 auto;
    width: 1200px;
    background-color: aqua;
    overflow: hidden;
}
.basic-information{

    width: 200px;
    float: left;
    
}
.basic-information>span{
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 20px;
    font-weight: bold;
    

}

.input-value{
    width: 960px;

    background-color: royalblue;
    float: left;
    padding-left: 40px;
}
.input-value>div{
    margin: 20px;
}

.detail-information{

    width: 200px;
    float: left;
}
.detail-information>span{
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 20px;
    font-weight: bold;  
}
.input-detail{
    width: 1000px;
    background-color: blueviolet;
    float: left;
}
th{
    font-size: 20px;
    font-weight: bold;
}


.funding-basic>table{
    width: 500px;
    background-color: brown;
    border-collapse: separate;
     border-spacing: 0 10px;
}

.funding-basic>table th{
    width: 30%;
}

table{
    border-collapse: separate;
     border-spacing: 10px 10px;
}

.main-img-div{
	width:100px;
	height:100px;
	border: 1px solid black;
}
.main-imgView{
	width:100px;
	height:100px;
	background-color: crimson;
}
.input-file-button{
    width: 100px;
    height: 100px;
}
.insert-button{
	margin: 20px 0;
}

	
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
<!-- 써머노트 -->
<script src="/resources/js/summernote-lite.js"></script>
<script src="/resources/js/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="/resources/css/summernote-lite.css">

<!-- jquery_datepicker -->
<!-- jQuery UI CSS파일 -->
<!--<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css">-->
<!-- jquery 기본 js 파일 -->
<!--<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>-->
<!-- jQuery UI 라이브러리 js파일 -->
<!--<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>-->

<link rel="stylesheet" type="text/css" href="/resources/js/funding/jquery.datetimepicker.css"/ >
<!-- <script src="/jquery.js"></script> 제이쿼리 헤더랑 중복이라 안써도 될 것 같음.-->
<script src="/resources/js/funding/jquery.datetimepicker.full.min.js"></script>

	<div class="main">
		<form action="/fundingUpdate.kh" method="post" enctype="multipart/form-data">
	        <h1>펀딩상품 수정</h1>
	        <hr>
	        <div class="basic-information"><span>기본정보</span></div>
	        <div class="input-value">
	            <div class="funding-basic">
	            <!-- <input type="hidden" name="memberNo" value="${session.m.memberNo }"> -->
	            <input type="hidden" name="fundingNo" value="${f.fundingNo }">
	                <table>
	                    <tr>
	                        <th>펀딩 프로젝트명</th><td><input type="text" class="input-form" name="fundingName" type="text" value="${f.fundingName }"></td>
	                    </tr>
	                    <tr>
	                        <th>회사명</th><td><input type="text" class="input-form" type="text" name="bizName" value="${f.bizName}"></td>
	                    </tr>
	                    <tr>
	                        <th>카테고리</th>
	                        <td><select class="input-form" name="fundingCategory">
	                            <option value="카테고리선택" <c:if test="${f.fundingCategory eq '카테고리선택' }">selected </c:if>>카테고리 선택</option>
	                            <option value="테크가전" <c:if test="${f.fundingCategory eq '테크가전' }">selected </c:if>>테크가전</option>
	                            <option value="식품" <c:if test="${f.fundingCategory eq '식품' }">selected </c:if>>식품</option>
	                            <option value="패션잡화" <c:if test="${f.fundingCategory eq '패션잡화' }">selected </c:if>>패션잡화</option>
	                            <option value="뷰티" <c:if test="${f.fundingCategory eq '뷰티' }">selected </c:if>>뷰티</option>
	                            <option value="홈리빙" <c:if test="${f.fundingCategory eq '홈리빙' }">selected </c:if>>홈리빙</option>
	                        </select>
	                        </td>
	                    </tr>
	                </table>
	            </div>
				
	            <div class="optionListPrice">
	                <table border="1">
	                    <tr id="optionListPrice-table-tr">
	                        <th>옵션명</th><th>가격(원)</th>
	                    </tr>
	                    	<c:forEach items="${optionList }" var="fop">
	                    <tr>
	                    	<td><input type="text" class="input-form" name="fundingOptionList" value="${fop.fundingOptionList }"></td><td><input type="text" class="input-form" name="fundingOptionPrice" value="${fop.fundingOptionPrice }"></td>
	                    </tr>
	                    </c:forEach>
	                </table>
	            </div>
	
	            <div>
	                <div class="main-img">
						<input type="file" name="upfile" accept=".jpg,.png,.jpeg,.gif" multiple>
					</div>
					<c:forEach items="${filelist }" var="file">
					<span>${file.fundingFilePath}</span>
					</c:forEach>
	                <div class="sub-img"><img></div>
	                <div class="sub-img"><img></div>
	                <div class="sub-img"><img></div>
	                <div class="sub-img"><img></div>
	            </div>
	
	            <div class="funding-end-table">
	                <table>
	                    <tr>
	                        <th>펀딩 종료일</th><td><input id="datetimepicker" type="text" class="input-form" name="fundingEndDate" value="${f.fundingEndDate }"></td>
	                    </tr>
	                    <tr><td><br></td></tr>
	                    <tr>
	                        <th>펀딩 목표 금액</th><td><input type="text" class="input-form" name="fundingSum" value="124567890"></td><td>원</td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	
	        <hr>
	        <div class="detail-information"><span>상세정보</span></div>
	        <div class="input-detail">
	            <div class="summernote-detail">
	                <textarea id="summernote" name="fundingDetail">${f.fundingDetail }</textarea>
	            </div>
	            <div class="insert-button">
			        <input type="submit" class="btn bc1" id="insertButton" value="수정하기">
			        <input type="button" class="btn bc11" value="취소하기">
			        <input type="button" class="btn bc2" value="미리보기(시간나면)">
		        </div>
	        </div>
	    </form>
    </div>    
<%@include file="/WEB-INF/views/common/footer.jsp" %>	



<script>

	 //써머노트
	 $(function(){
	 $("#summernote").summernote({
		height:800,
		lang : "ko-KR",
		callbacks:{//이미지 올릴 때 데이터베이스에 아작스 이용해서 업로드
			onImageUpload : function(files){ //이미지가 업로드 되면 files에 들어옴
				uploadImage(files[0],this); //그 이미지를 이 함수를 통해 처리한다.
			}
		}
	 });
	 
	 function uploadImage(file,editor){ //editor는 위에 this
		 //ajax를통해 서버에 이미지를 업로드하고 업로드경로를 받아옴
		 //form태그와 동일한 효과를 내는 formData개체 새성
		 const form = new FormData();
		 form.append("file",file);//"fundingDetail"이라는 네임으로 file을 전송
		 $.ajax({
			 url : "/fundingInsertSummernote.kh",
			 type: "post",
			 data : form,
			 processData : false,  //아작스로 파일업로드 하려면 꼭 필요
			 contentType : false,  //아작스로 파일업로드 하려면 꼭 필요
			 success : function(data){
					//결과로 받은 이미지파일 경로를 에디터에 추가
					$(editor).summernote("insertImage",data);//*****insertImage도 변수이름에 맞게 나중에 조정
			 }
		 });
	 
	 }

		 //processData : 기본값 true {key1:value1, key2:value2}
		 //  ->>기본 strig 데이터로 보내야하는데 파일형태로 전송하기 위해서 false사용해서 기본값 제거
		 //contentType : 기본값 "application/x-www-form-urlencoded;charset=UTF-8"
		 //->form 태그 전송시 enctype의 기본값임
		 //			->enctype="multipart/form-data"로 설정하기 위해 기본값을 제거 그럼 자동으로 폼데이타로 변경
		});
	 
	//datetimepicker
	//https://xdsoft.net/jqplugins/datetimepicker/
	$(function(){
		$("#datetimepicker").datetimepicker({
		   dateTimeFormat: "dddd, MMMM dd, yyyy hh-mm-ss tt",
		   timePopupWidth: "150px",
		   timeDisplayFormat: "hh:mm:ss tt",
		   width: '300px',
		   minDate:'+1970/01/02'
		   
		});
		
		//콘솔용
		$("#datetimepicker").on("change",function(){
			console.log($("#datetimepicker").val());
			console.log(typeof $("#datetimepicker").val());
		});
		$("[name=fundingCategory]").on("change",function(){
			console.log(typeof $("[name=fundingCategory]").val());
			console.log(typeof $("[name=fundingOptionValue]").val());
			console.log(typeof $("[name=fundingOptionList]").val());
			console.log(typeof $("[name=fundingSum]").val());
		});

	});
</script>
<style>
    .input-form{
        height: 40px;
        padding: 0;
        margin: 0;
        padding-left: 10px;
        font-size: 15px;
    }
</style>	
</body>
</html>