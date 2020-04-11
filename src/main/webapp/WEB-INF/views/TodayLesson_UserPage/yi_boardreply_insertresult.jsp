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
var result=${insertResult}

if (result>0)
	{
	alert('댓글 작성완료');
	location.href="${pageContext.request.contextPath}/todaylesson/freeboard_detail/"+${freeboard_no};
	}
else
	{
	alert('댓글 입력실패');
	location.href="${pageContext.request.contextPath}/todaylesson/freeboard_detail/"+${freeboard_no};
	}
</script>
</body>
</html>
