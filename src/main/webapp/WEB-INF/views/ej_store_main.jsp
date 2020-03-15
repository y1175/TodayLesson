<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- <script src="resources/JS/summernote-lite.js"></script> -->
<!-- <script src="/JS/summernote-lite.js"></script> -->
<!-- <script src="resources/JS/summernote-ko-KR.js"></script> -->
<!-- <script src="/JS/summernote-ko-KR.js"></script> -->
<!-- <link rel="stylesheet" href="resources/CSS/summernote-lite.css"> -->
<!--  <link rel="stylesheet" href="/CSS/summernote-lite.css"> -->
<style>
#thumb{
display:inline-block;
width:30%}
</style>
</head>

<body>
 

${pageContext.request.contextPath}

<c:out value="${pageContext.request.contextPath}"/>




<c:forEach var="item" items="${list}"> 
<div id="thumb">
<a href="ej_store_detail/${item.product_no}"><img src="${item.product_thumb}" alt="thumb"></a><br>
${item.product_sale }%<br>

<c:set var="category" value="${item.product_category }"/>
 <c:choose>
         <c:when test = "${category==1}">
            외국어
         </c:when>
            <c:when test = "${category==2}">
            IT
         </c:when>
            <c:when test = "${category==3}">
            요리
         </c:when>
            <c:when test = "${category==4}">
            DIY
         </c:when>
            <c:when test = "${category==5}">
            운동
         </c:when>
            <c:when test = "${category==6}">
            기타
         </c:when>
          <c:otherwise>
        기타
         </c:otherwise> 
      </c:choose><br>
<a href="ej_store_detail/${item.product_no}">${item.product_name}</a><br>
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