<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/jquery-3.6.0.js"></script>

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
.tbl3 td{
	border-bottom:none;
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
			<div id="div1">
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<h3 style="margin-bottom:10px;margin-top:30px;">배송 관리</h3>				                                
               	<table class="tbl" style="margin-bottom:30px;">
               		<tr>
               			<th class="th">프로젝트 이름</th>
               			<td><input type="text" name="projectName" style="float:left;"></td>
               			<td rowspan=4 style="border-left:1px solid #ccc;"><button class="btn bc1 searchDelivery">검색</button></td>
               		</tr>
               		<tr>
               			<th class="th">결제기간</th>
               			<td>
               				<p style="float:left;">
						        <input type="text" name="startDate" class="datepicker" id="datepicker1" value="" disabled>
						        <input type="text" name="endDate" class="datepicker" id="datepicker2" value="" disabled>
						    </p>
               			</td>               			
               		</tr>
               		<tr>
               			<th class="th">분류</th>
               			<td>
               				<select name="divNo" id="divNo" style="float:left;">	
               					<option value="0">선택</option>                								
			                    <option value="1">펀딩</option>
			                    <option value="2">기부</option>
			                    <option value="3">공동구매</option>
			                    <option value="4">경매</option>
			                </select> 
               			</td>
               		</tr>
               		<tr>
               			<th class="th">주문상태</th>
               			<td>
               				<select name="orderStatus" id="orderStatus" style="float:left;">
               					<option value="0">선택</option>									
			                    <option value="1">결제완료</option>
			                    <option value="2">주문완료</option>
			                    <option value="3">배송완료</option>
			                    <option value="4">결제대기</option>
			                    <option value="5">주문취소</option>
			                </select>
               			</td>
               		</tr>                		
               	</table>	            	                                       
                <button class="btn bc1 orderCancel" style="display:none;">주문취소</button>
				<table class="tbl tbl2"></table>				
			</div>
		</div>		
	</div>	
	<script>
		$(document).on("click", "td .detail",function(event){					
			const orderNo=$(this).parent().prev().prev().prev().prev().prev().prev().prev().text();
			const tr=$(this).parent().parent().next();
			tr.toggle();
			
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
	
			
	
		
		$(".searchDelivery").on("click", function(e){				
			const projectName=$("input[name=projectName]").val();
			const startDate = $("input[name=startDate]").val();
			const endDate = $("input[name=endDate]").val();
			const divNo=$("#divNo").val();
			const orderStatus=$("#orderStatus").val();				
			if((startDate.length==10 && endDate.length==0) || (startDate.length==0 && endDate.length==10)){
				alert("날짜를 모두 입력하세요.");
				return;
			}
			if(startDate.length==0 && endDate.length==0 && divNo==0 && orderStatus==0 && projectName.length==0){
				alert("검색조건을 입력하세요.");
				return;
			}
			$.ajax({
				url:"/searchDelivery.kh",
				data:{projectName:projectName,startDate:startDate,endDate:endDate,divNo:divNo,orderStatus:orderStatus,memberNo:memberNo},
				success:function(list){
					table.empty();
					if(orderStatus==1 || orderStatus==3 || orderStatus==4){
						$(".orderCancel").css("display","flex");
					}else{
						$(".orderCancel").css("display","none");
					}
					tr.empty();					
					table.append(tr);
					dt(list, orderStatus);
					if(list.length==0){						
						alert("조회할 내용이 없습니다.");
						window.location.href = '/manageDelivery.kh?memberNo='+memberNo;
					}
				}
			});
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
		const memberNo=$("input[name=memberNo]").val();
		const table=$(".tbl2");
		const tr=$("<tr class=\"tr-2\">");
		const th=$("<th>주문번호</th><th>분류</th><th>프로젝트명</th><th>결제시간</th><th>결제금액</th><th>주문자</th><th>주문상태</th><th></th>");
		const cTh=$("<th><input type=\"checkBox\" id=\"allChk\"></th><th>주문번호</th><th>분류</th><th>프로젝트명</th><th>결제시간</th><th>결제금액</th><th>주문자</th><th>주문상태</th><th></th>");
		const thousands = (o) => o.toString().replace(/\B(?<!\/\d*)(?=(\d{3})+(?!\d))/g,',');
		const oc=$(".orderCancel");
		tr.append(th);
		table.append(tr);
		window.onload=init();
		function init() {
			$.ajax({
				url : "/selectOrderList.kh",
				data:{memberNo:memberNo},
				async: false,
				success : function(list){		
					for(let i=0;i<list.length;i++){
						const tr2=$("<tr>");
						const noTd=$("<td>");
						const divTd=$("<td>");
						const pTd=$("<td>");
						const timeTd=$("<td>");
						const priceTd=$("<td>");
						const nameTd=$("<td>");
						const sTd=$("<td>");
						const detailTd=$("<td><button class=\"btn detail\">상세보기</button></td>");
						noTd.append(list[i].ORDERNO);
						if(list[i].DIVNO==1){
							divTd.append("펀딩");
						}else if(list[i].DIVNO==2){
							divTd.append("기부");
						}else if(list[i].DIVNO==3){
							divTd.append("공동구매");
						}else if(list[i].DIVNO==4){
							divTd.append("경매");
						} 								
						pTd.append(list[i].PROJECTNAME);
						timeTd.append(list[i].ORDERDATE);
						priceTd.append(thousands(list[i].ORDERPRICE+list[i].ORDERPOINT)+"원");
						nameTd.append(list[i].ORDERDELNAME);
						if(list[i].ORDERSTATUS==1){
							sTd.append("결제완료");
						}else if(list[i].ORDERSTATUS==2){
							sTd.append("배송완료");
						}else if(list[i].ORDERSTATUS==3){
							sTd.append("주문완료");
						}else if(list[i].ORDERSTATUS==4){
							sTd.append("결제대기");
						}else if(list[i].ORDERSTATUS==5){
							sTd.append("주문취소");
						}
						tr2.append(noTd).append(divTd).append(pTd).append(timeTd).append(priceTd).append(nameTd).append(sTd).append(detailTd);

						let orderNo=list[i].ORDERNO;											
						
						const detailTr1=$("<tr style=\"display:none;border:10px solid rgb(139,149,161);\">");
						const detailTd2=$("<td colspan=\"8\">");
						const table2=$("<table border=\"1\" class=\"tbl tbl3\" style=\"margin-bottom:0px;\">");
						const detailTr2=$("<tr>");
						const detailTr3=$("<tr>");
						const dummyTr=$("<tr>");
						const odnTh=$("<th>주문자 이름</th>");
						const phoneTh=$("<th>전화번호</th>");
						const addrTh=$("<th>주소</th>");
						
						const odnTd=$("<td>");
						const phoneTd=$("<td>");
						const addrTd=$("<td>");
						
						dummyTr.append("<td colspan=\"6\">");
						odnTd.append(list[i].ORDERDELNAME);
						phoneTd.append(list[i].ORDERDELPHONE);
						addrTd.append("("+list[i].ORDERDELPOST+") "+list[i].ORDERDELADDR1+" "+list[i].ORDERDELADDR2);
						
						
						detailTr1.append(detailTd2);
						detailTd2.append(table2);
						table2.append(detailTr2).append(dummyTr);
						detailTr2.append(odnTh).append(odnTd).append(phoneTh).append(phoneTd).append(addrTh).append(addrTd);
						
						$.ajax({
							url:"/selectOrderProduct.kh",
							data:{orderNo:orderNo},
							async: false,
							success:function(list){																
								for(let i=0;i<list.length;i++){
									const detailTr3=$("<tr>");
									const opNoTh=$("<th>옵션번호</th>");
									const opPrTh=$("<th>옵션가격</th>");
									const amountTh=$("<th>구매수량</th>");
									
									const opNoTd=$("<td>");
									const opPrTd=$("<td>");
									const amountTd=$("<td>");
									
									opNoTd.append(list[i].OPTIONNO);
									opPrTd.append(list[i].PRODUCTPRICE);
									amountTd.append(list[i].PRODUCTAMOUNT);
									
									detailTr3.append(opNoTh).append(opNoTd).append(opPrTh).append(opPrTd).append(amountTh).append(amountTd);
									table2.append(detailTr3);
								}
								table.append(tr2).append(detailTr1);
							}
						});
						
						
		            }					
				}
			});
		};		
		function dt(list, orderStatus){
			for(let i=0;i<list.length;i++){
				const tr2=$("<tr>");
				const checkBox=$("<td><input type=\"checkBox\" class=\"chk\"></td>");
				const noTd=$("<td>");
				const divTd=$("<td>");
				const pTd=$("<td>");
				const timeTd=$("<td>");
				const priceTd=$("<td>");
				const nameTd=$("<td>");
				const sTd=$("<td>");
				const detailTd=$("<td><button class=\"btn detail\">상세보기</button></td>");
				noTd.append(list[i].ORDERNO);
				if(list[i].DIVNO==1){
					divTd.append("펀딩");
				}else if(list[i].DIVNO==2){
					divTd.append("기부");
				}else if(list[i].DIVNO==3){
					divTd.append("공동구매");
				}else if(list[i].DIVNO==4){
					divTd.append("경매");
				}
				pTd.append(list[i].PROJECTNAME);
				timeTd.append(list[i].ORDERDATE);
				priceTd.append(thousands(list[i].ORDERPRICE+list[i].ORDERPOINT)+"원");
				nameTd.append(list[i].ORDERDELNAME);
				if(list[i].ORDERSTATUS==1){
					sTd.append("결제완료");
				}else if(list[i].ORDERSTATUS==2){
					sTd.append("배송완료");
				}else if(list[i].ORDERSTATUS==3){
					sTd.append("주문완료");
				}else if(list[i].ORDERSTATUS==4){
					sTd.append("결제대기");z
				}else if(list[i].ORDERSTATUS==5){
					sTd.append("주문취소");
				}
				
				if(orderStatus==1 || orderStatus==3 || orderStatus==4){
					tr.append(cTh);
					tr2.append(checkBox).append(noTd).append(divTd).append(pTd).append(timeTd).append(priceTd).append(nameTd).append(sTd).append(detailTd);
				}else {
					tr.append(th);
					tr2.append(noTd).append(divTd).append(pTd).append(timeTd).append(priceTd).append(nameTd).append(sTd).append(detailTd);
				}
				
				let orderNo=list[i].ORDERNO;											
				
				const detailTr1=$("<tr style=\"display:none;\">");
				let detailTd2=null;
				if(orderStatus==1 || orderStatus==3 || orderStatus==4){
					detailTd2=$("<td colspan=\"9\">");
				}else{
					detailTd2=$("<td colspan=\"8\">");
				}
				
				const table2=$("<table border=\"1\" class=\"tbl tbl3\" style=\"margin-bottom:0px;\">");
				const detailTr2=$("<tr>");
				const detailTr3=$("<tr>");
				const dummyTr=$("<tr>");
				const odnTh=$("<th>주문자 이름</th>");
				const phoneTh=$("<th>전화번호</th>");
				const addrTh=$("<th>주소</th>");
				
				const odnTd=$("<td>");
				const phoneTd=$("<td>");
				const addrTd=$("<td>");
				
				dummyTr.append("<td colspan=\"6\">");
				odnTd.append(list[i].ORDERDELNAME);
				phoneTd.append(list[i].ORDERDELPHONE);
				addrTd.append("("+list[i].ORDERDELPOST+") "+list[i].ORDERDELADDR1+" "+list[i].ORDERDELADDR2);
				
				
				detailTr1.append(detailTd2);
				detailTd2.append(table2);
				table2.append(detailTr2).append(dummyTr);
				detailTr2.append(odnTh).append(odnTd).append(phoneTh).append(phoneTd).append(addrTh).append(addrTd);
				
				$.ajax({
					url:"/selectOrderProduct.kh",
					data:{orderNo:orderNo},
					async: false,
					success:function(list){																
						for(let i=0;i<list.length;i++){
							const detailTr3=$("<tr>");
							const opNoTh=$("<th>옵션번호</th>");
							const opPrTh=$("<th>옵션가격</th>");
							const amountTh=$("<th>구매수량</th>");
							
							const opNoTd=$("<td>");
							const opPrTd=$("<td>");
							const amountTd=$("<td>");
							
							opNoTd.append(list[i].OPTIONNO);
							opPrTd.append(list[i].PRODUCTPRICE);
							amountTd.append(list[i].PRODUCTAMOUNT);
							
							detailTr3.append(opNoTh).append(opNoTd).append(opPrTh).append(opPrTd).append(amountTh).append(amountTd);
							table2.append(detailTr3);
						}
						table.append(tr2).append(detailTr1);
					}
				});
				
            }
		}
		/* if(e.value=="3"){
				oc.css("display","none");
				$("#allChk").prop("checked",false);
				$.ajax({
					url : "/selectStatusList.kh",
					data:{memberNo:memberNo,status:3},
					success : function(list){
						dt(list);
						$("th:first").remove();
						$("tr td:first-child").remove();
					}
				});
			} */
		$(document).on("click","#allChk",function () { 
			if ($("#allChk").prop("checked")) {
				$(".chk").prop("checked", true);
			} else {
				$(".chk").prop("checked", false); 
			} 
		});
		$(".orderCancel").on("click",function(){
			const check=$(".chk:checked");
			if(check.length==0){
				alert("취소할 주문을 선택하십시오.");
				return;
			}
			var orderNos=[];
			check.each(function(index,item){
				orderNos.push($(item).parent().next().text());
			});
			var on = orderNos.map(Number);
			location.href="/orderCancel.kh?orderNos="+orderNos.join("/")+"&memberNo="+memberNo;
		});
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>