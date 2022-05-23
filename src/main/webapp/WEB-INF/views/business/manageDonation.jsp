<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
						<li><a href="#">성별/연령별</a></li>
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
				<h3>기부 관리</h3>
				<select onchange="divChange(this)">				
                    <option value="selling">진행중인 기부</option>
                    <option value="end">종료된 기부</option>
                </select>
				<table border="1"></table>				
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
		const sTr=$("<tr>");
		const eTr=$("<tr>");
		const sTh=$("<th>번호</th><th>프로젝트명</th><th>상품가격</th><th>목표기부금액</th><th>현재모인금액</th><th>시작일</th><th>종료일</th>");
		const eTh=$("<th>번호</th><th>프로젝트명</th><th>상품가격</th><th>목표기부금액</th><th>총모인금액</th><th>시작일</th><th>종료일</th>");
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
							noTd.append(i+1);
							pNameTd.append(list[i].DONATIONTITLE);
							cashTd.append(list[i].DONATIONCASH);
							targetTd.append(list[i].DONATIONTARGET);
							sumTd.append(list[i].DONATIONSUM);
							sdTd.append(list[i].DONATIONSTARTDATE);
							edTd.append(list[i].DONATIONENDDATE);
							tr.append(noTd).append(pNameTd).append(cashTd).append(targetTd).append(sumTd).append(sdTd).append(edTd);
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
						const modiTd=$("<td><button><a href=\"#\">수정하기</a></button></td>");
						const delTd=$("<td><button id=\"delete\">삭제</button></td>");
						const projectNo="<div style=\"display:none;\">"+list[i].PROJECTNO+"</div>";
						noTd.append(i+1);
						pNameTd.append(list[i].DONATIONTITLE);
						cashTd.append(list[i].DONATIONCASH);
						targetTd.append(list[i].DONATIONTARGET);
						sumTd.append(list[i].DONATIONSUM);
						sdTd.append(list[i].DONATIONSTARTDATE);
						edTd.append(list[i].DONATIONENDDATE);
						tr.append(noTd).append(pNameTd).append(cashTd).append(targetTd).append(sumTd).append(sdTd).append(edTd).append(modiTd).append(delTd).append(projectNo);
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
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>