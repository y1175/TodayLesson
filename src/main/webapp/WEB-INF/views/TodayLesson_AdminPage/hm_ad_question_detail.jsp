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
<span id="questiondetail_no"><c:out value="${dto.question_no}"/></span>
</li>
<li>
<c:out value="${dto.member_id}"></c:out>
</li>
<li>
<c:out value="${dto.question_group}"></c:out>
</li>
<li>
<c:out value="${dto.question_title}"></c:out>
</li>
<li>
<c:out value="${dto.question_content}"></c:out>
</li>
<li>
<c:out value="${dto.question_situation}"></c:out>
</li>
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
<form method="post" action="hm_ad_question_update">
<ul>
<li>
<textarea rows="20" cols="90" id="question_answer" name="question_answer">
${dto.member_id} 님 안녕하세요.
오늘의 레슨 고객 센터팀 입니다.
</textarea>
</li>
<li>
<input type="button" id="question_answerbtn" value="답변달기">
</li>
</ul>
</form>
</div>


</body>
</html>