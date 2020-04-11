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
alert('등급이 수정되었습니다.');
window.location=document.referrer;
}
else if(result==0){
	alert('등급 수정을 실패하였습니다.');
	window.location=document.referrer;
}else{
	alert('등급 수정이 불가한 요청입니다.');
	window.location=document.referrer;
	
}
</script>
</body>
</html>