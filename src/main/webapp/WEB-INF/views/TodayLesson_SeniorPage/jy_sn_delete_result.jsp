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
	alert("삭제 성공!");
	location.href="${pageContext.request.contextPath }/todaylessonsenior/lesson_list/${pageContext.request.userPrincipal.name}";

} else {
	

	alert("삭제 실패!");
	location.href="${pageContext.request.contextPath }/todaylessonsenior/lesson_list/${pageContext.request.userPrincipal.name}";
	
}
</script>




</body>
</html>