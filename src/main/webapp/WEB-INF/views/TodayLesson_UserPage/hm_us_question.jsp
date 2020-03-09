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

<table>
<thead><tr><th>번호</th><th>제목</th><th>처리상태</th><th>문의일</th></tr></thead>
<tbody>
<tr></tr>
</tbody>
</table>
<input type ="button" id="question_btn" value="문의하기">
</body>
</html>