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

<form action="freeboard_insertresult" method="post">

<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">
<ul>
<li><label>카테고리</label><br>
<select name="freeboard_category">
<option value="1">자유글</option>
<option value="2">질문과답변</option>
</select></li>

<li><label>글제목</label><br>
<input type="text" name="freeboard_title" id="freeboard_title" required="required"></li>

<li><label>글내용</label><br>
<textarea rows="15" cols="100" name="freeboard_content" id="freeboard_content" required="required">
</textarea>
</li>
<li>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="작성">
<input type="button" onclick="location.href='/todaylesson/freeboard'" value="목록으로">
</li>
</ul>
</form>

</body>
</html>
