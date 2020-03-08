<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

$(document).ready(function() {
	
	
	
	
	let state = ${dto.lesson_type};
	console.log(state);
	if ( state == 3 ) {
		$('.layer').hide();
	} else {
		$('.layer').show();
	}

	
	
	
});



</script>




</head>
<body>

레슨번호<c:out value="${dto.lesson_no }"/><br>
레슨명<c:out value="${dto.lesson_title }"/><br>
레슨 내용<c:out value="${dto.lesson_content}"/><br>
수강생수<c:out value="${dto.lesson_member_max}"/><br>

카테고리

<c:choose>

<c:when test="${dto.lesson_category == 1}">
<c:out value="운동"/><br>
</c:when>

<c:when test="${dto.lesson_category == 2}">
<c:out value="교육"/><br>
</c:when>

<c:when test="${dto.lesson_category == 3}">
<c:out value="핸드메이드"/><br>
</c:when>

<c:when test="${dto.lesson_category == 4}">
<c:out value="it"/><br>
</c:when>

<c:otherwise>
<c:out value="요리"/><br>
</c:otherwise>

</c:choose>

레슨 가격 <c:out value="${dto.lesson_cost}"/><br>

레슨 시작일 <c:out value="${dto.lesson_open_period}"/><br> 
레슨 종료일 <c:out value="${dto.lesson_close_period}"/><br> 

레슨 타입

<c:choose>

<c:when test="${dto.lesson_type == 1}">
<c:out value="원데이 클래스"/><br>
</c:when>

<c:when test="${dto.lesson_type == 2}">
<c:out value="다회성 클래스"/><br>
</c:when>

<c:otherwise>
<c:out value="온라인 클래스"/><br>
</c:otherwise>

</c:choose>

<div class="layer">
레슨 시간 <c:out value="${dto.lesson_time}"/><br>

레슨 주소<br> 
우편번호<c:out value="${dto.lesson_zipno}"/><br>
주소<c:out value="${dto.lesson_addr}"/><br>
<!-- 여기에 map가져오기 -->
</div>

총 강의 수<c:out value="${dto.lesson_number}"/><br>
시니어 명<c:out value="${dto.lesson_senior_title}"/><br>
시니어 소개<c:out value="${dto.lesson_senior_content}"/><br>


<a href="${pageContext.request.contextPath }/lesson_list">목록으로</a>
</body>
</html>