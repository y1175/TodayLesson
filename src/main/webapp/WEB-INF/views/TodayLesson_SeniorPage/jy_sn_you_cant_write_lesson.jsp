<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script>
alert("거절된 레슨 수가 5개가 넘는 경우, 레슨을 신청하실 수 없습니다.");
location.href="${pageContext.request.contextPath}/todaylessonsenior/lesson_list";

</script>
</body>
</html>