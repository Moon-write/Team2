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
.add-head{
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

<link rel="stylesheet" href="../../../resources/css/summernote-lite.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="/resources/js/summernote-lite.js"></script>
	<script src="/resources/js/lang/summernote-ko-KR.js"></script>
	<div id="add-wrap">
		<form action="" method="post" enctype="multipart/form-data">
		<div id="add-head">공동구매 등록</div>
		<div id="add-body">
			<div class="add-part title">
				<p class="txt">기본 정보</p>
			</div>
			<div class="add-part info">
				<table id="content">
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
					<tr class="info-tr prdName">
						<td class="td-title">상품명</td>
						<td><input type="text" name="gName"><button class="addName" type="button">+</button></td>
					</tr>
					<tr class="info-tr prdOpt">
						<td class="td-title">옵션명</td>
						<td><input type="text" name="gOpt"><button class="addOption" type="button">+</button></td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">판매기간</td>
						<td>시작일<input type="text" name="grpStart">종료일<input type="text" name="grpEnd"></td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">커버 이미지</td>
						<td><input type="file" name="thumbpath"></td>
					</tr>
					<tr class="info-tr">
						<td class="td-title">이미지 모음</td>
						<td><input type="file" name="thumbpath" multiple></td>
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
					<tr class="info-tr discount">
						<td class="td-title">할인률</td>
						<td>
							<select class="makeLevel">
								<option selected>단계 설정</option>
								<option value="2">2단계</option>
								<option value="3">3단계</option>
								<option value="4">4단계</option>
								<option value="5">5단계</option>
							</select>
						</td>
					</tr>
					
					<tr>
						<td></td>
						<td>	<button type="button" class="makeTable">적용하기</button>
							<button type="button" class="reset">초기화</button></td>
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
		$(".addName").on("click",function(){
			const addPrdName = 
					'<tr class="info-tr prdName">'+'<td></td>'+'<td><input type="text" name="gName">'
						+'<button type="button" class="removeName">-</button>'
						+'</td></tr>'
			const trHtml = $(".prdName:last");
			trHtml.after(addPrdName);	
			$(".removeName").on("click",function(){
				const trHtml=$(this).parent().parent();
				trHtml.remove();
		});
		});

		$(".addOption").on("click",function(){
			const addOptName = 
					'<tr class="info-tr prdOpt">'+'<td></td>'+'<td><input type="text" name="gName">'
						+'<button type="button" class="removeOption">-</button>'
						+'</td></tr>'
			const trHtml = $(".prdOpt:last");
			trHtml.after(addOptName);	
			$(".removeOption").on("click",function(){
				const trHtml=$(this).parent().parent();
				trHtml.remove();
		});
		});

		$(".makeLevel").on("change",function(){
			
			$(".addLevel").remove();
			const addDisLevel0 = '<tr class="info-tr discount addLevel">'+'<td class="addLevel"></td>'+'<td class="addLevel">1명~<input type"text">명'+'<input type="text">원'
				+'</td></tr>';
			const addDisLevel = '<tr class="info-tr discount addLevel">'+'<td class="addLevel"></td>'+'<td class="addLevel"><input type"text">명~<input type"text">명'+'<input type="text">원'
				+'</td></tr>';
			const addDisMax = '<tr class="info-tr discount addLevel">'+'<td class="addLevel"></td>'+'<td class="addLevel"><input type"text">명 이상'+'<input type="text" placeholder="최저가">원'
				+'</td></tr>';
			const trHtml=$(".discount:last");
			
			
			if($(".makeLevel").val()==2){
				trHtml.after(addDisMax).after(addDisLevel0);
			}
			if($(".makeLevel").val()==3){
				trHtml.after(addDisMax).after(addDisLevel).after(addDisLevel0);
			} 
			if($(".makeLevel").val()==4){
				trHtml.after(addDisMax).after(addDisLevel).after(addDisLevel).after(addDisLevel0);
			} 
			if ($(".makeLevel").val()==5){
				trHtml.after(addDisMax).after(addDisLevel).after(addDisLevel).after(addDisLevel).after(addDisLevel0);
			}
		});
		$(".makeTable").on("click",function(){

		})

		$("#summernote").summernote({
		height:400,
		lang : "ko-KR",
		callbacks:{
			onImageUpload : function(files){ 
				uploadImage(files[0],this); 
			}
		}
	 });
	
		
		
	</script>
</body>
</html>