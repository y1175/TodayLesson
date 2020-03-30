<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="item" value="${dto }"></c:set>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<sec:authentication property="principal" var="pinfo"/>		
<sec:authorize access="isAnonymous()">
로그인 하세요.
</sec:authorize>		
<sec:authorize access="isAuthenticated()">
카테고리 : <c:choose>
<c:when test="${item.freeboard_category eq 1 }">자유글</c:when>
<c:when test="${item.freeboard_category eq 2 }">질문과답변</c:when>
</c:choose><br>
글번호 : <div class="freeboard_no">${item.freeboard_no }</div> <br>
작성자 : ${item.member_nick } <br>
조회수 : ${item.freeboard_readno } <br>
제목 : ${item.freeboard_title } <br>
내용 : ${item.freeboard_content } <br>


<div class="rep_form">
<form method='post' action='/todaylesson/insert_boardreply/' id='repdetail'>
<input type='hidden' name='freeboard_no' value="${item.freeboard_no }"><br>
<input type='hidden' id='member_id' name='member_id' value='${pageContext.request.userPrincipal.name}'><br>
<label for='boardreply_content'>내용</label>
<input type='text' name='boardreply_content' id='boardreply_content' class='form-control'>
<!-- <input type='button' class='reply_submit' value='입력'> -->
<input type='submit' value='입력'>
</form>

</div>

<table>
<thead>
<tr><th>작성자</th><th>내용</th><th>작성일</th><th>삭제</th>
</tr>
</thead>
<tbody class="add_reply">
<c:forEach var='rep_list' items='${rep_list}'>
<tr>
<td>${rep_list.member_nick}</td>
<td>${rep_list.boardreply_content}</td>
<td>${rep_list.boardreply_writedate }</td>
<td>
<c:if test="${rep_list.member_id eq pageContext.request.userPrincipal.name }">
<input type="button" class="reply_delete" value="삭제" 
onclick="if(!confirm('삭제 하시겠습니까?')){return false;}location.href='/todaylesson/boardreply_delete/${rep_list.boardreply_no}'">
</c:if>
</td></tr>
</c:forEach>

</tbody>
</table><br>
<c:if test="${item.member_id eq pageContext.request.userPrincipal.name }">
<input type="button" class="freeboard_modify" value="글수정" 
onclick="location.href='/todaylesson/freeboard_modify/${item.freeboard_no}'">
<input type="button" class="freeboard_delete" value="글삭제"
onclick="if(!confirm('삭제 하시겠습니까?')){return false;}location.href='/todaylesson/freeboard_delete/${item.freeboard_no}'">
</c:if>
<a href="/todaylesson/freeboard">목록으로</a>
</sec:authorize>
</body>
</html>
