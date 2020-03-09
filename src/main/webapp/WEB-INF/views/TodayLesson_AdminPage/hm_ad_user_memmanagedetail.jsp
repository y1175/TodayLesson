<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<ul>
<li>
<c:out value="${dto.member_no}"></c:out>
</li>
<li>
<c:out value="${dto.member_id}"></c:out>
</li>
<li>
<c:out value="${dto.member_name}"></c:out>
</li>
<li>
<c:out value="${dto.member_birth}"></c:out>
</li>
<li>
<c:out value="${dto.member_phone}"></c:out>
</li>
<li>
<c:out value="${dto.member_addr}"></c:out>
</li>
<li>
<c:out value="${dto.member_zipcode}"></c:out>
</li>
<li>
<c:out value="${dto.member_point}"></c:out>
</li>
<li>
<c:out value="${dto.member_level}"></c:out>
</li>
<li>
<c:out value="${dto.member_email}"></c:out>
</li>
<li>
<c:out value="${dto.member_nick}"></c:out>
</li>
<li>
<c:out value="${dto.member_join_date}"></c:out>
</li>
</ul>
</body>
</html>