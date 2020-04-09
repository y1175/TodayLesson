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
	alert("거절 완료!");
	</script>
	
	<h3>거절완료</h3>
	<a href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson">목록으로</a>
	
	<script>
} else {
	

	alert("거절 실패!");
	location.href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson";
	
}
</script>




</body>
</html>