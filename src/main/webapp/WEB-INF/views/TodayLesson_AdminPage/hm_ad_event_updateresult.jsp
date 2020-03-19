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
alert('이벤트 수정이 완료되었습니다..');
location.href="/hm_ad_event_manage";
}
else{
	alert('이벤트 수정을 실패하였습니다.');
location.href="/hm_ad_event_manage";
}
</script>
</body>
</html>