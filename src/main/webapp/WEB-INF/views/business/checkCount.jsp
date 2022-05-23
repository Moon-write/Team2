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
				<select onchange="divChange(this)">				
                    <option value="auction">경매</option>
                    <option value="funding">펀딩</option>
                    <option value="group">공동구매</option>
                    <option value="donation">기부</option>
                </select>
				<table border="1">
					<tr>
						<th>번호</th><th>프로젝트명</th><th>전일비교</th><th>페이지뷰</th>
					</tr>
				</table>
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
		const tr=$("<tr>");
		const th=$("<th>번호</th><th>프로젝트명</th><th>전일비교</th><th>페이지뷰</th>");
		window.onload = function() {
			$.ajax({
				url : "/auctionCount.kh",
				data:{memberNo:memberNo},
				success : function(list){
					for(let i=0;i<list.length;i++){
						const tr2=$("<tr>");
						const noTd=$("<td>");
						const nameTd=$("<td>");
						const difTd=$("<td>");
						const viewTd=$("<td>");
						noTd.append(i+1);
						nameTd.append(list[i].PROJECTNAME);
						console.log(list[i].VIEWDIF);
						console.log(list[i].PREVCOUNT);
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
			});
		};
		function divChange(e) {
			table.empty();
			tr.append(th);
			table.append(tr);
			if(e.value=="auction"){
				$.ajax({
					url : "/auctionCount.kh",
					data:{memberNo:memberNo},
					success : function(list){
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
				});
			}else if(e.value=="donation"){
				$.ajax({
					url : "/donationCount.kh",
					data:{memberNo:memberNo},
					success : function(list){
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
				});
			}else if(e.value=="group"){
				$.ajax({
					url : "/groupCount.kh",
					data:{memberNo:memberNo},
					success : function(list){
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
				});
			}else if(e.value=="funding"){
				$.ajax({
					url : "/fundingCount.kh",
					data:{memberNo:memberNo},
					success : function(list){
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
				});
			}
		}
	</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>