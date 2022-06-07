<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 카테고리 별 분류페이지</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
.page-content-content2 {
	/*display: flex;*/
	margin-bottom: 10px;
	width: 1200px;
}

.page-content-content2>div {
	width: 240px;
	/*background-color: black;*/
	margin: 10px;
	height: auto;
}

.detail-content {
	width: 500px;
}

.page-content-header {
	width: 100%;
	height: 300px;
	background-size: cover;
	background-repeat: no-repeat;
	background-position: center center;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 15px;
	margin-top: 10px;
	display: flex;
}

.page-content-content {
	width: 80%;
	margin: 10px;
}

.page-content-content>h2 {
	margin: 10px;
	margin-top: 35px;
}

.donationMainImg {
	width: 240px;
	height: 164.38px;
	overflow: hidden;
}

.donationMainImgHover img {
	transition: all 0.2s linear;
	border: none;
}

.donationMainImgHover:hover img {
	transform: scale(1.1);
}

.donationMainImgHover {
	width: auto;
	height: auto;
}

.hash-tag-div {
	display: flex;
	width: 25%;
	flex-direction: column;
	height: auto;
	/*overflow: hidden;*/
}

.hash-tag-div-div {
	width: auto;
	height: 164.38px;
	overflow: hidden;
}

.hash-tag-div-div:hover {
	box-shadow: 2px 2px 1px 1px #1e90ff;
	transition: 0.5s;
}

.hash-tag-footer-div {
	display: flex;
	flex-direction: column;
}

.page-content-content2 {
	display: flex;
	flex-wrap: wrap;
}

.hash-tag-footer-div-div {
	display: flex;
	justify-content: space-between;
}

.page-content-content2>div {
	width: auto;
	height: auto;
	/* background-color: black; */
	margin: 20px;
}

.donationCash {
	display: flex;
}

.box {
	position: relative;
	transition: .5s ease; /* 필수는 아님 */
}

.text {
	position: absolute;
	visibility: hidden;
}

.box:hover {
	opacity: 0.7;
}

.box:hover .text {
	visibility: visible;
}

.material-icons {
	color: #1e90ff;
}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="page-content-header"
			style="
				<c:if test="${donationCategory eq 'pet' }">
					background-image: url(/resources/upload/donation/donationPet.jpg);
				</c:if>
				<c:if test="${donationCategory eq 'child' }">
					background-image: url(/resources/upload/donation/donationChild.jpg);
				</c:if>
				<c:if test="${donationCategory eq 'female' }">
					background-image: url(/resources/upload/donation/donationFemale.jpg);
				</c:if>
				<c:if test="${donationCategory eq 'help' }">
					background-image: url(/resources/upload/donation/donationHelp.jpg);
				</c:if>
				<c:if test="${donationCategory eq 'old' }">
					background-image: url(/resources/upload/donation/donationOld.jpg);
				</c:if>
		">
			<div class="main">
				<div class="box">
					<div class="text">Hello!</div>
				</div>
			</div>
		</div>
		<div class="page-content-content">
			<h2 class="page-content-content-h2">
				<c:if test="${donationCategory eq 'pet' }">
					애견기부목록
				</c:if>
				<c:if test="${donationCategory eq 'child' }">
					아동기부목록
				</c:if>
				<c:if test="${donationCategory eq 'female' }">
					여성기부목록
				</c:if>
				<c:if test="${donationCategory eq 'help' }">
					불우이웃
				</c:if>
				<c:if test="${donationCategory eq 'old' }">
					독거노인
				</c:if>
			</h2>
			<div class="page-content-content2">
				<c:forEach items="${list }" var="list" end="5">
					<div class="hash-tag-div">
						<div class="hash-tag-div-div">
							<a href="/donationClick.kh?projectNo=${list.projectNo }"
								class="donationMainImgHover"> <img
								src="${list.donationImgpath }" class="donationMainImg">
							</a>
						</div>
						<div class="hash-tag-footer-div">
							<h3 class="title">${list.donationTitle }</h3>
							<div class="hash-tag-footer-div-div">
								<span>00%</span> <a class="donationCash"> <span
									class="material-icons">paid</span> <span>${list.donationCash }</span>
								</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>