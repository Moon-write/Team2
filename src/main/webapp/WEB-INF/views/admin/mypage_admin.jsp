<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style>
		 .mypage-header{
          display: flex;
          height: 30px;
        }
        .mypage-header-space{
          flex-grow: 2;
        }
        .mypage-header-profile{
          flex-grow: 7.5;
          vertical-align: middle;
          display: flex;
        }
        .mypage-header-profile>a{
          margin-right: 15px;
        }
        .mypage-header-nick{
          font-size: 35px;
          padding-left: 25px;
        }
        .mypage-nav{
          background-color: aquamarine;
          flex-grow: 1;
          height: 500px;
        }
        .mypage-content{
          flex-grow: 15;
          padding: 27px;
          overflow: hidden;
          margin-bottom: 100px;
        }
        
		.mypage-content-title {
		  margin-top: 3px;
	      height: 40px;
	      font-family: ns-bold;
	      font-size: 20px;
	      border-bottom: solid 2px rgb(167, 167, 167);
		}
        .left-menu{
            margin-top: 70px;
            flex-grow: 1;
            color: rgb(51, 51, 51);
            
      
        }
        .left-menu>ul{
            border-top: solid 2px rgb(167, 167, 167);
            border-bottom: solid 2px rgb(167, 167, 167);
            padding:0 30px;
            list-style-type: none;
            width: 100px;
        }
        .left-menu>ul>li{
            margin-top: 14px;
            margin-bottom: 8px;
            text-align: center;
            height: 30px;
        }
        .left-menu>ul>li>a{
            text-decoration: none;
            color: rgb(51, 51, 51);
        }
        .left-menu>ul>li>a:hover{
            color: rgb(172, 158, 137);
            font-size: 17px;
        }

</style>

<!-- 
<meta charset="UTF-8">
<title>Insert title here</title>
 -->
</head>
        <header>
          <div class="mypage-header">
          </div>
        </header>
        <div class="left-menu">
          <ul >
       		  <li style="font-size:18px;"><a href="/mypage_main.do?memberId=#&memberNo=#&memberLevel=#">관리자</a></li>
              <li><a href="/selectMemberList.kh?memberLevel=2&reqPage=1">일반회원 관리</a></li>
              <li><a href="/selectBizMemberList.kh?memberLevel=1&reqPage=1">사업자회원 관리</a></li>        
          </ul>
      </div>

</html>