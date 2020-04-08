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
var result = ${result}
var question_no = ${question_no}
if(result>0)
{
alert('답변삭제가 완료되었습니다');
location.href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question_detail/"+question_no;
}
else{
	alert('답변 삭제 실패');
	location.href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question_detail/"+question_no;
}
</script>
</body>
</html>