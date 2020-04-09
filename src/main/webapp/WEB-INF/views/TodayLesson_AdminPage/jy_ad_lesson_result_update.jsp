<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_senior_form.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

</head>
<body>
<div class= "jy_container">
<script>


	function approve(lesson_no) {
		opener.location.href="${pageContext.request.contextPath}/todaylessonadmin/lesson_approve/${lesson_no}";
		self.close();
	} 
	
	function reject(lesson_no) {
		opener.location.href="${pageContext.request.contextPath}/todaylessonadmin/lesson_reject/${lesson_no}";
		self.close();
	} 
	

</script>

<c:set var="lesson_no" value="${lesson_no }"/>

<h1 style="text-align: center;">레슨을 승인하시겠습니까?</h1>

	<br>

	<div class="jy_text_box">
<input type="button" name="yes" id="yes" onclick="approve(${lesson_no});" value="승인" class="ej_btn">
<input type="button" name="no" id="no" onclick="reject(${lesson_no});" value="거절" class="ej_btn2">
</div>
</div>
</body>
</html>