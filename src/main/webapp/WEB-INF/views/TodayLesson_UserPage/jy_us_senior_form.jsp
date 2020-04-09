<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_senior_form.css">

</head>
<body>

<script>
	
	function senior_switch(){
		
		var logoutform = document.seniorlogoutform;
		
		if (${mem_level}==1) {
			alert("시니어 전환 시 한번 더 로그인 하셔야합니다!");
			logoutform.submit();
			self.close();
			opener.document.location.reload();
		}
		
		else {
			opener.location.href="${pageContext.request.contextPath}/todaylessonsenior/you_are_senior";
			self.close();
		}
				
		
	}	

</script>

<div class="jy_container">
<h2>시니어 지원</h2>
<hr>
<div class = "jy_text_box">
<h3>시니어 회원으로 전환하시겠습니까?</h3>
<input type="button" value="예" onclick="senior_switch();" class="ej_btn">
<input type="button" value="아니요" onclick="self.close();" class="ej_btn2">
</div>

<div style="display: none">
   <form action="${pageContext.request.contextPath}/logout" name="seniorlogoutform" method='post' id="logout-form">
      <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
      <input type="submit" onclick="senior_switch()">
   </form>
</div>
</div>

</body>
</html>