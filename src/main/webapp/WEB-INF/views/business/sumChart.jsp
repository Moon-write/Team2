<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>

<style>
.tbl{
	border:1px solid #ccc;
}
td{
	border-right:1px solid #ccc;
}
td:last-child{
	border-right:0px solid #ccc;
}
.th{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
	width:15%;
}
.th2{
	border-bottom:1px solid #ccc;
	border-right:1px solid #ccc;
}
.datepicker{
	width:75px;
	text-align:center;
}
.detailContent{
	display:none;
}
.tbl3{
	border:1px solid #ccc;
}
.tbl3 tr th{
	
}
</style>

</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
		<div class="show-content">
			<div id="div1">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<h3 style="margin-bottom:10px;margin-top:30px;">누적금액</h3>				                                
               	<table class="tbl" style="margin-bottom:30px;">               		
               		<tr>
               			<th class="th">기간</th>
               			<td>
               				<p style="float:left;">
						        <input type="text" name="startDate" class="datepicker" id="datepicker1" value="" disabled>
						        <input type="text" name="endDate" class="datepicker" id="datepicker2" value="" disabled>
						    </p>
               			</td>  
               			<td rowspan=2 style="border-left:1px solid #ccc;"><button class="btn bc1 selectChart">검색</button></td>             			
               		</tr>
               		<tr>
               			<th class="th">분류</th>
               			<td>
               				<select onchange="divChange(this)" name="divNo" id="divNo" style="float:left;">	
               					<option value="0">선택</option>                								
			                    <option value="1">펀딩</option>
			                    <option value="2">기부</option>
			                    <option value="4">경매</option>
			                </select>
			                <span id="divNoTd">
			                
			                </span>		                
               			</td>               			
               		</tr>               		               	
               	</table>			
			</div>
			<div><h4>1. 드래그로 범위 지정 2. 휠로 확대 및 축소 3. ctrl 누르고 위치 이동</h4></div>
			<div id="chartArea">
				
			</div>			
		</div>
	</div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/hammer.js/2.0.8/hammer.min.js" integrity="sha512-UXumZrZNiOwnTcZSHLOfcTs0aos2MzBWHXOHOuB0J/R44QB0dwY5JgfbvljXcklVf65Gc4El6RjZ+lnwd2az2g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-zoom/1.2.1/chartjs-plugin-zoom.min.js" integrity="sha512-klQv6lz2YR+MecyFYMFRuU2eAl8IPRo6zHnsc9n142TJuJHS8CG0ix4Oq9na9ceeg1u5EkBfZsFcV3U7J51iew==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/1.4.0/chartjs-plugin-annotation.min.js"></script>
	<script>
		window.onload=init();	
		
		function init(){
			const memberNo=$("input[name=memberNo]").val();
			const chartArea=$("#chartArea");
			const canvas=$("<canvas id=\"myChart\" width=\"500\" height=\"200\" style=\"margin-bottom:50px;\"></canvas>");			
			var startDate;
			var dates=[];
			var amounts=[];
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month  + '-' + day;
			$.ajax({
				url:"/selectStartDate.kh",
				data:{memberNo:memberNo, divNo:0},
				success:function(list){
					startDate=list;
					$.ajax({
						url:"/getDates.kh",
						data:{startDate:startDate, endDate:dateString},
						success:function(list){
							for(let i=0;i<list.length;i++){
								dates.push(list[i]);
							}
							$.ajax({
								url:"/getAmounts.kh",
								data:{memberNo:memberNo, startDate:startDate, endDate:dateString, divNo:0, projectNo:0},
								success:function(list){
									for(let i=0;i<list.length;i++){
										amounts.push(list[i]);										
									}									
									chartArea.empty();
									chartArea.append(canvas);
									graph(dates,amounts);
								}
							});
						}
					});
				}
			});					
		}
		function graph(dates,amounts){			
			const options = {
		        plugins: {		           
		            zoom:{
                        zoom:{
                            wheel:{
                            	mode:'x',
                                enabled:true
                            },
                            mode:'x',
                            drag:{
                                enabled:true,
                                backgroundColor:'rgba(255,99,132,0.2)',
                                borderColor:'rgba(255,99,132,1)',
                                borderWidth:1,
                                threshold:30
                            }
                        },
                        pan:{
                        	modifierKey:'ctrl',
                        	enabled:true
                        }
                    }
		            
		        },
		        indexAxix:'x',
	        	scales:{
	        		y:{
	        			beginAtZero:true
	        		}
	        	}
	        };
			const config = {
			        type: 'line',
			        data: {
			            labels: dates,
			            datasets: [{
				            label: '누적금액',
				            data: amounts,
				            fill: false,
				            borderColor: 'rgb(30,144,255)',
				            tension: 0.1
			            }]
			        },
			        options
		        };
	        const myChart = new Chart('myChart', config);
		}
		function graphWithAnnotation(dates, amounts, targetPrice){
			const options = {
		        plugins: {
		            autocolors: false,
		            annotation: {
		            annotations: {
		                line1: {
		                    type: 'line',
		                    yMin: targetPrice,
		                    yMax: targetPrice,
		                    borderColor: 'rgb(255,130,171)',
		                    hoverBorderColor:'rgb(30,144,255)',
		                    borderWidth: 2,
		                    label:{
		                        enabled:true,
		                        backgroundColor:'rgba(255,26,104,1)',
		                                                
		                        content:'목표금액 : '+thousands(targetPrice)+'원',
		                        position:'end'
		                        }   
		                    }
		                }
		            },
		            zoom:{
                        zoom:{
                            wheel:{
                            	mode:'x',
                                enabled:true
                            },
                            mode:'x',
                            drag:{
                                enabled:true,
                                backgroundColor:'rgba(255,99,132,0.2)',
                                borderColor:'rgba(255,99,132,1)',
                                borderWidth:1,
                                threshold:30
                            }
                        },
                        pan:{
                        	modifierKey:'ctrl',
                        	enabled:true
                        }
                    }
		            
		        },
		        indexAxix:'x',
	        	scales:{
	        		y:{
	        			beginAtZero:true
	        		}
	        	}
	        };
	        const config = {
	        type: 'line',
	        data: {
	            labels: dates,
	            datasets: [{
		            label: '누적금액',
		            data: amounts,
		            fill: false,
		            borderColor: 'rgb(30,144,255)',
		            tension: 0.1
	            }]
	        },
	        options
	        };

	        const myChart = new Chart('myChart', config);
	        Chart.register(zoomPlugin);
		}
		
		$(".selectChart").on("click",function(){
			const memberNo=$("input[name=memberNo]").val();
			const chartArea=$("#chartArea");
			const canvas=$("<canvas id=\"myChart\" width=\"500\" height=\"200\" style=\"margin-bottom:50px;\"></canvas>");
			let datePicker1 = $("input[name=startDate]").val();
			let datePicker2 = $("input[name=endDate]").val();
			let divNo=$("#divNo").val();
			let projectNo=$("#divList").val();
			let targetPrice;
			var startDate;
			var endDate;
			var dates=[];
			var amounts=[];
			var today = new Date();
			var year = today.getFullYear();
			var month = ('0' + (today.getMonth() + 1)).slice(-2);
			var day = ('0' + today.getDate()).slice(-2);
			var dateString = year + '-' + month  + '-' + day;
			if(datePicker1.length==0 && datePicker2.length==0 && divNo==0){
				alert("검색조건을 입력하세요.");
				return;
			}
			if((datePicker1.length==10 && datePicker2.length==0) || (datePicker1.length==0 && datePicker2.length==10)){
				alert("날짜를 모두 입력하세요.");
				return;
			}
			chartArea.empty();
			chartArea.append(canvas);	
			if(datePicker1.length==10){				
				$.ajax({
					url:"/getDates.kh",
					data:{startDate:datePicker1, endDate:datePicker2},
					success:function(list){
						for(let i=0;i<list.length;i++){
							dates.push(list[i]);
						}
						$.ajax({
							url:"/getAmounts.kh",
							data:{memberNo:memberNo, startDate:datePicker1, endDate:datePicker2, divNo:divNo,projectNo:projectNo},
							success:function(list){
								for(let i=0;i<list.length;i++){
									amounts.push(list[i]);										
								}
								if(divNo==3 || divNo==4){
									graph(dates,amounts);	
								}else{
									if(divNo==1 && projectNo!=0){
										$.ajax({
											url:"/selectFundingSum.kh",
											data:{memberNo:memberNo, projectNo:projectNo},
											success:function(list){
												targetPrice=list;
												graphWithAnnotation(dates, amounts, targetPrice);
											}
										});
									}else if(divNo==2 && projectNo!=0){
										$.ajax({
											url:"/selectDonationTarget.kh",
											data:{memberNo:memberNo, projectNo:projectNo},
											success:function(list){
												targetPrice=list;
												graphWithAnnotation(dates, amounts, targetPrice);
											}
										});
									}else{
										graph(dates, amounts);
									}
								}
							}
						});
					}
				});	
			}else{
				if(projectNo!=0){
					$.ajax({
						url:"/selectStartEndDate.kh",
						data:{memberNo:memberNo, projectNo:projectNo, divNo:divNo},
						success:function(list){
							startDate=list[0].STARTDATE;
							endDate=list[0].ENDDATE;
							$.ajax({
								url:"/getDates.kh",
								data:{startDate:startDate, endDate:endDate},
								success:function(list){
									for(let i=0;i<list.length;i++){
										dates.push(list[i]);
									}
									$.ajax({
										url:"/getAmounts.kh",
										data:{memberNo:memberNo, startDate:startDate, endDate:dateString, divNo:divNo,projectNo:projectNo},
										success:function(list){
											for(let i=0;i<list.length;i++){
												amounts.push(list[i]);										
											}
											if(divNo==1 && projectNo!=0){
												$.ajax({
													url:"/selectFundingSum.kh",
													data:{memberNo:memberNo, projectNo:projectNo},
													success:function(list){
														targetPrice=list;
														graphWithAnnotation(dates, amounts, targetPrice);
													}
												});
											}else if(divNo==2 && projectNo!=0){
												$.ajax({
													url:"/selectDonationTarget.kh",
													data:{memberNo:memberNo, projectNo:projectNo},
													success:function(list){
														targetPrice=list;
														graphWithAnnotation(dates, amounts, targetPrice);
													}
												});
											}else{
												graph(dates, amounts);
											}
										}
									});
								}
							});
						}
					});
				}else{
					$.ajax({
						url:"/selectStartDate.kh",
						data:{memberNo:memberNo, divNo:divNo},
						success:function(list){
							startDate=list;
							$.ajax({
								url:"/getDates.kh",
								data:{startDate:startDate, endDate:dateString},
								success:function(list){
									for(let i=0;i<list.length;i++){
										dates.push(list[i]);
									}									
									$.ajax({
										url:"/getAmounts.kh",
										data:{memberNo:memberNo, startDate:startDate, endDate:dateString, divNo:divNo, projectNo:0},
										success:function(list){
											for(let i=0;i<list.length;i++){
												amounts.push(list[i]);										
											}									
											chartArea.empty();
											chartArea.append(canvas);
											graph(dates,amounts);
										}
									});
								}
							});
						}
					});	
				}			
			}			
		});
		
		
		
		
		
	
		$("#datepicker1").change(function(){
			const startDate=new Date($("input[name=startDate]").val());
			const endDate=new Date($("input[name=endDate]").val());
			if(startDate>endDate){
				alert("날짜를 다시 선택하세요.");
				$("input[name=startDate]").val("");
			}		
		});	
		$("#datepicker2").change(function(){
			const startDate=new Date($("input[name=startDate]").val());
			const endDate=new Date($("input[name=endDate]").val());
			if(startDate>endDate){
				alert("날짜를 다시 선택하세요.");
				$("input[name=endDate]").val("");
			}		
		});	
		$(function() {
	        $("#datepicker1").datepicker({
	        	dateFormat: 'yy-mm-dd'
	                ,showOtherMonths: true
	                ,showMonthAfterYear:true
	                ,changeYear: true
	                ,changeMonth: true                
	                ,showOn: "both"  
	                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
	                ,buttonImageOnly: true
	                ,buttonText: "선택"            
	                ,yearSuffix: "년"
	                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	                ,dayNamesMin: ['일','월','화','수','목','금','토']
	                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
	                ,minDate: "-5y"
	                ,maxDate: 0   
	        });                           
	    });
		$(function() {
	        $("#datepicker2").datepicker({
	        	dateFormat: 'yy-mm-dd'
                ,showOtherMonths: true
                ,showMonthAfterYear:true
                ,changeYear: true
                ,changeMonth: true                
                ,showOn: "both"  
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif"
                ,buttonImageOnly: true
                ,buttonText: "선택"            
                ,yearSuffix: "년"
                ,monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
                ,dayNamesMin: ['일','월','화','수','목','금','토']
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일']
                ,minDate: "-5y"
                ,maxDate: "+5y"  
	        });                           
	    });
		$('#datepicker').datepicker('setDate', 'today');
		function divChange(e) {
			const memberNo=$("input[name=memberNo]").val();
			const divNoTd=$("#divNoTd");
			const select=$("<select id=\"divList\" style=\"float:left;\">");
			const optionDefault=$("<option value=\"0\">선택</option");
			select.append(optionDefault);
			optionDefault.append("선택");
			if(e.value=="1"){
				divNoTd.empty();
				$.ajax({
					url:"/selectFList.kh",
					data:{memberNo:memberNo},
					success:function(list){
						divNoTd.append(select);
						for(let i=0;i<list.length;i++){
							const option=$("<option value=\""+list[i].FUNDINGNO+"\">");
							option.append(list[i].FUNDINGNAME);
							select.append(option);							
						}
						$.ajax({
							url:"/selectExpiredFList.kh",
							data:{memberNo:memberNo},
							success:function(list){				
								for(let i=0;i<list.length;i++){
									const option=$("<option value=\""+list[i].FUNDINGNO+"\">");
									option.append(list[i].FUNDINGNAME);
									select.append(option);
								}
							}
						});
					}
				});	
			}else if(e.value=="2"){
				divNoTd.empty();
				$.ajax({
					url:"/selectDList.kh",
					data:{memberNo:memberNo},
					success:function(list){
						divNoTd.append(select);
						for(let i=0;i<list.length;i++){
							const option=$("<option value=\""+list[i].PROJECTNO+"\">");
							option.append(list[i].DONATIONTITLE);
							select.append(option);							
						}
						$.ajax({
							url:"/selectExpiredDList.kh",
							data:{memberNo:memberNo},
							success:function(list){
								for(let i=0;i<list.length;i++){
									const option=$("<option value=\""+list[i].PROJECTNO+"\">");
									option.append(list[i].DONATIONTITLE);
									select.append(option);
								}
							}
						});		
					}
				});		
			}else if(e.value=="4"){
				divNoTd.empty();
				$.ajax({
					url:"/selectAList.kh",
					data:{memberNo:memberNo},
					success:function(list){
						divNoTd.append(select);
						for(let i=0;i<list.length;i++){
							const option=$("<option value=\""+list[i].PROJECTNO+"\">");
							option.append(list[i].PROJECTNAME);
							select.append(option);							
						}
						$.ajax({
							url:"/selectExpiredAList.kh",
							data:{memberNo:memberNo},
							success:function(list){
								for(let i=0;i<list.length;i++){
									const option=$("<option value=\""+list[i].PROJECTNO+"\">");
									option.append(list[i].PROJECTNAME);
									select.append(option);
								}
							}
						});		
					}
				});		
			}
		}
		const thousands = (o) => o.toString().replace(/\B(?<!\/\d*)(?=(\d{3})+(?!\d))/g,',');
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>