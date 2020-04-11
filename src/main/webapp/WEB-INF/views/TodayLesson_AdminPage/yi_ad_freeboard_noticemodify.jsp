<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_admin_freeboard_insert.css?ver=1">
</head>
<body>
<div id="yi_container">
<form action="${pageContext.request.contextPath}/todaylessonadmin/admin_noticemodifyresult/" method="post">

<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" name="notice_category" value="0">
<input type="hidden" name="notice_no" value="${dto.notice_no }">

<div class="form-group">
<label>공지제목</label>
<input type="text" class="form-control" name="notice_title" id="notice_title" value="${dto.notice_title }" required="required"></li>
</div>
<div class="form-group">
<label>공지내용</label>
<textarea rows="15" cols="100" class="form-control" name="notice_content" id="notice_content" required="required" >
${dto.notice_content }
</textarea>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" class="write_btn" value="수정">
<input type="button" class="goback" onclick="location.href='${pageContext.request.contextPath}/todaylessonadmin/admin_freeboard'" value="목록으로">

</form>
</div>
</body>
</html>