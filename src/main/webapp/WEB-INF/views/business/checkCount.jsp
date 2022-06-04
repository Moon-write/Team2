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
						<li><a href="/checkCount.kh">조회수 전일비교</a></li>
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
		<div class="show-content" style="width:500px; margin-left:220px;">
			<div>
				<input type="hidden" name="memberNo" value="${sessionScope.m.memberNo }">
				<h3 style="margin-bottom:10px;margin-top:30px;">조회수 통계</h3>
				<select onchange="divChange(this)" style="margin-bottom:10px;">				
                    <option value="auction">경매</option>
                    <option value="funding">펀딩</option>
                    <option value="donation">기부</option>
                </select>
				<table class="tbl"></table>
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
		const tr=$("<tr class=\"tr-2\">");
		const th=$("<th>번호</th><th>프로젝트명</th><th>전일비교</th><th>페이지뷰</th>");
		tr.append(th);
		table.append(tr);
		window.onload=init();
		function init() {
			$.ajax({
				url : "/auctionCount.kh",
				data:{memberNo:memberNo},
				success : function(list){
					vt(list);
				}
			});
		};
		function vt(list){
			for(let i=0;i<list.length;i++){
				const tr2=$("<tr>");
				const noTd=$("<td>");
				const nameTd=$("<td>");
				const difTd=$("<td>");
				const viewTd=$("<td>");
				noTd.append(i+1);
				nameTd.append(list[i].PROJECTNAME);
				if(list[i].VIEWDIF==0){
					if(list[i].PREVCOUNT==0){
						if(list[i].VIEWCOUNT>0){
							difTd.append("▲"+list[i].VIEWCOUNT);	
						}else{
							difTd.append("변동없음");
						}
					}
				}else if(list[i].VIEWDIF<0){
					difTd.append("▼"+list[i].VIEWDIF*-1);
				}else if(list[i].VIEWDIF>0){
					difTd.append("▲"+list[i].VIEWDIF);
				}
				viewTd.append(list[i].VIEWCOUNT);
				tr2.append(noTd).append(nameTd).append(difTd).append(viewTd);
				table.append(tr2);
            }
		}
		function divChange(e) {
			table.empty();
			tr.append(th);
			table.append(tr);
			if(e.value=="auction"){
				init();
			}else if(e.value=="donation"){
				$.ajax({
					url : "/donationCount.kh",
					data:{memberNo:memberNo},
					success : function(list){
						vt(list);
					}
				});
			}else if(e.value=="funding"){
				$.ajax({
					url : "/fundingCount.kh",
					data:{memberNo:memberNo},
					success : function(list){
						vt(list);
					}
				});
			}
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>