<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#content-wrap{
		width: 1200px;
		margin: 0 auto;
	}
	.content-head{
		text-align: center;
	}
	.content-title{
		background-image: url(/resources/img/group/banner.jpg);
		margin-top: 30px;
		height: 312px;
		border-radius: 20px;
		position: relative;
		display: flex;
		align-items: center; 
  		flex-direction: row; 
 		justify-content: center; 
	}
	.title-txt{ 
		margin: auto;
		padding: 10px;
		border-radius: 20px;
		position:absolute;
		width: 1000px;
		text-align: center;
		font-size: 35px;
		color: white; 
		background-color: rgba(39, 39, 39, 0.425);
		animation-name: up;
		animation-duration: 1.5s;
		animation-fill-mode: forwards;
		animation-direction:alternate;
	}
	@keyframes up {
  	from {
		opacity: 0;  
		transform: translateY(10%);
	}
 	 to {
		opacity: 3;  
		transform: translateY(30%);
	}
	}	
	.content-category{
		margin-top: 20px;
		align-items: center; 
  		flex-direction: row; 
 		justify-content: center; 
		display: flex;
	}
	.category {
		margin-left: 30px;
	}
	.category a {
		color: #191F28;
		text-decoration: none;
	}
	.category a:hover {
		color: #191F28;
		font-weight: 600;
	}
	.cate-img {
		margin: 0 auto;
		width: 50px;
		height: 50px;
		border-radius: 50%;
		background-color: black;
	}
	.category-txt{
		margin-top: 5px;
		font-size: 13px;
	}
	
	.content-body{
		width: 1000px;
		margin: 0 auto;
		padding-top: 20px;
	}
	.content-due{
		padding-bottom: 20px;
		border-bottom: 1px solid #ccc;
	}
	.due-title>span{
		vertical-align: center;
	}
	.title{
		font-size: 25px;
		font-weight: bold;
	}
	.sub {
		font-size: 15px;
	}
	.due-wrap {
		display:grid;
		grid-template-columns: 300px 300px 300px;
		align-items : center;
  		flex-direction: row; 
 		justify-content: center; 
	}
	.project1{
		width: 300px;
		margin: 15px;
	}
	.project1>*{
		margin: 10px;
		background-color: bisque;
	}
	.prj-img{
		height: 100px;
		background-color: aqua;
	}
	.content-bar {
		margin-top: 20px;
		padding-bottom: 10px;
		vertical-align: baseline;
	}
	.array-list{
		padding-top: 10px;
		float: right;
		display: block;
	}
	.content-list-wrap{
		display:grid;
		grid-template-columns: 300px 300px 300px;
		align-items : center;
  		flex-direction: row; 
 		justify-content: center; 
	}
  
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div id="content-wrap">
		<div class="content-head">
			<div class="content-title">
				<div class="title-txt">합리적인 가격으로 좋은 제품을 만나보세요</div>
			</div>
			<div class="content-category">
				<div class="category" name="tech"><a href="/groupTech.kh"><div class="cate-img"></div><div class="category-txt">테크·가전</div></a></div>	
				<div class="category" name="fashion"><a href="/groupFashion.kh"><div class="cate-img"></div><div class="category-txt">패션·잡화</div></a></div>
				<div class="category" name="living"><a href="/groupLiving.kh"><div class="cate-img"></div><div class="category-txt">홈·리빙</div></a></div>
				<div class="category" name="food"><a href="/groupFood.kh"><div class="cate-img"></div><div class="category-txt">식품·영양제</div></a></div>
				<div class="category" name="beauty"><a href="/groupBeauty.kh"><div class="cate-img"></div><div class="category-txt">뷰티</div></a></div>
			</div>
		</div>
		<div class="content-body">
			<div class="content-due">
				<div class="due-title">
					<span class="title">마감임박</span>
					<span class="sub">참여기간이 얼마 남지 않았어요!</span>
				</div>
				<div class="due-wrap">
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
				</div>
			</div>
			<div class="content-main">
				<div class="content-bar">
					<span class="title">테크·가전</span>
					<span class="array-list">
						<select>
							<option value="pop">진행중</option>
							<option value="newest">종료된</option>
						</select>
						<select>
							<option value="pop">인기순</option>
							<option value="newest">최신순</option>
						</select>
					</span>
				</div>
				<div class="content-list-wrap">
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					<div class="project1"><div class="prj-img">이미지</div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date">1일 남음</div></div>
					   
				</div>
			
				
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>