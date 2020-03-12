<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

시니어 번호 <c:out value="${dto.senior_no }"/><br>
시니어 아이디 <c:out value="${dto.member_id}"/><br>
시니어 이메일 <c:out value="${dto.senior_email}"/><br>
시니어 연락처 <c:out value="${dto.senior_phone}"/><br>
시니어 닉네임 <c:out value="${dto.senior_nick}"/><br>
시니어 등록일 <c:out value="${dto.senior_register_date}"/><br>

<table>
<thead><tr><th>레슨no</th><th>레슨 제목</th><th>레슨 타입</th><th>레슨 결과</th><th>수강생수</th><th>레슨 등록일</th></tr></thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<td>${list.lesson_no}</td>
<td><a href="${pageContext.request.contextPath}/admin_lesson_detail/${list.lesson_no }">${list.lesson_title}</a></td>
<td>${list.lesson_type}</td>

<c:choose> 

<c:when test="${list.lesson_result == 0}">
<td>신청완료</td>
</c:when>

<c:when test="${list.lesson_result == 1}">
<td>심사중</td>
</c:when>

<c:when test="${list.lesson_result == 2}">
<td>레슨승인</td>
</c:when>

<c:otherwise>
<td>레슨거절</td>
</c:otherwise>

</c:choose>

<td>${list.lesson_result}</td>
<td>${list.lesson_junior_count}</td>
<td>${list.lesson_register_date}</td>
</tr>
</c:forEach>
</tbody>
</table>
<a href="${pageContext.request.contextPath }/all_senior">목록으로</a>
</body>
</html>