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
<script type="text/javascript" src="resources/JS/yi_findAddr.js"></script>
</head>
<body>
<h1 text align="center">주문신청서</h1>
<h2>주문할 취미</h2>
<hr>
 <%-- ${product_no } --%>
 <img src="${pdto.product_img}" id="ej_order_topimg" width="200">
<h3>${product_name }</h3><br>


 수량: ${pdcount } 개<br>
 전체금액:
 ${product_cost}원X${pdcount}
<%--  로그인아이디:${member_id}
${mdto.member_id }
${mdto.member_addr } --%>
 
 <section class="total" >
 </section><br>
 
 <h2>주문자 정보</h2><hr>
 주문자명   <input type="text" value=${mdto.member_name }><br>
 이메일   <input type="text" value=${mdto.member_email }><br>
연락처   <input type="text" value=${mdto.member_phone }><br>

 <h2>배송지 정보</h2><hr>
 <input type="radio" name="deliveryaddr" value="same" checked="checked">주문자정보와 동일
<input type="radio" name="deliveryaddr" value="newaddr">새로운 배송지<br>

수령자명<input type="text" value=${mdto.member_name }><br>
휴대전화<input type="text" value=${mdto.member_phone }><br>
추가번호(선택)<input type="text" name="phone2"><br>
주소(우편번호)<input type="text" size="150" value="${mdto.member_addr }"><br>
체크(기본배송지로 저장나중에 추가)<br>
배송요청사항<textarea rows="5" cols="100"></textarea><br>
---------------국쌤우편번호---------<br>
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

<br>
 <h2>배송지 정보</h2><hr>
 결제수단 선택
  <input type="radio" name="paymethod" value="same">신용카드
<input type="radio" name="paymethod" value="newaddr">카카오페이
<input type="radio" name="paymethod" value="newaddr">페이코
<input type="radio" name="paymethod" value="newaddr">무통장입금
<br>
 마일리지 사용 <input type="text" ><button>적용</button><br>
 상품금액:${total}<br>
 배송비 무료<br>
 전체 주문금액:<br>
<button>결제하기</button>
나와라라ㅏ::${pageContext.request.contextPath}

<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- Optional JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<script>/* 총가격계산(할인율도 적용할것) */
 var cost=${product_cost};
 var cnt=${pdcount};
 var total=cost*cnt;

 $("section.total").html(+total+'원');
 //에이작스 써야되나?
 </script>
</body>
 
</html>