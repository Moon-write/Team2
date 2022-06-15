<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩상품 등록</title>

<style>
td{
	border: none;
}
.main{
    padding: 0;
    margin: 0 auto;
    width: 1200px;

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

    float: left;
}
th{
    font-size: 20px;
    font-weight: bold;
}

.funding-basic>table{
	width: 920px;
	background-color: rgba(30, 144, 255, 0.2);
    border-collapse: separate;
     border-spacing: 0 10px;
}

.funding-basic>table th{
    width: 20%;
}

table{
    border-collapse: separate;
     border-spacing: 10px 10px;
}
.main-img{
	background-color: rgba(30, 144, 255, 0.2);
}
.main-img-div{
	width:100px;
	height:100px;
	border: 1px solid black;
}
.main-imgView{
	width:100px;
	height:100px;

}
.input-file-button{
    width: 100px;
    height: 100px;
}
.insert-button{
	margin: 20px 0;
	margin-left: 60px;
}

#optionListPrice-table-tr>th{
	width:225.33px;
	border-bottom: 2px solid #555;
}
#precaution+span{
	font-size: 13px;

	color: #555;
	
}
.chrome{
	font-size: 13px;
	margin-top: 40px;
	margin-bottom: 20px;
	color: #555;
	display: flex;
	
}
.chrome>span:nth-child(2n){
	font-weight: 900;
	
	
}
.chrome>span{
	margin-left: 3px;
}
#precaution{
	font-size: 17px;
	font-weight: 400;
	color: #555;
	
	
}

.main-tbl{
	
}
.main-tbl>tr>td{
	width: 100px;
}
.main-tbl>tr>td>input{
	width: 40px;
}
#bizName{
	width: 200px;
}
#fundingCategory{
	width: 200px;
}
#fundingOptionCount{
	width: 200px;
	
}
#fundingCategorySpan>span:nth-of-type(1){

	margin-left: 5px;
	font-size: 13px;
}
#fundingCategorySpan>span:nth-of-type(2){
	font-size: 13px;

	
}		
.option-category{
	margin-left: 10px;
}
/*파일업로드 버튼 커스텀*/
#uploadFile{
    position: absolute;
    width: 0;
    height: 0;
    padding: 0;
    overflow: hidden;
    border: 0;
}
#uploadFileLabel{
	display: inline-block;
    padding: 10px 10px;
    color: #fff;
    vertical-align: middle;
	background-color: rgb(30,144,255);
	font-size: 16px;
	line-height: 30px;
	border-radius: 5px;
    cursor: pointer;
    height: 30px;
	font-family: ns-light
	
}
.option-table{
	background-color: rgba(30, 144, 255, 0.2);
}
.optionListPrice{
	background-color: rgba(30, 144, 255, 0.2);
}
.funding-end-table{
	background-color: rgba(30, 144, 255, 0.2);
}
.note-editable{
	background-color: rgba(30, 144, 255, 0.2);
}
.optionlist-span{
	font-size: 13px;
}
.summernote-detail{
	margin-left: 60px;
	width: 780px;
	box-sizing: border-box;
}

</style>
<link rel="stylesheet" href="/resources/css/summernote-lite.css"><!-- css헤더에 넣는다. -->
</head>
<body>
<%@include file="/WEB-INF/views/common/bizHeader.jsp" %>
<!-- 써머노트 -->
<script type='text/javascript' src='http://code.jquery.com/jquery-3.6.0.js'></script>
<script src="/resources/js/summernote-lite.js"></script>
<script src="/resources/js/lang/summernote-ko-KR.js"></script>


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
		<form action="/fundingInsertFrm.kh" method="post" enctype="multipart/form-data" onsubmit="return checkAll()">
	        <h1>펀딩상품 등록</h1>
	        <hr>
	        <div class="basic-information"><span>기본정보</span></div>
	        <div class="input-value">
	            <div class="funding-basic">
	            <!-- <input type="hidden" name="memberNo" value="${session.m.memberNo }"> -->
					<div class="chrome">
						<span id="precaution"class="material-symbols-outlined">error</span>
						<span>weNeedYou</span>
						<span>은</span>
						<span>Chrome</span>
						<span>사용을 권장합니다. 이외의 브라우저 또는 </span>
						<span>Chrome</span>
						<span>하위버전으로 접속 할 경우 페이지가 깨져 보일 수 있습니다.</span>
					</div>
	                <table class="main-tbl">
	                    <tr >
	                        <th>펀딩 프로젝트명</th>
							<td colspan="2"><input type="text" class="input-form" name="fundingName" type="text"></td>
	                    </tr>
	                    <tr>
	                        <th>회사명</th><td id="bizName"><input type="text" class="input-form" type="text"  name="bizName" value="${sessionScope.m.bizName}" readonly ></td>
	                    </tr>
	                    <tr> 
	                        <th>카테고리</th>
	                        <td><select class="input-form"  id="fundingCategory" name="fundingCategory">
	                            <option value="none">카테고리 선택</option>
	                            <option value="테크가전">테크가전</option>
	                            <option value="패션잡화">패션잡화</option>
	                            <option value="홈리빙">홈리빙</option>
	                            <option value="식품">식품</option>
	                            <option value="뷰티">뷰티</option>
	                        </select>
	                        </td>
							<td id="fundingCategorySpan">
								<span id="precaution"class="material-symbols-outlined">error</span>
								<span>펀딩과 맞지 않는 카테고리에 등록할 경우, 적정 카테고리로 이동될 수 있습니다.</span>
							</td>
	                    </tr>
	                    <tr>
	                        <th>옵션명 개수</th><td>
	                            <select class="input-form" id="fundingOptionCount">
	                                <option value="1">1개</option>
	                                <option	value="2">2개</option>
	                                <option value="3">3개</option>
	                            </select>
	                        </td>
							<td id="fundingCategorySpan">
								<span id="precaution"class="material-symbols-outlined">error</span>
								<span>옵션명 개수 선택후 아래의 '옵션목록으로 적용' 버튼을 눌러주세요.</span>
							</td>
	                    </tr>    
	                </table>
	            </div>
				
	            <div class="option-table">
	                <table>
	                	<tbody>                	
		                    <tr>
		                        <th>옵션명</th><th>옵션값</th>
		                    </tr>
		                    <tr id="option-table-tr">
		                        <td><input type="text" class="input-form" name="fundingOptionName" placeholder="사이즈" ></td>
		                        <td><input type="text" class="input-form" name="fundingOptionValue" placeholder="M/L" ></td>
								<td><button type="button" class="option-category btn bc1">옵션목록으로 적용</button></td><td class="token"><span id="precaution"class="material-symbols-outlined">error</span><span> 옵션값은 '/'로 구분됩니다</span></td>
		                    </tr>
	                	</tbody>
	                </table>
	                
	            </div>
	
	            <div class="optionListPrice">
	                <table>
	                    <tr id="optionListPrice-table-tr">
	                        <th>옵션 리스트</th><th>가격(원)</th><td><td><span id="precaution"class="material-symbols-outlined">error</span>
								<span class="optionlist-span">'옵션명 개수' 선택 후 '옵션목록으로 적용'을 누르세요 </span></td></td>
	                    </tr>
	                </table>
	            </div>
	
	            <div>
	                <div class="main-img">
						<!--<input type="file" name="upfile" onchange="loadMainImg(this);" accept=".jpg,.png,.jpeg,.gif" multiple>  -->
						
						  <table>
						   
						    <tr>
						      <td >
								<label for="uploadFile" id="uploadFileLabel">펀딩 상품 이미지 업로드</label>
								<span id="precaution"class="material-symbols-outlined">error</span>
								<span>첫번째 사진이 '메인 이미지' 입니다.</span>
						        <input type="file" name="upfile" id="uploadFile" accept=".jpg,.png,.jpeg,.gif" multiple>
						        <div id="preview"></div>
						      </td>
						    </tr>
						  </table>
					</div>
	            </div>
	
	            <div class="funding-end-table">
	                <table>
	                    <tr>
	                        <th>펀딩 종료일</th><td><input id="datetimepicker" type="text" class="input-form" name="fundingEndDate" placeholder="펀딩 종료일 선택" readonly></td>
							<td><span id="precaution"class="material-symbols-outlined">error</span>
								<span>왼쪽 박스를 클릭해 펀딩 종료일을 선택 해주세요.</span></td>
	                    </tr>
	                    <tr>
	                        <th>펀딩 목표 금액</th><td><input type="text" class="input-form" name="fundingSum" ></td><td>원</td>
	                    </tr>
	                </table>
	            </div>
	        </div>
	
	        <hr>
	        <div class="detail-information"><span>상세정보</span></div>
	        <div class="input-detail">
	            <div class="summernote-detail">
	                <textarea id="summernote" name="fundingDetail"></textarea>
	            </div>
	            <div class="insert-button">
			        <input type="submit" class="btn bc1" id="insertButton" value="등록하기">
			        <input type="button" class="btn bc11" id="cancelButton" value="취소하기">
			        <!-- <input type="button" class="btn bc2" value="미리보기(시간나면)"> -->
		        </div>
	        </div>
	    </form>
    </div>    
<%@include file="/WEB-INF/views/common/footer.jsp" %>	



<script>
	//옵션셀렉트 선택시 옵션 추가
	$(function(){
		$("#fundingOptionCount").on("change",function(){
			const tr = $("#option-table-tr");
			const add = $(".add");
			const titleTr = $("<tr>").attr("class","add");
			const optionNameTd = $("<td>");
			const optionValueTd = $("<td>");
			
			const titleTr2 = $("<tr>").attr("class","add");
			const optionNameTd2 = $("<td>");
			const optionValueTd2 = $("<td>");
			
			const inputName=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionName").attr("placeholder","색상");
			const inputValue=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionValue").attr("placeholder","블랙/화이트");
			
			const inputName2=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionName").attr("placeholder","맛");
			const inputValue2=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionValue").attr("placeholder","딸기/포도");
				
			add.remove();
			

			if($("#fundingOptionCount").val()==2){
				optionNameTd.append(inputName);
				optionValueTd.append(inputValue);
				titleTr.append(optionNameTd).append(optionValueTd);
				tr.after(titleTr);	
			}
			if($("#fundingOptionCount").val()==3){
				optionNameTd2.append(inputName2);
				optionValueTd2.append(inputValue2);
				titleTr2.append(optionNameTd2).append(optionValueTd2);
				tr.after(titleTr2);
				optionNameTd.append(inputName);
				optionValueTd.append(inputValue);
				titleTr.append(optionNameTd).append(optionValueTd);
				tr.after(titleTr);
				
			}
		});
	});

	 //써머노트
	 $(function(){
	 $("#summernote").summernote({
		height:400,
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
	 //옵션목록으로 적용
	$(function(){
		$("#cancelButton").on("click",function(){
			alert("등록이 취소되었습니다");
			location.href = "/";
		});

	 $(".option-category").on("click",function(){
		 var fundingOptionNameArr = new Array();//다음부터는 let으로 쓰자
		 var fundingOptionValueArr = new Array();
		 console.log("배열의길이 : "+$("[name=fundingOptionName]").length)//배열의길이 
		 
		 
		/*  $("[name=fundingOptionName]").each(function(index, item){
			 fundingOptionNameArr.push($(item).val());
		   }); */
		 
		 $.each($("[name=fundingOptionName]"),function(index,item){
			 fundingOptionNameArr.push($(item).val());
		 });
		  $.each($("[name=fundingOptionValue]"),function(index,item){
			 fundingOptionValueArr.push($(item).val());
			 //console.log($(item).val().split(","));
		 });
			
	/* 	 for(var i=0; i<$("[name=fundingOptionName]").length;i++){
				// fundingOptionNameArr = $("[name=fundingOptionName]").eq(i).val();
				// fundingOptionNameArr.push($("[name=fundingOptionName]").eq(i).val());
				 console.log($("[name=fundingOptionName]").eq(i).val());
				 console.log($("[name=fundingOptionValue]").eq(i).val());
			 } */
		 console.log(fundingOptionNameArr);
		 console.log(fundingOptionValueArr);
		/*  for(var i=0; i<$("[name=fundingOptionName]").length;i++){
			// fundingOptionNameArr = $("[name=fundingOptionName]").eq(i).val();
			// fundingOptionNameArr.push($("[name=fundingOptionName]").eq(i).val());
			 console.log($("[name=fundingOptionName]").eq(i).val());
		 }
		 console.log(fundingOptionNameArr)
		 
		 for(var i=0; i<$("[name=fundingOptionValue]").length;i++){
			 //fundingOptionValueArr = $("[name=fundingOptionValue]").eq(i).val();
			 fundingOptionValueArr.push($("[name=fundingOptionValue]").eq(i).val());
		 }
		 console.log(fundingOptionValueArr) */
			
			
			
		 $.ajax({
			url : "/optionCategoryAjax.kh",
			type : "get",
			data : {fundingOptionNameArr:fundingOptionNameArr,fundingOptionValueArr:fundingOptionValueArr},
			success : function(data){
				
				const trPrice = $("#optionListPrice-table-tr");//이거는 아님
				const tableTest =  $("#optionListPrice-table-tr").parent();
				const addPrice = $(".addPrice");
				addPrice.remove();
				
				for(let i=0; i<data.length; i++){//쿼리에선 let..
				const titleTrPrice = $("<tr>").attr("class","addPrice");
				const optionList = $("<td>");
				const inputOptionList=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionList").attr("value",data[i]);
				optionList.append(inputOptionList);
				
				const optionListPrice = $("<td>");
				const inputOptionListPrice=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionPrice").attr("value","10000");
				optionListPrice.append(inputOptionListPrice);
				
				titleTrPrice.append(optionList).append(optionListPrice);
				tableTest.append(titleTrPrice);
				console.log("컨트롤러에서 보내준 데이터 : "+data[i]);
				}
			
				
			},
			error : function(data){
				alert("옵션명과 옵션값을 입력해주세요");
			}			 
		 });
	 });		
	});
	//datetimepicker
	//https://xdsoft.net/jqplugins/datetimepicker/
	$(function(){
		$("#datetimepicker").datetimepicker({
		   dateTimeFormat: "dddd, MMMM dd, yyyy hh-mm-ss tt",
		   timePopupWidth: "150px",
		   timeDisplayFormat: "hh:mm:ss tt",
		   width: '300px',
		   minDate:'+1970/01/02',
		   //minTime:'today.getHours()'
		   
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

		



		  //정규 표현식
		  $("form").on("submit",function(){
					if(!check()){
						event.preventDefault();
						return false;
					}else{
						return true;
					}
				})
			
			  function check(){
				  let regExp = /^[0-9]+$/;
				  const category = $("select[name=fundingCategory]");
					
				  if( $("input[name=fundingName]").val()!=""){
					  if(category.val()!="none"){
						  if($("#fundingOptionName").val()!=""){
							//
						  		if(!$("input[name=fundingOptionList]").length==0){
						  			
						  			
						  			if($("#preview").children().length!=0){
						  				if($("#datetimepicker").val()!=""){
						  					
						  					if($("input[name=fundingSum]").val()!=""&&regExp.test($("input[name=fundingSum]").val())){
						  						return true;
						  					}else{
						  						alert("숫자를 입력해주세요!");
						  						return false;
						  					}
						  				}else{
						  					alert("마감날짜를 선택해주세요!");
						  					return false;
						  				}
						  			}else{
						  				alert("사진을 올려주세요!");
						  				return false;
						  			}
						  		}else{
						  			alert("'옵션개수'를 선택후 '옵션목록으로 적용' 버튼을 눌러주세요!");
						  			return false;
						  		}////
						  }else{
							  alert("옵션명을 입력해주세요!");
							  return false;
						  }
							
					  	}else{
							alert("'카테고리'를 선택해 주세요!");
							return false;
						}
				  			
					}else{
			  			alert("'펀딩 프로젝트명'을 입력해 주세요!");
						return false;
			  		}
					/*
					  if($("input[name=fundingOptionList]").val()!=""){
									return true;
							  }else{
								alert("펀딩합계 입력해주세요")
								return false;
							  }*/
			  }//check
			
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
<script type="text/javascript">
  $(document).ready(function (e){
    $("input[type='file']").change(function(e){

      //div 내용 비워주기
      $('#preview').empty();

      var files = e.target.files;
      var arr =Array.prototype.slice.call(files);
      
      //업로드 가능 파일인지 체크
      for(var i=0;i<files.length;i++){
        if(!checkExtension(files[i].name,files[i].size)){
          return false;
        }
      }
      
      preview(arr);
      
      
    });//file change
    
    function checkExtension(fileName,fileSize){

      var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
      var maxSize = 20971520;  //20MB
      
      if(fileSize >= maxSize){
        alert('파일 사이즈 초과');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      
      if(regex.test(fileName)){
        alert('업로드 불가능한 파일이 있습니다.');
        $("input[type='file']").val("");  //파일 초기화
        return false;
      }
      return true;
    }
    
    function preview(arr){
      arr.forEach(function(f){
        
        //파일명이 길면 파일명...으로 처리
        var fileName = f.name;
        if(fileName.length > 10){
          fileName = fileName.substring(0,7)+"...";
        }
        
        //div에 이미지 추가
        var str = '<div class="pre-img" style="display: inline-flex; padding: 10px;"><div>';
        str += '<span>'+fileName+'</span><br>';
        
        //이미지 파일 미리보기
        if(f.type.match('image.*')){
          var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
          reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
            str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
            str += '</div></div>';
            $(str).appendTo('#preview');
          } 
          reader.readAsDataURL(f);
        }else{
          str += '<img src="/resources/img/fileImg.png" title="'+f.name+'" width=100 height=100 />';
          $(str).appendTo('#preview');
        }
      });//arr.forEach
    }
  });
  
  
 
  
</script>
<style>
	td{
		border: none;
	}
</style>
</html>