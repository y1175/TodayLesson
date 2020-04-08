<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSSstyle --> 
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Product_Title>a{
         color: rgb(224, 62, 82);
      }
      #ej_container{
      width:80%;
      margin:0 auto;
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
   </style>
   
<!-- CSSstyle -->

</head>

<body>
<div id="ej_container">
<h2 style="text-align: center;">상품관리</h2><br>

   <table class="table">
      <thead>
         <tr style="background-color:#fff2f2;">
            <th>상품번호</th><th>상품명</th><th>카테고리</th><th>할인적용 후</th><th>할인적용 전 가격</th><th>재고</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="item" items="${list}">
          
            <tr>
               <td>
                  <c:out value="${item.product_no}"/>
               </td>
               <td>
                  <a href="ej_ad_productdetail/${item.product_no}" class="ej_link">${item.product_name}</a>
               </td>
               <td>
                <c:set var="category" value="${item.product_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">외국어</c:when>
                        <c:when test = "${category==2}">IT </c:when>
                        <c:when test = "${category==3}">요리</c:when>
                        <c:when test = "${category==4}">DIY</c:when>
                        <c:when test = "${category==5}">운동</c:when>
                        <c:when test = "${category==6}">기타</c:when>
                     </c:choose>
               </td>
               <td>
                 <fmt:formatNumber value="${item.product_after_cost }" type="number" maxFractionDigits="3"/>원
               </td>
               <td>
                  <fmt:formatNumber value="${item.product_cost}" type="number" maxFractionDigits="3"/>원
               </td>
               <td>
                  <c:out value="${item.product_stock}개"/>
               </td>
            </tr> 
         </c:forEach>
      </tbody>
   </table>
   <a href="${pageContext.request.contextPath}/todaylessonadmin/ej_ad_productregister"><button class="ej_btn">상품등록</button></a>
</div>

</body>
</html>