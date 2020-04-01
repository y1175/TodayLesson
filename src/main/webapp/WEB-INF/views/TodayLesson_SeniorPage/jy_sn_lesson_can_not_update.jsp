<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


<script>


	alert("신청 완료 상태인 레슨만 수정할 수 있습니다!");
	location.href="${pageContext.request.contextPath}/todaylessonsenior/lesson_list/${pageContext.request.userPrincipal.name}";


</script>


</body>
</html>