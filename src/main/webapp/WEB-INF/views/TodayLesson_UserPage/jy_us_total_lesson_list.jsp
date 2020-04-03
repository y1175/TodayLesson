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

<script>

function order(data)
{
location.href="total_lesson_list?order="+data;
	
	
	}

</script>

</head>
<body>


<input type="button" name="order" value="정렬" onclick="order('lesson_readno')">
<input type="button" name="order" value="정렬" onclick="order('lesson_like')">
<input type="button" name="order" value="정렬" onclick="order('lesson_register_date')">

<c:forEach var="item" items="${list}">

<div id="thumb">
<img alt="레슨 썸네일" src="${item.lesson_thumb }">
<c:out value="${item.lesson_no}"/>
<a href="${pageContext.request.contextPath}/todaylesson/lesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a>


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

<c:when test="${item.lesson_category == 4}">
<c:out value="it"/>
</c:when>

<c:when test="${item.lesson_category == 5}">
<c:out value="요리"/>
</c:when>

<c:otherwise>
<c:out value="기타"/>
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

<form method="get" action="total_lesson_list?currPage=${page.startBlock }">
<select name="search">
<option value="all">전체</option>
<option value="lesson_title">제목</option>
<option value="lesson_content">내용</option>
</select>
<input type="text" name="searchtxt" >
<input type="submit" value="검색">

</form>




<c:if test="${page.prev }">
<a href="total_lesson_list?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }&lesson=${order}"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="total_lesson_list?currPage=${index }&search=${search}&searchtxt=${searchtxt}&lesson=${order}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="total_lesson_list?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}&lesson=${order}"><c:out value="다음"/></a>
</c:if>


</body>
</html>