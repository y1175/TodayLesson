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

alert("시니어 정보를 입력하셔야 레슨을 신청할 수 있습니다!");
location.href="${pageContext.request.contextPath }/todaylessonsenior/senior_switch_update/${pageContext.request.userPrincipal.name}";

</script>

</body>
</html>