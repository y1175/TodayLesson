<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Required meta tags -->
  <!--   <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"> -->
    <!-- Bootstrap CSS -->
   <!--  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
     <!-- Bootstrap CSS/ -->
    <!-- 주소찾기-->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/yi_findAddr.js"></script>
<!--  주소찾기/-->
<!--결제 아임포트  -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<!--결제아임포트/  -->
<!--mystyle  -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_orderform.css">  
<!--mystyle/  -->
</head>




<body>

<div id="ej_container">
<h2 text align="center"><b>주문신청서    </b><img alt="ordericon" src="${pageContext.request.contextPath}/resources/IMG/contract.svg"
style="width:40px; display:inline;"></h2>
<h4><b>주문할 취미</b></h4>
<hr>
<input type="hidden" name="product_no" value=${product_no }>
<table class="table">
<thead>
<th></th><th>상품명</th><th>개당금액</th><th>수량</th><th>배송비</th><th>주문금액</th>
</thead>
<tbody>
<tr>
<td><img src="${pdto.product_thumb}" id="ej_order_topimg" s"></td>
<td><h4>${product_name }</h4></td>
<td><fmt:formatNumber value="${pdto.product_after_cost}" type="number" maxFractionDigits="3"/>원 </td>
 <td> ${pdcount} 개</td>
 <td>배송비 무료</td>
 <td><fmt:formatNumber value="${totalcost }" type="number" maxFractionDigits="3"/>원</td>
 </tr>
</tbody>
</table>
<hr>
 <input type="hidden" name="product_name" value=${product_name }>
<input type="hidden" name="member_id" value='${pageContext.request.userPrincipal.name}'>
 <input type="hidden" name="order_count" value=${pdcount }>
 <input type="hidden" name="product_after_cost" value="${product_after_cost }">
 
 <div class="ej_cost">
 <b>보유 포인트</b><fmt:formatNumber value="${mdto.member_point}" type="number" maxFractionDigits="3"/><br>
<b>포인트 사용</b> <input type="text"  id="usepoint" value=0>
<button class="ej_btn point" id="pointbtn">적용</button>
<div class="ej_cost right">
<b style="font-size:25px;">결제금액</b>
<input type="text" style="border:none; font-size:30px; font-weight:bolder; width:90px; background-color:transparent;" value="${totalcost }" id="orderlist_cost1" class="paymentcost" readonly="readonly">원 
</div>
</div>
<script>
    
    $("#pointbtn").click(function(){
  
      
  var memberpoint=${mdto.member_point};
  var usepoint=$("#usepoint").val();
  console.log('usepoint: ',usepoint);
  var member_id='${pageContext.request.userPrincipal.name}';
  var totalcost=${totalcost};
  var paymentcost=totalcost-usepoint;
  var remainpoint=memberpoint-usepoint;
  var element = $(".paymentcost3");//클래스로 받아옴
  var paymentnum = element.children();
  var hh=$("fmt").val();
  console.log('ele',element);
console.log('paymentnum',paymentnum);
console.log('val',hh);
  var data = {
        memberpoint: memberpoint,
       usepoint : usepoint,
       member_id: member_id,
       totalcost: totalcost,
       paymentcost: paymentcost,
       remainpoint: remainpoint
    };
 

  $.ajax({
   url :"${pageContext.request.contextPath}/todaylesson/ej_us_orderform/applypointjson",
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
		totalcost=data.paymentcost;
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

<br><br>
 <form role="form" method="post"> 
 <h4><b>주문자 정보</b></h4><hr>
 <b>주문자명</b>   <input type="text" style="border:none; width="300" value=${mdto.member_name } readonly="readonly"><br>
 <b>이메일</b>  <input type="text" style="border:none; name="member_email"   readonly="readonly"  value=${mdto.member_email } ><br>
<b>연락처</b>   <input type="text"   style="border:none;"  readonly="readonly"  value=${mdto.member_phone }><br><br>
<input type="hidden" name="member_id" value='${pageContext.request.userPrincipal.name}'>
<h4><b>배송지 정보</b></h4><hr>
 <input type="radio" name="deliveryaddr" value="same" checked="checked" id="sameaddr"  >주문자정보와 동일    
<input type="radio" name="deliveryaddr" value="newaddr" id="newaddr" >새로운 배송지<br>
<input type="hidden" name="product_no" value=${product_no }>
<input type="hidden" name="order_count" value=${pdcount }>
<input type="hidden" name="orderlist_cost" id="orderlist_cost" value=${totalcost } class="paymentcost">
<input type="hidden" name="orderlist_usepoint" id="orderlist_usepoint" value=0>
<input type="hidden" name="remainpoint" class="remainpoint" value= ${mdto.member_point}>
<b>수령자명</b><br><input type="text"  name="orderlist_receiver"    id="rec"  readonly="readonly" value=${mdto.member_name }><br>
<b>휴대전화</b><br><input type="text"  name="orderlist_phone"    id="phone" readonly="readonly" value=${mdto.member_phone } ><br>
<b>주소</b><br><input type="text" name="orderlist_addr" size="150"  id="addr"   readonly="readonly" value="${mdto.member_addr }"><br>


   <input type="radio"  name='addrselect' value="0" id="sameaddrselect" checked="checked">
 
 <div id="findaddr">
 <label for='addr'></label>
               <div class='form-row'>
                  <div class='col-5'>
                     <input type="text" id="sample4_postcode" name="orderlist_zipcode"
                        placeholder="우편번호" value=${mdto.member_zipcode } >
                  </div>
                  <input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly="readonly" class='ej_btn' ><br>
               </div>
               <div class='juso'>
            
                <input type="radio" id='roadAddress' name='addrselect' value="1" 
                     ><label for="addrselect">도로명주소 선택</label> <br>
                  <input type="text" style="width:600px;" id="sample4_roadAddress" placeholder="도로명주소"
                     name="roadaddr" readonly="readonly"   ><br>
                 
				 <input type="radio" id='jibunAddress' name='addrselect' value="2">
				 <label for="addrselect" >지번주소 선택</label><br>
                  <input type="text" id="sample4_jibunAddress" style="width:600px;" placeholder="지번주소"
                     name="jibunaddr" readonly="readonly"  >
                 
               </div>
               <span id="guide" style="color: #999"></span> 
               <label for="detailaddr">상세주소</label><br>
                <input type="text" id="detailaddr"name="detailaddr" style="width:600px;"   placeholder="상세주소"> 

<br>  
</div> 

<hr>
<b>배송요청사항</b><br><textarea rows="5" name="orderlist_msg"   cols="100"></textarea><br><br>
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
 <b>결제금액</b><br>
 <input type="text" style="border:none; font-size:30px; font-weight:bolder; width:90px; background-color:transparent" name="paymentt2" value="${totalcost }" class="paymentcost" readonly="readonly">원
 
  <button id="check_module" type="button" class='ej_btn' >결제하기</button>
  </div>
  </div>
  <br>


	
 <script>

 
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
       name: '주문상품:${product_name}',
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
  /*     var msg = '화면의 주문완료 버튼을 눌러주세요'; */
      /*  msg += '고유ID : ' + rsp.imp_uid;
       msg += '상점 거래ID : ' + rsp.merchant_uid;
       msg += '결제 금액 : ' + rsp.paid_amount;
       msg += '카드 승인번호 : ' + rsp.apply_num;  */
      
       			
       			$("form").attr("action", "${pageContext.request.contextPath}/todaylesson/orderlistdetail");
    
       			$("form").submit();  
       			
       		} else {
    	   
       		var msg = '결제에 실패하였습니다.';
      		 msg += '에러내용 : ' + rsp.error_msg;
       }
      alert(msg);
       });
       });

    </script>
  
 
    </form>
  </div>
    
</body>
 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- Optional JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
</html>