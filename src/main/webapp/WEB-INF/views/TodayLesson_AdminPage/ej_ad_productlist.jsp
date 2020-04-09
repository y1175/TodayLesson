<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>

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

/*page*/
.pagination .page-link:focus{
    box-shadow: none;
}
.pagination>.page-item>.page-link, .pagination>.page-item>span {
    border: 0;
    border-radius: 30px!important;
    transition: all .3s;
    padding: 0 11px !important;
    margin: 0 3px !important;
    min-width: 30px;
    height: 30px;
    line-height: 30px;
    color: #999;
    font-weight: 400;
    font-size: 12px;
    text-transform: uppercase;
    background: 0 0;
    text-align: center;
}

.pagination>.page-item.active>a, .pagination>.page-item.active>a:focus, .pagination>.page-item.active>a:hover, .pagination>.page-item.active>span, .pagination>.page-item.active>span:focus, .pagination>.page-item.active>span:hover {
    background-color: #9c27b0;
    border-color: #9c27b0;
    color: #fff;
    box-shadow: 0 4px 5px 0 rgba(156,39,176,.14), 0 1px 10px 0 rgba(156,39,176,.12), 0 2px 4px -1px rgba(156,39,176,.2);
}


.pagination.pagination-info>.page-item.active>a, .pagination.pagination-info>.page-item.active>a:focus, .pagination.pagination-info>.page-item.active>a:hover, .pagination.pagination-info>.page-item.active>span, .pagination.pagination-info>.page-item.active>span:focus, .pagination.pagination-info>.page-item.active>span:hover {
    background-color: #00bcd4;
    border-color: #00bcd4;
    box-shadow: 0 4px 5px 0 rgba(0,188,212,.14), 0 1px 10px 0 rgba(0,188,212,.12), 0 2px 4px -1px rgba(0,188,212,.2);
}


.pagination.pagination-success>.page-item.active>a, .pagination.pagination-success>.page-item.active>a:focus, .pagination.pagination-success>.page-item.active>a:hover, .pagination.pagination-success>.page-item.active>span, .pagination.pagination-success>.page-item.active>span:focus, .pagination.pagination-success>.page-item.active>span:hover {
    background-color: #4caf50;
    border-color: #4caf50;
    box-shadow: 0 4px 5px 0 rgba(76,175,80,.14), 0 1px 10px 0 rgba(76,175,80,.12), 0 2px 4px -1px rgba(76,175,80,.2);
}

.pagination.pagination-warning>.page-item.active>a, .pagination.pagination-warning>.page-item.active>a:focus, .pagination.pagination-warning>.page-item.active>a:hover, .pagination.pagination-warning>.page-item.active>span, .pagination.pagination-warning>.page-item.active>span:focus, .pagination.pagination-warning>.page-item.active>span:hover {
    background-color: #ff9800;
    border-color: #ff9800;
    box-shadow: 0 4px 5px 0 rgba(255,152,0,.14), 0 1px 10px 0 rgba(255,152,0,.12), 0 2px 4px -1px rgba(255,152,0,.2);
}

.pagination.pagination-danger>.page-item.active>a, .pagination.pagination-danger>.page-item.active>a:focus, .pagination.pagination-danger>.page-item.active>a:hover, .pagination.pagination-danger>.page-item.active>span, .pagination.pagination-danger>.page-item.active>span:focus, .pagination.pagination-danger>.page-item.active>span:hover {
    background-color: #f44336;
    border-color: #f44336;
    box-shadow: 0 4px 5px 0 rgba(244,67,54,.14), 0 1px 10px 0 rgba(244,67,54,.12), 0 2px 4px -1px rgba(244,67,54,.2);
}



   </style>
   
<!-- CSSstyle -->

</head>

<body>
<div id="ej_container">
<h2 style="text-align: center;"><b>상품관리</b></h2><br>
 <a href="${pageContext.request.contextPath}/todaylessonadmin/ej_ad_productregister"><button class="ej_btn" style="float:right; margin-bottom:30px;">상품등록</button></a>
 
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
   
   <div class="paging">
<div class="paginginside" style="text-align: center;">

<ul class="pagination pagination-danger" >
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="/todaylessonadmin/ej_ad_productlist?currPage=${page.startBlock-1}">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="/todaylessonadmin/ej_ad_productlist?currPage=${index }">${index }
</a></li>
</c:if>
<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>
</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="/todaylessonadmin/ej_ad_productlist?currPage=${page.endBlock+1 }">NEXT
</a></li>
</c:if>
</ul>

</div>
</div>
   
   
   
  
</div>

</body>
</html>