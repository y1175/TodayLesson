<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

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
	alert('주문이 취소되었습니다.');
	history.go(-2);
	}
else
	{
	alert('주문을 취소할 수 없습니다.');
	location.href="/user_myorderlist";
	}
</script>
</body>
</html>