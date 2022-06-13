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
		                <input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
		                <input type="hidden" name="shopNo" value="${shop.shopNo }">
		                <span><input type="submit" class="btn bc1" name="submit" value="등록" style="float:none;"></span>	               
					</fieldset>
				</form>
			</c:if>			
		</div>
		<script>
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
			let picLength=$(".img").length;			
			$("input[name=submit]").on("click",function(e){
				const file=$("input[name=upfile]").val();
				if(file.length==0){
					alert("선택된 사진이 없습니다.");
					e.preventDefault();
				}
				if (($('#imgUpload')[0].files.length)+picLength>4) {	
					alert("최대 4장까지 업로드 할 수 있습니다.");
				    e.preventDefault();
				}
			});
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>