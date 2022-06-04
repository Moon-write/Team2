<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    table#itemTbl, table#orderTbl, table#delTbl{
        width: 70%;
        margin: 30px auto;
        margin-bottom: 50px;
    }
    table#orderTbl th, table#delTbl th{
        width: 20%; height: 50px;
    }
    table#orderTbl td, table#delTbl td{
        padding: 5px 0px;
        display: flex;
        justify-content: space-between;
    }
    table#delTbl input{
        padding-left: 20px;
    }
    table#itemTbl th:first-child{
    	border-radius: 5px;
    }
    table#itemTbl th:not(th:first-child){
    	border-radius:  5px;
    	border-left: 2px solid #fff;   
    }
    table#itemTbl input[name=orderPoint]{
        display: inline-block;
        width: 80%;
        margin-right: 5px;
    }
    .btn-wrap{
        text-align: center;
        margin-top: 70px;
        margin-bottom: 150px;
    }
    .btn-wrap button, .btn-wrap input{
        font-size: 1.2em;
    }
    table#delTbl input[name=orderDelPost]{
        width: calc( 100% - 130px );
    }
	div#projectName{
        padding: 15px 0px 5px 20px;
        text-align: left;
        font-size: 1.2em;
        color:#1E90FF;
    }
    div#productName{
        text-align: left;
        padding: 0px 0px 15px 20px;
    }
    div#productPrice{
        font-size: 0.9em;
    }
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
 
        <input type="hidden" id="orderNo" value="${order.orderNo}" name="orderNo">
        <input type="hidden" id="projectNo" value="${order.projectNo}" name="projectNo">
	    <input type="hidden" id="memberNo" value="${sessionScope.m.memberNo}" name="memberNo">
		<div class="page-content">
			<div class="page-titleC">주문 결제</div>
			<table class="tbl" id="itemTbl">
                <thead>
                    <tr class="tr-2">
                        <th>상품명</th>
                        <th>수량</th>
                        <th>금액</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${order.orderProductList}" var="op" varStatus="i">
                        <tr style="border-bottom: 1px dotted #ccc;">
                            <td>
                                <div id="projectName">${order.projectName}</div>
                                <div id="productName">${op.productName}</div>
                            </td>
                            <td>
                                <div id="productAmount">${op.productAmount}개</div>
                                <div id="productPrice">(${op.productPrice}원)</div>
                            </td>
                            <td>
                                <span>${op.productPrice*op.productAmount}원</span>
                            </td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="2" style="text-align: left; height: 60px"><span style="padding-left:20px">배송비</span></td>
                        <td>무료배송</td>
                    </tr>
                    <tr>
                        <td colspan="2" style="text-align: left; height: 60px;">
                            <div style="padding-left: 20px;">포인트 사용</div>
                            <span style="padding-left: 20px; font-size: 0.8em;">사용 가능 포인트 : <span id="memberPoint">${sessionScope.m.memberPoint}</span></span>
                        </td>
                        <td style="width: 20%;">
                            <input type="text" name="orderPoint" class="input-form" style="text-align: right" value="0">원
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr class="tr-2">
                        <th colspan="3" style="font-size: 1.4em; height: 80px;">
                            <span>총 결제금액</span>
                            <span id="orderPrice">${order.orderPrice}</span>원
                            <input type="hidden" id="totalPrice" value="${order.orderPrice}"> <!--여기에 포인트 사용전 최종 주문금액 넣기-->
                            <input type="hidden" name="orderPrice"  value="${order.orderPrice}">
                        </th>
                    </tr>
                </tfoot>
            </table>
            <div class="page-titleC">주문자 정보</div>
            <table border="0" id="orderTbl">
                <tr>
                    <th>이름</th>
                    <td>${sessionScope.m.memberName}</td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>${sessionScope.m.memberPhone}</td>
                </tr>
            </table>
            <div class="page-titleC">배송지 정보</div>
            <div style="width: 70%; margin: 0px auto; text-align: right;">
                <input type="checkbox" id="equalChk"><label for="equalChk">주문자 정보와 동일</label>
            </div>
            <table border="0" id="delTbl">
                <tr>
                    <th>이름</th>
                    <td>
                        <input type="text" name="orderDelName" class="input-form" value="${order.orderDelName }">
                    </td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>
                        <input type="text" name="orderDelPhone" class="input-form" value="${order.orderDelPhone }">
                    </td>
                </tr>
                <tr>
                    <th rowspan="3">주소</th>
                    <td>
                        <input type="text" name="orderDelPost" placeholder="우편번호" class="input-form" id="orderDelPost"  value="${order.orderDelPost }">
                        <button class="btn bc1" id="postBtn" onclick="searchAddr(); return false;">우편번호 검색</button>
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="orderDelAddr1" placeholder="대주소" class="input-form"  id="orderDelAddr1"  value="${order.orderDelAddr1 }">
                    </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" name="orderDelAddr2" placeholder="상세주소" class="input-form" id="orderDelAddr2"  value="${order.orderDelAddr2 }">
                    </td>
                </tr>
                <tr>
                    <th>배송시 요청사항</th>
                    <td>
                        <input type="text" name="orderDelAsk" placeholder="(선택)" class="input-form"  value="${order.orderDelAsk }">
                    </td>
                </tr>
            </table>
            <div class="btn-wrap">
                <button class="btn bc22 bs5" onclick="back(); return false;">이전</button>
                <c:if test="${order.orderStatus eq 4}">
                    <button class="btn bc11 bs5" onclick="payment(); return false;">결제하기</button>
                    <input  type="submit" class="btn bc1 bs5" value="결제처리">
                </c:if>
            </div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
</body>
</html>