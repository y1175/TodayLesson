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
if (${result} > 0) {
	alert("수정 성공! 내부 검토 후 등록 여부를 알려드리겠습니다.");

	location.href="${pageContext.request.contextPath }/todaylessonsenior/lesson_list";

} else {
	

	alert("수정 실패!");
	location.href="${pageContext.request.contextPath }/todaylessonsenior/lesson_list";
	
}
</script>

</body>
</html>