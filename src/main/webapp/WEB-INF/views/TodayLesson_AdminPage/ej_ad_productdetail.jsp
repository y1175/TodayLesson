<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>

$(document).ready(function(){
	let con = $('#content').html();
});

</script>


</head>
<body>



글 번호 <c:out value="${dto.product_no}"></c:out><br>
글 제목 <c:out value="${dto.product_name}"></c:out><br>


<div id="content">

${dto.product_content}
<img src="${pageContext.request.contextPath }/${dto.product_thumb}" alt="\${pageContext.request.contextPath }\${dto.product_thumb}"><br>

</div>
<%-- <c:out value="이미지경로1: ${dto.product_thumb}"/>
<c:out value="이미지경로 pageContext.request.contextPath => ${pageContext.request.contextPath }"/><br> --%>

<br>
<%-- 
<img src=" ${dto.product_thumb}" alt="{dto.product_thumb}"><br>
<img src="C:\springpro\summernote\src\main\webapp\resources\imgUpload\can.jpg" alt="can"><br>
<img src="${pageContext.request.contextPath }\resources\can.jpg" alt="can더 밖에"><br>
<img src="${pageContext.request.contextPath }\can.jpg"><br>
--%>



<br> 

<!-- <img src="http://localhost:9080/myapp/imgUpload/purple.jpg" /> --><!--weapp/resource/imgUpload된다  -->



<a href="${pageContext.request.contextPath }/ej_ad_productlist">목록으로</a>


</body>
</html>