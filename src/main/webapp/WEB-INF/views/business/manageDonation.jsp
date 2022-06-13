<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.3"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-piechart-outlabels@0.1.4/dist/chartjs-plugin-piechart-outlabels.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-doughnutlabel/2.0.3/chartjs-plugin-doughnutlabel.js"></script>

<style>
.container {
  width: 80%;
  margin: 15px auto;
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">	
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
		<div class="show-content">
			<div>
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<h3 style="margin-bottom:10px;margin-top:30px;">기부 관리</h3>
				<select onchange="divChange(this)" style="margin-bottom:10px;">			
                    <option value="selling">진행중인 기부</option>
                    <option value="end">종료된 기부</option>
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
        <div class="modal-content">
        	<div class="container">
			  
			</div>
        </div>
      </div>
    </div>
	<script>
		const memberNo=$("input[name=memberNo]").val();
		const table=$("table");
		const sTr=$("<tr class=\"tr-2\">");
		const eTr=$("<tr class=\"tr-2\">");
		const sTh=$("<th>번호</th><th>프로젝트명</th><th>상품가격</th><th>목표기부금액</th><th>현재모인금액</th><th>시작일</th><th>종료일</th><th></th><th></th><th></th>");
		const eTh=$("<th>번호</th><th>프로젝트명</th><th>상품가격</th><th>목표기부금액</th><th>총모인금액</th><th>시작일</th><th>종료일</th><th></th>");
		const thousands = (o) => o.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ',');
		sTr.append(sTh);
		eTr.append(eTh);
		window.onload=init();
		function divChange(e) {
			if(e.value=="selling"){
				window.location.replace("manageDonation.kh");
			}else if(e.value="end"){
				table.empty();
				table.append(eTr);
				$.ajax({
					url : "/selectExpiredDList.kh",
					data:{memberNo:memberNo},					
					success : function(list){
						for(let i=0;i<list.length;i++){
							const tr=$("<tr>");
							const noTd=$("<td>");
							const pNameTd=$("<td>");
							const cashTd=$("<td>");
							const targetTd=$("<td>");
							const sumTd=$("<td>");
							const sdTd=$("<td>");
							const edTd=$("<td>");
							const projectNo="<div style=\"display:none;\">"+list[i].PROJECTNO+"</div>";
							const sum="<div style=\"display:none;\">"+list[i].DONATIONSUM+"</div>";
							const modal=$("<td><button class=\"btn2 bc1 modal-open-btn chart\" target=\"#test-modal\">통계</button></td>");
							noTd.append(i+1);
							pNameTd.append(list[i].DONATIONTITLE);
							cashTd.append(thousands(list[i].DONATIONCASH)+"원");
							targetTd.append(thousands(list[i].DONATIONTARGET)+"원");
							sumTd.append(thousands(list[i].DONATIONSUM)+"원");
							sdTd.append(list[i].DONATIONSTARTDATE);
							edTd.append(list[i].DONATIONENDDATE);
							tr.append(noTd).append(pNameTd).append(cashTd).append(targetTd).append(sumTd).append(sdTd).append(edTd).append(projectNo).append(sum).append(modal);
							table.append(tr);						
			            }
					}
				});
			}
		};
		function init(){
			table.empty();
			table.append(sTr);
			$.ajax({
				url : "/selectDList.kh",
				data:{memberNo:memberNo},					
				success : function(list){
					for(let i=0;i<list.length;i++){
						const tr=$("<tr>");
						const noTd=$("<td>");
						const pNameTd=$("<td>");
						const cashTd=$("<td>");
						const targetTd=$("<td>");
						const sumTd=$("<td>");
						const sdTd=$("<td>");
						const edTd=$("<td>");
						const modiTd=$("<td><button class=\"btn2 bc1\">수정하기</button></td>");
						const delTd=$("<td><button class=\"btn2 bc1\" id=\"delete\">삭제</button></td>");
						const projectNo="<div style=\"display:none;\">"+list[i].PROJECTNO+"</div>";
						const sum="<div style=\"display:none;\">"+list[i].DONATIONSUM+"</div>";
						const modal=$("<td><button class=\"btn2 bc1 modal-open-btn chart\" target=\"#test-modal\">통계</button></td>");
						noTd.append(i+1);
						pNameTd.append(list[i].DONATIONTITLE);
						cashTd.append(thousands(list[i].DONATIONCASH)+"원");
						targetTd.append(thousands(list[i].DONATIONTARGET)+"원");
						sumTd.append(thousands(list[i].DONATIONSUM)+"원");
						sdTd.append(list[i].DONATIONSTARTDATE);
						edTd.append(list[i].DONATIONENDDATE);
						tr.append(noTd).append(pNameTd).append(cashTd).append(targetTd).append(sumTd).append(sdTd).append(edTd).append(modiTd).append(delTd).append(projectNo).append(sum).append(modal);
						table.append(tr);						
		            }
				
					$(document).on("click", "td #delete",function(event){					
						const projectNo=$(this).parent().next().text();
						$.ajax({
							url : "/checkDnOrder.kh",
							type:"get",
							data:{projectNo:projectNo},
							success:function(cdo){
								if(cdo==0){
									if(confirm("삭제하시겠습니까?")==true){	
										$.ajax({
											url:"/deleteDonation.kh",
											data:{projectNo:projectNo},
											success : function(result){
												window.location.replace(result);					
											}
										});
									}
								}else{
									alert("삭제할 수 없습니다.");
								}						
							},
							error : function(){
								alert("error");
							}
						});											
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
				var mnList=[];
				var gen = [];
		    	const canvas=$("<canvas id=\"chart\" width=600 height=600></canvas>");
		    	modalContent.append(canvas);		    	
				$.ajax({
					url:"/selectMemberNo.kh",
					type:"get",
					data:{memberNo:memberNo,projectNo:projectNo2,divNo:2},
					success:function(list){
						for(let i=0;i<list.length;i++){
							mnList.push(list[i]);	
						};
						console.log(mnList);
						$.ajax({
							url:"/genderGraph.kh",
							type:"get",
							traditional : true,
							data:{mnList:mnList},
							success:function(list){
								const obj=JSON.parse(list);
								for (let i = 0; i < obj.length; i++) {
									gen.push(obj[i]);
								};
								var gender = gen.map(Number);
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
				});
			}else if(event.value=="age"){
				graphTitle.text("연령대별 차트");
				modalContent.empty();
				var mnList=[];
				var male=[];
				var female=[];
				$.ajax({
					url:"/selectMemberNo.kh",
					type:"get",
					data:{memberNo:memberNo,projectNo:projectNo2,divNo:2},
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
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>