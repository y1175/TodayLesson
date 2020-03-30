<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="resources/JS/summernote-lite.js"></script>
<script src="resources/JS/summernote-ko-KR.js"></script>

</head>

<table>
<thead>
<tr>
<th>리뷰번호</th><th>상품번호</th><th>작성자</th><th>작성날짜</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}"> 
<tr>
<td>${item.product_no}</td>
<td><a href="ej_ad_productdetail/${item.product_no}">${item.product_name}</a></td>
<td>${item.product_cost}원</td>
<td>${item.product_stock}개</td>
</tr>
</c:forEach>
</tbody>


</table>
<a href="${pageContext.request.contextPath }/ej_ad_productregister">상품등록</a>


</body>
</html>