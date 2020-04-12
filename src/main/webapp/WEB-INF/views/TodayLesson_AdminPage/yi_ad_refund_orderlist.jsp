<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <style type="text/css">
      .hs_ad_main_asidenav_nav_OrderCancel_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_admin_orderlist.css?ver=2">
</head>
<body>
<div id="yi_container">
<h2><b>주문취소 관리</b></h2>
<form action="${pageContext.request.contextPath}/todaylessonadmin/refund_orderlist?currPage=${page.startBlock }">
<div class="form-group">
<label>결제상태</label>
<div class="form-check">
<input class="form-check-input orderlist_orderstatus"  type="radio" id="order_all" name="orderlist_paystatus" value="0" checked="checked">
<label class="form-check-label" for="order_all">전체</label>
<input class="form-check-input orderlist_orderstatus"  type="radio" id="pay_complete" name="orderlist_paystatus" value="1">
<label class="form-check-label" for="pay_complete">결제완료</label>
<input class="form-check-input orderlist_orderstatus"  type="radio" id="refunding" name="orderlist_paystatus" value="2">
<label class="form-check-label" for="refunding">환불진행</label>
<input class="form-check-input orderlist_orderstatus"  type="radio" id="refund_complete" name="orderlist_paystatus" value="3">
<label class="form-check-label" for="refund_complete">환불완료</label>
</div>
</div>

<div class="form-group">
<label for="orderlist_search">주문번호</label>
<input class="form-control" type="text" id="orderlist_search" name="orderlist_search" aria-describedby="order_no_search">
<small id="order_no_search" class="form-text text-muted">주문번호 정확히 입력하세요.</small>
</div>

<div class="form-group">
<label>주문기간</label>
<input class="form-control" type="date" name="start_date" aria-describedby="orderstart">
<small id="orderstart" class="form-text text-muted">검색범위를 입력하세요(첫날)</small> ~ 
<input class="form-control" type="date" name="end_date" aria-describedby="orderend">
<small id="orderend" class="form-text text-muted" >검색범위를 입력하세요(마지막날)</small>
</div>
<select name="orderlist_category">
<option value="1" id="categoryselect1">스토어</option>
<option value="2" id="categoryselect2">레슨</option>
</select>
 <input type="submit" class="order_search_btn" value="조회">
</form>

<%-- <form action="${pageContext.request.contextPath}/todaylessonadmin/refund_orderlist?currPage=${page.startBlock }">
<select name="orderlist_category">
<option value="1" id="categoryselect1">스토어</option>
<option value="2" id="categoryselect2">레슨</option>
</select>
<input type="submit" class="storeselect-btn" value="스토어/레슨 선택">
</form> --%>


<form action="${pageContext.request.contextPath}/todaylessonadmin/admin_order_refund">
<table class="table table-hover">
<thead class="thead-dark">
<tr><th>주문번호</th><th>주문일자</th><th>주문자 연락처</th><th>상품명(판매자)</th><th rowspan="2">금액합계</th></tr>
<tr><th>결제상태</th><th>주문자 ID</th><th>배송 주소</th><th>상품번호</th></tr>
</thead>
<tbody>

<c:forEach var="item" items="${list }">
<tr><td>${item.orderlist_no }</td><td>${item.orderlist_date }</td><td>${item.member_phone }</td>
<td>${item.product_name }${item.lesson_title }<br>
<span>(<c:if test='${item.senior_nick==null }'>투데이레슨</c:if>${item.senior_nick}</span>)</td>
<td rowspan="2">${item.orderlist_cost }</td></tr>
<tr><td><select name="pay_status" class="status_select status_select-${item.orderlist_no}" id="${item.orderlist_no}">
<option value="1">결제완료</option>
<option value="2">환불진행</option>
<option value="3">환불완료</option>

</select></td><td>${item.member_id }</td><td>${item.orderlist_addr }</td><td><c:if test='${item.product_no!=0 }'>${item.product_no}</c:if>${item.lesson_no }</td></tr>


<c:set var="cost" value="${item.orderlist_cost }"></c:set>
<c:set var="total" value="${total+cost }"></c:set>
<script>
	
$('.status_select-'+${item.orderlist_no}+' option[value=${item.orderlist_paystatus }]').attr('selected',true);
console.log($('.status_select option[value=${item.orderlist_paystatus }]').val());

var emptyalert=${emptyalert};

if(${orderlist_category}==1)
	{
	$('#categoryselect1').attr('selected',true);
	}
else if(${orderlist_category}==2)
	{
	$(document).ready(function(){
		
		if(emptyalert==true)
		{
		emptyalert=false;
		alert("스토어에 취소내역이 없습니다. 레슨 취소내역을 출력합니다.");
		}
		
	});

	
	$('#categoryselect2').attr('selected',true);
	}



</script>
</c:forEach>
</tbody>
<%-- <tbody>
<tr><td colspan="3"></td><td>합계</td><td><c:out value="${total }"/>원</td>
</tbody> --%>
</table>

</form>

<div class="paging">
<div class="paginginside">
<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_orderlist?currPage=${page.startBlock-1}&orderlist_category=${orderlist_category}&orderlist_search=${search}&start_date=${start_date}&end_date=${end_date}&orderlist_paystatus=${paystatus}">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_orderlist?currPage=${index }&orderlist_category=${orderlist_category}&orderlist_search=${search}&start_date=${start_date}&end_date=${end_date}&orderlist_paystatus=${paystatus}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>

</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_orderlist?currPage=${page.endBlock+1 }&orderlist_category=${orderlist_category}&orderlist_search=${search}&start_date=${start_date}&end_date=${end_date}&orderlist_paystatus=${paystatus}">NEXT
</a></li>
</c:if>
</ul>
</div>
</div>

</div>

<script>
$(document).ready(function() {
    $('body').bootstrapMaterialDesign();
});
/*주문배송상태 변경 셀렉터*/
var before
$('.status_select').focus(function(){
	before=$(this).val();
});
$('.status_select').on("change",function(){
	var orderlist_no=$(this).attr('id');
	var selected=$(this).prop('selected',true).val();
	if(!confirm('주문상태를 변경하시겠습니까?'))
	{
		$('.status_select-'+orderlist_no+' option[value='+before+']').prop('selected',true);
		console.log(before);
		return false;
	}
	else
	{location.href="${pageContext.request.contextPath}/todaylessonadmin/admin_order_refund/"+orderlist_no+"/"+selected;} 
})
</script>
</body>
</html>
