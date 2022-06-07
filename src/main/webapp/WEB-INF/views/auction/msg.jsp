<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	div.msg-banner>span:first-child{
    		font-family: ns-light;
    	}
		div.msg-banner>span>a{
			text-decoration: none;
			color: white;
		}
    </style>
<input type="hidden" value="${msg }" id="msgAlert">
<input type="hidden" id="memberNo" value="${sessionScope.m.memberNo}">
<script>
	// 웹소켓 종류 2개
	// 1. 현재 접속자 리스트 : 별도 동작 x 접속하면 무조건 
	// 2. 로그인 회원 리스트 : 로그인하면 연동

	// 동작
	// 1. 입찰 : 입찰자에게 입찰성공(success)/입찰실패(error) 안내   - 해당 view 안보고 있어도 유효
	// 2. 입찰탈락 : 탈락자에게 탈락(drop) 안내                     - 해당 view 안보고 있어도 유효
	// 3. 갱신 : 모든 접속자에게 갱신된 프로젝트명 전달 (projectNo) - 해당 view 보고있는 사람에게만 유효

	let memberNo;
	let ws;

	$(function(){
		let msg = $("#msgAlert").val();
		if(msg!=""){
			$("div.msg-banner>span:first-child").text(msg);
			$("div.msg-banner").slideDown();
		}		
		
		ws = new WebSocket("ws://116.127.99.184/insertBid.kh");
		ws.onopen = onOpen;
		ws.onmessage = receiveMsg;
		ws.onclose = onClose;
				
		memberNo = $("#memberNo").val();
		
		setTimeout(function(){
			
			if(memberNo!=""){
				const data = {
					type : "login",
					memberNo : memberNo
					};
				ws.send(JSON.stringify(data));
			};	
		},1000);

	})

	function onOpen(){
	}
	function receiveMsg(msg){
		let result = msg.data.split("/");
		if(result[0] =="drop"){
			const link = $("<a>");
			link.attr("href","/auctionView.kh?projectNo="+result[1]);
			link.text("회원님의 입찰이 추월당했어요! 놓치지 마세요! 보러가기>>");
			$("div.msg-banner>span:first-child").html(link);
			$("div.msg-banner").slideDown();
		}else if(msg.data=="success"){
			$("div.msg-banner>span:first-child").text("입찰이 완료됐습니다!");
			$("div.msg-banner").slideDown();
			bidUpdate();
		}else if(msg.data=="error"){
			$("div.msg-banner>span:first-child").text("입찰에 실패했습니다! 마감기한이 지난 경매는 참여할 수 없어요!");
			$("div.msg-banner").slideDown();
		}else if(result[0]=="update"&&result[1]==$("input#projectNo").val()){
			bidUpdate();
		}else if(msg.data=="bidSuccess"){
			$("div.msg-banner>span:first-child").text("참여한 경매가 낙찰됐습니다! 마이페이지에서 결제해 주세요.");
			$("div.msg-banner").slideDown();
		}
		
	}
	function onClose(){
	}

</script>