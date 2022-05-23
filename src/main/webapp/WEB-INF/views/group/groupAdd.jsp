<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/group/groupAdd.css">
<style>
#add-body {
	display: flex;
}


</style>
<link rel="stylesheet" href="../../../resources/css/summernote-lite.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="../../../resources/js/summernote-lite.js"></script>
	<script src="../../../resources/js/lang/summernote-ko-KR.js"></script>
	<div id="add-wrap">
		<div id="add-head">공동구매 등록</div>
		<div id="add-body">
			<div class="add-part title">
				기본 정보
			</div>
			<form action="" method="post">
				
				<div class="add-part info">
					<table style="border: none;">
						<tr>
							<th>카테고리</th>
							<td>
								<select name="grpCategory" class="input-form">
									<option>카테고리 선택</option>
									<option value="1">테크·가전</option>
									<option value="2">패션·잡화</option>
									<option value="3">홈·리빙</option>
									<option value="4">식품·영양제</option>
									<option value="5">뷰티</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>프로젝트명</th>
							<td><input type="text" name="projectName" class="input-form"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" name="gName" class="input-form">
								<button class="amountB"><span class="material-symbols-rounded">add</span></button></td>
						</tr>
						<tr>
							<th>옵션명</th>
							<td><input type="text" name="gOpt" class="input-form">
								<button class="amountB"><span class="material-symbols-rounded">add</span></button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<div id="add-body">
			<div class="add-part title">
				가격 설정
			</div>
			<form action="" method="post">
				
				<div class="add-part info">
					<table style="border: none;">
						<tr>
							<th>기본가</th>
							<td>
								<td><input type="number" name="prjOrigPrice" class="input-form">원</td>
							</td>
						</tr>
						<tr>
							<th>할인률</th>
							<td><input type="text" name="projectName" class="input-form"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" name="gName" class="input-form">
								<button class="amountB"><span class="material-symbols-rounded">add</span></button></td>
						</tr>
						<tr>
							<th>옵션명</th>
							<td><input type="text" name="gOpt" class="input-form">
								<button class="amountB"><span class="material-symbols-rounded">add</span></button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
		<div id="add-body">
			<div class="add-part title">
				상세 정보
			</div>
			<form action="" method="post">
				<div class="add-content">
					<textarea name="groupContent" id="groupContent" class="input-form"></textarea>
				</div>
				<div class="add-submit">
					<button class="btn bc11 bs3" id="previewBtn">미리보기</button>
					<button id="submitBtn" class="btn bc4 bs3" disabled>등록하기</button>
				</div>
			</form>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$("#groupContent").summernote({
			height: 800,
			lang: "ko-KR",
			callbacks: {
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		})
	</script>
</body>
</html>