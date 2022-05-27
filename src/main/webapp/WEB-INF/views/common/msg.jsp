<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="/resources/js/jquery-3.6.0.js"></script>
<script src="/resources/js/sweetalert.min.js"></script>
</head>
<body>
	<!-- alert 후 페이지를 이동하는 기능용 페이지 -->
	<script>
		window.onload = function(){
			swal({
				title: "${requestScope.title}",
				text: "${requestScope.msg}",
				icon: "${requestScope.icon}"
			}).then(function(){
				location.href = "${requestScope.loc}"
			});
		}
	</script>
</body>
</html>