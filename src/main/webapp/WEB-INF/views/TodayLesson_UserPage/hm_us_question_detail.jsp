 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<div>
<ul>

<c:choose>
<c:when test="${dto.question_group eq '0'}">
<li>
<p>레  슨</p>                          
</li>
</c:when>
<c:when test="${dto.question_group eq '1'}">
<li>
<p>시니어</p>
</li>
</c:when>
<c:when test="${dto.question_group eq '2'}">
<li>
<p>스토어</p>
</li>
</c:when>
<c:when test="${dto.question_group eq '3'}">
<li>
<p>주  문</p>
</li>
</c:when>
<c:when test="${dto.question_group eq '4'}">
<li>
<p>기  타</p>
</li>
</c:when>
</c:choose>

<li>
작성일 : <c:out value="${dto.question_writedate}"></c:out> 
</li>
<li>
제목 : <c:out value="${dto.question_title}"></c:out>
</li>
<li>
문의내용 : <c:out value="${dto.question_content}"></c:out>
</li>
</ul>
</div>

<c:if test="${!empty dto.question_answer }">
<div>
<ul>
<li>
답변일 : <c:out value="${dto.question_answerwritedate}"/>
</li>
<li>
답변 : <c:out value="${dto.question_answer}"/>
</li>
</ul>
</div>
</c:if>


<c:if test="${empty dto.question_answer }">
<div>
<ul>
<p>CALL CENTER 010-9988-2728</p><br>
<p>서비스 운영시간 : 오전 9시 ~ 오후 6시 월 ~ 금(토,일 ,공휴일 제외)</p>
</ul>
</div>
</c:if>

<a href="${pageContext.request.contextPath}/todaylessonmypage/hm_us_question">목록으로</a>
</body>
</html>