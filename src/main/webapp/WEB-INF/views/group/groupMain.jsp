<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/group/groupMain.css">
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
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">제주산 당근씨오일</div><div class="prj-caption">냄새를 참으면 강력한 보습효과를 맛볼 수 있어요</div><div class="prj-date"><span class="badge-pink">오늘마감</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">1일 남음</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">오늘마감</span></div></a></div>
				</div>
			</div>
			<div class="content-main">
				<div class="content-bar">
					<span class="title">전체상품</span>
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
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">1일 남음</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">오늘마감</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">1일 남음</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">오늘마감</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">1일 남음</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">오늘마감</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">1일 남음</span></div></a></div>
					<div class="project1"><a href="/groupView.kh"><div class="prj-img"></div><div class="prj-name">프로젝트명</div><div class="prj-caption">캡션</div><div class="prj-date"><span class="badge-pink">오늘마감</span></div></a></div>
					   
				</div>
			
				
			</div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>