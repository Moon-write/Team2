<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 관리</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chartjs-plugin-piechart-outlabels@0.1.4/dist/chartjs-plugin-piechart-outlabels.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-doughnutlabel/2.0.3/chartjs-plugin-doughnutlabel.js"></script>

<style>
input[type="number"] {
	min-width: 50px;
}
.tbl tr>th:nth-child(2){
	width:15%;
}
.tbl tr>th:nth-child(3){
	width:17%;
}
.tbl tr>th:first-child, .tbl tr>th:nth-child(4){
	width:5%;
}
.tbl tr>th:nth-child(5),.tbl tr>th:nth-child(6){
	width:7%;
}
.tbl tr>th:nth-child(7),.tbl tr>th:nth-child(8){
	width:10%;
}
.tbl tr>th:nth-child(9){
	width:10%;
}
.tbl tr>th:nth-child(10), .tbl tr>th:last-child{
	width:7%;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">		
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
		<div class="show-content">
			<div>
				<input type="hidden" name="memberNo"
					value="${sessionScope.m.memberNo }">
				<h3 style="margin-bottom: 10px; margin-top: 30px;">경매 관리</h3>
				<select onchange="divChange(this)" style="margin-bottom: 10px;">
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
				<h2 id="graph-title">그래프</h2>
				<span class="material-icons close-icon modal-close">close</span>
			</div>
			<div class="modal-content"></div>
		</div>
	</div>
	<script>
		const memberNo=$("input[name=memberNo]").val();
		const table=$("table");
		const sTr=$("<tr class=\"tr-2\">");
		const eTr=$("<tr class=\"tr-2\">");
		const sTh=$("<th>번호</th><th>프로젝트명</th><th>상품명</th><th>수량</th><th>시작일</th><th>종료일</th><th>시작가</th><th>현재가</th><th></th><th></th><th></th>");
		const eTh=$("<th>번호</th><th>프로젝트명</th><th>상품명</th><th>수량</th><th>시작일</th><th>종료일</th><th>시작가</th><th>낙찰가</th><th>판매상태</th><th></th>");
		const thousands = (o) => o.toString().replace(/\B(?<!\/\d*)(?=(\d{3})+(?!\d))/g,',');		
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
						const modiTd=$("<td><button class=\"btn2 bc1 modifyBtn\">수정하기</button></td>"); <!--지음: 수정하기에 클래스 하나 넣었어요-->
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
		const modalContent=$(".modal-content");
		const graphMenu=$("<button onclick=\"selectGraph(this)\" type=\"button\" class=\"btn bc1\" value=\"gender\">성별 비율</button> <button onclick=\"selectGraph(this)\" type=\"button\" class=\"btn bc1\" value=\"age\">연령별 비율</button>");
		let projectNo2=0;		
		$(function () {
			  $(document).on("click", ".modal-open-btn", function () {
				 if($(this).parent().prev().text()>0){
					 $($(this).attr("target")).css("display", "flex");	
					 modalContent.empty();
					 modalContent.append(graphMenu);			
					    const projectNo=$(this).parent().prev().prev().text();
					    projectNo2=projectNo;
					    selectGraph(event);					    
				 }else{
						alert("조회할 정보가 없습니다.");						
					}			    
			  });
			  $(document).on("click", ".modal-close", function () {
			    $(this).parents(".modal-wrap").parent().css("display", "none");
			  });  
			  $(".sub-navi").prev().after("<span class='material-icons dropdown'>expand_more</span>");
		});
		
		const graphTitle=$("#graph-title");
		function selectGraph(event){
			if(event.value=="gender"){
				graphTitle.text("성별 비율");
				modalContent.empty();				    	
		    	const canvas=$("<canvas id=\"chart\" width=600 height=600></canvas>");
		    	modalContent.append(canvas);
		    	var gen = [];
			    var arr=[];
					$.ajax({
						url : "/selectBidList.kh",
						data:{projectNo:projectNo2},
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
			}else if(event.value=="age"){
				graphTitle.text("연령대별 차트");
				modalContent.empty();
				var mnList=[];
				var male=[];
				var female=[];
				$.ajax({
					url:"/selectBidList.kh",
					type:"get",
					data:{projectNo:projectNo2},
					success:function(list){
						for(let i=0;i<list.length;i++){
							mnList.push(list[i]);	
						}
						$.ajax({
							url:"/selectMaleGroup.kh",
							type:"get",
							data:{mnList:mnList},
							traditional : true,
							success:function(list){
								const obj=JSON.parse(list);
								for (let i = 0; i < 7; i++) {
											male.push(obj[i]);											
									};
									for(let j=7;j<10;j++){												
										male[6]+=obj[j];											
									};
								var maleCount = male.map(Number);
								$.ajax({
									url:"/selectFemaleGroup.kh",
									type:"get",
									data:{mnList:mnList},
									traditional : true,
									success:function(list){
										const obj=JSON.parse(list);
										for (let i = 0; i < 7; i++) {
													female.push(obj[i]);
											};
											for(let j=7;j<10;j++){												
												female[6]+=obj[j];											
											};
										var femaleCount = female.map(Number);	
										const canvas=$("<canvas id=\"bar-chart\" width=\"600\" height=\"350\"></canvas>");
										modalContent.append(canvas);
										 // Return with commas in between
										

										var dataPack1 = male;
										var dataPack2 = female;
										var dates = ["10대", "20대", "30대", "40대", "50대", "60대", "70대~"];

										var bar_ctx = document.getElementById('bar-chart');
										var bar_chart = new Chart(bar_ctx, {
										    type: 'bar',
										    data: {
										        labels: dates,
										        datasets: [
										        {
										            label: '남성',
										            data: dataPack1,
																backgroundColor: "#5DA5DA",
																barThickness: 20
										        },
										        {
										            label: '여성',
										            data: dataPack2,
																backgroundColor: "#F17CB0",
																barThickness: 20
										        },
										        ]
										    },
										    options: {
										     		animation: {
										        	duration: 10,
										        },
										        tooltips: {
															mode: 'label',
										          callbacks: {
										          label: function(tooltipItem, data) { 
										          	return data.datasets[tooltipItem.datasetIndex].label + ": " + tooltipItem.yLabel+"명";
										          }
										          }
										         },
										        scales: {
										          xAxes: [{ 
										          	stacked: true, 
										            gridLines: { display: false },
										            }],
										          yAxes: [{ 
										          	stacked: true, 
										            ticks: {
										            	beginAtZero: true,
										                callback: function(value) {
										                	if (value % 1 === 0) {
										                		return value+"명";
										                		}
										                	}
									     				}, 
										            }],
										        }, // scales
										        legend: {display: true}
										    } // options
										   }
										);
									}
								});
								
							}
						});
					}
				});
			}
		};
		<!--지음: 수정하기용 메소드 하나 넣었어요 -->
		$(document).on("click",".modifyBtn",function(){
			const value = $(this).parent().next().next("div").text();
			const link = "/gotoModifyAuction.kh?projectNo="+value;
			window.open(link,"_blank");
		})
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>