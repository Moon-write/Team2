<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩 공지사항 등록</title>
</head>
<style>
	.board-table th{
		background-color: rgb(255, 130, 171);
		color: white;
		padding-left: 15px;
		padding-right: 15px;
	}
	.board-table-div{
		margin: 20px;
	}
	.board-table td{
		text-align: center;
		padding-left: 15px;
		padding-right: 15px;
	}
	.board-table tr{
		border: 1px solid black;
	}
	.board-table{
		width: 80%;
		margin: 30px;
		border: 1px solid black;
	}
	.board-div{
		display: flex;
		width: 100%;
		align-items: center;
    	justify-content: center;
	}
	.table-content{
		height: 500px;
		
	}
</style>
<body>
	<%@include file="/WEB-INF/views/common/header.jsp" %>
	<div class="board-div">
		<table class="board-table">
			<tr>
				<th>제목</th><td colspan="3">${fb.boardTitle }</td>
			</tr>
			<tr>
				<th>작성자</th><td>${fb.boardNo }</td>
				<th>날짜</th><td>${fb.boardStartdate }</td>
			</tr>
			<tr>
				<th rowspan="4">내용</th>
				<td colspan="3" rowspan="4" class="table-content">
					${fb.boardContent }
				</td>
			</tr>
		</table>
	</div>
	<%@include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>