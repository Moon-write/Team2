<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <style>
    	div.msg-banner{
    		font-family: ns-light;
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
		if(memberNo!=""){
			console.log(memberNo);
			const data = {
				type : "login",
				memberNo : memberNo
			};
			ws.send(JSON.stringify(data));

		};

	})

	function onOpen(){
		console.log("접속");
	}
	function receiveMsg(msg){
		console.log(msg.data);
		if(msg.data=="drop"){
			$("div.msg-banner>span:first-child").text("회원님의 입찰이 추월당했어요! 놓치지 마세요!");
			$("div.msg-banner").slideDown();
		}else if(msg.data=="success"){
			$("div.msg-banner>span:first-child").text("입찰이 완료됐습니다!");
			$("div.msg-banner").slideDown();
			bidUpdate();
		}else if(msg.data=="error"){
			$("div.msg-banner>span:first-child").text("입찰에 실패했습니다! 마감기한이 지난 경매는 참여할 수 없어요!");
			$("div.msg-banner").slideDown();
		}else if(msg.data==$("input#projectNo").val()){
			bidUpdate();
		}
	}
	function onClose(){
		console.log("접속해제");
	}

</script>