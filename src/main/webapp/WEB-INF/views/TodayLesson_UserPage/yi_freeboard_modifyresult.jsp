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
var freeboard_no=${freeboard_no}

if (result>0)
	{
	alert('수정완료');
	location.href="${pageContext.request.contextPath}/todaylesson/freeboard_detail/"+freeboard_no;
	}
else
	{
	alert('수정실패');
	location.href="${pageContext.request.contextPath}/todaylesson/freeboard_detail/"+freeboard_no;
	}
</script>
</body>
</html>