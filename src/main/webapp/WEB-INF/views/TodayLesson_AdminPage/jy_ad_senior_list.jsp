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
<th>시니어 넘버</th><th>시니어 아이디</th><th>시니어 전환일</th><th>시니어명</th><th>사업자 여부</th>
</tr>
</thead>
<c:forEach var="list" items="${list }">









</c:forEach>
</table>
</body>
</html>