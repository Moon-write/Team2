<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/chartjs-plugin-annotation/1.4.0/chartjs-plugin-annotation.min.js"></script>
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
					<a href="/manageDelivery.kh?memberNo=${sessionScope.m.memberNo }">배송관리</a>
				</li>
				<li>
					<a href="#">통계</a>
					<ul class="sub-menu">
						<li><a href="/sumChart.kh">누적 금액</a></li>
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
			                    <option value="3">공동구매</option>
			                    <option value="4">경매</option>
			                </select>
			                <span id="divNoTd">
			                
			                </span>		                
               			</td>               			
               		</tr>               		               	
               	</table>			
			</div>
			<div id="chartArea">
				
			</div>			
		</div>
	</div>
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
				data:{memberNo:memberNo},
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
			        options:{
			        	indexAxix:'x',
			        	scales:{
			        		y:{
			        			beginAtZero:true
			        		}
			        	}
			        }
		        };
	        const myChart = new Chart('myChart', config);
		}
		
		$(".selectChart").on("click",function(){
			const memberNo=$("input[name=memberNo]").val();
			const chartArea=$("#chartArea");
			const canvas=$("<canvas id=\"myChart\" width=\"500\" height=\"200\" style=\"margin-bottom:50px;\"></canvas>");
			var startDate;
			const datePicker1 = $("input[name=startDate]").val();
			const datePicker2 = $("input[name=endDate]").val();
			const divNo=$("#divNo").val();
			const projectNo=$("#divList").val();
			var startDate;
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
								graph(dates,amounts);
							}
						});
					}
				});	
			}else{
				$.ajax({
					url:"/selectStartDate.kh",
					data:{memberNo:memberNo},
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
									data:{memberNo:memberNo, startDate:startDate, endDate:dateString, divNo:divNo,projectNo:projectNo},
									success:function(list){
										for(let i=0;i<list.length;i++){
											amounts.push(list[i]);										
										}
										graph(dates,amounts);
									}
								});
							}
						});
					}
				});				
			}			
		});
		
		
		
		
		
	
		$(function() {
			$(".sub-menu").prev().append("<span class='more'></span>")
			$(".more").parent().parent().on(
					"click",
					function(e) {
						$(this).children().last().slideToggle();
						$(this).children().first().children(".more")
								.toggleClass("menu-active");
						e.stopPropagation();
					})
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
			}else if(e.value=="3"){
				divNoTd.empty();
				$.ajax({
					url:"/selectGList.kh",
					data:{memberNo:memberNo},
					success:function(list){
						divNoTd.append(select);
						for(let i=0;i<list.length;i++){
							const option=$("<option value=\""+list[i].PROJECTNO+"\">");
							option.append(list[i].PROJECTNAME);
							select.append(option);							
						}
						$.ajax({
							url:"/selectExpiredGList.kh",
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
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>