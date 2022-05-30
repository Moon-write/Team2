<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공동구매 등록</title>
<style>
	
	.group-wrap{
		margin: 0 auto;
		display: flex;
	}
	.group-part{
		width: 250px;
		text-align: center;
		font-size: larger;
		font-weight: 600;
	}
	.group-pic, .group-thumb{
		width: 45%;	
		padding-top: 5px;	
	}
	.group-info{
		width: 55%;
	}
	.group-info>table{
		width: 700px;
	}
	.group-info>table th{
		width: 25%;
	}
	.group-info>table td{
		display: flex;
		padding: 5px;
		height: 50px;
	}
	.group-info>table td>span{
		display: block;
		line-height: 50px;
		margin: 0px 20px;
	}
	.thumb-preview{
		margin-top: 10px;
		width: 200px;
		height: 150px;
		border:1px dotted black;
	}
	.bc1 {
		width: 70px;
		height: 30px;
	}
	.group-content{
		margin: 0 auto;
		width: 1000px;
		padding-top: 20px;
	}
	.group-submit{
		padding-top: 20px;
		padding-bottom: 100px;
		text-align: center;
	}
	.disLevel {
		width: 700px;
		margin: 0 auto;
	}

	#att_zone{
	width: 520px;
	height:150px;
	margin-top: 10px;
	border:1px dotted black;
	}
	.disLevel2, .disLevel3, .disLevel4, .disLevel5{
		width: 660px;
		display: none;
	}
</style>
<link rel="stylesheet" href="../../../resources/css/auction/mobiscroll.jquery.min.css"/>
<link rel="stylesheet" href="../../../resources/css/summernote-lite.css">
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<script src="../../../resources/js/auction/mobiscroll.jquery.min.js"></script>
	<script src="../../../resources/js/summernote-lite.js"></script>
	<script src="../../../resources/js/lang/summernote-ko-KR.js"></script>
		<div class="page-content">
			<form action="/insertGroup.kh" method='post' enctype='multipart/form-data'>
			<div class="page-title">공동구매 등록</div>
			<div class="group-wrap">
				<div class="group-part">
					1. 기본 정보
				</div>
				<div class="group-info">
					<table style="border: none;">
						<input type="hidden" name="memberNo" val="${sessionScope.m.memberId }">
						<tr>
							<th>카테고리</th>
							<td>
								<select name="groupCategory" class="input-form">
									<option>카테고리 선택</option>
									<option value="1">테크·가전</option>
									<option value="2">패션·잡화</option>
									<option value="3">홈·리빙</option>
									<option value="4">식품·영양제</option>
									<option value="5">뷰티</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>프로젝트명</th>
							<td><input type="text" name="projectName" class="input-form"></td>
						</tr>
						<tr>
							<th>프로젝트 설명</th>
							<td><input type="text" name="grpCaption" class="input-form"></td>
						</tr>
						<tr class="gName">
							<th>상품명</th>
							<td><input type="text" name="gName" class="input-form"><span><button type="button" class="amountB addName"><span class="material-symbols-rounded">add</span></button></span></td>
						</tr>
						<tr class="gOpt">
							<th>옵션명</th>
							<td><input type="text" name="gOpt" class="input-form"><span><button type="button" class="amountB addOpt"><span class="material-symbols-rounded">add</span></button></span></td>
						</tr>
						<tr>
							<th rowspan="2">판매 기간</th>
							<td>
								<span style="width: 75px;">시작일</span><input id="date-start" placeholder="시작일을 선택해주세요" onchange="checkDate()" class="input-form" name="grpStart" />
							</td>
						</tr>
						<tr>
							<td>
								<span style="width: 75px;">종료일</span><input id="date-end" placeholder="종료일을 선택해주세요" onchange="checkDate()" class="input-form" name="grpEnd" />
							</td>
						</tr>
						<tr>
							<th>썸네일</th>
							<td style="height: 200px;">
								<div class="group-thumb">
									<div class="thumb-button">
										<span>권장 크기 400*300</span>
										<label for="upThumb"><span class="btn bc1">등록</span></label>
										<input type="file" name="thumbpath" id="upThumb" style="display: none;" accept=".jpg,.png,.jpeg,.gif" onchange="loadImg(this)">
									</div>
									<div class="thumb-preview">
										<img src="" style="width: 200px; height: 150px;">						
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<th>이미지 모음</th>
							<td style="height: 220px;">
								<div id='image_preview'>
									<span>최대 3장까지 등록 가능</span>
										<label for="btnAtt"><span class="btn bc1">등록</span></label>
									<input type='file' id='btnAtt' style="display: none;" multiple='multiple'/>
									<div id='att_zone'></div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		
			<div class="group-wrap">
				<div class="group-part">
					2. 가격 설정
				</div>
				<div class="group-info">
					<table style="border: none;">
						<tr>
							<th>기본가</th>
							<td><input type="text" name="grpOrigPrice" class="input-form" style="width: 250px;"><span>원</span></td>
						</tr>
						<tr>
							<th>최저가</th>
							<td><input type="text" name="grpLowest" class="input-form" style="width: 250px;"><span>원</span></td>
						</tr>
						<tr>
							<th>목표 인원</th>
							<td><input type="text" name="" class="input-form" style="width: 250px;"><span>원</span></td>
						</tr>
					</table>
				</div>
			</div>
			

			</div>
			<div class="group-wrap">
				<div class="group-part">
					3. 상세 정보
				</div>
				<div class="group-info">
				</div>
			</div>
			<div class="group-content">
				<textarea name="grpContent" id="grpContent" class="input-form"></textarea>
			</div>
			<div class="group-submit">
				<button class="btn bc11 bs3" id="previewBtn">미리보기</button>
				<button id="submitBtn" class="btn bc4 bs3">등록하기</button>
			</div>
			</form>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
		$(".addName").on("click",function(){

			const addPrdName = '<tr>'+'<th></th>'+'<td><input type="text" name="gName" class="input-form">'+
				'<span><button type="button" class="amountB removeName"><span class="material-symbols-rounded">remove</span></button></span>'+'</td></tr>';
			const trHtml = $(".gName:last");
			trHtml.after(addPrdName);	
			$(".removeName").on("click",function(){
				const trHtml=$(this).parent().parent().parent();
				trHtml.remove();
		});
		});

		$(".addOpt").on("click",function(){
			const addPrdName = '<tr>'+'<th></th>'+'<td><input type="text" name="gOpt" class="input-form">'+
				'<span><button type="button" class="amountB removeOpt"><span class="material-symbols-rounded">remove</span></button></span>'+'</td></tr>';
			const trHtml = $(".gOpt:last");
			trHtml.after(addPrdName);	
			$(".removeOpt").on("click",function(){
				const trHtml=$(this).parent().parent().parent();
				trHtml.remove();
			});
		});

		$("#grpContent").summernote({
			height: 600,
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
				url: "/groupImgUpload.kh",
				type : "post",
				data : form,
				processData : false,
				contentType : false,
				success : function(data){
					$(editor).summernote("insertImage", data);
				}
			})
		}
	


		function checkDate(){
			const startDate = $("input[name=grpStart]").val();
			const endDate = $("input[name=grpEnd]").val();
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
				$("div.thumb-button>label>span").text("변경");
				const reader = new FileReader();
				reader.readAsDataURL(f.files[0]);
				reader.onload= function(e){
					$("div.thumb-preview>img").attr("src", e.target.result);

				}
			}else{
				$("div.thumb-button>label>span").text("등록");
			}
		}



		mobiscroll.setOptions({
		    locale: mobiscroll.localeKo,
		    theme: 'windows',
		    themeVariant: 'light'
		});

		$(function () {
		    $('#date-start').mobiscroll().datepicker({
		        controls: ['datetime'],
				dateFormat : 'YYYY-MM-DD',
				timeFormat : 'HH:mm',
		        stepMinute: 10
		    });
		    $('#date-end').mobiscroll().datepicker({
		        controls: ['datetime'],
				dateFormat : 'YYYY-MM-DD',
				timeFormat : 'HH:mm',
		        stepMinute: 10
		    });
		});

		( /* att_zone : 이미지들이 들어갈 위치 id, btn : file tag id */
  			imageView = function imageView(att_zone, btn){

			var attZone = document.getElementById(att_zone);
			var btnAtt = document.getElementById(btn)
			var sel_files = [];
			
			// 이미지와 체크 박스를 감싸고 있는 div 속성
			var div_style = 'display:inline-block;position:relative;'
						+ 'width:150px;height:130px;margin:10px;z-index:1';
			// 미리보기 이미지 속성
			var img_style = 'width:100%;height:100%;z-index:none';
			// 이미지안에 표시되는 체크박스의 속성
			var chk_style = 'width:40px;height:40px;position:absolute;font-size:24px;'
						+ 'right:0px;bottom:0px;z-index:999;background-color:red;color:white';
		
			btnAtt.onchange = function(e){
			var files = e.target.files;
			var fileArr = Array.prototype.slice.call(files)
			for(f of fileArr){
				imageLoader(f);
			}
			}  
			
			
			/*첨부된 이미지들을 배열에 넣고 미리보기 */
			imageLoader = function(file){
			sel_files.push(file);
			var reader = new FileReader();
			reader.onload = function(ee){
				let img = document.createElement('img')
				img.setAttribute('style', img_style)
				img.src = ee.target.result;
				attZone.appendChild(makeDiv(img, file));
			}
			
			reader.readAsDataURL(file);
			}
			
			/*첨부된 파일이 있는 경우 checkbox와 함께 attZone에 추가할 div를 만들어 반환 */
			makeDiv = function(img, file){
			var div = document.createElement('div')
			div.setAttribute('style', div_style)
			
			var btn = document.createElement('input')
			btn.setAttribute('type', 'button')
			btn.setAttribute('value', 'x')
			btn.setAttribute('delFile', file.name);
			btn.setAttribute('style', chk_style);
			btn.onclick = function(ev){
				var ele = ev.srcElement;
				var delFile = ele.getAttribute('delFile');
				for(var i=0 ;i<sel_files.length; i++){
				if(delFile== sel_files[i].name){
					sel_files.splice(i, 1);      
				}
				}
				
				dt = new DataTransfer();
				for(f in sel_files) {
				var file = sel_files[f];
				dt.items.add(file);
				}
				btnAtt.files = dt.files;
				var p = ele.parentNode;
				attZone.removeChild(p)
			}
			div.appendChild(img)
			div.appendChild(btn)
			return div
			}
		}
		)('att_zone', 'btnAtt')

	</script>
</body>
</html>