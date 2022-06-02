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
/*
.link>ul>a{
    text-decoration: none;
    color: #191F28;
}
*/
.link>ul>a>li{
    display: block;
    float: left;
    width: 20%;
    text-align: center;
    font-size: 25px;
    margin: 0 2.5%;
    color: #191F28;
    
}
.link>ul>a:first-child>li{
    border-bottom: 5px solid rgb(30,144,255);

}
.lrbox{
    width: 1200px;
    height: 1200px;
    background-color: gray;
}
.left-box{
    width: 60%;
    height: 500px; /*나중에 지워주기*/
    background-color: blue;
    
}
.right-box{
    width: 30%;
    height: 500px; /*나중에 지워주기*/
    background-color: violet;
}

</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>


    <div class="title">제목제목제목제목제목넓이1200이상이미지로전체감쌀예정</div>
    <div class="main">
        <div class="link">
            <ul>
                <a href=""><li>스토리</li></a>
                <a href=""><li>커뮤니티</li></a>
                <a href=""><li>새소식</li></a>
                <a href=""><li>구매자</li></a>
            </ul>
        </div>
        <div class="lrbox">
            <div class="left-box">
                <div class="img-slide"></div>
                <div class="funding-detail"></div>
            </div>
            <div class="right-box">
                <div class="funding"></div>
                <div class="funding-rank"></div>
            </div>
        </div>    
    </div>
    


    <%@include file="/WEB-INF/views/common/footer.jsp" %>

</body>
</html>