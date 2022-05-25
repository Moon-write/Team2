<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-piechart-outlabels@0.1.4/dist/chartjs-plugin-piechart-outlabels.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-doughnutlabel/2.0.3/chartjs-plugin-doughnutlabel.js"></script>

<style>
.menu {
	margin-top:30px;
	width: 150px;
	height: 100%;
	float: left;
}

.menu ul {
	margin: 0;
	padding: 0;
	list-style-type: none;
	text-align: center;
}

.menu a {
	font-size: 14px;
	display: block;
	height: 40px;
	color:black;
	line-height: 40px;
	text-decoration: none;
	position: relative;
}

.sub-menu {
	display: none;
}

.sub-menu a{
	color:gray;
}

.more {
	position: absolute;
	font-size: 20px;
	right: 20px;
	transition-duration: 0.5s;
}

.menu-active {
	transform: rotate(45deg);
}

.page-content {
	float: left;
}

input[type="number"] {
	min-width: 50px;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<div class="menu">
			<ul class="main-menu">
				<li>
					<a href="#">펀딩</a>
					<ul class="sub-menu">
						<li><a href="#">펀딩 등록</a></li>
						<li><a href="/manageFunding.kh">펀딩 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">기부</a>
					<ul class="sub-menu">
						<li><a href="#">기부 등록</a></li>
						<li><a href="/manageDonation.kh">기부 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">공동구매</a>
					<ul class="sub-menu">
						<li><a href="#">공동구매 등록</a></li>
						<li><a href="/manageGroup.kh">공동구매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">경매</a>
					<ul class="sub-menu">
						<li><a href="addAuction.kh">경매 등록</a></li>
						<li><a href="/manageAuction.kh">경매 관리</a></li>
					</ul>
				</li>
				<li>
					<a href="#">Q&A페이지</a>
					
				</li>
				<li>
					<a href="#">통계</a>
					<ul class="sub-menu">
						<li><a href="#">누적 금액</a></li>
						<li><a href="/checkCount.kh">일별 카운트</a></li>
					</ul>
				</li>
				<li>
					<a href="/shopUploadFrm.kh?memberNo=${sessionScope.m.memberNo }">상호등록</a>
				</li>
				<li>
					<a href="/updateInfo.kh?memberNo=${sessionScope.m.memberNo }">마이페이지</a>
				</li>
				<li>
					<a href="/shopInfo.kh?memberNo=${sessionScope.m.memberNo }">샵</a>
				</li>
			</ul>
		</div>
		<div class="show-content">
			<div>
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<h3 style="margin-bottom:10px;margin-top:30px;">경매 관리</h3>
				<select onchange="divChange(this)" style="margin-bottom:10px;">				
                    <option value="selling">진행중인 경매</option>
                    <option value="end">종료된 경매</option>
                </select>
				<table class="tbl"></table>				
			</div>	
		</div>
	</div>
	<div id="test-modal" class="modal-bg">
      <div class="modal-wrap">
        <div class="modal-head">
          <h2>입찰 참여자 성별 비율</h2>
          <span class="material-icons close-icon modal-close">close</span>
        </div>
        <div class="modal-content">
        	<canvas id="chart" width=600 height=600></canvas>
        </div>
      </div>
    </div>
	<script>
		$(function() {
			$(".sub-menu").prev().append("<span class='more'></span>")
			$(".more").parent().parent().on(
					"click",
					function(e) {
						$(this).children().last().slideToggle();
						$(this).children().first().children(".more")
								.toggleClass("menu-active");
						e.stopPropagation();
					});
		});
		const memberNo=$("input[name=memberNo]").val();
		const table=$("table");
		const sTr=$("<tr class=\"tr-2\">");
		const eTr=$("<tr class=\"tr-2\">");
		const sTh=$("<th>번호</th><th>프로젝트명</th><th>상품명</th><th>수량</th><th>시작일</th><th>종료일</th><th>시작가</th><th>현재가</th><th></th><th></th><th></th>");
		const eTh=$("<th>번호</th><th>프로젝트명</th><th>상품명</th><th>수량</th><th>시작일</th><th>종료일</th><th>시작가</th><th>낙찰가</th><th>판매상태</th><th></th>");
		const thousands = (o) => o.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
		sTr.append(sTh);
		eTr.append(eTh);
		window.onload=init();
		function divChange(e) {
			if(e.value=="selling"){
				window.location.replace("manageAuction.kh");
			}else if(e.value="end"){
				table.empty();
				table.append(eTr);
				$.ajax({
					url : "/selectExpiredAList.kh",
					data:{memberNo:memberNo},					
					success : function(list){
						for(let i=0;i<list.length;i++){
							const tr2=$("<tr>");
							const noTd=$("<td>");
							const pNameTd=$("<td>");
							const iNameTd=$("<td>");
							const amountTd=$("<td>");
							const sdTd=$("<td>");
							const edTd=$("<td>");
							const priceTd=$("<td>");
							const statusTd=$("<td>");
							const projectNo=$("<div style=\"display:none;\">"+list[i].PROJECTNO+"</div>");
							const modal=$("<td><button class=\"btn2 bc1 modal-open-btn chart\" target=\"#test-modal\">통계</button></td>");
							$.ajax({
								url:"/selectBestPrice.kh",
								data:{memberNo:memberNo, projectNo:list[i].PROJECTNO},
								async: false,
								success:function(data){
									const bpTd=$("<td>");
									const bp=$("<div style=\"display:none;\">"+data+"</div>");
									noTd.append(i+1);
									pNameTd.append(list[i].PROJECTNAME);
									iNameTd.append(list[i].AUCTIONITEM);
									amountTd.append(list[i].AUCTIONAMOUNT);
									sdTd.append(list[i].AUCTIONSTART);
									edTd.append(list[i].AUCTIONEND);
									priceTd.append(thousands(list[i].AUCTIONPRICE)+"원");
									if(data>0){
										bpTd.append(thousands(data)+"원");	
									}else{
										bpTd.append(data);
									}									
									if(data>0){
										statusTd.append("낙찰완료");	
									}else{
										statusTd.append("판매기간만료");
									}
									$("input[name=projectNo]").val(list[i].PROJECTNO);
									tr2.append(noTd).append(pNameTd).append(iNameTd).append(amountTd).append(sdTd).append(edTd).append(priceTd).append(bpTd).append(statusTd).append(projectNo).append(bp).append(modal);
									table.append(tr2);
								}
							});								
			            }
					}
				});			
			}
		}
		function init(){
			table.empty();
			table.append(sTr);
			$.ajax({
				url : "/selectAList.kh",
				data:{memberNo:memberNo},					
				success : function(list){
					for(let i=0;i<list.length;i++){
						const tr2=$("<tr>");
						const noTd=$("<td>");
						const pNameTd=$("<td>");
						const iNameTd=$("<td>");
						const amountTd=$("<td>");
						const sdTd=$("<td>");
						const edTd=$("<td>");
						const priceTd=$("<td>");
						const modiTd=$("<td><button class=\"btn2 bc1\">수정하기</button></td>");
						const delTd=$("<td><button class=\"btn2 bc1\" id=\"delete\">삭제</button></td>");
						const projectNo=$("<div style=\"display:none;\">"+list[i].PROJECTNO+"</div>");
						const modal=$("<td><button class=\"btn2 bc1 modal-open-btn chart\" target=\"#test-modal\">통계</button></td>");
						$.ajax({
							url:"/selectBestPrice.kh",
							data:{memberNo:memberNo, projectNo:list[i].PROJECTNO},
							async: false,
							success:function(data){
								const bpTd=$("<td>");
								const bp=$("<div style=\"display:none;\">"+data+"</div>");
								noTd.append(i+1);
								pNameTd.append(list[i].PROJECTNAME);
								iNameTd.append(list[i].AUCTIONITEM);
								amountTd.append(list[i].AUCTIONAMOUNT);
								sdTd.append(list[i].AUCTIONSTART);
								edTd.append(list[i].AUCTIONEND);
								priceTd.append(thousands(list[i].AUCTIONPRICE)+"원");
								if(data>0){
									bpTd.append(thousands(data)+"원");	
								}else{
									bpTd.append(data);
								}	
								tr2.append(noTd).append(pNameTd).append(iNameTd).append(amountTd).append(sdTd).append(edTd).append(priceTd).append(bpTd).append(modiTd).append(delTd).append(projectNo).append(bp).append(modal);
								table.append(tr2);
							}
						});								
		            }
					$(document).on("click", "td #delete",function(event){					
						const projectNo=$(this).parent().next().text();
						const bestPrice=$(this).parent().next().next().text();
						if(bestPrice>0){
							alert("이미 입찰 된 상품입니다.");
						}else{					
							if(confirm("삭제하시겠습니까?")==true){
								$.ajax({
									url : "/deleteAuction.kh",
									data:{projectNo:projectNo},
									success : function(result){
										window.location.replace(result);					
									},
									error : function(){
										alert("error");
									}
								});
							}
						}
						
					});
				}
			});
		}
		$(function () {
			  $(document).on("click", ".modal-open-btn", function () {
				 if($(this).parent().prev().text()>0){
					 $($(this).attr("target")).css("display", "flex");
					    const projectNo=$(this).parent().prev().prev().text();
					    var gen = [];
					    var arr=[];
							$.ajax({
								url : "/selectBidList.kh",
								data:{projectNo:projectNo},
								success : function(list) {							
									if(list!=""){							
										for (let i = 0; i < list.length; i++) {
											gen.push(list[i]);
										};
										$.ajax({
									      url : "/auctionGender.kh",
									      type : 'POST',
									      traditional : true,
									      data : {
									          gen : gen
									      },							      
									      success : function(list){
										  const obj=JSON.parse(list);
										for (let i = 0; i < obj.length; i++) {
													arr.push(obj[i]);
											};
										var gender = arr.map(Number);												
										const myChart = new Chart(document.getElementById('chart').getContext("2d"), {
											   "data":{
											      "datasets":[
											         {
											            "data":gender,
											            "backgroundColor":[
											               "#5DA5DA",
											               "#F17CB0"
											            ]
											         }
											      ],
											      "labels":[
											         "남성",
											         "여성"
											      ]
											   },
											   "options":{
											      "plugins":{
											         "legend":false,
											         "outlabels":{
											        	"text":"%l\n%v명 (%p)",
											            "color":"white",
											            "stretch":35,
											            "font":{
											               "resizable":true,
											               "minSize":12,
											               "maxSize":18
											            }
											         }								        
											      }
											   },
											   "type":"outlabeledDoughnut"
											});
									      }
									  });
									}
								}
							}); 
				 }else{
						alert("입찰자가 없습니다.");						
					}			    
			  });
			  $(document).on("click", ".modal-close", function () {
			    $(this).parents(".modal-wrap").parent().css("display", "none");
			  });  
			  $(".sub-navi").prev().after("<span class='material-icons dropdown'>expand_more</span>");
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>