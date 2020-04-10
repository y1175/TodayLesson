<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <script>
   if (${admin_Calculate_Give} > 0) {
	   alert("정산완료");
	   location.href="${pageContext.request.contextPath}/todaylessonadmin/admin_calculate_list"
	
   } else {
	   alert("정산실패");
	   location.href="${pageContext.request.contextPath}/todaylessonadminr/admin_calculate_list"
   } 
   </script>
</body>
</html>