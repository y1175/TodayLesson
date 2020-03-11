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
<c:out value="${dto.question_no}"></c:out>
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
</body>
</html>