<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="/js/summernote/summernote-lite.js"></script>
<script src="/js/summernote/lang/summernote-ko-KR.js"></script>

<link rel="stylesheet" href="/css/summernote/summernote-lite.css">
<style>
#thumb{
display:inline-block;
width:30%}
</style>
</head>


 








<c:forEach var="item" items="${list}"> 
<div id="thumb">
<a href="store_detail/${item.product_no}"><img src="${pageContext.request.contextPath }/${item.product_thumb}" alt="\${pageContext.request.contextPath }\${item.product_thumb}"></a><br>
${item.product_sale }%<br>
${item.product_category}<br>
<a href="store_detail/${item.product_no}">${item.product_name}</a><br>
<hr>
${item.product_cost}원<br>
</div>


</c:forEach>



<%-- <c:forEach var="item" items="${list}"> 
${item.product_name}
<img src="${pageContext.request.contextPath }/$item.product_thumb}" alt="\${pageContext.request.contextPath }\${item.product_thumb}"><br>
</c:forEach> --%>


</body>
</html>