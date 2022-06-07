<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 디테일 페이지</title>
<style>
.title{
    margin-top: 50px;
    background-color: brown;
    text-align: center;
}
.main{
    width: 1200px;
    margin: 50px auto;
   
}
.link{
    background-color: aqua;
}
.link>ul{
    list-style: none;
    overflow: hidden;
}
.link>ul>a>li{
    display: block;
    float: left;
    width: 20%;
    text-align: center;
    font-size: 25px;
    margin: 0 2.5%;
    color: #191F28;
}
.link>ul>a:nth-child(3)>li{
    border-bottom: 5px solid rgb(30,144,255);

}
</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>

    <div class="title">제목제목제목제목제목넓이1200이상이미지로전체감쌀예정</div>
    <div class="main">
        <div class="link">
            <ul>
                <a href="/fundingDetailStory.kh?fundingNo=${fundingNo }"><li>스토리</li></a>
                <a href="/fundingDetailCommunity.kh?fundingNo=${fundingNo }"><li>커뮤니티</li></a>
                <a href="/fundingDetailNotice.kh?fundingNo=${fundingNo }"><li>새소식</li></a>
                <a href="/fundingDetailSupporter.kh?fundingNo=${fundingNo }"><li>서포터</li></a>
            </ul>
        </div>
        <div class="left-box">

        </div>
            <div id="test-modal" class="modal-bg">
      <div class="modal-wrap">
        <div class="modal-head">
          <h2>모달 제목</h2>
          <span class="material-icons close-icon modal-close">close</span>
        </div>
        <div class="modal-content">
          <p>모달내용</p>
          <p>모달내용</p>
          <p>모달내용</p>
          <p>모달내용</p>
        </div>
        <div class="modal-foot">
          <button class="btn bc1">확인</button>
          <button class="btn bc11 modal-close">취소</button>
        </div>
      </div>
    </div>
        <div class="right-box">
            <div class="funding"></div>
            <div class="funding-rank"></div>
        </div>
    </div>
    
    








    <%@include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>