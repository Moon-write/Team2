<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp"%>
	<div class="page-content">
		<%@include file="/WEB-INF/views/business/bizMenu.jsp"%>
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