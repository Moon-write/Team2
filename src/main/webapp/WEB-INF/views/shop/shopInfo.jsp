<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://www.w3schools.com/lib/w3.js"></script>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<style>
.shop-content{
	width:700px;
	margin:30px auto;	
}
.shop-pic>img{
	height:350px;
	max-width:700px;
	display: block; 
	margin: 0px auto;
}
.info-detail{
	width:640px;
	margin:0 auto;
	margin-top:30px;
}

.movie-header{
	width:1200px;
	height:300px;
	margin:0 auto;
	display:flex;
}
.tab-wrap{
	width:200px;
	margin: 30px auto;
}
.tabs{
    list-style-type: none;    
    overflow: hidden;
}
.tabs>li{
    float: left;
    width: 100px;
    text-align: center;
    height: 30px;
    line-height: 30px;
    background-color: rgb(30,144,255);
   	color: white;
}
.tabs>li:hover{
    font-size: 1.1em;
    cursor: pointer;
}
.content-wrap{
    margin:0 auto;
}
.tabcontent{
    margin: 0 auto;
    padding: 30px 0px;
    display: none;
    text-align:center;
}
.tabcontent:first-of-type{
    display:block;
}
.tabs>li:first-of-type{
    background-color:#fffbe9;
   	color:white;
}
.posting-wrap {
display: flex;
flex-wrap: wrap;
}

.photoWrapper {
	clear: right;
	margin: 0 auto;
	width:1200px;
}
label {
   cursor: pointer;
   /* Style as you please, it will become the visible UI component. */
}

#upload-photo {
   opacity: 0;
   position: absolute;
   z-index: -1;
}
.input-form2 {
  width: 100%;
  padding: 0.8rem;
  background-color: #fff;
  outline: none;
  border: 1px solid #ccc;
  box-sizing: border-box;
}
tr th, tr td{
	border-bottom:1px solid #ccc;
	width:200px;
	padding:10px;
}
tr th{
	border-right:1px solid #ccc;
}
table{
	border:1px solid #ccc;
	border-collapse: collapse;
	margin:0 auto;
	margin-bottom:30px;
}
.auction-content, .auction-content2, .funding-content, .funding-content2, .donation-content, .donation-content2{
	float:left;
	margin-top:30px;
	margin-left:10px;
	margin-right:10px;
	width:calc(100%/3 - 20px);
	margin-bottom:30px;
}
.auction-content div>img, .auction-content2 div>img, .funding-content div>img, .funding-content2 div>img, .donation-content div>img, .donation-content2 div>img{
	width: 100%; height: 213px;
	object-fit: cover;
	border-radius: 10px;
}
.auction-list, .funding-list, .donation-list{
	height:300px;
}
h2{
	margin-top:30px;
}
</style>
</head>
<body>
	<c:choose>
		<c:when test="${sessionScope.m.memberLevel == 1 }"><%@include file="/WEB-INF/views/common/bizHeader.jsp" %></c:when>
		<c:otherwise><%@include file="/WEB-INF/views/common/header.jsp" %></c:otherwise>
	</c:choose>
		<input type='hidden' name='shopNo' value="${shop.shopNo }">
		<div class="page-content">
			<div class="shop-content">
				<div class="shop-pic" style="text-align: center;">
					<c:if test="${fn:length(shop.fileList) eq 0 }">
						<img class="mySlides" src="/resources/img/logo/WNYlogo1.png">
					</c:if>
					<c:if test="${fn:length(shop.fileList) gt 0 }">
						<c:forEach var="sp" items="${shop.fileList }">												
								<img class="mySlides" src="/resources/upload/shopPic/${sp.shopFilepath}">												
						</c:forEach>	
					</c:if>										
				</div>
				<div class="info-detail">
					<h1>${shop.shopName}</h1>
					<c:forEach var="c" items="${category }">
						<span style="background-color:rgb(30,144,255); font-size:15px;color:white; padding-left:4px;padding-right:4px;">${c.category }</span>
					</c:forEach>
					<div style="margin-top:30px;height:100px;">${shop.shopIntro }</div>
					<c:choose>
						<c:when test="${100000000<=shop.grossIncome and shop.grossIncome <100000000000}">
							<fmt:parseNumber var="grossIncome" value="${shop.grossIncome/100000000}" integerOnly="true" />
							<span>누적금액 </span>${grossIncome}<span>억원 ↑</span>
						</c:when>
						<c:when test="${10000<=shop.grossIncome and shop.grossIncome <100000000}">
							<fmt:parseNumber var="grossIncome" value="${shop.grossIncome/10000}" integerOnly="true" />
							<span>누적금액 </span>${grossIncome}<span>만원 ↑</span>
						</c:when>
						<c:when test="${shop.grossIncome <10000}">
							<span>누적금액 </span>${shop.grossIncome}<span>원</span>
						</c:when>
					</c:choose>							
				</div>
				<div class="tab-wrap">
			        <ul class="tabs">
			            <li>프로젝트</li>
			            <li>사업자 정보</li>
			        </ul>
			    </div>
			    <div class="content-wrap">
		            <div class="tabcontent" id="projectList">
		            	
		            </div>
		            <div class="tabcontent" id="shop-info">
			            <table>
			            	<tr>
			            		<th>상호명</th><td>${shop.shopName }</td>
			            	</tr>
			            	<tr>
			            		<th>주요제품</th>
			            		<td>
			            			<c:set var="comma" value=","/>
			            			<c:if test="${empty category }">
				                		없음
				                	</c:if>
				                	<c:if test="${!empty category }">
				                		<c:forEach var="c" items="${category }" varStatus="status">
				                		<c:if test="${!status.last}">
											<span>${c.category }${comma} </span>									
										</c:if>
										<c:if test="${status.last}">
											<span>${c.category }</span>
										</c:if>										
										</c:forEach>
				                	</c:if>
			            		</td>
			            	</tr>
			            	<tr>
			            		<th>설립일</th>
			            		<td>
			            			<c:if test="${empty shop.shopBirth }">
				                		없음
				                	</c:if>
				                	<c:if test="${!empty shop.shopBirth }">
				                		${shop.shopBirth }
				                	</c:if>
			            		</td>
			            	</tr>
			            	<tr>
			            		<th>주소</th><td>${sessionScope.m.memberAddr1 } ${sessionScope.m.memberAddr2 }</td>
			            	</tr>
			            	<tr>
			            		<th>전화번호</th><td>${sessionScope.m.memberPhone }</td>
			            	</tr>
			            	<tr>
			            		<th>사업자등록번호</th><td>${sessionScope.m.bizNo }</td>
			            	</tr>
			            </table>
		            </div>			            
		        </div>
			</div>			
		</div>
		<script>
			window.onload=init();
			function init(){
				const shopNo=$("input[name=shopNo]").val();
				$.ajax({
					url:"/selectFundingList.kh",
					data:{shopNo:shopNo},
					success:function(list){
						const div=$("#projectList");
						const div2=$("<div class='funding-list'>");
						let filepath="";
						if(list.length!=0){
							div.append("<h2>펀딩</h2>").append(div2);
						}
						for(let i=list.length-1;i>=list.length-3;i--){
							if(i<0){
								return;
							}
							const fundingNo=list[i].fundingNo;
							$.ajax({
								url:"/selectFundingFile.kh",
								data:{fundingNo:fundingNo},
								async:false,
								success:function(data){									
									filepath=data;									
								}
							});
							const content =	$("<div class='funding-content'>");
							const a=$("<a href='/fundingDetailStory.kh?fundingNo="+list[i].fundingNo+"'>");
							const div3=$("<div>");
							if(filepath=="0"){
								div3.append("<img src=\"/resources/upload/common/위니쥬.jpg\">");
							}else{
								div3.append("<img src=\"/resources/upload/funding/"+filepath+"\">");
							}
							const textBox="<div class='auction-title'><h4 style=\"white-space:nowrap;overflow:hidden;text-overflow:ellipsis\">"+list[i].fundingName+"</h4></div>"+
										  "<div class='auction-price'>"+
										  "<h5 style='font-family: ns-light;'>"+list[i].fundingSumRate+"%"+"</h5>"+
										  "<h5 style='font-family: ns-light;'>"+list[i].fundingDeadline+"일 남음"+"</h5>"
										  "</div>";							
							div2.append(content);
							content.append(a);
							a.append(div3).append(textBox);							
							/* if(list.length==2){
								$(".funding-content").css("width","calc(100%/2 - 20px)");
							}else if(list.length==1){
								$(".funding-content").css("width","calc(100% - 20px)");
							} */
						}
						for(let i=list.length-4;i>=0;i--){
							const fundingNo=list[i].fundingNo;
							$.ajax({
								url:"/selectFundingFile.kh",
								data:{fundingNo:fundingNo},
								async:false,
								success:function(data){									
									filepath=data;									
								}
							});							
							const content =	$("<div class='funding-content2' style=\"display:none;\">");
							const a=$("<a href='/fundingDetailStory.kh?fundingNo="+list[i].fundingNo+"'>");
							const div3=$("<div>");
							if(filepath=="0"){
								div3.append("<img src=\"/resources/upload/common/위니쥬.jpg\">");
							}else{
								div3.append("<img src=\"/resources/upload/funding/filepath\">");
							}
							const textBox="<div class='auction-title'><h4 style=\"white-space:nowrap;overflow:hidden;text-overflow:ellipsis\">"+list[i].fundingName+"</h4></div>"+
							  "<div class='auction-price'>"+
							  "<h5 style='font-family: ns-light;'>"+list[i].fundingSumRate+"%"+"</h5>"+
							  "<h5 style='font-family: ns-light;'>"+list[i].fundingDeadline+"일 남음"+"</h5>"
							  "</div>";							
							div2.append(content);
							content.append(a);
							a.append(div3).append(textBox);
						}
						if(list.length>3){
							div.append("<div><button onclick=\"more(this)\" class=\"btn bc1\" id=\"funding-more\" value=\"1\" style=\"margin-bottom:40px;\">더보기</button></div>");
						}
					}
				});
				$.ajax({
					url:"/selectDonationList.kh",
					data:{shopNo:shopNo},
					success:function(list){
						const div=$("#projectList");
						const div2=$("<div class='donation-list'>");					
						if(list.length!=0){
							div.append("<br><h2>기부</h2>").append(div2);
						}
						for(let i=list.length-1;i>=list.length-3;i--){
							if(i<0){
								return;
							}
							const content =	$("<div class='donation-content'>");
							const a=$("<a href='/donationClick.kh?projectNo="+list[i].projectNo+"'>");
							const div3=$("<div>");
							div3.append("<img src=\"/resources/upload/donation/"+list[i].donationImgpath+"\">");
							
							const textBox="<div class='auction-title'><h4 style=\"white-space:nowrap;overflow:hidden;text-overflow:ellipsis\">"+list[i].donationTitle+"</h4></div>"+
							"<p><span style=\"float:left;\">00%</span> <a style=\"display:flex;float:right;\"> <span class=\"material-icons\">paid</span> <span>"+list[i].donationCash+"</span></a></p>";							
							div2.append(content);
							content.append(a);
							a.append(div3).append(textBox);
						}
						for(let i=list.length-4;i>=0;i--){
							const content =	$("<div class='donation-content2' style='display:none;'>");
							const a=$("<a href='/donationClick.kh?projectNo="+list[i].projectNo+"'>");
							const div3=$("<div>");
							div3.append("<img src=\"/resources/upload/donation/"+list[i].donationImgpath+"\">");
							
							const textBox="<div class='auction-title'><h4 style=\"white-space:nowrap;overflow:hidden;text-overflow:ellipsis\">"+list[i].donationTitle+"</h4></div>"+
							"<p><span style=\"float:left;\">00%</span> <a style=\"display:flex;float:right;\"> <span class=\"material-icons\">paid</span> <span>"+list[i].donationCash+"</span></a></p>";							
							div2.append(content);
							content.append(a);
							a.append(div3).append(textBox);
						}
						if(list.length>3){
							div.append("<div><button onclick=\"more(this)\" class=\"btn bc1\" id=\"donation-more\" value=\"2\" style=\"margin-bottom:40px;\">더보기</button></div>");
						}										
					}
				});
				$.ajax({
					url:"/selectAuctionList.kh",
					data:{shopNo:shopNo},
					success:function(list){
						const div=$("#projectList");
						const div2=$("<div class='auction-list'>");
						if(list.length!=0){
							div.append("<br><h2>경매</h2>").append(div2);							
						}
						for(let i=list.length-1;i>=list.length-3;i--){
							if(i<0){
								return;
							}
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

							const content =	"<div class='auction-content'>"+						
											"<a href='/auctionView.kh?projectNo="+list[i].projectNo+"'>"+
											"<div>"+
											"<img src='../../../resources/upload/auction/"+list[i].auctionPic+"'>"+
											"</div>"+
											"<div class='auction-title'>"+
												"<h4 style=\"white-space:nowrap;overflow:hidden;text-overflow:ellipsis\">"+list[i].projectName+"</h4>"+
												"<h5 style='font-family: ns-light;'>"+list[i].auctionItem+"</h5>"+
											"</div>"+
											"<div class='auction-price'>"+
											"<h5 style='font-family: ns-light;'>"+lastTime+"</h5>"+
												"<h4>"+priceName+" : "+thousands(list[i].bestPrice)+"원"+"</h4>"+
											"</div></a>"+
										"</div>"+"</div>";
							div2.append(content);
						}
						for(let i=list.length-4;i>=0;i--){
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

							const content =	"<div class='auction-content2' style=\"display:none;\">"+						
											"<a href='/auctionView.kh?projectNo="+list[i].projectNo+"'>"+
											"<div>"+
											"<img src='../../../resources/upload/auction/"+list[i].auctionPic+"'>"+
											"</div>"+
											"<div class='auction-title'>"+
												"<h4 style=\"white-space:nowrap;overflow:hidden;text-overflow:ellipsis\">"+list[i].projectName+"</h4>"+
												"<h5 style='font-family: ns-light;'>"+list[i].auctionItem+"</h5>"+
											"</div>"+
											"<div class='auction-price'>"+
											"<h5 style='font-family: ns-light;'>"+lastTime+"</h5>"+
												"<h4>"+priceName+" : "+thousands(list[i].bestPrice)+"원"+"</h4>"+
											"</div></a>"+
										"</div>"+"</div>";
							div2.append(content);
						}
						if(list.length>3){
							div.append("<div><button onclick=\"more(this)\" class=\"btn bc1\" id=\"auction-more\" value=\"4\" style=\"margin-bottom:40px;\">더보기</button></div>");	
						}						
					}					
				});
			}
			function more(e){
				if(e.value=="1"){
					const funding=$("#funding-more");
					const div=$("#projectList");
					const div2=$(".funding-list");				
					const fc=$(".funding-content2");
					let length=0;
					if(fc%3==0){
						length=parseInt(fc.length/3)+1;
					}else{
						length=parseInt(fc.length/3)+2;
					}
					if(funding.text()=="더보기"){
						funding.text("닫기");
						div2.css("height", length*340+"px");
					}else{
						funding.text("더보기");
						div2.css("height","340px");
					}
					fc.slideToggle();
				}else if(e.value=="2"){
					const donation=$("#donation-more");
					const div=$("#projectList");
					const div2=$(".donation-list");				
					const dc=$(".donation-content2");
					let length=0;
					if(dc%3==0){
						length=parseInt(dc.length/3)+1;
					}else{
						length=parseInt(dc.length/3)+2;
					}
					if(donation.text()=="더보기"){
						donation.text("닫기");
						div2.css("height", length*326+"px");
					}else{
						donation.text("더보기");
						div2.css("height","326px");
					}
					dc.slideToggle();
				}else if(e.value=="4"){
					const auction=$("#auction-more");
					const div=$("#projectList");
					const div2=$(".auction-list");				
					const ac=$(".auction-content2");
					let length=0;
					if(ac%3==0){
						length=parseInt(ac.length/3)+1;
					}else{
						length=parseInt(ac.length/3)+2;
					}
					if(auction.text()=="더보기"){
						auction.text("닫기");
						div2.css("height", length*364+"px");
					}else{
						auction.text("더보기");
						div2.css("height","364px");
					}
					ac.slideToggle();
				}
			}
			/* $(document).on("click", ".more-button", function(e){
				console.log(e.value);
				if(value=="4"){
					const div=$("#projectList");
					const div2=$(".auction-list");				
					const ac=$(".auction-content2");
					let length=0;
					if(ac%3==0){
						length=parseInt(ac.length/3)+1;
					}else{
						length=parseInt(ac.length/3)+2;
					}
					if($(this).text()=="더보기"){
						$(this).text("닫기");
						div2.css("height", length*364+"px");
					}else{
						$(this).text("더보기");
						div2.css("height","0px");
					}
					ac.slideToggle();	
				}else if(value=="1"){
					console.log(1);
				}
			})
			$(document).on("click", ".close-auction", function(){
				$(this).remove();
				const div=$("#projectList");
				const ac=$(".auction-content2");
				ac.css("display","none");
				div.append("<div><button class=\"btn bc1 more-auction\">닫기</button></div>");
			}) */
			$(function(){
			    const tabs=$(".tabs>li");
			    tabs.on("click",function(){
			    	tabs.css("color", "white").css("backgroundColor","rgb(30,144,255)");
			        $(this).css("color","white").css("backgroundColor","rgba(24, 116, 205, 1)");
			        const content=$(".tabcontent");
			        content.hide();
			        const index=tabs.index(this);
			        content.eq(index).show();
			    })
			    tabs.first().click();
			})
			var slideIndex = 0;
			carousel();
			
			function carousel() {
			  var i;
			  var x = document.getElementsByClassName("mySlides");
			  for (i = 0; i < x.length; i++) {
			    x[i].style.display = "none";
			  }
			  slideIndex++;
			  if (slideIndex > x.length) {slideIndex = 1}
			  x[slideIndex-1].style.display = "block";
			  setTimeout(carousel, 2000); // Change image every 2 seconds
			}
			const thousands = (o) => o.toString().replace(/\B(?<!\/\d*)(?=(\d{3})+(?!\d))/g,',');
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>