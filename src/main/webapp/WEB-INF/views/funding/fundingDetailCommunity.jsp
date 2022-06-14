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
.link>ul>a:nth-of-type(2)>li{
    border-bottom: 5px solid rgb(30,144,255);

}
.link-border-line{
    border-bottom: 1px solid rgba(75, 75, 75, 0.2) ;
}
.box{
    width: 100%;

    overflow: hidden;
}

/*왼쪽 상자*/
.left-box{
    width: 65%;
    background-color: bisque;
    
    float: left;
    
}

/*오른쪽 상자*/
.right-box{
    width: 30%;
    height: 1000px; /*나중에 지워주기*/

    float: right;
    padding: 0 20px;
}
.suppoter-text{
    margin-top: 20px;
    line-height: 23px;
    color: #1d2129;
    font-size: 18px;
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
.modal-wrap{
	width: 700px;
} 
.modal-content,.modal-head,.modal-foot{
	padding: 10px 40px;
}
.modal-wrap>.modal-content,.modal-head,.modal-foot {
    padding: 10px;
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
                <div class="comment-wrap">
                    <p>
                        서포터님!<br>
                        처음 <strong>메이커의 열정과 가치에 공감</strong>해주셨듯, 마지막까지 <strong>메이커를 응원</strong>해주세요.
                    </p>
                </div>
                <div class="faq">
                    와디즈에서 펀딩하는 방법이 궁금하다면?
                    <br>
                    <h3>FAQ</h3>
                </div>
                <div class="faq-slide">
                    <h3>예시 펀딩했어요~</h3>
                    <h3>예시 펀딩했어요~</h3>
                    <h3>예시 펀딩했어요~</h3>
                    <h3>예시 펀딩했어요~</h3>
                </div>
                <br>
                <div class="community-review">
                    <h2>응원.의견.체험리뷰</h2>
                    <button type="button" id="bidBtn" class="btn bc2 bs5">글 남기기</button>
                    <br>
                    <div id='noComment' style='height: 100px; display: none; align-items: center;'>등록된 댓글이 없습니다!</div>
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

    <div id="bidding-modal" class="modal-bg"  style="display: none;">
    	
    
        <div class="modal-wrap">
            <div class="modal-head">
                <h2>글 남기기</h2>
                <span class="material-symbols-rounded close-icon modal-close">close</span>
            </div>
            <div class="modal-content">
                    <span>메이커에게 응원 메시지를 남겨주세요.</span>
                    <br>
                    <textarea id="commentContent"style="width: 100%; height: 250px;"></textarea>
            </div>
                <div class="modal-foot">
                    <h2 style="text-align: left;">게시물 이용 안내</h2>
                    <ol style="text-align: left;">
                        <li>본 프로젝트와 무관한 글, 광고성, 욕설, 비방, 도배 등의 글은 예고 없이 삭제 등 조치가 취해질 수 있으며, 해당 내용으로 인해 메이커, 서포터, 제3자에게 피해가 발생되지 않도록 유의하시기 바랍니다.</li>
                        <li>최근 메이커 또는 제3자에 대한 허위사실 유포, 비방 목적의 댓글로 인해 당사자간 법적분쟁이 발생한 사례가 증가하고 있습니다. 악의적 댓글 작성자는 명예훼손, 모욕 등으로 법적 책임을 부담하게 될 수 있다는 점을 유의하여 주시기 바랍니다.</li>
                        <li>리워드 관련 문의 및 배송 문의는 '메이커에게 문의하기'를 통해 정확한 답변을 받을 수 있습니다.</li>
                        <li>서포터님의 연락처, 성명, 이메일 등의 소중한 개인정보는 절대 남기지 마세요.</li>
                    </ol>
                    <br>
                    <button class="btn bc2" id="sendBidBtn" disabled>등록</button>
                    <button class="btn bc22 modal-close">취소</button>
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

        //모달 글 작성
        $(function(){//모달 종료버튼
            $("#bidBtn").on("click",function(){
				$("#bidding-modal").css("display", "flex");
                console.log("등록버튼눌림");
			});
        
            $(".modal-close").on("click", function () {
                    $(this).parents(".modal-wrap").parent().css("display", "none");
                     
            });
            $("#sendBidBtn").on("click", function(){
                console.log("등록버튼 눌림");  
                const value = $("#moreBtn").val();
                const content =  $("#commentContent").val();
                
             

            });
        });//온로드

        
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