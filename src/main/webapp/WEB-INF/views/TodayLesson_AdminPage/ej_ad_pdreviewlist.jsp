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
      #ej_container{
      width:80%;
      margin:0 auto;
      margin-top:40px;
      }
     .ej_btn{
border: 1px transparent;
padding: 5px 15px; 
background-color: rgb(224, 62, 82);
height:40px;
font-weight : 600;
font-size : 14px;
color: white;

}
.ej_link{
color:black;}
.ej_link:hover{
color:black;
text-decoration: none;
}
#ej_right{
float:right;}
   </style>
<!-- CSSstyle -->

</head>
<body>

<div id="ej_container">
<h2 style="text-align:center;">후기관리</h2><br>
<table class="table">
<thead>
<tr style="background-color:#fff2f2;">
<th>리뷰번호</th><th>상품번호</th><th>상품명</th><th>리뷰제목</th><th>작성자</th><th>작성날짜</th>
</tr>
</thead>
<tbody>
<c:forEach var="item" items="${list}"> 
<tr>
<td>${item.pdreview_no }</td>
<td>${item.product_no}</td>
<td><a href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_reviewdetail/${item.pdreview_no}" class="ej_link">${item.product_name}</a></td>
<td><a href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_reviewdetail/${item.pdreview_no}" class="ej_link">${item.pdreview_title}</a></td>
<td>${item.member_id}</td>
<td>${item.pdreview_date}</td>
</tr>
</c:forEach>
</tbody>


</table>


</div>


</body>
</html>