<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../../resources/css/group/groupAdd.css">
<style>
#add-wrap{
	width: 1200px;
	margin: 0 auto;
	margin-top: 30px;
	margin-bottom: 30px;
}
#add-wrap div {
	width: 1000px;
	margin: 0 auto;
}
#add-head{
	font-size: x-large;
	font-weight: 600;
	padding-bottom: 20px;
}
#add-body {
	margin-top: 20px;
	display: flex;
	border-bottom: 2px solid rgb(199, 199, 199);
}
#add-body .title{
	width: 200px;
	margin-right: 30px;
	margin-top: 20px;
}
.txt {	
	text-align: center;
	font-size: larger;
	font-weight: 600;
}
.info {
	width: 700px;
}
.btn{
	text-align: center;
}
.td-title {
	width: 100px;
}
table{
	border-collapse: separate;
	border-spacing: 0 20px;
}

</style>
<link rel="stylesheet" href="../../../resources/css/datepicker.css">
<script scr="../../../resources/js/datepicker.js"></script>
<script scr="../../../resources/js/datepicker.ko.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	
	<div id="add-wrap">
		<form action="" method="post">
		<div id="add-head">공동구매 등록</div>
		<div id="add-body">
			<div class="add-part title">
				<p class="txt">기본 정보</p>
			</div>
			<div class="add-part info">
				<table>
					<tr class="info-tr">
						<td class="td-title">카테고리</td>
						<td>
							<select name="grpCategory">
								<option>카테고리 선택</option>
								<option value="1">테크·가전</option>
								<option value="2">패션·잡화</option>
								<option value="3">홈·리빙</option>
								<option value="4">식품·영양제</option>
								<option value="5">뷰티</option>
							</select>
						</td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">프로젝트명</td>
						<td><input type="text" name="projectName"></td>
					</tr>
					<tr class="info-tr gName">
						<td class="td-title">상품명</td>
						<td><input type="text" name="gName"><button class="addName">+</button></td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">옵션명</td>
						<td><input type="text" name="gOpt"><button id="addOption">+</button></td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">판매기간</td>
						<td>시작일<input type="text" name="grpStart">종료일<input type="text" name="grpEnd"></td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">커버 이미지</td>
						<td><button>파일 올리기</button></td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">이미지 모음</td>
						<td><button>파일 올리기</button></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="add-body">
			<div class="add-part title">
				<p class="txt">가격 설정</p>
			</div>
			<div class="add-part info">
				<table>
					<tr class="info-tr">
						<td class="td-title">기본가</td>
						<td><input type="text" name="grpOrigPrice">원</td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">최저가</td>
						<td><input type="text" name="grpLowest">원</td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">할인률</td>
						<td>1명~<input type="number">명<input type="number">원<button>+</button></td>
					</tr>
					<tr class="info-tr">	
						<td></td>
						<td><input type="number">명~<input type="number">명<input type="number">원<button>+</button><button>x</button></td>
					</tr>
					<tr>
						<td></td>
						<td>	<button>적용하기</button>
							<button>초기화</button></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="add-body">
			<div class="add-part title">
				<p class="txt">상세 내용</p>
			</div>
			<div class="add-part info">
	         
			</div>
		</div>
		<div class="add-body btn">
			<button>미리보기</button>
			<button>등록하기</button>
		</div>
			<!--
				
			-->
			
		</div>
	</form>	
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(function(){
			$(".addName").on("cilck",function(){
			console.log("안녕");
			/*
			const add=$('this').parent().parent().next();
			
			const tr=$("<tr>").attr("class","info-tr");
			const emptyTd=$("<td></td>");
			const inputTd=$("<td>")
			const inputValue = $("<input>").attr("type","text").attr("name","gName");
			
			add.append(tr).append(emptyTd).append(inputTd).append(inputValue);
				*/
		});
		});
		
	</script>
</body>
</html>