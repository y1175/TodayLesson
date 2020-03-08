<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
</head>
<body>
<table class="table">
<thead>
<tr><th>카테고리</th><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
</tr>
</thead>
<tbody>
<c:forEach var="notice" items="${notice }">
<tr>
<td>${notice.notice_category }</td>
<td>${notice.notice_no }</td>
<td><a href="notice_detail/${notice.notice_no }">${notice.notice_title }</a></td>
<td>${notice.member_nick }</td>
<td>${notice.notice_writedate }</td>
<td>${notice.notice_readno }</td>
</tr>
</c:forEach>
</tbody>
<tbody>
<c:forEach var="item" items="${list }">


<tr>
<td>${item.freeboard_category }</td>
<td>${item.freeboard_no}</td>
<td><a href="detail/${item.freeboard_no }">${item.freeboard_title }</a></td>
<td><c:out value=" ${item.member_nick }"></c:out></td>
<td><c:out value=" ${item.freeboard_writedate }"></c:out></td>
<td><c:out value=" ${item.freeboard_readno }"></c:out></td>
</tr>
</c:forEach>
</tbody>
</table>
<form method="get" action="freeboard?currPage=${page.startBlock }">
<select name="search">
<option value="all">전체</option>
<option value="member_nick">닉네임</option>
<option value="freeboard_title">제목</option>
<option value="freeboard_content">내용</option>
</select>
<input type="text" name="searchtxt" >
<input type="submit" value="검색">

</form>
<c:if test="${page.prev }">
<a href="freeboard?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="freeboard?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="freeboard?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>
</body>
</html>






<%--   <sec:authorize access="isAuthenticated()">
                 <!--  <form action="/logout" method='post'> -->
                     <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>  <!-- 이걸  main 페이지에 넣어서 구분을   -->
                     <a href="freeboard_write">글쓰기</a><span style="margin-left: 10px;">
                 <!--  </form> -->
               </sec:authorize> --%>

