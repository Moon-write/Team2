<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
.main{
    padding: 0;
    margin: 0 auto;
    width: 1200px;
    background-color: aqua;
    overflow: hidden;
}
.basic-information{
    height: 1000px;
    width: 200px;
    float: left;
    
}
.basic-information>span{
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 20px;
    font-weight: bold;
    

}

.input-value{
    width: 960px;
    height: 1000px;
    background-color: royalblue;
    float: left;
    padding-left: 40px;
}
.input-value>div{
    margin: 20px;
}

.detail-information{
    height: 1000px;
    width: 200px;
    float: left;
}
.detail-information>span{
    display: block;
    font-size: 25px;
    text-align: center;
    margin-top: 20px;
    font-weight: bold;  
}
.input-detail{
    width: 1000px;
    height: 500px;
    background-color: blueviolet;
    float: left;
}
th{
    font-size: 20px;
    font-weight: bold;
}


.funding-basic>table{
    width: 500px;
    background-color: brown;
    border-collapse: separate;
     border-spacing: 0 10px;
}

.funding-basic>table th{
    width: 30%;
}

table{
    border-collapse: separate;
     border-spacing: 10px 10px;
}


	
</style>
</head>
<body>
<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="main">
        <h1>펀딩상품 등록</h1>
        <hr>
        <div class="basic-information"><span>기본정보</span></div>
        <div class="input-value">
            <div class="funding-basic">
                 <table>
                    <tr>
                        <th>상품명</th><td><input type="text" class="input-form" name="fundingName" type="text"></td>
                    </tr>
                    <tr>
                        <th>회사명</th><td><input type="text" class="input-form" name="bizName" type="text" value="bizName"></td>
                    </tr>
                    <tr>
                        <th>카테고리</th>
                        <td><select class="input-form" name="fundingCategory">
                            <option>카테고리 선택</option>
                            <option value="테크가전">테크가전</option>
                            <option value="식품">식품</option>
                            <option value="패션잡화">패션잡화</option>
                            <option value="뷰티">뷰티</option>
                            <option value="홈리빙">홈리빙</option>
                        </select>
                        </td>
                    </tr>
                    <tr>
                        <th>옵션명 개수</th><td>
                            <select class="input-form" id="fundingOptionCount" name="fundingOptionCount">
                                <option value="1">1개</option>
                                <option	value="2">2개</option>
                                <option value="3">3개</option>
                            </select>
                        </td>
                    </tr>    
                </table>
            </div>
			
            <div class="option-table">
                <table>
                	<tbody>                	
	                    <tr>
	                        <th><label for="fundingOptionName">옵션명</label></th><th><label for="fundingOptionValue">옵션값</label></th>
	                    </tr>
	                    <tr id="option-table-tr">
	                        <td><input type="text" class="input-form" name="fundingOptionName" placeholder="색상"></td>
	                        <td><input type="text" class="input-form" name="fundingOptionValue" placeholder="블랙,화이트(,로 구분)"></td>
	                    </tr>
                	</tbody>
                </table>
                <button class="option-category btn bc1">옵션목록으로 적용</button>
            </div>

            <div>
                <table border="1">
                    <tr>
                        <th>옵션명</th><th>옵션명2</th><th>옵션명3</th><th>가격(원)</th>
                    </tr>
                    <tr>
                        <td>블랙</td><td>s</td><td>200g</td><td>120000</td>
                    </tr>
                    <tr>
                        <td>화이트</td><td>s</td><td>200g</td><td>120000</td>
                    </tr>
                    <tr>
                        <td>블랙</td><td>s</td><td>200g</td><td>120000</td>
                    </tr>
                </table>
            </div>

            <div>
                <div class="main-img"><img></div>
                <div class="sub-img"><img></div>
                <div class="sub-img"><img></div>
                <div class="sub-img"><img></div>
                <div class="sub-img"><img></div>
            </div>

            <div class="funding-end-table">
                <table>
                    <tr>
                        <th>펀딩 종료일</th><td><input type="text" class="input-form" name="fundingEndDate" value="1993년"></td><td><input class="input-form" value="9월"></td><td><input class="input-form" value="9일"></td>
                    </tr>
                    <tr><td><br></td></tr>
                    <tr>
                        <th>펀딩 목표 금액</th><td><input type="text" class="input-form" value="124567890"></td><td>원</td>
                    </tr>
                </table>
            </div>
        </div>

        <hr>
        <div class="detail-information"><span>상세정보</span></div>
        <div class="input-detail">
            <div class="summernote">
                <textarea placeholder="써머노트" style="resize: none;"></textarea>
            </div>
        </div>
        <button type="submit" class="btn bc1">등록하기</button>
        <button type="button" class="btn bc11">취소하기</button>
        <button type="button" class="btn bc2">미리보기(시간나면)</button>
    </div>    
<%@include file="/WEB-INF/views/common/footer.jsp" %>	

<style>
    .input-form{
        height: 40px;
        padding: 0;
        margin: 0;
        padding-left: 10px;
        font-size: 15px;
    }
</style>
<!-- <th><input type="text" class="input-form" name="fundingOptionName" value="맛"></th><th><input type="text" class="input-form" name="fundingOptionValue" value="블랙,화이트(,로 구분)"></th>  -->
<script>
	$(function(){
		$("#fundingOptionCount").on("change",function(){
			const tr = $("#option-table-tr");
			const add = $(".add");
			const titleTr = $("<tr>").attr("class","add");
			const optionNameTd = $("<td>");
			const optionValueTd = $("<td>");
			
			const titleTr2 = $("<tr>").attr("class","add");
			const optionNameTd2 = $("<td>");
			const optionValueTd2 = $("<td>");
			
			const inputName=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionName").attr("placeholder","색상");
			const inputValue=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionValue").attr("placeholder","블랙,화이트(,로 구분)");
			
			const inputName2=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionName").attr("placeholder","색상");
			const inputValue2=$("<input>").attr("type","text").attr("class","input-form").attr("name","fundingOptionValue").attr("placeholder","블랙,화이트(,로 구분)");
				
			add.remove();
			

			if($("#fundingOptionCount").val()==2){
				optionNameTd.append(inputName);
				optionValueTd.append(inputValue);
				titleTr.append(optionNameTd).append(optionValueTd);
				tr.after(titleTr);	
			}
			if($("#fundingOptionCount").val()==3){
				optionNameTd.append(inputName);
				optionValueTd.append(inputValue);
				titleTr.append(optionNameTd).append(optionValueTd);
				tr.after(titleTr);
				
				optionNameTd2.append(inputName2);
				optionValueTd2.append(inputValue2);
				titleTr2.append(optionNameTd2).append(optionValueTd2);
				tr.after(titleTr2);
			}
		});
	});	
</script>	
</body>
</html>