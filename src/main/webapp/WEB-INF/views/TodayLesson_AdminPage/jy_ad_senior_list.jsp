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

<table>
<thead>
<tr>
<th>시니어넘버</th><th>시니어아이디</th><th>시니어전환일</th><th>시니어명</th><th>사업자여부</th>
</tr>
</thead>
<tbody>
<c:forEach var="list" items="${list }">
<tr>
<td>${list.senior_no }</td>
<td><a href="/todaylessonadmin/select_senior/${list.senior_no}">${list.member_id}</a></td>
<td>${list.senior_register_date}</td>
<td>${list.senior_nick}</td>

<c:choose>

<c:when test="${list.senior_crno == null}">
<td><c:out value="N"/></td>
</c:when>

<c:otherwise>
<td><c:out value="Y"/></td>
</c:otherwise>

</c:choose>

<!--  사업자 번호는 누르면 null이면 N, 사업자 번호가 있으면 Y로 나오게-->

<!-- 아코디언으로해서 시니어 누르면 밑으로 시니어 정보 보이게...? -->

</tr>

</c:forEach>
</tbody>







</table>
</body>
</html>