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
<sec:authentication property="principal" var="pinfo"/>		
<sec:authorize access="isAnonymous()">
로그인 하세요.
</sec:authorize>		
<sec:authorize access="isAuthenticated()">

<form action="/freeboard_modifyresult" method="post">

<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" name="freeboard_no" value="${item.freeboard_no}">
<ul>
<li><label>카테고리</label><br>
<select name="freeboard_category" id="freeboard_category">
<option value="1">자유글</option>
<option value="2">질문과답변</option>
</select></li>

<li><label>글제목</label><br>
<input type="text" name="freeboard_title" id="freeboard_title" required="required" 
value="${item.freeboard_title }"></li>

<li><label>글내용</label><br>
<textarea rows="15" cols="100" name="freeboard_content" id="freeboard_content" required="required"
>
${item.freeboard_content }</textarea>
</li>
<li>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="작성">
<input type="button" onclick="location.href='/freeboard'" value="목록으로">
</li>
</ul>
</form>

</sec:authorize>
</body>
</html>
