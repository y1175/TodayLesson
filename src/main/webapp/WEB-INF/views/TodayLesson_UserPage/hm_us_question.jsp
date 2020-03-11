<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_question.js"></script>
</head>
<body>
<h2>1:1 문의하기</h2>
<div>
<h3>궁금하신 사항이 있으시다면 언제든지 문의해주시기 바랍니다</h3>
<h5>고객센터 연결이 힘드신 경우 1:1문의를 이용하시면 빠르게 답변드리겠습니다</h5>
<p>CALL CENTER  010-9988-2728</p>
<p>서비스 운영시간 : 오전 9시 ~ 오후 6시 월 ~ 금(토,일 ,공휴일 제외)</p>
</div>

<c:if test="${!empty list}" > 
<table>
<thead><tr><th>문의유형</th><th>제목</th><th>처리상태</th><th>문의일</th></tr></thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<c:choose>
<c:when test="${item.question_group eq '0'}">
<td>
<p>레 슨</p>
</td>
</c:when>
<c:when test="${item.question_group eq '1'}">
<td>
<p>시니어</p>
</td>
</c:when>
<c:when test="${item.question_group eq '2'}">
<td>
<p>스토어</p>
</td>
</c:when>
<c:when test="${item.question_group eq '3'}">
<td>
<p>주  문</p>
</td>
</c:when>
<c:when test="${item.question_group eq '4'}">
<td>
<p>기  타</p>
</td>
</c:when>
</c:choose>
<td>
${item.question_title}
</td>
<c:choose>
<c:when test="${item.question_situation eq '0'}">
<td>
<p>답변대기</p>
</td>
</c:when>
<c:when test="${item.question_situation eq '1'}">
<td>
<p>답변완료</p>
</td>
</c:when>
</c:choose>
<td>
${item.question_writedate}
</td>
</tr>
</c:forEach>
</tbody>
</table>
 </c:if> 


<input type ="button" id="question_btn" value="문의하기">
</body>
</html>