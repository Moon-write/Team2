<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매</title>
<style>
	.likeList-wrap{
		height: 360px;
		display: flex;
		justify-content: center;
		margin: 30px;
	}
	.likeList-contents{
		width: 1000px;
		display: flex;
		justify-content: center;
	}
	.likeList-content{
		margin: 0px 10px;
		padding: 20px;
		position: relative;
		box-shadow: 1px 1px 1px 1px #eee;
		transition: box-shadow 0.5s;
	}
	.likeList-content:hover{
		box-shadow: 1px 1px 2px 2px #ccc;
	}
	.likeList-content>span{
		position: absolute;
		right: 30px; top: 30px;
		font-size: 2em;
		background-color: white;
		border-radius: 30%;
	}
	.likeList-content>a>div:first-of-type{
		width: 200px; height: 200px;
		margin-bottom: 10px;
	}
	.likeList-content a{
		display: flex;
		height: 320px;
		color : #191f28;
		flex-direction: column;
		justify-content: space-between;
	}
	.likeList-content div>img{
		width: 100%; height: 100%;
		object-fit: cover;
		border-radius: 10px;
	}

	.likeList-title{
		text-align: left;
	}
	.likeList-price{
		text-align: right;
	}


	.array-wrap{
		display: flex;
		justify-content: flex-end;
		align-items: center;
		width: 80%;
		margin: 0 auto;
		margin-top: 30px;
	}
	.input-form{
		width: 150px !important; height: 30px;
		margin-left: 10px;
		padding: 0px 15px !important;
	}
	#searchBtn{
		margin-left: 5px;
		height: 30px;
		width: 50px;
		padding: 0px;
	}
	label.btn.left{
		margin-left: 5px;
		height: 30px;
		padding: 0px 5px;
		line-height: 30px;
		border-top-right-radius: 0px;
		border-bottom-right-radius: 0px ;
	}
	label.btn.right{
		margin-right: 5px;
		height: 30px;
		padding: 0px 5px;
		line-height: 30px;
		border-top-left-radius: 0px;
		border-bottom-left-radius: 0px ;
	}
	#searchBtn>span{
		margin-top: 2px;
	}
	.auctionList-wrap{
		margin-bottom: 20px;
	}
	.auction-content{
		display: flex;
		padding: 30px;
		width: 80%;
		margin: 0px auto;
		border-bottom: 1px solid #ccc;
	}
	.auction-content>a{
		display: block;
		width: 95%;
		display: flex;
		color: #191f28;
	}
	.auction-pic{
		width: 40%; height: 250px;
		text-align: center;
	}
	.auction-pic>img{
		width: 250px; height : 250px;
		object-fit: cover;
		border-radius: 20px;
	}
	.auction-title{
		position: relative;
	}
	.auction-title>h4{
		margin-top: 5px;
	}
	.auction-info{
		width: 60%;
		display: flex;
		flex-direction: column;
		justify-content: space-between;
		padding: 10px 0px;
	}
	.auction-info>h4{
		font-family: ns-light;
	}
	.auction-time>h3{
		margin-bottom: 10px;
		color: #ff82ab;
	}
	.auction-time>span{
		margin-right: 5px;
		font-family: ns-light;
	}
	.auction-price{
		margin-top: 10px;
		text-align: right;
	}
	.auction-price>h1{
		text-align: right;
	}
	.auction-like{
		width: 5%
	}
	span.likeB , span.likeB-yellow{
		font-size: 2.5em;
	}
	.page{
		padding: 50px 0px;
	}
	.pageArrow{
		width: 4%; height: 100%;
		display: flex;
		justify-content: center;
		align-items: center;		
	}
	.pageArrow>span{
		font-size: 2em;
	}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page-content">
		<c:if test="${not empty sessionScope.m}">
			<div class="page-titleC">관심상품 모아보기</div>
			<div class="likeList-wrap">
				<div class='pageArrow' id='prevP'></div>
				<div class='likeList-contents'></div>
				<div class='pageArrow' id='nextP'></div>
			</div>
			<hr>		
		</c:if>
			<div class="page-titleC">전체 경매상품</div>
			<div class="auctionList-wrap">
				<div class="array-wrap">
					<input type="checkbox" id="startItem" style="display: none;" <c:if test="${startFlag eq 1}">checked</c:if>>
					<label for="startItem" class="btn bc11 left">오픈 전 프로젝트 제외</label>
					<input type="checkbox" id="endItem" style="display: none;" <c:if test="${endFlag eq 1}">checked</c:if>>
					<label for="endItem" class="btn bc11 right">종료 프로젝트 제외</label>
					<select id="listArray" class="input-form">
						<option value="1" <c:if test='${order eq 1}'>selected="selected"</c:if>>최근등록순</option>
						<option value="2" <c:if test='${order eq 2}'>selected="selected"</c:if>>마감임박순</option>
						<option value="3" <c:if test='${order eq 3}'>selected="selected"</c:if>>관심순</option>
						<option value="4" <c:if test='${order eq 4}'>selected="selected"</c:if>>조회수순</option>
					</select>
					<input type="text" id="listSearch" name="searchKeyword" class="input-form"
						<c:choose>
							<c:when test='${empty keyword}'>
								placeholder="상품명 입력"
							</c:when>
							<c:otherwise>
								value="${keyword}"
							</c:otherwise>
						</c:choose>
						>
					<button class="btn bc11" id="searchBtn"><span class="material-symbols-outlined" >search</span></button>
				</div>
				<c:if test='${empty list }'>
					<div class="auction-content" style="height: 300px; align-items: center;">
						<h4 style="width: 100%; text-align: center;">조건에 맞는 경매물품이 없습니다!</h4>
					</div>
				</c:if>
				<c:forEach items="${list }" var="l">
					<div class="auction-content">
						<a href="/auctionView.kh?projectNo=${l.projectNo }">
							<div class="auction-pic">
								<img src="../../../resources/upload/auction/${l.auctionPic }">
							</div>
							<div class="auction-info">
								<div class="auction-title">
									<h3>${l.projectName }</h3>
									<h4>${l.auctionItem }</h4>
								</div>
								<h4>입찰 ${l.bidCount }회</h4>

								<div class="auction-time">
									<h3>
										<c:choose>
											<c:when test="${l.lastDay ge 0 }">
												<c:if test="${l.lastDay ne 0 }">
													<span id="last-day">${l.lastDay }</span>일 
												</c:if>
												<c:if test="${l.lastHour ne 0 }">
													<span id="last-hour">${l.lastHour }</span>시간 
												</c:if>
												<span id="last-minute">${l.lastMin }</span>분
												뒤 종료
											</c:when>
											<c:otherwise>
												<span style="color: #ff2e63;">경매 마감</span>
											</c:otherwise>
										</c:choose>
									</h3>
									<c:choose>
										<c:when test="${l.auctionCategory eq 0}">
											<span class="badge">재난구호모금</span>
										</c:when>
										<c:when test="${l.auctionCategory eq 1}">
											<span class="badge">유기동물 구조</span>
										</c:when>
										<c:when test="${l.auctionCategory eq 2}">
											<span class="badge">미혼모 지원</span>
										</c:when>
										<c:when test="${l.auctionCategory eq 3}">
											<span class="badge">장애인 지원</span>
										</c:when>
										<c:when test="${l.auctionCategory eq 4}">
											<span class="badge">소년가장 후원</span>
										</c:when>
									</c:choose>
									<c:if test="${l.bidCount ge 10 }">
										<span class="badge-pink">입찰 10건 이상</span>
									</c:if>
									<c:if test="${l.lastDay eq 0 }">
										<span class="badge-pink">오늘마감</span>
									</c:if>
								</div>
								<div class="auction-price">
									<s>시작가 ${l.auctionPrice} 원</s>
									<h2 style="font-family: ns-light;">
										<c:choose>
											<c:when test="${l.lastDay ge 0}">
												현재가
											</c:when>
											<c:otherwise>최종가</c:otherwise>
										</c:choose>
										<span style="color: red;">${l.bestPrice }</span> 원</h2>
								</div>
							</div>
						</a>	
						<div class="auction-like">
							<c:if test="${not empty sessionScope.m}">
								<c:choose>
									<c:when test="${l.like eq 0 }">
										<span class="material-symbols-rounded likeB">star</span>									
									</c:when>
									<c:when test="${l.like eq 1 }">
										<span class="material-symbols-rounded likeB-yellow">star</span>									
									</c:when>
								</c:choose>
								<input type="hidden" value="${l.projectNo}" class="likeNo">
							</c:if>
						</div>
					</div>			
				</c:forEach>
				<!-- 한 콘텐츠 끝 -->
				<div class="page">
					${page}
				</div>
			</div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script type="text/javascript">
		// 기본셋팅
		$(function(){
			if($("input#startItem").prop("checked")==true){
				$("label.left").toggleClass("bc11").toggleClass("bc2");
			}
			if($("input#endItem").prop("checked")==true){
				$("label.right").toggleClass("bc11").toggleClass("bc2");
			}

			$("input#endItem").on("click",function(){
				keywordLink();	
			})
			$("input#startItem").on("click",function(){
				keywordLink();	
			})

			$("select#listArray").on("change",function(){
				keywordLink();
			})
			$("button#searchBtn").on("click",function(){
				keywordLink();
			})			
		})



		function keywordLink(){
			let endFlag = 0;
			let startFlag =0;

			if($("input#endItem").prop("checked")==true){
				endFlag = 1;
			}
			if($("input#startItem").prop("checked")==true){
				startFlag = 1;
			}
			// 종료프로젝트 제외
			location.href = "/auctionList.kh?startFlag="+startFlag+"&endFlag="+endFlag+"&searchKeyword="+$("input#listSearch").val()+"&order="+$("select#listArray").val()+"&reqPage=1";
		}

		$(document).on("click","span.likeB",function(){
			const value = $(this).parent().children("input").val();			
			$(".likeList-wrap").slideDown();
			
			$(this).addClass("likeB-yellow").removeClass("likeB");
			
			$.ajax({
				url: "/addLike.kh",
				data : {
					projectNo : value
				},
				type : "post",
				success: function(data){
					if(data==-1){
						alert("관심상품 업데이트 실패!");
					}
					checkMyLikeCount(1);
				}
			})			
		})
		$(document).on("click","span.likeB-yellow",function(){
			const value = $(this).parent().children("input").val();		
			$(this).removeClass("likeB-yellow").addClass("likeB");			
			
			$.ajax({
				url: "/removeLike.kh",
				data : {
					projectNo : value
				},
				type : "post",
				success: function(data){
					if(data==-1){
						alert("관심상품 업데이트 실패!");
					}else{				
						keywordLink();
					}
				}
			})			
		})
		$(function(){
			// 좋아요 갯수 세기
			const id = $("input#memberNo").val();
			if(id!=""){
				checkMyLikeCount(1);				
			}
		})
		
		function checkMyLikeCount(pageNo){
			$.ajax({
				url : "/checkMyLikeCount.kh",
				type :  "post",
				success : function(size){
					if(size==0){
						$(".likeList-wrap").slideUp();
						return;
					}else if(size<=pageNo*3){
						selectLikeList(pageNo);
					}else if(size>pageNo*3){
						selectLikeList(pageNo);
						putNextArrow(pageNo);
					}
				}
			})
		}
		function selectLikeList(pageNo){
			$(".likeList-contents").empty();
			$(".pageArrow").empty();
			
			$.ajax({
				url : "/selectLikeList.kh",
				type : "post",
				data : {
					pageNo : pageNo
				},
				success : function(list){
					if(list==null){
						return;
					}
					for(let i=list.length-1;i>=0;i--){
						let lastDay ="";
						let lastHour ="";
						let lastMin ="";
						let lastTime ;

						let priceName = "현재가";
						if(list[i].lastDay<0){
							lastTime = "경매마감";
							priceName = "최종가";
						}else{							
							if(list[i].lastDay!=0){
								lastDay = list[i].lastDay+"일 ";
							}
							if(list[i].lastHour!=0){								
								lastHour = list[i].lastHour.toString()+"시간 ";
							}
							if(list[i].lastMin){
								lastMin = list[i].lastMin.toString()+"분 ";
							}
							lastTime = lastDay + lastHour + lastMin +"뒤 종료";							
						} 

						const content = "<div class='likeList-content'>"+
										"<input type='hidden' value='"+list[i].projectNo+"'>"+
										"<span class='material-symbols-rounded likeB-yellow'>star</span>"+
										"<a href='/auctionView.kh?projectNo="+list[i].projectNo+"'>"+
										"<div>"+
										"<img src='../../../resources/upload/auction/"+list[i].auctionPic+"'>"+
										"</div>"+
										"<div class='likeList-title'>"+
											"<h4>"+list[i].projectName+"</h4>"+
											"<h5 style='font-family: ns-light;'>"+list[i].auctionItem+"</h5>"+
										"</div>"+
										"<div class='likeList-price'>"+
										"<h5 style='font-family: ns-light;'>"+lastTime+"</h5>"+
											"<h4>"+priceName+" : "+list[i].bestPrice+"</h4>"+
										"</div></a>"+
									"</div>";
						$(".likeList-contents").append(content);
					}
					if(pageNo>1){
						putPrevArrow(pageNo);
					}
				},
				error : function(){
					console.log("데이터 없음");
				}
			})						
		}
		function putPrevArrow(pageNo){
			
			const prev = $("<span class='material-symbols-outlined'>");
			prev.val(parseInt(pageNo)-1);
			prev.text("arrow_back_ios_new");
			$(".pageArrow#prevP").prepend(prev);
		};
		
		function putNextArrow(pageNo){
			const next = $("<span class='material-symbols-outlined'>");
			next.val(parseInt(pageNo)+1);
			next.text("arrow_forward_ios");
			$(".pageArrow#nextP").prepend(next);
		}
		$(document).on("click",".pageArrow>span",function(){
			checkMyLikeCount($(this).val());
		})
	 </script>
</body>
</html>
