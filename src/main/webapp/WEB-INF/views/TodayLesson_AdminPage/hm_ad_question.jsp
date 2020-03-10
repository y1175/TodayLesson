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
<h2>1:1문의 관리 페이지</h2>

 <form method ="get" action="hm_ad_question?currPage=${page.startBlock }">
 <select name="search">
 <option value="all">전체</option>
 <option value="question_title">제목</option>
 <option value="member_id">아이디</option>
 </select>
 <input type="text" name="searchtxt">
 <input type="submit" value="검색">
 </form>

<table>
<thead>
<tr><th>문의번호</th><th>문의유형</th><th>아이디</th><th>문의제목</th><th>답변상태</th><th>문의일</th></tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr>
<td><span>${item.question_no}</span></td>
<td><span>${item.question_group}</span></td>
<td><span>${item.member_id}</span></td>
<td><span>${item.question_title}</span></td>
<td><span>${item.question_situation}</span></td>
<td><span>${item.question_writedate}</span></td>
<td><input type="button" name="questionbtn" id="questionbtn" class="questionbtn" value="상세보기"></td>
</tr>
</c:forEach>
</tbody>
</table>




<c:if test="${page.prev }">
<a href="hm_ad_question?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="hm_ad_question?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="hm_ad_question?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>



</body>
</html>