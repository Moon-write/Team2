<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:choose>
		<c:when test="${direct eq 1}">
			<jsp:forward page="/auctionList.kh?endFlag=1&searchKeyword=&order=1&reqPage=1"/>
		</c:when>
		<c:when test="${direct eq 2}">
			<jsp:forward page="/addAuction.kh"/>
		</c:when>
		<c:when test="${direct eq 3}">
			<jsp:forward page="/auctionView.kh?projectNo=${projectNo}"/>
		</c:when>	
	</c:choose>
</body>
</html>