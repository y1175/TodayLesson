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
	alert("업데이트 완료");

	location.href="${pageContext.request.contextPath}/my_lesson_list/${member_id}";

} else {

	alert("업데이트 실패!");
	location.href="${pageContext.request.contextPath}/my_lesson_list/${member_id}";
	
}
</script>
</body>
</html>