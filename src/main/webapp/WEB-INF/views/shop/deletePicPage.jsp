<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.posting-wrap {
	display: flex;
	flex-wrap: wrap;
}

.photoWrapper {
	clear: right;
	margin: 0 auto;
	width:1200px;
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
		<div class="page-content">
			<div class="photoWrapper posting-wrap">
				<c:forEach var="sp" items="${sp }">
					<div style="box-sizing: border-box; width: calc(100%/ 4); padding: 20px;">
						<div>
							<img src="/resources/upload/shopPic/${sp.shopFilepath }" style="height:200px; width:200px;background-size:contain;">
						</div>
						<div><input type="checkbox" class="chk"></div>
						<div style="display:none;"><input type="hidden" name="shopPicNo" value="${sp.shopPicNo }">${sp.shopPicNo }</div>
					</div>
				</c:forEach>
			</div>
			<button class="btn bc1 bs1 deleteShopPic">삭제</button>
		</div>
		<script>
			$(".deleteShopPic").on("click",function(){
				const check=$(".chk:checked");
				if(check.length==0){
					alert("선택된 사진이 없습니다.");
					return;
				}
				const shopPicNos=new Array();
				check.each(function(index,item){
					shopPicNos.push($(item).parent().next().text());
				});
				console.log(shopPicNos);
				location.href="/deleteShopPic.kh?shopPicNos="+shopPicNos.join("/");
			});
		</script>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>