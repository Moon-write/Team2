<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<input type="hidden" value="${msg }" id="msgAlert">
<script>
	$(function(){
		let msg = $("#msgAlert").val();
		if(msg!=""){
			$("div.msg-banner>span:first-child").text(msg);
			$("div.msg-banner").show();
		}
	})
</script>