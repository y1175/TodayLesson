<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.thum{
width:500px; height:auto;
}

</style>

</head>
<body>

<table class="table">

<thead>
<tr>
<th scope="col">번호</th><th scope="col">레슨명</th><th scope="col">카테고리</th><th scope="col">레슨타입</th><th scope="col">승인 상태</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td><c:out value="${item.lesson_no}"/></td>
<td><a href="/lesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a></td>


<c:choose>

<c:when test="${item.lesson_category == 1}">
<td><c:out value="운동"/></td>
</c:when>

<c:when test="${item.lesson_category == 2}">
<td><c:out value="교육"/></td>
</c:when>

<c:when test="${item.lesson_category == 3}">
<td><c:out value="핸드메이드"/></td>
</c:when>

<c:when test="${cate == 4}">
<td><c:out value="it"/></td>
</c:when>

<c:otherwise>
<td><c:out value="요리"/></td>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type == 1}">
<td><c:out value="원데이 클래스"/></td>
</c:when>

<c:when test="${item.lesson_type == 2}">
<td><c:out value="다회성 클래스"/></td>
</c:when>

<c:otherwise>
<td><c:out value="온라인 클래스"/></td>
</c:otherwise>

</c:choose>


<c:set var="result" value="${item.lesson_result}"/>

<c:choose>

<c:when test="${item.lesson_result == 0}">
<td><c:out value="심사중"/></td>
</c:when>

<c:when test="${item.lesson_result == 1}">
<td><c:out value="완료"/></td>
</c:when>

<c:otherwise>
<td><c:out value="거절"/></td>
</c:otherwise>

</c:choose>



</tr>
</c:forEach>
</tbody>
</table>

<a href="${pageContext.request.contextPath }/lesson_write/${pageContext.request.userPrincipal.name}">글쓰기</a>

</body>
</body>
</html>