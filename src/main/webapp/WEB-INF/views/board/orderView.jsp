<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
    table#orderInfoTbl, table#itemTbl, table#orderTbl, table#delTbl{
        width: 70%;
        margin: 30px auto;
        margin-bottom: 50px;
    }
    table#orderTbl th, table#delTbl th{
        width: 20%; height: 50px;
    }    
    table#orderTbl td, table#delTbl td{
        padding-left: 5px 0px 5px 20px;
        height: 50px;
        display: flex;
        align-items: center;
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
			<div class="page-titleC">주문 내역</div>
			<table class="tbl" id="orderInfoTbl">
				<tr class="tr-1">
					<th>주문번호</th>
					<td>${order.orderNo }</td>
					<th>주문일자</th>
					<td>${order.orderDate }</td>
					<th>주문상태</th>
					<td>
						<c:choose>
							<c:when test="${order.orderStatus eq 1 }">결제완료</c:when>
							<c:when test="${order.orderStatus eq 2 }">배송완료</c:when>
							<c:when test="${order.orderStatus eq 3 }">입찰완료</c:when>
							<c:when test="${order.orderStatus eq 4 }">결제대기</c:when>
							<c:when test="${order.orderStatus eq 5 }">주문취소</c:when>
						</c:choose>
					</td>
				</tr>
			</table>
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
                        </td>
                        <td style="width: 20%;">
                            ${order.orderPoint }원
                        </td>
                    </tr>
                </tbody>
                <tfoot>
                    <tr class="tr-2">
                        <th colspan="3" style="font-size: 1.4em; height: 80px;">
                            <span>총 결제금액</span>
                            <span id="orderPrice">${order.orderPrice}</span>원
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
            <table border="0" id="delTbl">
                <tr>
                    <th>이름</th>
                    <td>
                        ${order.orderDelName }
                    </td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>
                        ${order.orderDelPhone }
                    </td>
                </tr>
                <tr>
                    <th rowspan="3">주소</th>
                    <td>
                        ${order.orderDelPost }
                    </td>
                </tr>
                <tr>
                    <td>
                        ${order.orderDelAddr1 }
                    </td>
                </tr>
                <tr>
                    <td>
                        ${order.orderDelAddr2 }
                    </td>
                </tr>
                <tr>
                    <th>배송시 요청사항</th>
                    <td>
                        ${order.orderDelAsk }
                    </td>
                </tr>
            </table>
            <div class="btn-wrap">
                <button class="btn bc22 bs5" onclick="back(); return false;">이전</button>
                <c:if test="${order.orderStatus ne 5 }">
	                <button class="btn bc11 bs5" onclick="modifyOrder(); return false;">주문정보 수정</button>                
                </c:if>
            </div>
		</div>
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script type="text/javascript">
    const memberName = '${sessionScope.m.memberName}';
    const memberPhone = '${sessionScope.m.memberPhone}';
    const memberEmail = '${sessionScope.m.memberId}';
    const memberPoint = '${sessionScope.m.memberPoint}';
    const memberAddrFull = '${sessionScope.m.memberAddr1}'+'${sessionScope.m.memberAddr2}';
    const memberPost = '${sessionScope.m.memberPostcode}'
    const memberAddr1 = '${sessionScope.m.memberAddr1}';
    const memberAddr2 = '${sessionScope.m.memberAddr2}';
    
		const orderNo = "${order.orderNo}";
		function modifyOrder(){
			location.href="/modifyOrder.kh?orderNo="+orderNo;
		}
		
        function back(){
        	location.href = "/orderList.kh?reqPage=1&memberNo="+$("input[name=memberNo]").val();
        }
	</script>
</body>
</html>