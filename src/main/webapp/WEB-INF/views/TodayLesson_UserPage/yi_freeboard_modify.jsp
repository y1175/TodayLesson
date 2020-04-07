<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today Lesson</title>
<c:set var="item" value="${dto }"></c:set>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_freeboard_insert.css?ver=1">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){
	let category = ${item.freeboard_category}
	if(category=='1')
		{
		$('#freeboard_category').val("1").attr("selected",true);
		}
	else if(category=='2')
		{
		$('#freeboard_category').val("2").attr("selected",true);
		}
})
</script>
</head>
<body>
<div id="yi_container">
<sec:authentication property="principal" var="pinfo"/>		
<sec:authorize access="isAnonymous()">
로그인 하세요.
</sec:authorize>		
<sec:authorize access="isAuthenticated()">

<form action="/todaylesson/freeboard_modifyresult" method="post">

<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" name="freeboard_no" value="${item.freeboard_no}">

<div class="form-group">
<label>카테고리</label>
<select name="freeboard_category" class="yi_freeboard_category custom-select mr-sm-2" id="inlineFormCustomSelect">
<option value="1" >자유글</option>
<option value="2" >질문과답변</option>
</select>
</div>

<div class="form-group">
<label>글제목</label>
<input type="text" class="form-control" name="freeboard_title" id="freeboard_title" required="required" 
value="${item.freeboard_title }">
</div>

<div class="form-group">
<label>글내용</label>
<textarea rows="15" cols="100" class="form-control" name="freeboard_content" id="freeboard_content" required="required"
>
${item.freeboard_content }</textarea>
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="form-group">
<input type="submit" class="write_btn" value="작성">
<input type="button" class="goback"  onclick="location.href='/todaylesson/freeboard'" value="목록으로">
</div>
</form>

</sec:authorize>
</div>
</body>
</html>
