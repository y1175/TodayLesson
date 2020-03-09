<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script>

if (${result} > 0) {
	alert("승인 완료!");
	</script>
	
	<h3>승인완료</h3>
	<h5>이제 멜 보내면 됨 혬한테 배워야혀</h5>
	<a href="${pageContext.request.contextPath }/wait_lesson">목록으로</a>
	
	<script>
} else {
	

	alert("승인 실패!");
	location.href="${pageContext.request.contextPath }/wait_lesson";
	
}
</script>




</body>
</html>