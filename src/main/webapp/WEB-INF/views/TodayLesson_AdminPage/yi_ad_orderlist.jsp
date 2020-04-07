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
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_OrderList_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
	<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_admin_orderlist.css?ver=1">
<!-- CSSstyle -->
</head>
<body>
<div id="yi_container">
<h3>주문내역 관리</h3>


<form action="/todaylessonadmin/admin_orderlist?currPage=${page.startBlock }">

<div class="form-group">
<label>주문상태</label>
<div class="form-check">
<input class="form-check-input orderlist_orderstatus" type="radio" id="order_all" name="orderlist_orderstatus" value="0">
<label class="form-check-label" for="order_all">전체</label>
<input class="form-check-input orderlist_orderstatus" type="radio" id="order_complete" name="orderlist_orderstatus" value="1">
<label class="form-check-label" for="order_complete">주문완료</label>
<input class="form-check-input orderlist_orderstatus" type="radio" id="deliverying" name="orderlist_orderstatus" value="2">
<label class="form-check-label" for="deliverying">배송중</label>
<input class="form-check-input orderlist_orderstatus" type="radio" id="delivery_complete" name="orderlist_orderstatus" value="3">
<label class="form-check-label" for="delivery_complete">배송완료</label>
<input class="form-check-input orderlist_orderstatus" type="radio" id="order_cancel" name="orderlist_orderstatus" value="4">
<label class="form-check-label" for="order_cancel">주문취소</label>
</div>
</div>

<div class="form-group">
<label for="orderlist_search">주문번호</label>
<input class="form-control" type="text" id="orderlist_search" name="orderlist_search" aria-describedby="order_no_search">
<small id="order_no_search" class="form-text text-muted">주문번호 정확히 입력하세요.</small>
</div>

<div class="form-group">
<label>주문기간</label>
<input class="form-control" id="start_date" type="date" name="start_date" aria-describedby="orderstart">
<small id="orderstart" class="form-text text-muted">검색범위를 입력하세요(첫날)</small> ~ 
<input class="form-control" id="end_date" type="date" name="end_date" aria-describedby="orderend">
<small id="orderend" class="form-text text-muted" >검색범위를 입력하세요(마지막날)</small>
</div>
<input type="submit" class="order_search_btn" value="조회">
</form>


<form action="/todaylessonadmin/admin_orderlist?currPage=${page.startBlock }">
<select name="orderlist_category">
<option value="1" selected="selected">스토어</option>
<option value="2">레슨</option>
</select>
<input type="submit" class="storeselect-btn" value="스토어/레슨 선택">
</form>


<form action="/todaylessonadmin/admin_order_modify">
<table class="table table-hover">
<thead class="thead-dark">
<tr><th>주문번호</th><th>주문일자</th><th>주문자 연락처</th><th>상품명</th><th rowspan="2">금액합계</th><th rowspan="2">정산상태</th></tr>
<tr><th>주문상태</th><th>주문자 ID</th><th>배송 주소</th><th>상품번호</th></tr>
</thead>
<tbody>

<c:forEach var="item" items="${list }">
<tr><td>${item.orderlist_no }</td><td>${item.orderlist_date }</td><td>${item.member_phone }</td><td>${item.product_name }</td><td rowspan="2">${item.orderlist_cost }</td>
<td rowspan="2">
<select name="calculate_status" class="calculate_select calculate_select-${item.orderlist_no}" id="c${item.orderlist_no}">
<option value="1">정산대기</option>
<option value="2">정산가능</option>
<option value="3">정산완료</option>
</select></td>
</tr>
<tr><td><select name="order_status" class="status_select status_select-${item.orderlist_no}" id="${item.orderlist_no}">
<option value="1">주문완료</option>
<option value="2">배송중</option>
<option value="3">배송완료</option>
<option value="4">주문취소</option>
</select></td><td>${item.member_id }</td><td>${item.orderlist_addr }</td><td>${item.product_no }</td></tr>


<c:set var="cost" value="${item.orderlist_cost }"></c:set>
<c:set var="total" value="${total+cost }"></c:set>
<script>
	
$('.status_select-'+${item.orderlist_no}+' option[value=${item.orderlist_orderstatus }]').attr('selected',true);

$('.calculate_select-'+${item.orderlist_no}+' option[value=${item.orderlist_calculatestatus }]').attr('selected',true);




</script>
</c:forEach>
</tbody>
<%-- <tbody>
<tr><td colspan="3"></td><td>합계</td><td><c:out value="${total }"/>원</td>
</tbody> --%>
</table>

</form>
<c:if test="${page.prev }">
<a href="admin_orderlist?currPage=${page.startBlock-1}&orderlist_category=${orderlist_category}&orderlist_search=${search}&start_date=${start_date}&end_date=${end_date}&orderlist_orderstatus=${orderstatus}"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="admin_orderlist?currPage=${index }&orderlist_category=${orderlist_category}&orderlist_search=${search}&start_date=${start_date}&end_date=${end_date}&orderlist_orderstatus=${orderstatus}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="admin_orderlist?currPage=${page.endBlock+1 }&orderlist_category=${orderlist_category}&orderlist_search=${search}&start_date=${start_date}&end_date=${end_date}&orderlist_orderstatus=${orderstatus}"><c:out value="다음"/></a>
</c:if>
</div>


<script>

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
	{location.href="/todaylessonadmin/admin_order_modify/"+orderlist_no+"/"+selected;} 
});


/*정산상태 변경 셀렉터*/
var before2
$('.calculate_select').focus(function(){
	before2=$(this).val();
});
$('.calculate_select').on("change",function(){
	var cal_id=$(this).attr('id');
	var orderlist_no=cal_id.substring(1,cal_id.length);
	var selected=$(this).prop('selected',true).val();
	console.log(orderlist_no);
	if(!confirm('정산상태를 변경하시겠습니까?'))
	{
		$('.calculate_select-'+orderlist_no+' option[value='+before2+']').prop('selected',true);
		console.log(before2);
		return false;
	}
	else
	{
		if( $('.status_select').val()!=3)
			{
			alert('배송이 완료된 상품만 정산상태를 변경할 수 있습니다.');
			$('.calculate_select-'+orderlist_no+' option[value='+before2+']').prop('selected',true);
			return false;
			}
		else
		{location.href="/todaylessonadmin/admin_order_calculate/"+orderlist_no+"/"+selected;}
	}
})
</script>

</body>
</html>
