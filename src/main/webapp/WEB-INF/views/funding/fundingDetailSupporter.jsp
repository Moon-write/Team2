<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 디테일 페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

<script>
    var seaho = $.noConflict(true); 
  seaho(document).ready(function(){
    seaho('.slider').bxSlider();
  });
</script>
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
    color: #4a4a4a;
    
}
.link>ul>a:nth-of-type(4)>li{
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

    float: left;
    height: 800px;
    
}

.right-box{
    width: 30%;


    float: right;
    padding: 0 20px;
}
.funding{
    width: 100%;

  
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
    height: 120px;
    background-color:rgba(30,144,255,0.15) ;
    border: 1px solid rgba(30,144,255,0.2);
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
.like-qna-share{
    display: flex;
    margin-top: 30px;
    justify-content: space-between;
    padding: 0;
}
.like-qna-share>div{
    border: 1px solid #ccc;
		border-radius: 10px;
		width: 32%;
		padding: 5px;
		text-align: center;
        cursor:pointer;
        height : 41px;
        background-color:  rgba(30,144,255,0.15) ;
}


.like>span{
		width: 25px;
        height: 25px;
		text-align: center;
	}
.like>span:first-child{
		font-size: 1.5em;
	}
.modal-open-btn{
    display: flex;
    height: 35px;
    line-height: 35px;
    
}
.modal-open-btn span{
    flex-direction: column-reverse;
}
.count-member{
    width: 100%;
    padding: 0 20px;
    margin-top: 100px;
    font-size: 33px;
    margin-bottom: 50px;
    font-family: ns-light;
   
}
.count-member>span{
    color: rgb(30,144,255);
}
.member-list{
    width: 100%;
    height: 100px;

    border-bottom: 1px solid #e6eaed;
    display: flex;

}
.member-img{
    width: 100px;
    height: 100px;
    margin-left: 60px;
    padding-top: 10px;
}
.member{
    box-sizing: border-box;
    padding-left: 10px;
    line-height: 100px;
    font-size: 24px;
    color: #676363;
}
.tech{
    display: inline-block;
    line-height: 100px;
	width:80px;
	height:80px;
	border-radius:40px;
	text-align:center;
	vertical-align:middle;
    background-size: 100% auto;
	background-image: url("/resources/img/auction/preview.jpg");
}

strong{
    color: #0d0f12;
}
</style>
</head>
<body>
    <%@include file="/WEB-INF/views/common/header.jsp" %>
    	<!--
        <table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>카테고리</th>
			<th>시작날짜</th>
			<th>끝난날짜</th>
			<th>목표금액</th>
			<th>현재모인금액</th>
			<th>달성률</th>
			<th>멤버넘버</th>
			<th>파일패스</th>
			<th>마감날짜</th>
			<th>회사명</th>
		</tr>
		<c:forEach items="${list }" var="fjf">
			<tr>
				<td>${fjf.fundingNo }</td>
				<td>${fjf.fundingName}</td>
				<td>${fjf.fundingCategory}</td>
				<td>${fjf.fundingStartDate}</td>
				<td>${fjf.fundingEndDate}</td>
				<td>${fjf.fundingSum}</td>
				<td>${fjf.fundingCurrentSum}</td>
				<td>${fjf.fundingSumRate}</td>
				<td>${fjf.memberNo}</td>
				<td>${fjf.fundingFilePath}</td>
				<td>${fjf.fundingDeadline}</td>	
				<td>${fjf.bizName }		
			</tr>
		</c:forEach>
	</table>-->
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
    <!--메인-->
    <div class="main">
        <div class="box">
            <!--왼쪽-->
            <div class="left-box" >
                <div class="count-member">현재 이 프로젝트에 <br> <span>${f.orderCount}명</span>  의 참여가 이루어 졌습니다.
                </div>
                <div class="member-list-wrap">
                    <c:forEach items="${f.orderList}" var="o">
                    <div class="member-list">
                        <div class="member-img"><div class="tech"></div></div>
                        <div class="member"><strong>${o.memberId}</strong>님이 <strong class="price-comma1">${o.orderPrice}</strong>원으로 펀딩을 참여 하셨습니다.</div>
                    </div>
                </c:forEach>
                </div>
                

            </div>

            <!--오른쪽-->
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
                    <div class="funding-sum"><span id="price-comma2">${f.fundingCurrentSum}</span><span>원 펀딩</span></div>
                    <div class="supporter-num"><span>${f.orderCount}</span><span>명의 서포터</span></div>
                	<div class="button-wrap">
                	<form action="/selectFundingOptionPrice.kh?fundingNo=${f.fundingNo }&&memberNo=${sessionScope.m.memberNo}" method="post" ><!-- 왜 get은안되고 post만되는지 질문 -->
                    	<input type="submit" class="btn bc1 funding-btn"  value="펀딩하기">          
                    </form>      	
                	</div>
                    
                    <div class="like-qna-share">
                        <div class="like">
                        <%--<c:choose>
                                <c:when test="${f.like eq 0 }">
                                    <span id="likestar" class="material-symbols-rounded likeB">star</span>									
                                </c:when>
                                <c:when test="${f.like eq 1 }">
                                    <span class="material-symbols-rounded likeB-yellow">star</span>									
                                </c:when>
						    </c:choose>								
							<span id="likeCount">${f.totallike}</span>
                             --%>
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

                        <div class="qna modal-open-btn" target="#test-modal"><span class="material-symbols-outlined modal-open-btn"><span class="material-symbols-rounded">
                            sms
                            </span></span><span>문의하기</span></div>
                        <div class="share"><span class="material-symbols-outlined">share</span><span>공유하기</span></div>
                    </div>
                </div>
                <div class="funding-rank"></div>
                </div>
            </div>
        </div>
        <div id="test-modal" class="modal-bg" style="z-index:88888;">
			<div class="modal-wrap" style="width:800px;">
				<div class="modal-head">
					<h2 id="graph-title">문의하기</h2>					
					<span class="material-icons close-icon modal-close">close</span>
				</div>
				<div class="modal-content">
					<form action="/insertQna.kh">
						<input type="hidden" name="memberId" value="${sessionScope.m.memberId }">
						<input type="hidden" name="divNo" value="1">
						<input type="hidden" name="projectNo" value="${f.fundingNo}">
						<table class="tbl">
							<tr><td><input type="text" class="input-form" name="qnaTitle" placeholder="제목을 입력하세요"></td></tr>
							<tr><td><textarea class="input-form" name="qnaContent" placeholder="내용을 입력하세요"></textarea></td></tr>
							<tr><td><button class="btn bc1">등록</button></td></tr>							
						</table>						
					</form>					
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
        $(function () {
        	const modalContent=$(".modal-content");
        	const fundingNo=$("#fundingNo").val();
			  $(document).on("click", ".modal-open-btn", function () {
				  $($(this).attr("target")).css("display", "flex");					 
			  });
			  $(document).on("click", ".modal-close", function () {
			    $(this).parents(".modal-wrap").parent().css("display", "none");
			  });  
			  $(".sub-navi").prev().after("<span class='material-icons dropdown'>expand_more</span>");
		});

        $(function(){
            $(".share").on("click", function(){
                var url = '';
                var textarea = document.createElement("textarea");
                document.body.appendChild(textarea);
                url = window.document.location.href;
                textarea.value = url;
                textarea.select();
                document.execCommand("copy");
                document.body.removeChild(textarea);
                alert("URL이 복사되었어요!!");
                });

                for(let i = 0 ; i < $(".price-comma1").length;i++){
				let priceComma1 = $(".price-comma1").eq(i).text();
				let cn1 = priceComma1.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
				$(".price-comma1").eq(i).text(cn1);

                let priceComma2 = $("#price-comma2").text();
                const cn2 = priceComma2.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
                $("#price-comma2").text(cn2);
			}
        })
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