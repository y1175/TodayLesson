<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>얼리버드</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_bird.css?ver=2"> 
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_bird.js"></script> 
</head>
<body>

<img src="/resources/IMG/earlybird.png" alt="얼리버드 메인 이미지" class="birdmainimg">

<div class="earlybirdtotal">

<img src="/resources/IMG/earlybirdmini.png" alt="얼리버드 미니 배너" class="birdminiimg">

<div class="birdbestmain">
<c:forEach begin="0"  end="3" step="1" var="bestlesson" items="${list}">
<div>
<img alt="test" src="${bestlesson.lesson_thumb}">
<p>
<c:choose>
<c:when test="${bestlesson.lesson_category == 1}">
<c:out value="운동"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 2}">
<c:out value="교육"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 3}">
<c:out value="핸드메이드"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 4}">
<c:out value="it"/>
</c:when>

<c:when test="${bestlesson.lesson_category == 5}">
<c:out value="요리"/>
</c:when>

<c:otherwise>
<c:out value="기타"/>
</c:otherwise>
</c:choose>
</p>
<h5>${bestlesson.lesson_title}</h5>
</div>
</c:forEach>
</div>


</div>
</body>
</html>