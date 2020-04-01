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

if (${result} > 0) {
	alert("승인 중으로 넘기기!");
	location.href="${pageContext.request.contextPath }/todaylessonadmin/apply_lesson";


} else {
	

	alert("실패!");
	location.href="${pageContext.request.contextPath }/todaylessonadmin/apply_lesson";
	
}
</script>


</body>
</html>