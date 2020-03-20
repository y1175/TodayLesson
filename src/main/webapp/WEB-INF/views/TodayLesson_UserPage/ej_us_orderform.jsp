<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript" src="resources/JS/yi_findAddr.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<style>

</style>
</head>




<body>
<script>
$("#ordersuccess_btn").hide();
</script>

<h2 text align="center">주문신청서</h2>
<h4>주문할 취미</h4>
<hr>
<input type="hidden" name="product_no" value=${product_no }>
 <img src="${pdto.product_img}" id="ej_order_topimg" width="200">
<h4>${product_name }</h4><br>
<input type="hidden" name="product_name" value=${product_name }>
<input type="hidden" name="member_id" value='${pageContext.request.userPrincipal.name}'>

 수량: ${pdcount} 개<br>
 전체금액:
 ${product_after_cost}원X${pdcount}<input type="hidden" name="order_count" value=${pdcount }>
 =>${totalcost }원<br><hr>
 
 <input type="hidden" name="orderlist_cost" value=${totalcost }>
 <input type="hidden" name="product_after_cost" value="${product_after_cost }">
 보유 포인트: ${mdto.member_point}<br>
포인트 사용 <input type="text"  class="form-control" id="usepoint" value=0>
<button class='btn btn-primary' id="pointbtn">적용</button><br>

 결제금액<br>
 <input type="text" value="${totalcost }" id="paymentcost" class="paymentcost" readonly="readonly">

<script>
    
    $("#pointbtn").click(function(){
  
       console.log('usepoint');
  var memberpoint=${mdto.member_point};
  var usepoint=$("#usepoint").val();
  var member_id='${pageContext.request.userPrincipal.name}';
  var totalcost=${totalcost};
  var paymentcost=totalcost-usepoint;
  var data = {
        memberpoint: memberpoint,
       usepoint : usepoint,
       member_id: member_id,
       totalcost: totalcost,
       paymentcost: paymentcost
    };

  $.ajax({
   url :"/ej_us_orderform/applypointjson",
   type : "post",
   data : data,
   success : function(){
   console.log('success');
	if(usepoint>=memberpoint)
		{
		alert('보유포인트를 초과하였습니다.');
		}
	else{
  	$('.paymentcost').val(paymentcost);
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
 <h4>주문자 정보</h4><hr>
 주문자명   <input type="text"   class="form-control" width="300" value=${mdto.member_name }><br>
 이메일   <input type="text" name="member_email" class="form-control"  value=${mdto.member_email }><br>
연락처   <input type="text"  name="orderlist_phone" class="form-control" value=${mdto.member_phone }><br>
<input type="hidden" name="member_id" value='${pageContext.request.userPrincipal.name}'>
 <h4>배송지 정보</h4><hr>
 <input type="radio" name="deliveryaddr" value="same" checked="checked"   >주문자정보와 동일
<input type="radio" name="deliveryaddr" value="newaddr"   >새로운 배송지<br>
<input type="hidden" name="product_no" value=${product_no }>
<input type="hidden" name="order_count" value=${pdcount }>
수령자명<input type="text"  name="orderlist_receiver" class="form-control"  value=${mdto.member_name }><br>
휴대전화<input type="text"  name="orderlist_phone" class="form-control"  value=${mdto.member_phone }><br>
추가번호(선택)<input type="text"  class="form-control"  name="phone2"><br>
주소(우편번호)<input type="text" name="orderlist_addr" size="150"  class="form-control" value="${mdto.member_addr }"><br>
체크(기본배송지로 저장나중에 추가)<br>
배송요청사항<textarea rows="5"  class="form-control" cols="100"></textarea><br>
<!-- ---------------국쌤우편번호---------<br>
<label for='addr'>주소</label>
               <div class='form-row'>
                  <div class='col-5'>
                     <input type="text" id="sample4_postcode" name='zipcode'
                        placeholder="우편번호" class='form-control'>
                  </div>
                  <input type="button" onclick="sample4_execDaumPostcode()"
                     value="우편번호 찾기" readonly="readonly" class='btn btn-primary'><br>
               </div>
               <div class='juso'>
                  <input type="text" id="sample4_roadAddress" placeholder="도로명주소"
                     name="roadaddr" readonly="readonly" class="form-control">
                  <input type="radio" id='roadAddress' name='addrselect' value="0"
                     required><label for="addrselect">도로명주소 선택</label> <br>

                  <input type="text" id="sample4_jibunAddress" placeholder="지번주소"
                     name="jibunaddr" readonly="readonly" class="form-control">
                  <input type="radio" id='jibunAddress' name='addrselect' value="1"><label
                     for="addrselect">지번주소 선택</label><br>
               </div>
               <span id="guide" style="color: #999"></span> <label
                  for="detailaddr">상세주소</label> <input type="text" id="detailaddr"
                  name="detailaddr" class="form-control"> 

<br> -->
<br>
<h4>결제정보</h4><hr>
 결제수단 선택
  <input type="radio" name="paymethod" value="card">신용카드
<input type="radio" name="paymethod" value="kakaopay">카카오페이
<input type="radio" name="paymethod" value="payco">페이코
<input type="radio" name="paymethod" value="accountpay">무통장입금
<br>

 배송비 무료<br>
 결제금액<br>
 <input type="text" name="paymentt2" value="${totalcost }" class="paymentcost" readonly="readonly">
 
  <button id="check_module" type="button" class='btn btn-primary'>결제하기</button>



 <script>
    $("#check_module").click(function () {
    
       var IMP = window.IMP; // 생략가능
       IMP.init('imp65601532');
       // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
       // i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
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
       name: '주문명:결제테스트',
       //결제창에서 보여질 이름
       amount: ${totalcost},
       //가격
       buyer_email: '${dto.member_email}',
       buyer_name: '${dto.member_name}',
       buyer_tel: '${dto.member_phone}',
       buyer_addr: '${dto.member_addr}',
       buyer_postcode: '${dto.member_zipcode}',
       m_redirect_url: '/todaylessonlogin'
       /*
       모바일 결제시,
       결제가 끝나고 랜딩되는 URL을 지정
       (카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐)
       */
       }, function (rsp) {
       console.log(rsp);
       $("#ordersuccess_btn").show();
       if (rsp.success) {
       var msg = '화면의 주문완료 버튼을 눌러주세요';
       msg += '고유ID : ' + rsp.imp_uid;
       msg += '상점 거래ID : ' + rsp.merchant_uid;
       msg += '결제 금액 : ' + rsp.paid_amount;
       msg += '카드 승인번호 : ' + rsp.apply_num;
       } else {
       var msg = '결제에 실패하였습니다.';
       msg += '에러내용 : ' + rsp.error_msg;
       }
       alert(msg);
       });
       });

    </script>
    <div id="ordersuccess_btn">
    <input type="submit" id="ordersuccess_btn" value="주문완료"></div>
    </form>
    <script>
    $("#ordersuccess_btn").click(function () {
    $("form").attr("action", "/orderlistdetail");
    });
    </script>
    
</body>
 <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- Optional JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 
</html>