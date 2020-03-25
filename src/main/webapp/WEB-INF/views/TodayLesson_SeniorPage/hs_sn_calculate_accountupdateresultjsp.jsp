<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
   <script>

   if (${accountupdatedto} > 0) {
	alert("수정완료);
	   location href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_requestlist/${pageContext.request.userPrincipal.name}";
	
   } else {
	

	alert("수정 실패!");
	   location.href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_requestlist/${pageContext.request.userPrincipal.name}";
	
   } 
   
   </script>
</body>
</html>