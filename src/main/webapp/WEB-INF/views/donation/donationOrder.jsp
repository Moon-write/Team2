<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 등록</title>
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
        text-align: center;
    }
</style>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
    <form action="/donationPay.kh" method="post"> <!--insert 용 form이 필요한 경우 여기에 태그를 넣어주세요-->
        <input type="hidden" id="divNo" value="${divNo }" name="divNo">
        <input type="hidden" id="projectNo" value="${projectNo}" name="projectNo">
	    <input type="hidden" id="memberNo" value="${sessionScope.m.memberNo}" name="memberNo">
	    <input type="hidden" id="sellerNo" value="${sellerNo }" name="sellerNo">
	    <input type="hidden" id="projectName" value="${donationTitle }" name="projectName">
	    <input type="hidden" id="orderStatus" value="1" name="orderStatus">
		<div class="page-content">
			<div class="page-titleC">주문 결제</div>
			<table class="tbl" id="itemTbl">
                <thead>
                    <tr class="tr-2">
                        <th>상품명</th>
                        <th colspan="2">금액</th>
                    </tr>
                </thead>
                <tbody>
                        <tr style="border-bottom: 1px dotted #ccc;">
                            <td>
                                <div id="projectName">${donationTitle}</div>
                            </td>
                            <td colspan="2">
                                <div id="productPrice"><h3>${orderPrice}원</h3></div>
                            </td>
                        </tr>
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
                            <span id="orderPrice">${orderPrice}</span>원
                            <input type="hidden" id="totalPrice" value="${orderPrice}"> <!--여기에 포인트 사용전 최종 주문금액 넣기-->
                            <input type="hidden" name="orderPrice"  value="${orderPrice}">
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
                        <input type="text" name="orderDelName" class="input-form" value="${sessionScope.m.memberName}">
                    </td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>
                        <input type="text" name="orderDelPhone" class="input-form" value="${sessionScope.m.memberPhone}">
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
                    <button class="btn bc11 bs5" onclick="payment(); return false;">결제하기</button>
                    <input  type="submit" class="btn bc1 bs5" value="결제처리">
            </div>
		</div>
    </form><!--insert용 form태그 닫는곳 -->
	<%@include file="/WEB-INF/views/common/footer.jsp"%>
	<script>
        const memberName = '${sessionScope.m.memberName}';
        const memberPhone = '${sessionScope.m.memberPhone}';
        const memberEmail = '${sessionScope.m.memberId}';
        const memberPoint = '${sessionScope.m.memberPoint}';
        const memberAddrFull = '${sessionScope.m.memberAddr1}'+'${sessionScope.m.memberAddr2}';
        const memberPost = '${sessionScope.m.memberPostcode}'
        const memberAddr1 = '${sessionScope.m.memberAddr1}';
        const memberAddr2 = '${sessionScope.m.memberAddr2}';

        $("input#equalChk").on("click",function(){
            if($(this).prop("checked")==true){
                $("input[name=orderDelName]").val(memberName);
                $("input[name=orderDelPhone]").val(memberPhone);
                $("input[name=orderDelPost]").val(memberPost);
                $("input[name=orderDelAddr1]").val(memberAddr1);
                $("input[name=orderDelAddr2]").val(memberAddr2);
            }else{
                $("input[name=orderDelName]").val("");
                $("input[name=orderDelPhone]").val("");
                $("input[name=orderDelPost]").val("");
                $("input[name=orderDelAddr1]").val("");
                $("input[name=orderDelAddr2]").val("");
            }
        })
        function back(){
            history.back();
        }
        $("input[name=orderPoint]").on("change",function(){
            // 1 기본 소지포인트보다 많으면 무효
            if($(this).val()>memberPoint){
                alert("보유 포인트보다 많이 입력하실 수 없습니다!");
                $(this).val("");
                return;
            }else{
                $("span#orderPrice").text($("input#totalPrice").val()-$(this).val());
                $("input[name=orderPrice]").val($("input#totalPrice").val()-$(this).val());
            }
        })
        function searchAddr(){
            new daum.Postcode({
                oncomplete: function(data) {
                    // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
                    // 예제를 참고하여 다양한 활용법을 확인해 보세요.
                    // 선택한 주소가 data 매개변수로 돌아옴 (json 타입으로)
                    $("#orderDelPost").val(data.zonecode);
                    $("#orderDelAddr1").val(data.roadAddress);
                    $("#orderDelAddr2").val(data.buildingName+" ");
                    $("#orderDelAddr2").focus();
                }
            }).open();
	    };
        function payment(){
            const price = $("span#orderPrice").text(); // 총결제금액 가져오기
            const d = new Date();
            const date = d.getFullYear()+""+(d.getMonth()+1)+""+d.getDate()+""
                                    +d.getHours()+""+d.getMinutes()+""+d.getSeconds();

            IMP.init("imp14793007");

            IMP.request_pay({
                merchant_uid : $("input#projectNo").val()+"_"+date,	// 거래ID
                name : "weNeedYou", 				// 결제이름
                amount : price, 				// 결제금액
                buyer_email: memberEmail,	// 구매자의 email주소
                buyer_name : memberName,				// 구매자 이름
                buyer_tel :	memberPhone,		// 구매자 전번
                buyer_addr : memberAddrFull, // 구매자 주소
                buyer_postcode : memberPost				// 구매자 우편번호
            },function(rsp){
                if(rsp.success){
                    // 결제 성공시 DB insert 작업할 공간
                    console.log("여기")
                    
                }else{
                        alert("결제가 취소되었습니다.");
                }
            }); 
        };
        $("input").on("keydown",function(event){
            if(event.keyCode==13){
                event.preventDefault();
            }
        })
        
        $("input[name=orderDelPhone]").on("keyup",function(event){
	    	const value = $(this).val();
	    	
	    	if(window.event.keyCode==109){
	    		const newStr= value.substring(0,value.length-1);
	    		$(this).val(newStr);
	    	}else{
		    	const value = $(this).val();
		    	const length = value.length;
	
		    	if(length==3){
		    		$(this).val(value+"-");
		    	}else if(length==7){
		    		$(this).val(value+"-");
		    	}else if(length==13){
		    		let fullNum;
		    		fullNum = value.substring(0,7)+value.substring(8,9)+"-"+value.substring(9);	    			
		    		$(this).val(fullNum);
		    	}	    		
	    	}
	    })
	</script>
</body>
</html>