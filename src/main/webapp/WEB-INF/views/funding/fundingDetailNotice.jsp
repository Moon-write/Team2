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
    width: 100%;
    margin-top: 50px;
    

}

.title-background{

    text-align: center;
    height: 200px;
    background-image: url("/resources/upload/funding/3311.jpg");
    background-repeat: no-repeat;
    background-position: 50% 30%;
    background-size: cover;
    filter: blur(7px);
    

}
.p{
    position: absolute;
    top: 235px;
    left: 50%;
    transform: translateX(-50%);
    font-size: 20px;
    color: rgb(30,144,255);
    z-index: 1;
    
}
.h2{
    position: absolute;
    top: 270px;
    left: 50%;
    transform: translateX(-50%);
    z-index: 1;
    font-size: 30px;
    color: white;
    text-align: center;
}
.main{
    width: 1200px;
    margin: 50px auto;
   
}
.link{
    margin: 0 auto;

    margin-top: 45px ;
    width: 600px;
    

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
    color: #4a4a4a;
    
}
.link>ul>a:nth-of-type(3)>li{
    border-bottom: 5px solid rgb(30,144,255);

}
.link-border-line{
    border-bottom: 1px solid rgba(75, 75, 75, 0.2) ;
}
.box{
    width: 100%;

    overflow: hidden;
}
.left-box{
    width: 65%;
    /*background-color: red;*/
    height: 1000px;/*나중에 지우세요*/
    float: left;
    
}

.right-box{
    width: 30%;
    height: 1000px; /*나중에 지워주기*/

    float: right;
    padding: 0 20px;
}
.funding{
    width: 100%;
    height: 500px;  /*나중에 지워주기*/ 
  
    margin-bottom: 30px;
    
}
.funding-deadline{
    font-size: 28px;
    margin-bottom: 25px;
    color: #4a4a4a;
}
.funding-deadline>span:nth-of-type(1){
    font-weight: 600;
}
.funding-deadline>span:nth-of-type(2){
    font-weight: 400;
}
.bar-back{
		position:relative;
		height:5px;
		background-color:#e6eaed;
        margin-bottom: 25px;
}
.bar{
		position:absolute;
		height:5px;
		background-color:rgb(30,144,255);
}
.funding-sum{
    color: #4a4a4a;
    margin-bottom: 25px;
}
.funding-sum>span:nth-of-type(1){
    font-size: 30px;
    font-weight: 500;
}
.funding-sum>span:nth-of-type(2){
    margin-left: 5px;
    font-size: 15px;
    padding-top: 10px;
}
.funding-sum-rate{
    color: #4a4a4a;
    margin-bottom: 25px;
}
.funding-sum-rate>span:nth-of-type(1){
    font-size: 30px;
    font-weight: 500;
}
.funding-sum-rate>span:nth-of-type(2){
    margin-left: 5px;
    font-size: 15px;
    padding-top: 10px;
}
.supporter-num{
    color: #4a4a4a;
    margin-bottom: 25px;
}
.supporter-num>span:nth-of-type(1){
    font-size: 30px;
}
.supporter-num>span:nth-of-type(2){
    margin-left: 5px;
    font-size: 15px;
    padding-top: 10px;
}
.funding-rank{
    width: 100%;
    height: 500px;/*나중에 지워주기*/ 
    background-color: indigo;
}
.funding-btn{
    width: 100%;
    height: 50px;
}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 0,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}
.like-qna-share{
	overflow:hidden
}

.like-qna-share>div>button{

}

.img-slide>div>img{
	width: 100%;
    height: 400px;
    object-fit: cover;
}
.sum-date{
    margin-bottom: 25px;
    width: 100%;
    height: 100px;
    background-color:rgba(30,144,255,0.2) ;
    color: rgb(30,144,255);
    padding: 16px;
    border-radius: 10px;
    box-sizing: border-box;
    font-size: 16px;

}
.sum-date>p:nth-of-type(3){
    margin-top: 3px;
    margin-left: 2px;
    color: #4a4a4a;
}
.like{
		border: 1px solid #ccc;
		border-radius: 15px;
		width: 33%;
		padding: 5px 10px;
		text-align: center;
        cursor:pointer

	}
.like>span{
		width: 25px; height: 25px;
		text-align: center;
	}
.like>span:first-child{
		font-size: 1.5em;
	}

.board-table th{
	width:246px;
	
	background-color: rgb(255, 130, 171);
	color: white;
}
.board-table-div{
	margin: 20px;
}
.board-table td{
	text-align: center;
}
.board-table{
	width: 100%;
}

</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
	<input type="hidden" id="fundingNo" value="${f.fundingNo}">

    <div class="title">
        <div class="title-background-before">
            <div class="p"><P>${f.fundingCategory}</P></div>
            <div class="h2"><h3>${f.fundingName}</h3></div>
        </div>
        <div class="title-background">
            
        </div>
        
    </div>
    <div class="link-border-line">
        <div class="link">
            <ul>
                <a href="/fundingDetailStory.kh?fundingNo=${f.fundingNo }"><li>스토리</li></a>
                <a href="/fundingDetailCommunity.kh?fundingNo=${f.fundingNo }"><li>커뮤니티</li></a>
                <a href="/fundingDetailNotice.kh?fundingNo=${f.fundingNo }"><li>새소식</li></a>
                <a href="/fundingDetailSupporter.kh?fundingNo=${f.fundingNo }"><li>서포터</li></a>
            </ul>
        </div>
    </div>
    <div class="main">
        <div class="box">
            <div class="left-box">
            <h1 style="color:rgb(30, 144, 255);" >새소식</h1>
            <hr>
            	<div class="board-table-div">
	                <table class="board-table">
		                <tr>
		                	<th>NO</th>
		                	<th>제목</th>
		                	<th>시간</th>
		                </tr>
		                <c:forEach items="${fb }" var="b">
			                <tr>
			                	<td>${b.boardNo }</td>
			                	<td><a href="/fundingBoardDetail.kh?boardNo=${b.boardNo }" style="color: black;">${b.boardTitle }</a></td>
			                	<td>${b.boardStartdate }</td>
			                </tr>
		                </c:forEach>
	                </table>
                </div>
            </div>
            <div class="right-box">
                <div class="funding">
                    <div class="funding-deadline"><span>${f.fundingDeadline }</span><span>일 남음</span></div>
                    <c:choose>
    					<c:when test="${f.fundingSumRate gt 100 }">
							<div class="bar-back"><div class="bar" style="width:100%;"></div></div>
						</c:when>
						<c:otherwise>
							<div class="bar-back"><div class="bar" style="width: ${f.fundingSumRate}%;"></div></div>
						</c:otherwise>
					</c:choose>	
                    <div class="funding-sum-rate"><span>${f.fundingSumRate }</span><span>% 달성</span></div>
                    <div class="funding-sum"><span>${f.fundingCurrentSum}</span><span>원 펀딩</span></div>
                    <div class="supporter-num"><span>131</span><span>명의 서포터</span></div>
                	<div class="button-wrap">
                	<form action="/selectFundingOptionPrice.kh?fundingNo=${f.fundingNo }&&memberNo=${sessionScope.m.memberNo}" method="post" ><!-- 왜 get은안되고 post만되는지 질문 -->
                    	<input type="submit" class="btn bc1 funding-btn"  value="펀딩하기">          
                    </form>      	
                	</div>
                    
                    <div class="like-qna-share">
                        <div class="like">
                        <%-- <c:choose>
							<c:when test="${f.like eq 0 }">
								<span id="likestar" class="material-symbols-rounded likeB">star</span>									
							</c:when>
							<c:when test="${f.like eq 1 }">
								<span class="material-symbols-rounded likeB-yellow">star</span>									
							</c:when>
						</c:choose>								
							<span id="likeCount">${f.totallike}</span> --%>
							<c:choose>
						<c:when test="${f.like eq 0 }">
							<span class="material-symbols-rounded likeB">star</span>									
						</c:when>
						<c:when test="${f.like eq 1 }">
							<span class="material-symbols-rounded likeB-yellow">star</span>									
						</c:when>
					</c:choose>
					<span id="likeCount">${f.totallike}</span>
						</div>

                        <div class="qna"><button><span class="material-symbols-outlined"><span class="material-symbols-outlined">speaker_notes_off</span></span><span>문의하기</span></button></div>
                        <div class="share"><button><span class="material-symbols-outlined">share</span><span>공유하기</span></button></div></div>
                    </div>
                    <div class="funding-rank">펀딩랭크</div>
                </div>
            </div>
        </div>    
    </div>


    <%@include file="/WEB-INF/views/common/footer.jsp" %>
    <script>
        /*
        $(function(){
            $(".like").on("click",function(){
                if($(this).children().eq(0).attr("class")=="material-symbols-rounded likeB"){
                    $(this).children().eq(0).removeClass("material-symbols-rounded likeB");
                    $(this).children().eq(0).addClass("material-symbols-rounded likeB-yellow");
                }else{
                    $(this).children().eq(0).removeClass("material-symbols-rounded likeB-yellow");
                    $(this).children().eq(0).addClass("material-symbols-rounded likeB");
                }
                
            });
        });
        */
        /*
        $(document).on("click",".like",function(){
            if($(this).children().eq(0).attr("class")=="material-symbols-rounded likeB"){
                if(checkLogin()){
				const value = $("input#fundingNo").val();			
	
				$(this).children().eq(0).addClass("likeB-yellow").removeClass("likeB");
				
				$.ajax({
					url: "/addLikeF.kh",
					data : {
						fundingNo : value
					},
					type : "post",
					success: function(data){
						if(data==-1){
							alert("좋아요 업데이트 실패!");
						}
						$("#likeCount").text(data);
					}
				})							
			}else{
				return false;
			}
            }else{
                if(checkLogin()){
				const value = $("input#fundingNo").val();		
				$(this).children().eq(0).removeClass("likeB-yellow").addClass("likeB");			
				
				$.ajax({
					url: "/removeLikeF.kh",
					data : {
						fundingNo : value
					},
					type : "post",
					success: function(data){
						if(data==-1){
							alert("좋아요 업데이트 실패!");
						}else{				
							$("#likeCount").text(data);					
						}
					}
				})			
			}else{
				return false;
			}
            }
			
		})
        */
        $(document).on("click","span.likeB",function(){
			if(checkLogin()){
				const value = $("input#fundingNo").val();			
	
				$(this).addClass("likeB-yellow").removeClass("likeB");
				
				$.ajax({
					url: "/addLikeF.kh",
					data : {
						fundingNo : value
					},
					type : "post",
					success: function(data){
						if(data==-1){
							alert("관심상품 업데이트 실패!");
						}
						$("#likeCount").text(data);
					}
				});							
			}else{
				return false;
			}
		});
		$(document).on("click","span.likeB-yellow",function(){
			if(checkLogin()){
				const value = $("input#fundingNo").val();		
				$(this).removeClass("likeB-yellow").addClass("likeB");			
				
				$.ajax({
					url: "/removeLikeF.kh",
					data : {
						fundingNo : value
					},
					type : "post",
					success: function(data){
						if(data==-1){
							alert("관심상품 업데이트 실패!");
						}else{				
							$("#likeCount").text(data);					
						}
					}
				});			
			}else{
				return false;
			}
		});
	

        function checkLogin(){
			const id = $("input#memberNo").val();
			if(id==""){
				location.href = "/loginFrmF.kh";
				return false;
			}else{
				return true;
			}
		}
        function login(){
			location.href = "/loginFrmF.kh";
		}
        $(".share").on("click", function(){
            copyToClipboard();
            alert("주소가 복사되었어요!!")
        });
</script>
    <style>
        .funding-btn{
            font-size: 25px;
            line-height: 25px;
            font-weight: 600;
        }
    </style>
</body>
</html>