<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function() {
	
	
	
	// 온라인 클래스의 경우 주소가 없음 > 그니까 온라인의 경우(온라인은 타입 3번) 아예 그 부분을 hide시켜버림
	let state = ${dto.lesson_type};
	console.log(state);
	if ( state == 3 ) {
		$('.layer').hide();
		$('.not_oneday').show();
	} else if(state == 1) {
		$('.layer').show();
		$('.not_oneday').hide();
	} else {
		$('.layer').show();
		$('.not_oneday').show();
	}
	
	
	
	
});



</script>




</head>
<body>

레슨번호<c:out value="${dto.lesson_no }"/><br>
레슨명<c:out value="${dto.lesson_title }"/><br>
최대 수강생 수 / 현재 수강생 수 <c:out value="${dto.lesson_member_max}"/>/<c:out value="${dto.lesson_junior_count}"/><br>

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

<c:when test="${dto.lesson_category == 5}">
<c:out value="요리"/><br>
</c:when>

<c:otherwise>
<c:out value="기타"/><br>
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
레슨 일자 및 시간 <c:out value="${dto.lesson_date_time }"/><br>

레슨 주소<br> 
우편번호<c:out value="${dto.lesson_zipno}"/><br>
주소<c:out value="${dto.lesson_addr}"/><br>
</div>

<div class = "not_oneday">
총 강의 수 / 현재 진행 된 강의 수 <c:out value="${dto.lesson_number}"/> / 맥스로 값을 뽑아와야하나<br>

<table>

<thead><tr><th>레슨 챕터</th><th>레슨 제목</th><th>레슨 수정</th></tr></thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<td><c:out value="${list.lessondetail_chapter}"/></td>
<td><a href="${pageContext.request.contextPath }/select_lessondetail_chapter/${list.lessondetail_no}" onclick="window.open(this.href,'lesson_detail','width=600, height=400'); return false; target='_blank' "><c:out value="${list.lessondetail_title}"/></a></td>
<td><a href="${pageContext.request.contextPath }/update_lessondetail_chapter/${list.lessondetail_no}">레슨 수정</a></td>
</tr>
</c:forEach>
</tbody>
</table>

</div>

<a href="${pageContext.request.contextPath }/my_approve_lesson/${pageContext.request.userPrincipal.name}">목록으로</a>

<c:if test="${dto.lesson_type != 1}">
<br>
<a href="${pageContext.request.contextPath }/my_approve_lesson_upload/${dto.lesson_no}">레슨 업로드</a>
</c:if>


</body>
</html>