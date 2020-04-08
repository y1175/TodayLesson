<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<!--오더 리스트 정보  -->
주문날짜  ${orderlistdto.orderlist_date }<br>
 주문번호  ${orderlistdto.orderlist_no }<br>
수령인  ${orderlistdto.orderlist_receiver }<br>
수령 주소  ${orderlistdto.orderlist_addr }<br>
결제금액 <fmt:formatNumber value="${orderlistdto.orderlist_cost }" type="number" maxFractionDigits="3"/> 원<br>
사용포인트 <fmt:formatNumber value="${orderlistdto.orderlist_usepoint  }" type="number" maxFractionDigits="3"/> <br>
<c:set var="cost" value="${orderlistdto.orderlist_cost }"> </c:set>
<c:set var="addedpoint" value="${(cost*0.1)}"></c:set>
<fmt:formatNumber value="${addedpoint }" type="number" maxFractionDigits="3"/> 포인트가 적립되었습니다!<br>
배송요청사항  ${orderlistdto.orderlist_msg  }
<hr>
<!--오더 디테일 정보  -->
<c:forEach var="item" items="${list}"> 
<c:set var="product_name" value="${item.product_name }"/>
<c:set var="lesson_title" value="${item.lesson_title }"/>
<c:if test="${lesson_title==null }">
상품명: ${item.product_name }  </c:if>
<c:if test="${product_name==null }">
레슨명:${item.lesson_title} </c:if>
수량: ${item.order_count }
<br>
</c:forEach>


</body>
</html> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="utf-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<!--style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_orderlistdetail.css?ver=2"> 
<!--style-->
</head>
<body>
<div id="ej_container">
<h4>오늘의 레슨을 이용해주셔서 감사합니다</h4>
<h2 >주문이 정상적으로 완료되었습니다.</h2>
 <h3 style="color:rgb(224, 62, 82)">주문번호  ${orderlistdto.orderlist_no }</h3><br>
 
 <!--오더 디테일 정보  -->
<c:forEach var="item" items="${list}"> 
<c:set var="product_name" value="${item.product_name }"/>
<c:set var="lesson_title" value="${item.lesson_title }"/>
<c:if test="${lesson_title==null }"><!--상품정보  -->
<a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${item.product_no}"><img src="${item.product_thumb }" alt="thumb"></a>
<b>상품명</b>  ${item.product_name }
<b>가격 </b> ${item.product_after_cost }
<b>수량</b>  ${item.order_count }<br>
</c:if>
<c:if test="${product_name==null }"><!--상품정보  -->
<a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${item.lesson_no}"><img src="${item.lesson_thumb }" alt="thumb"></a>
<b>레슨명</b>  ${item.lesson_title }
<b>가격 </b> ${item.lesson_cost }
<b>수량</b>  1
</c:if>
</c:forEach>
<br>
<div id="ej_line"></div>
<!--오더 리스트 정보  -->
<br>
<div class="ej_align left">
<b>주문날짜</b><br>
<b>수령인</b> <br>
<b>수령 주소</b><br>
<b>결제금액</b><br>
<b>사용포인트</b><br>
<b style="color:rgb(224, 62, 82)">축하드립니다</b><br> 
<b>배송요청사항</b><br>  
</div>

<div class="ej_align right">
${orderlistdto.orderlist_date }<br>
${orderlistdto.orderlist_receiver }<br>
${orderlistdto.orderlist_addr }<br>
${orderlistdto.orderlist_cost }원<br>
${orderlistdto.orderlist_usepoint  }<br>

<c:set var="cost" value="${orderlistdto.orderlist_cost }"> </c:set>
<fmt:parseNumber var="addpoint" value="${(cost*0.1)}" integerOnly="true" /> <b style="color:rgb(224, 62, 82)">${addpoint }포인트가 적립되었습니다!<br>

 ${orderlistdto.orderlist_msg  }<br>
</div>
<!--ej_align right/  -->
</div>
<!--ej container/  -->

</body>
</html>