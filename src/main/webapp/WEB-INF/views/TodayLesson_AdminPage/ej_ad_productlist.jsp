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
</head>

<table>
<thead>
<tr>
<th>상품번호</th><th>상품명</th><th>가격</th><th>재고</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}"> 
<tr>
<td>${item.product_no}</td>
<td><a href="ej_ad_productdetail/${item.product_no}">${item.product_name}</a></td>
<td>${item.product_cost}원</td>
<td>${item.product_stock}개</td>
<%-- <td><img src="${pageContext.request.contextPath }/${item.product_thumb}" alt="\${pageContext.request.contextPath }\${item.product_thumb}"><br></td> --%>
</tr>
</c:forEach>
</tbody>


</table>
<a href="${pageContext.request.contextPath }/ej_ad_productregister">상품등록</a>


</body>
</html>