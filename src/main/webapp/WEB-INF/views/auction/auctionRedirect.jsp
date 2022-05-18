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
			<jsp:forward page="/auctionList.kh"/>
		</c:when>
		<c:when test="${direct eq 2}">
			<jsp:forward page="/addAuction.kh"/>
		</c:when>
	
	</c:choose>
</body>
</html>