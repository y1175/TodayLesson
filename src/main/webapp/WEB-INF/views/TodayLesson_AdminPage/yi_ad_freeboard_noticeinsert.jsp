<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>
   <style type="text/css">
      .hs_ad_main_asidenav_nav_FreeBoard_Title>a{
         color: rgb(224, 62, 82);
      }

   </style>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_admin_freeboard_insert.css?ver=1">
</head>
<body>
<div id="yi_container">
<form action="freeboard_noticewriteResult" method="post">

<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" name="notice_category" value="0">
<div class="form-group">
<label>공지제목</label>
<input type="text" class="form-control" name="notice_title" id="notice_title" required="required"></li>
</div>
<div class="form-group">
<label>공지내용</label>
<textarea rows="15" cols="100" class="form-control" name="notice_content" id="notice_content" required="required">
</textarea>
</div>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
<input type="submit" class="write_btn" value="작성">
<input type="button" class="goback" onclick="location.href='${pageContext.request.contextPath}/todaylessonadmin/admin_freeboard'" value="목록으로">
</form>

</div>
</body>
</html>
