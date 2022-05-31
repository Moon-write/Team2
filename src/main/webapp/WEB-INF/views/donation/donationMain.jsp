<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>기부 메인 페이지</title>
<script type="text/javascript" src="https://www.google.com/jsapi"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js"></script>
<script type="text/javascript">
    google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(donationChart);
    function donationChart() 
    {
        var data = google.visualization.arrayToDataTable(
            [["Employee","Rating"],["상품구입기부",15000],["일반기부",30000]]
        );
        var options = {
            title: "총 기부 금액"
        };
        var chart = new google.visualization.PieChart(document.getElementById("donation_sumgraph"));
        chart.draw(data, options);
    }
</script>
<!-- 구글폰트 -->
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
</head>
<style>
	.slider{
	    width: 100%;
	    height: 480px;
	    position: relative;
	    margin: 30px auto;
	    
	}
	.slider input[type=radio]{
	    display: none;
	}
	ul.imgs{
	
	    padding: 0;
	    margin: 0;
	}
	ul.imgs li{
	    position: absolute;
	    opacity: 0;
	    list-style: none;
	    padding: 0;
	    margin: 0;
	    text-align: center;
	    width: 100%;
	}
	.bullets{
	    position: absolute;
	    left: 50%;
	    transform: translateX(-50%);
	    bottom: 20px; 
	    z-index: 2;
	}
	.bullets label{
	    display: inline-block;
	    border-radius: 50%;
	    background-color: rgba(0,0,0,0.55);
	    width: 20px;
	    height: 20px;
	    cursor: pointer;
	}
	.slider input[type=radio]:nth-child(1):checked~.bullets>label:nth-child(1){
	    background-color: #fff;
	}
	.slider input[type=radio]:nth-child(2):checked~.bullets>label:nth-child(2){
	    background-color: #fff;
	}
	.slider input[type=radio]:nth-child(3):checked~.bullets>label:nth-child(3){
	    background-color: #fff;
	}
	.slider input[type=radio]:nth-child(4):checked~.bullets>label:nth-child(4){
	    background-color: #fff;
	}
	.slider input[type=radio]:nth-child(1):checked~ul.imgs>li:nth-child(1){
	    opacity: 1;
	    transition: 1s;
	    z-index: 1;
	}
	.slider input[type=radio]:nth-child(2):checked~ul.imgs>li:nth-child(2){
	    opacity: 1;
	    transition: 1s;
	    z-index: 1;
	}
	.slider input[type=radio]:nth-child(3):checked~ul.imgs>li:nth-child(3){
	    opacity: 1;
	    transition: 1s;
	    z-index: 1;
	}
	.slider input[type=radio]:nth-child(4):checked~ul.imgs>li:nth-child(4){
	    opacity: 1;
	    transition: 1s;
	    z-index: 1;
	}
	ul.imgs li{
	    position: absolute;
	    opacity: 0;
	    list-style: none;
	    padding: 0;
	    margin: 0;
	    transition-delay: 0.9s;
	   	
	}
	.imgs li>img{
		width:1000px;
		height:480px;
		border-radius: 15px;
		
	}
	.hash-tag{
		display:flex;
		width: 100%;
		justify-content: center;
	}
	.hash-tag>a{
		margin-bottom:10px;
		margin-left: 10px;
		margin-right: 10px;
		width: 9%;
	}
	.row-img{
		width:900px;
		text-align: left;
	}
	.row-img>h3{
		
		font-size: 15px;
	}
	.row-img>div{
		width:200px;
		height:200px;
		display: inline-block;
		
	}
	.main-content{
		width:70%;
		display: inline-block;
	}
	
	.page-content{
		text-align: center;
		width: 1200px;
	}
	.row-img>h3{
		margin-top:15px;
		margin-bottom: 15px;
		
	}
	
	.footer-content{
		width: 100%;
		margin: 0 0;
		display: flex;
		align-items: center;
    	justify-content: center;
	}
	.footer-content>div{
		width: 40%;
		height: 400px;
		/*background-color: red;*/
		display: flex;
		align-items: center;
    	justify-content: center;
		
	}
	.footer-content>div>h3{
		display: inline-block;
	}
	
	.saleDonation{
		display: inline-block;
	}
	.saleDonationDiv{
		text-align: left;
		margin: 15px;
		display: flex;
		justify-content: space-between;
	}
	.detail-content>div{
		width: 100%;
		height: 100%;
		/*background-color: pink;*/
		overflow:hidden;
		transition:0.5s;
	}
	
	.detail-content>div:hover{
		border:none;
		box-shadow: 2px 2px 1px 1px #1e90ff;
	}
	.donationMainImg{
		width: 100%;
		height: 100%;
		
	}
	

	.donationMainImgHover img{
		transition: all 0.2s linear;
		border: none;
	}
	.donationMainImgHover:hover img{
		transform: scale(1.1);
		
	}
	
	.detail-content{
		width:100%;
		margin: 10px;
	}
	.detail-content>p{
		display:flex;
		margin-bottom: 5px;
		justify-content: space-between;
	}
	.detail-content>a{
		display: inline-block;
		margin-bottom: 5px;
		
	}
	.donationCash{
		display:flex;
	}
	.material-icons{
		color: #1e90ff;
	}
	
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp"%>
	<div class="page-content">
		<div class="slider">
		    <input type="radio" name="slide" id="slide1" checked>
		    <input type="radio" name="slide" id="slide2">
		    <input type="radio" name="slide" id="slide3">
		    <input type="radio" name="slide" id="slide4">
		    <ul id="imgholder" class="imgs">
		        <li>
		        	<img src="/resources/upload/donation/donationSlide001.jpg">
		        </li>
		        <li><img src="/resources/upload/donation/donationSlide002.jpg"></li>
		        <li><img src="/resources/upload/donation/donationSlide003.jpg"></li>
		        <li><img src="/resources/upload/donation/donationSlide004.jpg"></li>
		    </ul>
		    <div class="bullets">
		        <label for="slide1">&nbsp;</label>
		        <label for="slide2">&nbsp;</label>
		        <label for="slide3">&nbsp;</label>
		        <label for="slide4">&nbsp;</label>
		    </div>
		</div>
		<div class="hash-tag">
			<a class="btn bc1" href="/donationHashtag.kh?donationCategory=pet" name="pet">#애견</a>
			<a class="btn bc1" href="/donationHashtag.kh?donationCategory=child" name="child">#아동</a>
			<a class="btn bc1" href="/donationHashtag.kh?donationCategory=female" name="female">#여성</a>
			<a class="btn bc1" href="/donationHashtag.kh?donationCategory=help" name="help">#불우이웃</a>
			<a class="btn bc1" href="/donationHashtag.kh?donationCategory=old" name="old">#독거노인</a>
		</div>
		<div class="main-content">
			<div class="saleDonationDiv">
				<h2 class="saleDonation">상품구입기부펀딩</h2>
				<a href="/donationWriter.kh">기부신규등록</a>
			</div>
			<div class="row-img">
				<c:forEach items="${cashList }" var="c" end="7">
							<div class="detail-content" name="detail-content">
								<div>
									<a href="/donationClick.kh?projectNo=${c.projectNo }" class="donationMainImgHover">
										<img src="${c.donationImgpath }" class="donationMainImg">
									</a>
								</div>
								<h3 class="title">${c.donationTitle }</h3>
								<p>
									<span>00%</span>
									<a class="donationCash">
										<span class="material-icons">paid</span>
										<span>${c.donationCash }</span>
									</a>
								</p>
							</div>
				</c:forEach>
			</div>
			<div class="saleDonationDiv">
				<h2 class="saleDonation">일반기부펀딩</h2>
			</div>
			<div class="row-img">
					<c:forEach items="${generalList }" var="g" end="7">
							<div class="detail-content" name="detail-content">
								<div>
									<a href="/donationClick.kh?projectNo=${g.projectNo }" class="donationMainImgHover">
										<img src="${g.donationImgpath }" class="donationMainImg">
									</a>
								</div>
								<h3 class="title">${g.donationTitle }</h3>
								<p>
									<span>00%</span>
									<a class="donationCash">
										<span class="material-icons">paid</span>
										<span>${g.donationCash }</span>
									</a>
								</p>
							</div>
				</c:forEach>
			</div>
		</div>
		<div class="footer-content">
			<div id="donation_sumgraph"></div>
			<div><h2>총 기부 금액 1,000,000</h2></div>
		</div>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>