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
var result = ${result}
if(result>0)
{
alert('이벤트 등록이 완료되었습니다.');
location.href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage";
}
else{
	alert('이벤트 등록을 실패하였습니다.');
/* 	location.href="/hm_ad_event_insert"; 다시 그전으로 돌아가는것*/
}
</script>
</body>
</html>