<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

if (${result} > 0) {
	alert("옵션 등록을 성공하였습니다");
	location.href="${pageContext.request.contextPath }/ej_ad_productlist";
} else {
	

	alert("옵션 등록에 실패하였습니다");
	location.href="${pageContext.request.contextPath }/ej_ad_productlist";
	
}
</script>
</head>
<body>
</body>
</html>