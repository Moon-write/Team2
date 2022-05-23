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
				<h3>펀딩 관리</h3>
				<select onchange="divChange(this)">				
                    <option value="selling">진행중인 펀딩</option>
                    <option value="end">종료된 펀딩</option>
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
		const sTh=$("<th>번호</th><th>펀딩명</th><th>펀딩카테고리</th><th>시작일</th><th>종료일</th><th>목표금액</th><th>현재모인금액</th><th>목표달성률</th>");
		const eTh=$("<th>번호</th><th>펀딩명</th><th>펀딩카테고리</th><th>시작일</th><th>종료일</th><th>목표금액</th><th>총모인금액</th><th>목표달성률</th>");
		sTr.append(sTh);
		eTr.append(eTh);
		
		window.onload=init();
		
		function divChange(e) {
			if(e.value=="selling"){
				window.location.replace("manageFunding.kh");
			}else if(e.value="end"){
				table.empty();
				table.append(eTr);
				$.ajax({
					url : "/selectExpiredFList.kh",
					data:{memberNo:memberNo},					
					success : function(list){
						for(let i=0;i<list.length;i++){
							const tr=$("<tr>");
							const noTd=$("<td>");
							const pNameTd=$("<td>");
							const cTd=$("<td>");
							const sdTd=$("<td>");
							const edTd=$("<td>");
							const fsTd=$("<td>");
							const fcsTd=$("<td>");
							const fsmTd=$("<td>");
							noTd.append(i+1);
							pNameTd.append(list[i].FUNDINGNAME);
							cTd.append(list[i].FUNDINGCATEGORY);
							sdTd.append(list[i].FUNDINGSTARTDATE);
							edTd.append(list[i].FUNDINGENDDATE);
							fsTd.append(list[i].FUNDINGSUM);
							fcsTd.append(list[i].FUNDINGCURRENTSUM);
							fsmTd.append(list[i].FUNDINGSUMRATE);
							tr.append(noTd).append(pNameTd).append(cTd).append(sdTd).append(edTd).append(fsTd).append(fcsTd).append(fsmTd);
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
				url : "/selectFList.kh",
				data:{memberNo:memberNo},					
				success : function(list){
					console.log(list);
					for(let i=0;i<list.length;i++){
						const tr=$("<tr>");
						const noTd=$("<td>");
						const pNameTd=$("<td>");
						const cTd=$("<td>");
						const sdTd=$("<td>");
						const edTd=$("<td>");
						const fsTd=$("<td>");
						const fcsTd=$("<td>");
						const fsmTd=$("<td>");
						const modiTd=$("<td><button><a href=\"#\">수정하기</a></button></td>");
						const delTd=$("<td><button id=\"delete\">삭제</button></td>");
						const fundingNo="<div style=\"display:none;\">"+list[i].FUNDINGNO+"</div>";
						noTd.append(i+1);
						pNameTd.append(list[i].FUNDINGNAME);
						cTd.append(list[i].FUNDINGCATEGORY);
						sdTd.append(list[i].FUNDINGSTARTDATE);
						edTd.append(list[i].FUNDINGENDDATE);
						fsTd.append(list[i].FUNDINGSUM);
						fcsTd.append(list[i].FUNDINGCURRENTSUM);
						fsmTd.append(list[i].FUNDINGSUMRATE);
						tr.append(noTd).append(pNameTd).append(cTd).append(sdTd).append(edTd).append(fsTd).append(fcsTd).append(fsmTd).append(modiTd).append(delTd).append(fundingNo);
						table.append(tr);						
		            }
				
					$(document).on("click", "td #delete",function(event){					
						const fundingNo=$(this).parent().next().text();
						const fcs=$(this).parent().prev().prev().prev().text();
						if(fcs!=0){
							alert("삭제할 수 없습니다.");
							return;
						}
						if(confirm("삭제하시겠습니까?")==true){						
							$.ajax({
								url : "/deleteFunding.kh",
								data:{fundingNo:fundingNo},
								success: function(result){
									window.location.replace(result);
								}
							});
						}									
					});
				}
			});
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>