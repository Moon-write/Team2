<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 카테고리 별 분류페이지</title>
</head>
<style>
	.page-content-content2{
		display:flex;
		margin-bottom: 10px;
	}
	.page-content-content2>div{
		width: 30%;
		height: 200px;
		background-color: black;
		margin: 10px;
	}
	.page-content-header{
		width: 100%;
		height: 300px;
		background-color: gray;
		display: flex;
		justify-content: center;
    	align-items: center;
    	border-radius: 15px;
    	margin-top: 10px;
	}
	.page-content-content{
		margin: 10px;
	}
	.page-content-content>h2{
		margin: 10px;
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="page-content-header">
			<div class="main">
				<!-- 이미지태그추가예정 -->
				<h1>donationCategory</h1>
				<h2>sumDonationCategory</h2>
			</div>
		</div>
		<div class="page-content-content">
		<h2>donationCategory 목록</h2>
			<div class="page-content-content2">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
			<div class="page-content-content2">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
			<div class="page-content-content2">
				<div></div>
				<div></div>
				<div></div>
				<div></div>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>