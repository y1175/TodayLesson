<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_questioninsert.js"></script> 
</head>
<body>
<h2>1:1문의 등록</h2>
<form name ="hmquestionform" method="post" action="${pageContext.request.contextPath}/todaylessonmypage/hm_question_create">
<ul>
<%-- <input type ="hidden" id="member_id" name ="member_id" value="${pageContext.request.userPrincipal.name}"> --%>
<li>
<label>문의 분류</label>
<select id="question_group" name="question_group" required="required">
<option value ="">문의 유형을 선택하세요</option>
<option value ="0">레   슨</option>
<option value ="1">시니어</option>
<option value ="2">스토어</option>
<option value ="3">주   문</option>
<option value ="4">기   타</option>
</select>
</li>
<li>
<label>문의 제목</label>
<input type="text" id="question_title" name ="question_title" required="required">
</li>
<li>
<label>문의 내용</label>
<textarea rows="20" cols="90" id="question_content" name="question_content" placeholder="문의 내용을 입력하세요" required="required"></textarea>
</li>
<li>
<input type="button" id="hm_us_question_insertbtn" value="등록">
<input type ="reset" value="취소">
</li>
</ul>
</form>
</body>
</html>
