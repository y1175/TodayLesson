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
	alert('팝업삭제완료');
	location.href="/todaylessonadmin/popup_admin";
	}
else
	{
	alert('팝업삭제실패');
	location.href="/todaylessonadmin/popup_admin";
	}
</script>
</body>
</html>