<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>경매 등록</title>
<style>
	.auction-wrap{
		display: flex;
	}
	.auction-pic{
		width: 45%;		
		padding: 20px;
	}
	.auction-info{
		width: 55%;
		padding: 20px;
	}
	.auction-info>table{
		width: 100%;
	}
	.auction-info>table th{
		width: 25%;
	}
	.auction-info>table td{
		display: flex;
		padding: 5px;
		height: 50px;
	}
	.auction-info>table td>span{
		display: block;
		line-height: 50px;
		margin: 0px 20px;
	}
	.pic-button{
		margin-top: 10px;
		text-align: center;
	}
	.pic-button>button{
		margin-left: 20px;
	}
	.pic-upload{
		width: 400px; height: 400px;
		margin: 10px auto;
		border: 1px solid #ccc;
	}
	.pic-upload>img{
		width: 100%;
		object-fit: cover;
	}
	.auction-notice{
		padding: 30px 50px;
		border-top: 2px solid #ccc;
		border-bottom: 2px solid #ccc;		
	}
	.notice-title{
		font-size: 1.2em;
		font-family: ns-bold;
	}
	.auction-notice>p{
		margin: 15px 0px;
		font-family: ns-light;
		color: slategray;
	}
	.notice-confirm{
		text-align: right;
	}
	.auction-content{
		padding: 30px 0px;
	}
	.auction-submit{
		padding-top: 20px;
		padding-bottom: 100px;
		text-align: center;
	}
</style>
<link rel="stylesheet" href="../../../resources/css/summernote-lite.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<%@include file="/WEB-INF/views/auction/msg.jsp" %>
	<script src="../../../resources/js/summernote-lite.js"></script>
	<script src="../../../resources/js/lang/summernote-ko-KR.js"></script>
		<div class="page-content">
			<div class="page-title">경매 등록 * 헤더/푸터 사업자용으로 변경</div>
			<div class="auction-wrap">
				<div class="auction-pic">
					<div class="pic-upload">
						<img src="../../../resources/img/auction/preview.jpg">
					</div>
					<div class="pic-button">
						<span>대표사진 (필수)</span>
						<label for="upPic"><span class="btn bc1">등록</span></label>
						<input type="file" name="auctionPicture" id="upPic" style="display: none;" accept=".jpg,.png,.jpeg,.gif" onchange="loadImg(this)">
					</div>
				</div>
				<div class="auction-info">
					<table style="border: none;">
						<tr>
							<th>카테고리</th>
							<td>
								<select name="auction-category" class="input-form">
									<option>카테고리 선택</option>
									<option value="1">유기동물 구조</option>
									<option value="2">미혼모 지원</option>
									<option value="3">장애인 지원</option>
									<option value="4">소년가장 후원</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>프로젝트명</th>
							<td><input type="text" name="projectName" class="input-form"></td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" name="auctionItem" class="input-form"></td>
						</tr>
						<tr>
							<th>판매수량</th>
							<td><input type="number" name="auctionAmount" class="input-form" value="1" style="text-align: center;"><span style="width: 40px;">개</span></td>
						</tr>
						<tr>
							<th rowspan="2">경매 기간</th>
							<td><span style="width: 75px;">시작일</span><input type="datetime-local" name="auctionStart" class="input-form" onblur="checkDate()"></td>
							
						</tr>
						<tr>
							<td><span style="width: 75px;">마감일</span><input type="datetime-local" name="auctionEnd" class="input-form" onblur="checkDate()"></td>
						</tr>
						<tr>
							<th>시작 가격</th>
							<td><input type="text" name="startPrice" class="input-form" style="text-align: right;" placeholder="개당 시작가격"><span style="width: 40px;">원 ~</span></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="auction-notice">
				<div class="notice-title">경매상품 등록시 유의점</div>
				<p>
					(1) 프로젝트 기본 정보(상품명/수량/기간/시작가격/대표사진)는 경매가 시작하면 수정이 불가능합니다.<br>
					(2) 기본 정보를 제외한 상품 소개 콘텐츠는 경매 마감 전까지 수정 가능합니다.<br>
					(3) 복수 수량 판매시 상품마다 낙찰가가 다를 수 있습니다.
				</p>
				<div class="notice-confirm">
					<input type="checkbox" id="noticeConfirm"><label for="noticeConfirm">약관 내용을 확인했으며 이에 동의합니다. (필수)</label>
				</div>
			</div>
			<div class="auction-content">
				<textarea name="auctionContent" id="auctionContent" class="input-form"></textarea>
			</div>
			<div class="auction-submit">
				<button class="btn bc11 bs3">미리보기</button>
				<input type="submit" class="btn bc4 bs3" value="등록하기" disabled onclick="return submit()">
			</div>
			
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$("#auctionContent").summernote({
			height: 800,
			lang: "ko-KR",
			callbacks: {
				onImageUpload : function(files){
					uploadImage(files[0],this);
				}
			}
		})

		function uploadImage(file, editor){
			const form = new FormData();
			form.append("file", file);
		
			$.ajax({
				url: "/auctionImgUpload.kh",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					$(editor).summernote("insertImage", data);
				}
			})
		}

		$("#noticeConfirm").on("click",function(){
			const button = $("input[type=submit]");
			if($(this).prop("checked")==true){
				button.removeClass("bc4");
				button.addClass("bc1");
				$("input[type=submit]").removeAttr("disabled");
			}else{
				button.removeClass("bc1");
				button.addClass("bc4");
				$("input[type=submit]").attr("disabled");
			}
		})

		function checkDate(){
			const startDate = $("input[name=auctionStart]").val();
			const endDate = $("input[name=auctionEnd]").val();
			
			const today = new Date();
			let todayDate = dateFormat(today);

			if(startDate==""){
				return false;
			}else if(!checkDate2(todayDate, startDate)){
				alert("시작시각은 현재시각보다 뒤여야 합니다!");
				return false;
			}else if(endDate==""){
				return false;
			}else if(!checkDate2(startDate, endDate)){
				alert("시작시각은 종료시각보다 빨라야 합니다!");
				return false;
			}else if(!checkDate2(todayDate,endDate)){
				alert("종료시각은 현재시각보다 뒤여야 합니다!");
				return false;
			}else{
				return true;
			}
		}		

		function checkDate2(date1, date2){
			if(checkTime(0,4)&&checkTime(5,7)&&checkTime(8,10)&&checkTime(11,13)){
				// 다 만족하면 true return
				return true;
			}else{
				// 잘못된게 있으면 false return
				return false;
			}

			function checkTime(index1, index2){
			let sDate = date1.substring(index1,index2);
			let eDate = date2.substring(index1,index2);

				if(sDate>eDate){
					// 앞시간이 더 크면 (더 뒤이면)
					return false;
				}else{
					return true;
				}			
			}
		}

		function dateFormat(date){
			let month = date.getMonth() + 1;
			let day = date.getDate();
			let hour = date.getHours();
			let minute = date.getMinutes();
			// let second = date.getSeconds();

			month = month >= 10 ? month : '0' + month;
			day = day >= 10 ? day : '0' + day;
			hour = hour >= 10 ? hour : '0' + hour;
			minute = minute >= 10 ? minute : '0' + minute;
			// second = second >= 10 ? second : '0' + second;

			return date.getFullYear() + '-' + month + '-' + day + 'T' + hour + ':' + minute; // + ':' + second;
		}

		function loadImg(f){
			if(f.files.length!=0&&f.files[0]!=0){
				$("div.pic-button>label>span").text("변경");
				const reader = new FileReader();
				reader.readAsDataURL(f.files[0]);
				reader.onload= function(e){
					$("div.pic-upload>img").attr("src", e.target.result);
				}
			}else{
				$("div.pic-button>label>span").text("등록");
				$("div.pic-upload>img").attr("src","../../../resources/img/auction/preview.jpg");
			}
		}

		function submit(){
			let regExp = /^[0-9]+$/;
			// 유효성검사 실행 
			const category = $("select[name=auction-category]");
			if(category.val()!="카테고리 선택"){
				const name = $("input[name=projectName]");
				if(name.val()!=""){
					const item = $("input[name=auctionItem]");
					if(item.val()!=""){
						const amount = $("input[name=auctionAmount]");
						if(amount.val()!=""&&regExp.test(amount.val())){
							// 수량은 전부 숫자여야함-유효성검사 거치기
							const start = $("input[name=auctionStart]");
							const end = $("input[name=auctionEnd]")
							if(start.val()!=""&&end.val()!=""&&checkDate()){
								const price = $("input[name=startPrice]");								
								if(price.val()!=""&&regExp.test(price.val())){
									// 금액도 전부 숫자여야함 - 유효성검사 거치기
									const form = $("<form action='/insertAuction.kh' method='post' enctype='multipart/form-data'>");
									form.appendTo($("body"));
									form.append(category).append(name).append(item).append(amount).append(start).append(end).append(price).append($("input#upPic")).append($("textarea#auctionContent"));
									form.submit();
								}else{
									alert("경매 시작가격을 정확히 입력해 주세요!");
								}
							}else{
								alert("경매 진행기간을 정확히 입력해 주세요!")
							}
						}else{
							alert("정확한 수량을 입력해 주세요!");
						}
					} else{
						alert("상품명을 입력해 주세요!");
					}
				}else{
					alert("프로젝트명을 입력해 주세요!");
				}
			}else{
				alert("카테고리를 선택해 주세요!");
			}
		}

	</script>
</body>
</html>