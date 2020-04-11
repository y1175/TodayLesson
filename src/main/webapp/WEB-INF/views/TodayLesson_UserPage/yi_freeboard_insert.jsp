<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Today Lesson</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_freeboard_insert.css?ver=1">
</head>
<body>
<div id="yi_container">
<form action="freeboard_insertresult" method="post">

<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">

<div class="form-group">
<label>카테고리</label>
<select name="freeboard_category" class="yi_freeboard_category custom-select mr-sm-2" id="inlineFormCustomSelect">
<option value="1" >자유글</option>
<option value="2" >질문과답변</option>
</select>
</div>
<div class="form-group">
<label>글제목</label><br>
<input type="text" class="form-control" name="freeboard_title" id="freeboard_title" required="required">
</div>
<div class="form-group">
<label>글내용</label><br>
<textarea rows="15" cols="100" class="form-control" name="freeboard_content" id="freeboard_content" required="required">
</textarea>
</div>

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<div class="form-group">
<input type="submit" class="write_btn" value="작성">
<input type="button" class="goback" onclick="location.href='${pageContext.request.contextPath}/todaylesson/freeboard'" value="목록으로">
</div>
</form>
</div>
</body>
</html>
