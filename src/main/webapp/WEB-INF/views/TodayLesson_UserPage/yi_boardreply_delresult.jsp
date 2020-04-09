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
var result=${deleteResult}

if (result>0)
	{
	alert('삭제완료');
	window.location=document.referrer;
	}
else
	{
	alert('삭제실패');
	window.location=document.referrer;
	}
</script>
</body>
</html>

