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
	alert('삭제완료');
	location.href="/freeboard";
	}
else
	{
	alert('삭제실패');
	location.href="/freeboard";
	}
</script>
</body>
</html>
