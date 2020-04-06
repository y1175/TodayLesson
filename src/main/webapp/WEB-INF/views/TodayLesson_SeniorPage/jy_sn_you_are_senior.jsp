<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("이미 시니어입니다! 시니어로 전환은 딱! 한번만 할 수 있어요 :) ");
location.href="${pageContext.request.contextPath }/todaylessonsenior/lesson_list";
//이동하는 페이지는 시니어 메인으로 해도 좋음
</script>
</body>
</html>