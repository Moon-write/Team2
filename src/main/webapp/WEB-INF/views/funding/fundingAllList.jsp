<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펀딩리스트</title>
</head>
<body>
	<table border="1">
		<tr>
			<th>번호</th>
			<th>이름</th>
			<th>카테고리</th>
			<th>시작날짜</th>
			<th>끝난날짜</th>
			<th>목표금액</th>
			<th>현재모인금액</th>
			<th>달성률</th>
			<th>멤버넘버</th>
		</tr>
		<c:forEach items="${list }" var="f">
			<tr>
				<td>${f.fundingNo }</td>
				<td>${f.fundingName}</td>
				<td>${f.fundingCategory}</td>
				<td>${f.fundingStartDate}</td>
				<td>${f.fundingEndDate}</td>
				<td>${f.fundingSum}</td>
				<td>${f.fundingCurrentSum}</td>
				<td>${f.fundingSumRate}</td>
				<td>${f.memberNo}</td>		
			</tr>
		</c:forEach>
	</table>	
</body>
</html>