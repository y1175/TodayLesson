<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_question.css?ver=1">                               
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_question.js?ver=4"></script>
</head>
<body>
<div class="usquestionmain">
<img alt="faq" src="/resources/IMG/faq.png" class="usquestionimg">
<h2>1:1 문의하기</h2>
<div>
<h3>궁금하신 사항이 있으시다면 언제든지 문의해주시기 바랍니다</h3>
<h5>고객센터 연결이 힘드신 경우 1:1문의를 이용하시면 빠르게 답변드리겠습니다</h5>
<p>CALL CENTER  010-9988-2728</p>
<p>서비스 운영시간 : 오전 9시 ~ 오후 6시 월 ~ 금(토,일 ,공휴일 제외)</p>
<input type ="button" class="question_btn" id="question_btn" value="문의하기">
</div>
</div>
<c:if test="${!empty list}" > 


	<table class="table" style="width: 80%; margin: 0px auto 100px;">
		<thead>
			<tr class="table-warning">
				<th scope="col">#</th>
				<th scope="col">문의유형</th>
				<th scope="col">제목</th>
				<th scope="col">처리상태</th>
				<th scope="col">문의일</th>
				<th scope="col">상세보기</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${list}">
		<tr>
		<td>
		<input type="hidden" id="question_no" class = "question_no" value="${item.question_no}">
		<svg class="bi bi-heart" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 01.176-.17C12.72-3.042 23.333 4.867 8 15z" clip-rule="evenodd"/>
		</svg>
		</td>
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
		<td>
		<input type ="button" class ="hm_us_questiondetailbtn" id="${item.question_no}" value="상세보기">
		</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
		
</c:if>






</body>
</html>