<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="resources/JS/summernote-lite.js"></script>
<script src="resources/JS/summernote-ko-KR.js"></script>

<!-- CSSstyle --> 
   <style type="text/css">
      .hs_ad_main_asidenav_nav_ProductReview_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

</head>

<table>
<thead>
<tr>
<th>리뷰번호</th><th>상품번호<th><th>상품명</th><th>리뷰제목</th><th>작성자</th><th>작성날짜</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}"> 
<tr>
<td>${item.pdreview_no }</td>
<td>${item.product_no}</td>
<td><a href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_reviewdetail/${item.pdreview_no}">${item.product_name}</a></td>
<td><a href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_reviewdetail/${item.pdreview_no}">${item.pdreview_title}</a></td>
<td>${item.member_id}</td>
<td>${item.pdreview_date}</td>
</tr>
</c:forEach>
</tbody>


</table>



</body>
</html>