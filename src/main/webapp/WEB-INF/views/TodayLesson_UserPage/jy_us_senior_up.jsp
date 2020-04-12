<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<script>

$(document).ready(function() {
	senior_switch();
	
});


</script>
</head>



<body>


<script>
	
function senior_switch(){

		var logoutform = document.seniorlogoutform;
		
			//opener.location.href="${pageContext.request.contextPath}/todaylesson/senior_up";
			//location.href="${pageContext.request.contextPath}/todaylesson/senior_up";
			alert("시니어 전환 시 한번 더 로그인 하셔야합니다!");
			logoutform.submit();
			self.close();
			opener.document.location.reload();  
			//location.href="${pageContext.request.contextPath}/todaylesson/senior_request_form";
			opener.document.location.reload();  
			location.reload();
			//logoutform.submit();
			//self.close();
			//opener.document.location.reload();

			
}

</script>

<div style="display: none">
   <form action="${pageContext.request.contextPath}/logout" name="seniorlogoutform" method='post' id="logout-form">
      <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
      <input type="submit" onclick="senior_switch()">
   </form>
</div>

</body>
</html>