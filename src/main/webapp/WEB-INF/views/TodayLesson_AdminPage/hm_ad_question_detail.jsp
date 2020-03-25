 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_question_detail.js"></script>
</head>
<body>
<div>
<ul>
<li>
글번호 : <c:out value="${dto.question_no}"/>
</li>
<li>
아이디 : <c:out value="${dto.member_id}"></c:out>
</li>
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
<c:out value="${dto.question_title}"></c:out>
</li>
<li>
<c:out value="${dto.question_content}"></c:out>
</li>
<c:choose>
<c:when test = "${dto.question_situation eq '0'}">
<li>
<p>답변대기</p>
</li>
</c:when>
<c:when test = "${dto.question_situation eq '1'}">
<li>
<p>답변완료</p>
</li>
</c:when>
</c:choose>
<li>
<c:out value="${dto.question_writedate}"></c:out>
</li>
</ul>
</div>


<c:choose>
<c:when test="${empty dto.question_answer }">
<input type="button" id="hm_ad_questionbtn" class="hm_ad_questionbtn" value="답변하기">
</c:when>
<c:when test="${!empty dto.question_answer }">
<div>
<ul>
<li>"${dto.question_answer}"</li>
</ul>
</div>
</c:when>
</c:choose>

<div id="hm_question_answerdiv" style="display : none;">
<form method="post" action="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question_update">
<ul>
<input type="hidden" id="question_no" name="question_no" value="${dto.question_no }">
<li>
<textarea rows="20" cols="90" id="question_answer" name="question_answer" required="required">
${dto.member_id} 님 안녕하세요.
오늘의 레슨 고객 센터팀 입니다.
</textarea>
</li>
<li>
<input type="submit" id="question_answerbtn" value="답변달기">
</li>
</ul>
<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>
</div>


</body>
</html>