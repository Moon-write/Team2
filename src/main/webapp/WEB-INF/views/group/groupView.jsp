<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#view-wrap{
		padding-top: 30px;
		width: 1200px;
		margin: 0 auto;
	}
	#view-title{
		width: 1000px;
		margin: 0 auto;
		padding: 30px 0px 30px 0px;
		font-size: xx-large;
		text-align: center;
	}
	#view-head {
		margin: 0 auto;
		width: 1000px;
		height: 300px;
		background-color: bisque;
		display: flex;
	}
	.view-slide {
		width: 500px;
		height: 300px;
		background-color: aquamarine;
		
	}
	.view-info {
		width: 500px;
		height: 300px;
		background-color: cornflowerblue;
	}

	#view-body {
		margin: 0 auto;
		width: 1000px;
		display: flex;
	}
	.view-content {
		width: 680px;
		height: 1000px;
		background-color: sienna;
	}
	.view-cart {
		width: 320px;
		height: 500px;
		background-color: darkblue;
	}
	#view-foot {
		margin: 0 auto;
		width: 1000px;
		display: flex;
	}
	.view-qna{
		margin: 0 auto;
		width: 680px;
		height: 300px;
		background-color: sandybrown;
	}
	.view-empty {
		width: 320px;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="view-wrap">
		<div id="view-title">
			프로젝트명
		</div>
		<div id="view-head">
			<div class="view-slide"></div>
			<div class="view-info">
				div
			</div>
		</div>
		<div id="view-body">
			<div class="view-content"></div>
			<div class="view-cart"></div>
			
		</div>
		<div id="view-foot">
			<div class="view-qna"></div>
			<div class="view-empty"></div>
		</div>
		

	</div>
	
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>