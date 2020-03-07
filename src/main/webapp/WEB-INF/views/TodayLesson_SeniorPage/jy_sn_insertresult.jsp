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
	alert("추가 성공!");
	</script>
	
	<h3>추가 완료</h3>
	<h5>내부 검토 후 등록 여부를 알려드리겠습니다!</h5>
	<a href="${pageContext.request.contextPath }/lesson_list">목록으로</a>
	
	<script>
} else {
	

	alert("추가 실패!");
	location.href="${pageContext.request.contextPath }/lesson_list";
	
}
</script>




</script>
</head>
<body>
</body>
</html>