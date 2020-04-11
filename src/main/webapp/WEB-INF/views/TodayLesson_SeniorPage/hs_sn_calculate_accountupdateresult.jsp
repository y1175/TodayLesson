<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <script>
   if (${accountupdatedto} > 0) {
	   alert("수정완료");
	   location.href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_requestlist"+${accountdetalidto.senior_no};
	
   } else {
	   alert("수정 실패");
	   location.href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_requestlist"+${accountdetalidto.senior_no};
   } 
   </script>
</body>
</html>