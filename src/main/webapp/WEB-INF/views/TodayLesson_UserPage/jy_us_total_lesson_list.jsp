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


<c:forEach var="item" items="${list}">

<div id="thumb">
<img alt="레슨 썸네일" src="${item.lesson_thumb }">
<c:out value="${item.lesson_no}"/>
<a href="/lesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a>


<c:choose>

<c:when test="${item.lesson_category == 1}">
<c:out value="운동"/>
</c:when>

<c:when test="${item.lesson_category == 2}">
<c:out value="교육"/>
</c:when>

<c:when test="${item.lesson_category == 3}">
<c:out value="핸드메이드"/>
</c:when>

<c:when test="${cate == 4}">
<c:out value="it"/>
</c:when>

<c:otherwise>
<c:out value="요리"/>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type == 1}">
<c:out value="원데이 클래스"/>
</c:when>

<c:when test="${item.lesson_type == 2}">
<c:out value="다회성 클래스"/>
</c:when>

<c:otherwise>
<td><c:out value="온라인 클래스"/></td>
</c:otherwise>

</c:choose>



</div>
</c:forEach>

</body>
</body>
</html>