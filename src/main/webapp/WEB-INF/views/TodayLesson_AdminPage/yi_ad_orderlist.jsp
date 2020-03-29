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
</head>
<body>
주문내역 관리
<form action="/todaylessonadmin/admin_orderlist?currPage=${page.startBlock }">
<label>주문상태</label>
<input type="radio" id="order_all" name="orderlist_orderstatus" value="0"><label for="order_all">전체</label>
<input type="radio" id="deposit_waiting" name="orderlist_orderstatus" value="1"><label for="deposit_waiting">입금대기</label>
<input type="radio" id="deposit_complete" name="orderlist_orderstatus" value="2"><label for="deposit_complete">입금완료</label>
<input type="radio" id="delivery_ready" name="orderlist_orderstatus" value="3"><label for="delivery_ready">배송준비</label>
<input type="radio" id="deliverying" name="orderlist_orderstatus" value="4"><label for="deliverying">배송중</label>
<input type="radio" id="order_complete" name="orderlist_orderstatus" value="5"><label for="order_complete">완료</label>
<input type="radio" id="order_cancel" name="orderlist_orderstatus" value="6"><label for="order_cancel">취소</label>
<br>
<label>주문번호</label>
<input type="text" id="orderlist_search" name="orderlist_search"><br>

<label>주문기간</label>
<input type="date" name="start_date"> ~ <input type="date" name="end_date"><br>

<input type="submit" value="조회">
</form>

<form action="/todaylessonadmin/admin_orderlist?currPage=${page.startBlock }">
<select name="orderlist_category">
<option value="1" selected="selected">스토어</option>
<option value="2">레슨</option>
</select>
<input type="submit" value="스토어/레슨 선택">
</form>


<form action="/todaylessonadmin/admin_order_modify">
<table>
<thead>
<tr><th>주문번호</th><th>주문일자</th><th>주문자 연락처</th><th>상품명</th><th rowspan="2">금액합계</th><th rowspan="2">정산상태</th></tr>
<tr><th>주문상태</th><th>주문자 ID</th><th>배송 주소</th><th>상품번호</th></tr>
</thead>
<tbody>

<c:forEach var="item" items="${list }">
<tr><td>${item.orderlist_no }</td><td>${item.orderlist_date }</td><td>${item.member_phone }</td><td>${item.product_name }</td><td rowspan="2">${item.orderlist_cost }</td><td>정산상태(공사중)</td></tr>
<tr><td><select name="order_status" class="status_select status_select-${item.orderlist_no}" id="${item.orderlist_no}">
<option value="1">입금대기</option>
<option value="2">입금완료</option>
<option value="3">배송준비</option>
<option value="4">배송중</option>
<option value="5">취소</option>
</select></td><td>${item.member_id }</td><td>${item.orderlist_addr }</td><td>${item.product_no }</td></tr>


<c:set var="cost" value="${item.orderlist_cost }"></c:set>
<c:set var="total" value="${total+cost }"></c:set>
<script>
	
$('.status_select-'+${item.orderlist_no}+' option[value=${item.orderlist_orderstatus }]').attr('selected',true);
console.log($('.status_select option[value=${item.orderlist_orderstatus }]').val());





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
</script>
</body>
</html>
