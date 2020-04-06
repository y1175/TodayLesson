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
   </style>
<!-- CSSstyle -->

</head>

<body>

   <table>
      <thead>
         <tr>
            <th>상품번호</th><th>상품명</th><th>할인적용 전</th><th>할인적용 후 가격</th><th>재고</th>
         </tr>
      </thead>
      <tbody>
         <c:forEach var="item" items="${list}"> 
            <tr>
               <td>
                  <c:out value="${item.product_no}"/>
               </td>
               <td>
                  <a href="ej_ad_productdetail/${item.product_no}">${item.product_name}</a>
               </td>
               <td>
                  <fmt:formatNumber value="${item.product_cost}" type="number" maxFractionDigits="3"/>원
               </td>
               <td>
                  <fmt:formatNumber value="${item.product_after_cost }" type="number" maxFractionDigits="3"/>원
               </td>
               <td>
                  <c:out value="${item.product_stock}개"/>
               </td>
            </tr> 
         </c:forEach>
      </tbody>
   </table>
   <a href="${pageContext.request.contextPath}/todaylessonadmin/ej_ad_productregister">상품등록</a>


</body>
</html>