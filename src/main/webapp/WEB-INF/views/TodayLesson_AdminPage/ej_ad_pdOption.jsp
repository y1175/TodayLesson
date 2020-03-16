<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script>
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script>

<title>글쓰기</title>


</head>
<body>
	<h2 style="text-align: center;">옵션 등록</h2>
	<br>
	<br>
	<br>

	<div style="width: 60%; margin: auto;">
		
		<form role="form" method="post" action="${pageContext.request.contextPath }/ej_ad_pdOption_insertresult"> 
		제품번호: ${dto.product_no }<br>
		제품명: ${dto.product_name }<br>
		<c:forEach var="i" begin="1" end="4">

    

		<label>옵션번호: </label>
		<input type="text" name="pdoption_no" style="width: 40%;" value="${i}" /> <br>
				 <input type="text" name="pdoption_name" style="width: 40%;" placeholder="옵션명"  /> <br>
			</c:forEach>

 <input type="submit" value="옵션 등록"/>

			
		</form>
	</div>

</body>
</html>