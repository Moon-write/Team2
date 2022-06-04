<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<style>
.show-content2{
	float:left;
	margin-top:50px;
	margin-left:305px;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
		<h2 style="margin-top:50px;margin-left:520px;">사업자 정보 관리</h1>
		<div class="show-content2">
			<form action="/shopUpload.kh" method="post">
				<fieldset style="border:0px solid black;">				
						<div>
						<div style="float:left;">
		                	<div>사업자 번호</div>
		                	<div>상호명</div>		                
		                	<div>주소</div>
		                	<div>상세주소</div>
		                	<div>휴대폰번호</div>                	
		                </div>
		                <div style="float:left; margin-left:40px;">
		                	<div><input type="text" name="bizNo" disabled value="${shop.bizNo }"></div>		                	
		                	<div><input type="text" name="shopName" disabled value="${shop.shopName }"></div>
		                	<div><input type="text" name="memberAddr1" value="${member.memberAddr1 }"></div>
		                	<div><input type="text" name="memberAddr2" value="${member.memberAddr2 }"></div>
		                	<div><input type="text" name="memberPhone" value="${member.memberPhone }"></div>
		                </div>
		                </div>
		                <input type="hidden" name="memberNo" value="100">
		                <input type="hidden" name="shopNo" value="${shop.shopNo }">
						<div><button class="btn bc1" style="margin-left:130px;margin-top:20px;">등록</button></div>
				</fieldset>
			</form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>