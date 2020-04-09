<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<meta>
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
<a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/${item.lesson_no}"><img src="${item.lesson_thumb }" alt="thumb"></a>
<b>상품명</b>  ${item.lesson_title }
<b>가격 </b> ${item.lesson_cost }
</c:forEach>
<br>
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



</body>
</html>