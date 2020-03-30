<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<table>
<thead><tr><th>레슨 챕터</th><th>레슨 제목</th><th>수강여부</th></tr></thead>
<tbody>
<c:forEach var="list" items="${list}">
<tr>
<div class="thumb">
<img alt="레슨 썸네일" src="${list.lessondetail_thumb }">
<td><c:out value="${list.lessondetail_chapter}"/></td>
<td><a href="${pageContext.request.contextPath }/select_lessondetail_this_chapter/${list.lessondetail_no}"><c:out value="${list.lessondetail_title}"/></a></td>
<td><c:out value="${list.lessondetail_comp }"/></td>
</div>
</tr>
</c:forEach>
</tbody>
</table>


</body>
</html>