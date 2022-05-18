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
	<script src="../../../resources/js/summernote-lite.js"></script>
	<script src="../../../resources/js/lang/summernote-ko-KR.js"></script>
		<div class="page-content">
			<div class="page-title">경매 등록 * 헤더/푸터 사업자용으로 변경</div>
			<div class="auction-wrap">
				<div class="auction-pic">
					<div class="pic-upload">
						<img src="../../../resources/img/logo/WNYlogo1.png">
					</div>
					<div class="pic-button">
						<span>대표사진 (필수)</span>
						<button class="btn bc1">등록</button>
					</div>
				</div>
				<div class="auction-info">
					<table style="border: none;">
						<tr>
							<th>카테고리</th>
							<td>
								<select name="auction-category" class="input-form">
									<option value="1">유기동물</option>
									<option value="2">미혼모</option>
									<option value="3">장애인</option>
									<option value="4">소년가장</option>
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
							<td><input type="number" name="auctinoAmount" class="input-form" value="1" style="text-align: center;"><span style="width: 40px;">개</span></td>
						</tr>
						<tr>
							<th rowspan="2">경매 기간</th>
							<td><span style="width: 75px;">시작일</span><input type="datetime-local" name="auctionStart" class="input-form"></td>
							
						</tr>
						<tr>
							<td><span style="width: 75px;">마감일</span><input type="datetime-local" name="auctionEnd" class="input-form"></td>
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
				<input type="submit" class="btn bc4 bs3" value="등록하기" disabled>
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
				console.log("여기");
				button.removeClass("bc4");
				button.addClass("bc1");
				$("input[type=submit]").removeAttr("disabled");
			}else{
				console.log("안여기");
				button.removeClass("bc1");
				button.addClass("bc4");
				$("input[type=submit]").attr("disabled");
			}
		})

		$("input[name=auctionEnd]").on("change",function(){
			const startDate = $("input[name=auctionStart]").val();
			const endDate = $("input[name=auctionEnd]").val();

			console.log(startDate);
			console.log(endDate);

			let sDate = startDate.substring(0,4);
			let eDate = endDate.substring(0,4);

			if(sDate>eDate){
				alertMsg();
			}else{
				sDate = startDate.substring(5,7);
				eDate = endDate.substring(5,7);
				console.log(sDate);
				console.log(eDate);
				if(sDate>eDate){
					alertMsg();
				}
			}

		})

		function alertMsg(){
			alert("시작시간은 종료시간보다 늦을 수 없습니다!");
		};
	</script>
</body>
</html>