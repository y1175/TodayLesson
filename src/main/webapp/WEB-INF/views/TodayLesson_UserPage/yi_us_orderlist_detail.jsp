<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLesson</title>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_us_mypage_myorderlist>a{
         color: white;
      }
      .hs_us_mypage_mymanage>a{
	     color : #757575;
       }
   </style>
<!-- CSSstyle -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_us_orderlist_detail.css?ver=3">
<script>


function cancel(orderlist_orderstatus,orderlist_no)
{
	var my_member_point=${my_member_point-Math.round(dto.orderlist_cost/10) }
	var member_id="${dto.member_id}";
	var result=confirm("주문을 취소하시겠습니까?");
if(result)
	{
	if(orderlist_orderstatus<3)
		{
			location.href='${pageContext.request.contextPath}/todaylessonmypage/user_myorderlist_cancel/'+orderlist_no+'/'+my_member_point+'/'+member_id;
		}
	else if(orderlist_orderstatus==4)
		{
			alert("이미 취소된 주문입니다.");
		}
	else
		{
			alert("배송단계의 주문은 취소할 수 없습니다.");
		}
	}

}
</script>
</head>
<body>
<div id="yi_container">
<h3>주문내역 상세 </h3>
주문일자: <span class="detail_info">${dto.orderlist_date }</span>		
주문번호:<span class="detail_info">${dto.orderlist_no }	</span>	
주문상태:<span class="detail_info"><c:choose>
<c:when test="${dto.orderlist_orderstatus==1 }">
주문완료
</c:when>
<c:when test="${dto.orderlist_orderstatus==2 }">
배송중
</c:when>
<c:when test="${dto.orderlist_orderstatus==3 }">
배송완료
</c:when>
<c:when test="${dto.orderlist_orderstatus==4 }">
주문취소
</c:when>
</c:choose></span>

<div class="container order">
<div class="row">
<div class="col-md-9">
<table class="table">
<c:forEach var="list" items="${list}">




<tr>
<td>
<img src='${list.product_thumb }' alt='thumb'>
</td>
<td>
[스토어>카테고리명:
<c:choose>
<c:when test='${list.product_category==1 }'>
운동
</c:when>
<c:when test='${list.product_category==2 }'>
교육
</c:when>
<c:when test='${list.product_category==3 }'>
핸드메이드
</c:when>
<c:when test='${list.product_category==4 }'>
IT
</c:when>
<c:when test='${list.product_category==5 }'>
요리
</c:when>
<c:when test='${list.product_category==6 }'>
기타
</c:when>
</c:choose>

]<br>
상품명:${list.product_name }
</td>
</tr>

<%-- <div class="col order_thumb"><img src='${list.product_thumb }' alt='thumb'></div>
<div class="col myproduct" >[스토어>카테고리명:${list.product_category }]<br>
상품명:${list.product_name }</div>
<div class="col ordercost" >판매가격:${list.product_cost }원</div> --%>

</c:forEach>


</table>
</div>
<div class="col-md-3 ordercost">
${dto.orderlist_cost }원
</div>
</div>
</div>

<div class="detailline"></div>

<h4>배송 정보 </h4>
<div class="detailline"></div>
<div class="delivery_name">이름:${dto.orderlist_receiver }</div>
<div class="delivery_name">주소:${dto.orderlist_addr }</div>
<div class="delivery_name">연락처:${dto.orderlist_phone }</div>
<div class="delivery_name">배송 요청사항:${dto.orderlist_msg }</div>
<div class="detailline"></div>
<h4> 결제 금액 </h4>
<div class="detailline"></div>
<div class="pay_info">배송료: 무료</div>
<div class="pay_info">사용 포인트: ${dto.orderlist_usepoint }</div>
<div class="pay_info">총 결제 금액: ${dto.orderlist_cost }원</div>
<div class="detailline"></div>
<input type="button" class="ordercancel-btn" name="order_cancel" value="주문취소"
 onclick="cancel(${dto.orderlist_orderstatus},${dto.orderlist_no })">
<input type="button" class="goback-btn" name="go_previous" value="돌아가기" onclick="location.href='${pageContext.request.contextPath}/todaylessonmypage/user_myorderlist'">
</div>
</body>
</html>
