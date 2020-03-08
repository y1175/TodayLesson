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
var authresult = ${authresult}
if(result>0 && authresult>0)
{
alert('등급이 수정되었습니다.');
location.href="/admin_hm_memmanage";
}
else{
	alert('등급 수정을 실패하였습니다.');
	location.href="/admin_hm_memmanage";
}
</script>
</body>
</html>