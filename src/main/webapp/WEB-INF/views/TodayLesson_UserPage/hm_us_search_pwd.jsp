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
<script>
var result=${result}

if (result>0)
	{
	alert('메일로 임시 비밀번호가 전송완료되었습니다.');
	location.href="/TodayLesson_UserPage/hs_us_main_sec_login";
	}
else
	{
	alert('메일 전송 실패');
	location.href="/TodayLesson_UserPage/hm_find_pwd";
	}
</script>
</body>
</html>