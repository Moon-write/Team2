<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.posting-wrap {
	display: flex;
	flex-wrap: wrap;
}

.photoWrapper {
	clear: right;
	margin: 0 auto;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp" %>
		<div class="page-content">
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
			<div class="photoWrapper posting-wrap">
				<c:forEach var="sp" items="${sp }">
					<div style="box-sizing: border-box; width: calc(100%/ 4); padding: 20px;">
						<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
						<div>
							<img class="img" src="/resources/upload/shopPic/${sp.shopFilepath }" style="height:200px; width:200px;background-size:contain;">
						</div>
						<div><input type="checkbox" class="chk"></div>
						<div style="display:none;"><input type="hidden" name="shopPicNo" value="${sp.shopPicNo }">${sp.shopPicNo }</div>
					</div>
				</c:forEach>
			</div>
			<c:if test="${!empty sp }">
				<div style="width:500px; text-align:center;margin:30px auto;">
				<button class="btn bc3 deleteShopPic">삭제</button>
			</div>
			</c:if>			
			<c:if test="${fn:length(sp) lt 4 }">
				<form action="/picUpload.kh" method="post" enctype="multipart/form-data" style="margin-top:50px;">
					<fieldset style="border:0px solid black;width:500px; margin:0 auto; text-align:center;">										
						<input type="file" name="upfile" id="imgUpload" accept=".jpg,.png,.jpeg,.gif" style="display:none;" multiple></input>	
						<label class="btn bc1" for="imgUpload">사진 선택 (최대 4장)</label>
						<span><input type="submit" class="btn bc1" name="submit" value="등록" style="float:none;"></span>	 
						<div id="preview"></div>				
		                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
		                <input type="hidden" name="shopNo" value="${shop.shopNo }">		                	               
					</fieldset>
				</form>
			</c:if>			
		</div>
		<script>
			let picLength=$(".img").length;	
			$(document).ready(function (e){
				$("input[type='file']").change(function(e){
				
				  //div 내용 비워주기
				  $('#preview').empty();
				
				  var files = e.target.files;
				  var arr =Array.prototype.slice.call(files);
				  if(arr.length+picLength>4){
					  alert("최대 4장까지 선택가능합니다.")
					  e.preventDefault();
				  }else{
					//업로드 가능 파일인지 체크
				   for(var i=0;i<files.length;i++){
				     if(!checkExtension(files[i].name,files[i].size)){
				       return false;
				     }
				   }			      
				   preview(arr);  
				  }		      
				});//file change
		    
				function checkExtension(fileName,fileSize){
				
				  var regex = new RegExp("(.*?)\.(jpg|png|jpeg|gif)$");
				  var maxSize = 20971520;  //20MB
				  if(fileSize >= maxSize){
				    alert('파일 사이즈 초과');
				    $("input[type='file']").val("");  //파일 초기화
				    return false;
				  }
				  
				  if(!regex.test(fileName)){
				    alert('이미지만 업로드 가능합니다.');
				    $("input[type='file']").val("");  //파일 초기화
				    return false;
				  }
				  return true;
				}
		    
			    function preview(arr){
		      		arr.forEach(function(f){		       
			        //div에 이미지 추가			        
			        var str = '<div class="pre-img" style="display: inline-flex; padding: 10px;"><div>';
			        str += '<br>';
			        
			        //이미지 파일 미리보기
					var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성		          
					reader.onload = function (e) { //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러		        	  
					  //str += '<button type="button" class="delBtn" value="'+f.name+'" style="background: red">x</button><br>';
					  str += '<img src="'+e.target.result+'" title="'+f.name+'" width=100 height=100 />';
					  str += '</div></div>';
					  $(str).appendTo('#preview');
					} 
					console.log(reader);
					reader.readAsDataURL(f);
					});//arr.forEach
				}
			});
			$(".deleteShopPic").on("click",function(){
				const memberNo=$("input[name=memberNo]").val();
				const check=$(".chk:checked");
				if(check.length==0){
					alert("선택된 사진이 없습니다.");
					return;
				}
				const shopPicNos=new Array();
				check.each(function(index,item){
					shopPicNos.push($(item).parent().next().text());
				});
				location.href="/deleteShopPic.kh?memberNo="+memberNo+"&shopPicNos="+shopPicNos.join("/");
			});				
			$("input[name=submit]").on("click",function(e){
				const file=$("input[name=upfile]").val();
				if(file.length==0){
					alert("선택된 사진이 없습니다.");
					e.preventDefault();
				}
			});			
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>