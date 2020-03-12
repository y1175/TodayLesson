<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<script>


	function approve(lesson_no) {
		opener.location.href="${pageContext.request.contextPath}/lesson_approve/${lesson_no}";
		self.close();
	} 
	
	function reject(lesson_no) {
		opener.location.href="${pageContext.request.contextPath}/lesson_reject/${lesson_no}";
		self.close();
	} 
	

</script>

<c:set var="lesson_no" value="${lesson_no }"/>

<h1>레슨을 승인하시겠습니까?</h1>

	${dto.senior_email }
	<br>
	${dto.senior_nick}

디티오 값 받을 수 있네	
	
<input type="button" name="yes" id="yes" onclick="approve(${lesson_no});" value="승인">
<input type="button" name="no" id="no" onclick="reject(${lesson_no});" value="거절">

</body>
</html>