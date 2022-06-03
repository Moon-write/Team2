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
	table td{
		border: none;
	}
</style>
<link rel="stylesheet" href="../../../resources/css/summernote-lite.css">
<link rel="stylesheet" href="../../../resources/css/auction/datepicker.min.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/bizHeader.jsp" %>
	<script type='text/javascript' src='http://code.jquery.com/jquery-3.6.0.js'></script>
	<script src="../../../resources/js/auction/datepicker.min.js"></script>
	<script src="../../../resources/js/auction/i18n/datepicker.ko.js"></script>
	<script src="../../../resources/js/summernote-lite.js"></script>
	<script src="../../../resources/js/lang/summernote-ko-KR.js"></script>
		<div class="page-content">
			<form method='post' enctype='multipart/form-data'>
			
			<div class="page-titleC">경매 등록</div>
			<div class="auction-wrap">
				<div class="auction-pic">
					<div class="pic-upload">
						<img src="../../../resources/img/auction/preview.jpg">
					</div>
					<div class="pic-button">
						<span style="margin-right: 20px">대표사진</span>
						<label for="upPic"><span class="btn bc1">등록</span></label>
						<input type="file" name="auctionPicture" id="upPic" style="display: none;" accept=".jpg,.png,.jpeg,.gif" onchange="loadImg(this)">
					</div>
				</div>
				<div class="auction-info">
					<table style="border: none;">
						<tr>
							<th>카테고리</th>
							<td>
								<select name="auctionCategory" class="input-form">
									<option>카테고리 수정</option>
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
							<td>
								<span style="width: 75px;">시작일</span><input id="date-start" placeholder="시작일을 선택해주세요" onblur="checkDate()" class="input-form" name="auctionStart" />
							</td>
						</tr>
						<tr>
							<td>
								<span style="width: 75px;">마감일</span><input id="date-end" placeholder="종료일을 선택해주세요" onblur="checkDate()" class="input-form" name="auctionEnd" />
							</td>
						</tr>
						<tr>
							<th>시작 가격</th>
							<td><input type="text" name="auctionPrice" class="input-form" style="text-align: right;" placeholder="개당 시작가격"><span style="width: 40px;">원 ~</span></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="auction-notice">
				<div class="notice-title">경매상품 등록시 유의점</div>
				<p>
					(1) 프로젝트 기본 정보(상품명/수량/기간/시작가격)는 경매가 시작하면 수정이 불가능합니다.<br>
					(2) 기본 정보를 제외한 썸네일 및 상품 소개 콘텐츠는 경매 마감 전까지 수정 가능합니다.<br>
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
				<button class="btn bc11 bs3" id="previewBtn">미리보기</button>
				<button id="submitBtn" class="btn bc4 bs3" disabled>등록하기</button>
			</div>
			</form>
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
		});

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
			const button = $("button#submitBtn");
			if($(this).prop("checked")==true){
				button.removeClass("bc4");
				button.addClass("bc1");
				$("button#submitBtn").removeAttr("disabled");
			}else{
				button.removeClass("bc1");
				button.addClass("bc4");
				$("button#submitBtn").attr("disabled");
			}
		})

		function checkDate(){
			
			const startDate = $("input[name=auctionStart]").val();
			const endDate = $("input[name=auctionEnd]").val();
			const today = new Date();
			
			const start = new Date(startDate);
			const end = new Date(endDate);	
			
			if(startDate==""){
				return false;
			}else if(today-start>60000){
				alert("시작시각은 현재시각보다 뒤여야 합니다!");
				return false;
			}else if(endDate==""){
				return false;
			}else if(start-end>0){
				alert("시작시각은 종료시각보다 빨라야 합니다!");
				return false;
			}else if(today-end>60000){
				alert("종료시각은 현재시각보다 뒤여야 합니다!");
				return false;
			}else{
				return true;
			}
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

		$("input").on("keydown",function(event){
			if(event.keyCode===13){
				event.preventDefault();
			}
		})
		
		$("#previewBtn").on("click",function(){
			const form = $("form");
			form.attr("action","/previewAuction.kh");
			form.attr("target","preview");
		});
		
		$("#submitBtn").on("click",function(){
			const form = $("form");
			form.removeAttr("target");
			form.attr("action","/insertAuction.kh");
		})
		$("form").on("submit",function(){
			if(!check()){
				event.preventDefault();
				return false;
			}else{
				if($("form").attr("target")!=null){
					let popup=window.open("","preview","menubar=no, status=no, scrollbars=yes");					
				}
			}
		})

		function check(){
			let regExp = /^[0-9]+$/;
			// 유효성검사 실행 
			const category = $("select[name=auctionCategory]");
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
								const price = $("input[name=auctionPrice]");								
								if(price.val()!=""&&regExp.test(price.val())){
									return true;									
								}else{
									alert("경매 시작가격을 정확히 입력해 주세요!");
									return false;
								}
							}else{
								alert("경매 진행기간을 정확히 입력해 주세요!")
								return false;
							}
						}else{
							alert("정확한 수량을 입력해 주세요!");
							return false;
						}
					} else{
						alert("상품명을 입력해 주세요!");
						return false;
					}
				}else{
					alert("프로젝트명을 입력해 주세요!");
					return false;
				}
			}else{
				alert("카테고리를 선택해 주세요!");
				return false;
			}
		};

		$(function () {
			
			$("#date-start").datepicker({
				language : 'ko',
				timepicker:true,
				timeFormat: "hh:ii",
				minutesStep: 10
			})
			
			$("#date-end").datepicker({
				language : 'ko',
				timepicker:true,
				timeFormat: "hh:ii",
				minutesStep: 10
			})
		});
	</script>
</body>
</html>