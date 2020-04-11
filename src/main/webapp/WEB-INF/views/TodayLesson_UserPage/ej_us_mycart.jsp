<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

   
   
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/JS/yi_findAddr.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!--my style  -->	
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_orderform.css">
  <!--my style/  -->
<title>Insert title here</title>
<style>
.orderInfo{
display:none;}
.fa-times-circle{
text-align: right;
}
.delete_product_cart:hover{
text-decoration: none;
}

/* span.ej_link{
color:black;} */
.ej_link:hover{
text-decoration: none;
}
.hs_us_mypage_nav{
display:none;}

</style>

</head>
<body>

<div id="ej_container">
<!-- <h2 style="text-align:center;"><b>장바구니 <i class="fas fa-shopping-cart" style="color: rgb(224, 62, 82) ;"></i></b></h2><br><br> -->
<img src="${pageContext.request.contextPath}/resources/IMG/cartbanner.png" alt="cart" style="width:105%;" >
<input type="hidden" name="member_id" value="${memberid }" id="member_id"> 
<table class="table" style="border:none;">
<thead>
<tr>
<th>삭제</th><th>구분</th><th></th><th>이름</th><th>가격</th><th>수량</th>
</tr>
</thead>
<tbody>
<c:set var="total_cart" value="0" />
<c:forEach var="item" items="${list}">
<tr>
<c:set var="lesson_title" value="${item.lesson_title}"/>
<c:set var="product_name" value="${item.product_name}"/>


<c:choose>

<c:when test="${lesson_title==null}"><!--상품정보  -->
<td><a href="#" class="delete_product_cart" id="${item.product_no}" ><i class="fas fa-times" style="font-size:20px; color:black;"></i></a></td>
<td>상품</td>
<td><a href="${pageContext.request.contextPath}/todaylesson/ej_store_detail/${item.product_no}"><img src="${item.product_thumb}" alt="thumb"></a></td>
<td style="color:black;"><a href="${pageContext.request.contextPath}/todaylesson/ej_store_detail/${item.product_no}" class="ej_link"><span class="ej_link">${item.product_name }</span></a></td>
<td><fmt:formatNumber value="${item.product_after_cost }" type="number" maxFractionDigits="3"/>원</td>
<td>${item.cart_amount }</td>
</c:when>

<c:when test="${product_name==null}"><!--레슨정보  -->
<td><a href="#" class="delete_lesson_cart" id="${item.lesson_no}" ><i class="fas fa-times" style="font-size:20px;color:black;"></i></a></td>
<td>레슨</td>
<td><a href="${pageContext.request.contextPath}/todaylesson/lesson_detail/${item.lesson_no}"><img src="${item.lesson_thumb}" alt="thumb"></a></td>
<td style="color:black;"><a href="${pageContext.request.contextPath}/todaylesson/lesson_detail/${item.lesson_no}">${item.lesson_title}</a></td>
<td><fmt:formatNumber value="${item.lesson_cost }" type="number" maxFractionDigits="3"/>원</td>
<td>1</td>
</c:when>
</c:choose>
</tr>
<!--foreach문 내에서 합계 계산  -->
<c:set var="total_cart" value="${total_cart + (item.product_after_cost * item.cart_amount)+item.lesson_cost}" />
</c:forEach> 
</tbody>
</table>
<hr>
<div class="sum">
	<h3><b>장바구니 합계  <fmt:formatNumber value="${total_cart }" type="number" maxFractionDigits="3"/>원</b></h3>
</div>

<input type="button" class='ej_btn' id="open_orderform_btn"value="주문하기" style="float:right;width:110px;"><br>


<div class="orderInfo">

<div class="ej_cost">
 <b>보유 포인트</b> <fmt:formatNumber value="${mdto.member_point}" type="number" maxFractionDigits="3"/><!-- <a href="#"> --><i class="far fa-times-circle"  id="cancel_btn" style="font-size:20px;color:black;float:right;"></i><!-- </a> --><br>
<b>포인트 사용</b> <input type="text"  class="form-control" id="usepoint" value=0 style="width:100px;">
<button class='ej_btn' id="pointbtn">적용</button>
<div class="ej_cost right">
 <b style="font-size:20px;">결제금액</b><br>
 <input type="text" value="${total_cart }" id="orderlist_cost1" class="paymentcost" readonly="readonly" style="border:none;background-color:transparent;font-size:25px;font-weight:bold;width:100px;">원</div>
<br></div>

<script>
    
    $("#pointbtn").click(function(){
  
      
  var memberpoint=${mdto.member_point};
  var usepoint=$("#usepoint").val();
  console.log('usepoint: ',usepoint);
  var member_id='${pageContext.request.userPrincipal.name}';
  var totalcost=${total_cart};
  var paymentcost=totalcost-usepoint;
  var remainpoint=memberpoint-usepoint;
  var data = {
        memberpoint: memberpoint,
       usepoint : usepoint,
       member_id: member_id,
       totalcost: totalcost,
       paymentcost: paymentcost,
       remainpoint: remainpoint
    };
 

  $.ajax({
   url :"/todaylesson/ej_us_orderform/applypointjson",
   type : "post",
   data : data,
   success : function(){
   console.log('success');
	if(usepoint>=memberpoint)
		{
		alert('보유포인트를 초과하였습니다.');
		}
	else{
	
		$('.paymentcost').val(data.paymentcost);
  	 $('#orderlist_usepoint').val(data.usepoint);
  	 $('.remainpoint').val(data.remainpoint);
  	 console.log(data.paymentcost);
  	 console.log(data.usepoint);
  	
	}
    } 
   ,error: function(){
      console.log(data);
      console.log('error');
     // alert('로그인이 필요합니다.');
      }
  }); 
 
 });
    </script>


 <form role="form" method="post" autocomplete="off"> 
 <h4><b>주문자 정보</b></h4><hr>
 <b>주문자명</b>   <input type="text"   class="form-control" width="300" value=${mdto.member_name } readonly="readonly"><br>
 <b>이메일</b>   <input type="text" name="member_email" class="form-control"  value=${mdto.member_email } readonly="readonly"><br>
<b>연락처</b>   <input type="text"  class="form-control" value=${mdto.member_phone } readonly="readonly"><br>
<input type="hidden" name="member_id" value='${memberid}'>
 <h4><b>배송지 정보</b></h4><hr>
 <input type="radio" name="deliveryaddr" value="same" checked="checked" id="sameaddr"  >주문자정보와 동일
<input type="radio" name="deliveryaddr" value="newaddr" id="newaddr" >새로운 배송지<br>
<%-- <input type="hidden" name="product_no" value=${product_no }>
<input type="hidden" name="order_count" value=${pdcount }> --%>
<input type="hidden" name="orderlist_cost" id="orderlist_cost" value="${total_cart}" class="paymentcost">
<input type="hidden" name="orderlist_usepoint" id="orderlist_usepoint" value=0>
<input type="hidden" name="remainpoint" class="remainpoint" value= ${mdto.member_point}>
<b>수령자명</b><input type="text"  name="orderlist_receiver" class="form-control"  id="rec" value=${mdto.member_name } readonly="readonly"><br>
<b>휴대전화</b><input type="text"  name="orderlist_phone" class="form-control"  id="phone" value=${mdto.member_phone } readonly="readonly"><br>
<b>주소</b><input type="text" name="orderlist_addr" size="150"  id="addr" class="form-control" value="${mdto.member_addr }" readonly="readonly"><br>


   <input type="radio"  name="addrselect" value=0 id="sameaddrselect" checked="checked">
 
 <div id="findaddr">
 <label for='addr'></label>
               <div class='form-row'>
                  <div class='col-5'>
                     <input type="text" id="sample4_postcode" name="orderlist_zipcode"
                        placeholder="우편번호" value=${mdto.member_zipcode } class='form-control' >
                  </div>
                  <input type="button" onclick="sample4_execDaumPostcode()"
                     value="우편번호 찾기" readonly="readonly" class='ej_btn' ><br>
               </div>
               <div class='juso'>
            
                <input type="radio" id='roadAddress' name='addrselect' value="1" 
                     ><label for="addrselect">도로명주소 선택</label> <br>
                  <input type="text" id="sample4_roadAddress" placeholder="도로명주소"
                     name="roadaddr" readonly="readonly" class="form-control" >
                 
				 <input type="radio" id='jibunAddress' name='addrselect' value="2"><label
                     for="addrselect" >지번주소 선택</label><br>
                  <input type="text" id="sample4_jibunAddress" placeholder="지번주소"
                     name="jibunaddr" readonly="readonly" class="form-control" >
                 
               </div>
               <span id="guide" style="color: #999"></span> <label
                  for="detailaddr">상세주소</label> <input type="text" id="detailaddr"
                  name="detailaddr" class="form-control"> 

<br>  
</div> 

<hr>
<b>배송요청사항</b><textarea rows="5" name="orderlist_msg" class="form-control" cols="100"></textarea><br>
<script>

$("#findaddr").hide();
$("#sameaddrselect").hide();
var h=$('addrselect').val();
console.log('addrselect',h);


var value = $('input[name=addrselect]').val();
console.log('addrselect input으로 벨류값',value);
$('input[name=addrselect]').val('0');
$("#roadAddress").on('click', function() {
	$("#roadAddress").val("1");
});
$("#jibunAddress").on('click', function() {
	$("#jibunAddress").val("2");
});
	

</script>
<script>
$("#newaddr").on('click', function() {
	
	$('#rec').val('');
	$('#phone').val('');
	$("#addr").hide();
	$('#addr').val('');
	$('#zipcode').val('');
	$('#sample4_postcode').val('');
	$('#rec').attr("readonly",false);
	$('#phone').attr("readonly",false);
	$('#addr').attr("readonly",false);
	//$("#findaddr").attr("disabled", true);
	//$("#findaddr").show();
	$("#findaddr").toggle();
	//$("#findaddr").find("input").prop("disabled",false);
	//우편번호 찾기 버튼 활성화 시킬거임
	
});
$("#sameaddr").on('click', function() {
	
	$('#rec').val('${mdto.member_name }');
	$('#phone').val('${mdto.member_phone }');
	$('#addr').val('${mdto.member_addr }');
	$('#rec').attr("readonly",true);
	$('#phone').attr("readonly",true);
	$('#addr').attr("readonly",true);
	$('#addr').toggle();
	$("#findaddr").toggle();
	//$("#findaddr").find("input").prop("disabled",true);
});
</script>
<br>
<div class="ej_cost2">
<h4><b>결제정보</b></h4><hr>
 <b>결제수단 선택</b>
  <input type="radio" name="paymethod" value="card">신용카드
<input type="radio" name="paymethod" value="kakaopay">카카오페이

<br>

 배송비 무료<br>
 <div class="ej_cost2_right">
<b> 결제금액</b><br>
 <input type="text" name="paymentt2" value="${total_cart }" class="paymentcost" readonly="readonly" style="border:none;background-color:transparent;font-size:25px;font-weight:bold;width:100px;">원
 
  <button id="check_module" type="button" class='ej_btn' >결제하기</button> </div>
  </div>
  <button id="test">테스트버튼 지워지워</button>
  <br>


<script>
$("#test").click(function () {
$("form").attr("action", "/todaylessonmypage/order_cart");
	$("form").submit();  });
</script>
 <script>
    $("#check_module").click(function () {
    	  $("#check_module").click(function () {
        	  var IMP = window.IMP; // 생략가능
        	  var cost=$(".paymentcost").val();

        	 var inputValue = $("input[name='paymethod']:checked").val();
             if(inputValue=='card')
            	 {IMP.init('imp57388060');//이니시스
            	 }
             else if(inputValue=='kakaopay')
            	 {IMP.init('imp65601532');//카카오
            	 }
             
           IMP.request_pay({
           pg: 'inicis', // version 1.1.0부터 지원.
           /*
       'kakao':카카오페이,
       html5_inicis':이니시스(웹표준결제)
       'nice':나이스페이
       'jtnet':제이티넷
       'uplus':LG유플러스
       'danal':다날
       'payco':페이코
       'syrup':시럽페이
       'paypal':페이팔
       */
       pay_method: 'card',
       /*
       'samsung':삼성페이,
       'card':신용카드,
       'trans':실시간계좌이체,
       'vbank':가상계좌,
       'phone':휴대폰소액결제
       */
       merchant_uid: 'merchant_' + new Date().getTime(),
       /*
       merchant_uid에 경우
       https://docs.iamport.kr/implementation/payment
       위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
       참고하세요.
       나중에 포스팅 해볼게요.
       */
       name: '주문상품:',
       //결제창에서 보여질 이름
       amount: cost,
       //가격
       buyer_email: '${mdto.member_email}',
       buyer_name: '${mdto.member_name}',
       buyer_tel: '${mdto.member_phone}',
       buyer_addr: '${mdto.member_addr}',
       buyer_postcode: '${mdto.member_zipcode}',
       m_redirect_url: '/orderlistdetail'
       /*
       모바일 결제시,
       결제가 끝나고 랜딩되는 URL을 지정
       (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
       */
    	  
       }, function (rsp) {
     
      
       		if (rsp.success) {
      var msg = '주문이 완료되었습니다';
      /*  msg += '고유ID : ' + rsp.imp_uid;
       msg += '상점 거래ID : ' + rsp.merchant_uid;
       msg += '결제 금액 : ' + rsp.paid_amount;
       msg += '카드 승인번호 : ' + rsp.apply_num;  */
       			
       			$("form").attr("action", "/todaylessonmypage/order_cart");
       			$("form").submit();  
       		} else {
    	   
       		var msg = '결제에 실패하였습니다.';
      		 msg += '에러내용 : ' + rsp.error_msg;
       }
      alert(msg);
       });
       });
    });

    </script>
    
   

</form>
</div>
<script>
 $("#open_orderform_btn").click(function(){
  $(".orderInfo").slideDown();
  $("#open_orderform_btn").slideUp();
 }); 
 
 $("#cancel_btn").click(function(){
	 $(".orderInfo").slideUp();
	 $("#open_orderform_btn").slideDown();
	});   
</script>
<script>
/* 상품삭제 */
$(".delete_product_cart").on('click',function(){
	
	console.log(this);
	console.log('delete pro');
	var product_no=$(this).prop('id');
	var member_id='${memberid }';
	var lesson_no=0;
	var data={
			product_no: product_no,
			member_id: member_id,
			lesson_no: lesson_no
	}
	
	$.ajax({
	      url:"/todaylessonmypage/deletecart_json",
	      type:"post",
	      data: data,
	      success: function(result){
	    	 if(result>0)
	    		 {
	    		// alert('해당상품을 장바구니에서 삭제 하시겠습니까?');
	    	  location.href="/todaylessonmypage/mycart/"+'${memberid}';
	    		 }
	    	 else{
	    		 alert('삭제 실패되었습니다.');
	    	 }
	      },error: function(){
	         console.log('error');
	   }    
	  });

	
});
</script>
<script>
$(".delete_lesson_cart").on('click',function(){
	/* 레슨삭제 */
	console.log(this);
	console.log('delete les');
	var product_no=0;
	var lesson_no=$(this).prop('id');
	var member_id='${memberid }';
	var data={
			product_no: product_no,
			lesson_no: lesson_no,
			member_id: member_id
	}
	
	$.ajax({
	      url:"/todaylessonmypage/deletecart_json",
	      type:"post",
	      data: data,
	      success: function(result){
	    	 if(result>0)
	    		 {
	    		// alert('해당상품을 장바구니에서 삭제 하시겠습니까?');
	    	  location.href="/todaylessonmypage/mycart/"+'${memberid}';
	    		 }
	    	 else{
	    		 alert('삭제 실패되었습니다.');
	    	 }
	      },error: function(){
	         console.log('error');
	   }    
	  });

	
});
</script>

</body>
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- Optional JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
</html>