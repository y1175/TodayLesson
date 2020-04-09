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
	location.href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson";
	
} else {
	

	alert("거절 실패!");
	location.href="${pageContext.request.contextPath }/todaylessonadmin/wait_lesson";
	
}
</script>




</body>
</html>