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
	alert("거절 완료!");
	</script>
	
	<h3>거절완료</h3>
	<h5>이제 멜 보내면 됨 혬한테 배워야혀 근데 여기 input text 박스 만들어서 이유 쓸 수 있으면 좋겠다.</h5>
	<a href="${pageContext.request.contextPath }/wait_lesson">목록으로</a>
	
	<script>
} else {
	

	alert("거절 실패!");
	location.href="${pageContext.request.contextPath }/wait_lesson";
	
}
</script>




</body>
</html>