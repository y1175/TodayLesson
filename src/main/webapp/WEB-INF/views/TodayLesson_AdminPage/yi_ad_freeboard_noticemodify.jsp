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

<form action="/admin_noticemodifyresult/" method="post">

<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" name="notice_category" value="0">
<input type="hidden" name="notice_no" value="${dto.notice_no }">
<ul>

<li><label>공지제목</label><br>
<input type="text" name="notice_title" id="notice_title" value="${dto.notice_title }" required="required"></li>

<li><label>공지내용</label><br>
<textarea rows="15" cols="100" name="notice_content" id="notice_content" required="required" >
${dto.notice_content }
</textarea>
</li>
<li>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" value="수정">
<input type="button" onclick="location.href='/todaylessonadmin/admin_freeboard'" value="목록으로">
</li>
</ul>
</form>

</body>
</html>