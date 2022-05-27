<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
.flex-wrap {
	display: flex;
	flex-wrap: wrap;
}	
.mypage-header {
	display: flex;
	height: 30px;
}
.mypage-header-space {
	flex-grow: 2;
}

.mypage-header-profile {
	flex-grow: 7.5;
	vertical-align: middle;
	display: flex;
	margin-top: 20px;
}

.mypage-header-profile>a {
	margin-right: 15px;
}

.mypage-header-nick {
	font-size: 35px;
	padding-left: 25px;
}

.mypage-nav {
	background-color: aquamarine;
	height: 500px;
	width:181px !important;
}

.mypage-content {
	min-height: 680px;
	margin: 27px 0 27px 57px;
	width:960px;
}

.mypage-content-title {
	margin-top: 3px;
	height: 30px;
	font-family: ns-bold;
	border-bottom: solid 2px #1E90FF;
}

.left-menu {
	margin-top: 60px;
	color: rgb(51, 51, 51);
	width:181px !important;
}

.left-menu>ul {
	border-top: solid 2px #1E90FF;
	border-bottom: solid 2px #1E90FF;
	margin-left: 30px;
	list-style-type: none;
}

.left-menu>ul>li {
	margin-top: 14px;
	margin-bottom: 8px;
	padding-left: 25px;
	height: 30px;
}

.left-menu>ul>li>a {
	text-decoration: none;
	color: rgb(51, 51, 51);
}

.left-menu>ul>li>a:hover {
	font-weight: bold;
}
.left-menu hr{
	background-color: #1E90FF;
	height: 1px;
	border: none;
}
</style>

<!-- 
<meta charset="UTF-8">
<title>Insert title here</title>
 -->
</head>
        <header>
          <div class="mypage-header"></div>
        </header>
        <div class="left-menu">
          <ul>
          	  <li class="f-bold">프로필 정보</li>
          	  <hr>
              <li class="f-bold">활동정보</li>
              <li><a href="/projectList.kh?reqPage=1&memberNo=${m.memberNo}">참여중인 프로젝트</a></li>
              <li><a href="/orderList.kh?reqPage=1&memberNo=${m.memberNo}">결제내역</a></li>
              <li><a href="/commentList.kh?reqPage=1&memberNo=${m.memberNo}">나의리뷰</a></li>
              <li><a href="/likeList.kh?reqPage=1&memberNo=${m.memberNo}">찜목록</a></li>
              <li><a href="/qnaList.kh?reqPage=1&memberNo=${m.memberNo}">나의 Q&A</a></li>
              <hr>
              <li class="f-bold">회원정보</li>
              <li><a href="/updateMemberFrm.kh">정보관리</a></li>
              <li><a href="/updatePwFrm.kh">비밀번호 변경</a></li>
              <li><a href="/deleteMemberFrm.kh">회원탈퇴</a></li>               
          </ul>
      </div>
</html>