<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--jquery  -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<!--jquery  -->
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <!-- Optional JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
 <!--    Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> 

  <!--owl carousel css, js-->
 <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.carousel.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.theme.default.css">
    <script src="/resources/JS/owl.carousel.js"></script>
  <script src="/resources/JS/owl.carousel.min.js"></script>
<!--owl carousel css, js-->
    
<!--summernote css/js/ko-kr-->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
<script src="/resources/JS/summernote-ko-KR.js"></script>
<!--summernote css/js/ko-kr-->


<!--style-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/ej_us_storedetail.css"> 
<!--style-->

<script>
$('document').ready(function() { 
	$('html, body').animate({
		scrollTop: $('html').offset().top
	}, 'slow');
	/*관련상품카르셀  */
	var owl = $('.owl-carousel');
	owl.owlCarousel({
	    items:4,
	    loop:true,
	    margin:10,
	    nav: true,/* 
	    autoplay:true,
	    autoplayTimeout:1000,
	    autoplayHoverPause:true */
	});
	
	 $('.owl-carousel').owlCarousel();
	 
	$('#summernote').summernote({
		placeholder : '후기를 남겨보세요!',
		minHeight : 370,
		maxHeight : null,
		/* focus : true, */
		lang : 'ko-KR'
	});	
});
</script>

</head>
<body>


<div id="ej_container">


  <form role="form" method="post" id="form1" name="form" >
 
<!--썸네일 이미지 원본 맨위에 보여줌-->
<div class="ej_top img">
<img src="${dto.product_img }" id="ej_sdetail_topimg" width="60%">
</div>

<div class="ej_top right">
<c:set var="category" value="${dto.product_category }"/>
 <c:choose>
 <c:when test = "${category==1}">외국어</c:when>
         <c:when test = "${category==2}">IT </c:when>
            <c:when test = "${category==3}">요리</c:when>
            <c:when test = "${category==4}">DIY</c:when>
            <c:when test = "${category==5}">운동</c:when>
            <c:when test = "${category==6}">기타</c:when>
          <c:otherwise>기타</c:otherwise>
          </c:choose><br>
          
<h3><c:out value="${dto.product_name}"></c:out><br></h3>
<h4 class="beforecost" id="ej_cost"><fmt:formatNumber value="${dto.product_cost}" type="number" maxFractionDigits="3"/>원 </h4>
<div id="ej_cost"><c:out value="${dto.product_sale}"/>%</div> <div id="ej_cost"><h3> <fmt:formatNumber value="${dto.product_after_cost}" type="number" maxFractionDigits="3"/>원 </h3></div><br>




수량 <input type=text size="1" name="pdcount" id="pdcount" placeholder="1" size="2" value=1 required="required"><br>
배송비 무료<br>


<div class="ej_grid fist">
<input type="submit" value="구매하기" id="to_orderform" class='btn btn-primary' ><br></div>
<div class="ej_grid second">
<a href="#"><div class="fas fa-heart" id="${dto.product_no}"></div></a></div>
<div class="ej_grid third">
<a href="#"><div class="fa fa-shopping-cart" id="${dto.product_no}"></div></a></div>


<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
<input type="hidden" name="product_no" value="${dto.product_no }"/>
<input type="hidden" name="product_name" value="${dto.product_name }"/>
<input type="hidden" name="product_cost" value="${dto.product_cost }"/>
<input type="hidden" name="product_after_cost" value="${dto.product_after_cost }"/>
<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}" id="member_id">
 </div><!--id="ej_sdetail_right"-->
 </form>

 
 <script>

	$("#to_orderform").click(function(){
		if(${dto.product_stock }<=0)
			{
			alert('일시품절된 상품입니다.');
			}
		else{
		 $("form").attr("action", "${pageContext.request.contextPath}/todaylesson/ej_us_orderform");
			$("form").submit();  
		}
		
	});
	
	
/* 장바구니 아이콘 */
 $(".fa.fa-shopping-cart").click(function(){ 
	 
  var productno=$(this).prop("id");
  var member_id='${pageContext.request.userPrincipal.name}';
  var pdcount=$("#pdcount").val();
  
  console.log(pdcount);
  var data = {
       product_no : productno,
       member_id: member_id,
       cart_amount: pdcount
    };
  console.log(member_id);
  if(member_id=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"/todaylesson/cartwith_amount_json",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(result){
	   console.log('result:',result);
    if(data.member_id==null)
       {
       alert('로그인이 필요합니다.');
       }
    else{
    	if(result=="success")
    		{
    		alert('장바구니에'+data.cart_amount+'개 담겼습니다');
    		}
    	else{
    		alert('이미 장바구니에 추가된 상품입니다.');
    	}
    		
    }
   
    } 
   ,error: function(){
      console.log('error');
      }
  }); 
  }
 });

</script>
 <script>

 $(".fas.fa-heart").click(function(){
	 
	 var productno=$(this).prop("id");
	 
  var member_id='${pageContext.request.userPrincipal.name}';
  
  var data = {
       product_no : productno,
       member_id: member_id
    };
  
  if(member_id=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"/todaylesson/likejson",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(result){
	   console.log('result:',result);
    if(data.member_id==null)
       {
       alert('로그인이 필요합니다.');
       }
    else{
    	if(result=="success")
    		{
    		alert('♥');
    		}
    	else{
    		alert('이미 좋아요에 추가된 상품입니다.');
    	}
    		
    }
   
    } 
   ,error: function(){
      console.log(data);
      console.log('error');
     // alert('로그인이 필요합니다.');
      }
  }); 
  }
 });

</script>
<h3>관련상품</h3>
<hr>
 <!--관련상품 슬라이더  -->

<!--  <div id="wrapper"> -->
  <%-- 	<div class="owl-carousel owl-theme">
  	 <c:forEach var="prolist" items="${list}">
  		<div class="item">
  			<a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${prolist.product_no}"><img src="${prolist.product_thumb }" alt="thumb"><br>
  			<h4>${prolist.product_name }</h4></a>
  		</div>
  	</c:forEach> 
  	</div> --%>
<!--   </div> -->
 
 
 
 <div class="owl-carousel owl-theme">
  	
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  			<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  			<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  			<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  			<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  		<div class="item">
  			<img src="${dto.product_thumb }" alt="thumb">
  		</div>
  
  	</div>
 
 
<!--상품소개/후기/배송   -->
<a href="#ej_first"><div class="btn-group" role="group">
    <button type="button" class="btn btn-default">상품소개</button></div></a>
  <a href="#ej_second"><div class="btn-group" role="group">
    <button type="button" class="btn btn-default">후기</button></div></a>
  <a href="#ej_third"><div class="btn-group" role="group">
    <button type="button" class="btn btn-default">배송/교환/환불</button></div></a>
<!--상품소개/후기/배송   -->


   <%-- <!-- 레슨 신규 -->
   <div id="hs_us_newlesson" style="width: 80%; margin: auto;">
      <b class="" style="font-size: 25px;"> 관련상품 </b>
      <div class="hs_us_newlesson_container">
         <div class="hs_us_newlesson_g-scrolling-carousel">
            <div class="hs_us_newlesson_items">
               
                  <c:forEach var="list" items="${list}">
                     
                     <a href="">
                        <img class="hs_storecontent_cg_img" src="${list.product_thumb}" alt="">
                     <c:set var="procategory" value="${list.product_category }"/>
                     <c:choose>
                        <c:when test = "${procategory==1}">
                           <p>
                              <c:out value="운동"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${procategory==2}">
                           <p>  
                              <c:out value="교육"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${procategory==3}">
                           <p>
                              <c:out value="핸드메이드"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                        <c:when test = "${procategory==4}">
                           <p>
                              <c:out value="IT"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${procategory==5}">
                           <p>
                              <c:out value="요리"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>
                        </c:when>
                        <c:when test = "${procategory==6}">
                           <p> 
                              <c:out value="기타"/>
                              <span> ㆍ </span>
                              <c:out value="${newlessonlist.senior_nick}"/>
                           </p>   
                        </c:when>
                     </c:choose> 
                     <p>
                        <c:out value="${list.product_name}"/>
                     </p>
                     <hr style="margin: 0px 0px 5px;">
                     <p class="hs_us_newlesson_ATcost">
                      -  <fmt:formatNumber value="123" type="number" maxFractionDigits="3"/>원
                        <span class="hs_us_newlesson_BFcost">
                           <fmt:formatNumber value="324" type="number" maxFractionDigits="3"/>원
                        </span> 
                     </p>
                     <p>
                        <i class="fas fa-heart" style="color: rgb(224, 62, 82);"></i>
                           111
                     </p>
                     </a>
                     
                     
                     
                    
                      <span class="hs_user_store_newproduct_label">
                        <c:out value="100"/>%
                     </span> 
                  </c:forEach>
   
            </div>
         </div>
      </div>
   </div>

 --%>


<br>
<div id="ej_first">
상품소개
</div>
<hr>
<div id="content">

${dto.product_content}

</div>

<!-- 후기 -->
<br>
<div id="ej_second">
후기
</div>
<hr>
<table>
<c:forEach var="item" items="${reply}"> 

<tr>
<td>${item.member_id }</td>
<td class="reviewTitle">${item.pdreview_title }</td>
<td class="reviewCon">${item.pdreview_content }</td>
<td>${item.pdreview_date }</td>
</tr>
</c:forEach>
</table>

 <section class="replyList">
<ol>
</ol>
</section> 

<section class="replyForm">
<form role="form" method="post" autocomplete="off">
<input type="hidden" name="gdsNum" id="gdsNum" value="${dto.product_no }">
 <td><label>제목</label>
      <input type="text" id="pdreview_title" class="pdreview_title"name="pdreview_title">
<div class="input_area">
	<textarea name="pdreview_content" class="repCon" id="summernote" ></textarea>
</div>

<div class="input_area">
<button type="button" id="reply_btn" class="btn btn-primary">후기 남기기</button>

</form>

</section>

<script>
/* $(".reviewCon").hide(); */
 $(".reviewCon").slideUp();

$(".reviewTitle").click(function(){
	console.log(this);
	//전체 댓글내용 다보이니까
	//this 의 내용만 보이도록 수정하기
	/* $(".reviewCon").toggle(); */
	$(this).next(".reviewCon").slideToggle(100);
}); 

 $("#reply_btn").click(function(){

  var formObj = $(".replyForm form[role='form']");
  var gdsNum = $("#gdsNum").val();
  var pdreview_title= $(".pdreview_title").val();
  var repCon = $(".repCon").val();
  var member_id=$("#member_id").val();
  
  var data = {
		 product_no : gdsNum,
		 pdreview_content : repCon,
		 pdreview_title: pdreview_title,
		 member_id: member_id
    };

  
  $.ajax({
   url :"/todaylesson/ej_store_detail/registReply",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(){
	   
    console.log(data.product_no+" "+data.pdreview_content+" "+data.member_id);
    $(".repCon").val("");
    $(".pdreview_title").val("");
	 /* 
    if(data.member_id!=null)
    	{
    	alert('hello');
    	} */
    var str = "";
	str+="<tr><td>"+data.member_id+"</td>"
	str+="<td>"+data.pdreview_title+"</tr>"
	/* str+="<td>"+data.pdreview_content+"</td></tr>" */
   

  
  $("section.replyList ol").append(str);
  
    } 
   ,error: function(){
	   console.log(data);
	   console.log('error');
	   alert('구매한 고객만 후기를 작성 할 수 있습니다.');
	   }
  });
 });

</script>

   
<div id="ej_third">
배송/교환/환불
</div>
<hr>
<pre>
배송정책
회원 고객의 모든 주문 (제품 및 마일리지 제품) 및 비회원 고객의
 5만원 이상 주문에 한해 무료 배송 서비스를 이용하실 수 있습니다. (할인 혜택이 적용된 할인가 기준으로 함)


배송비	무료	회원 주문 (마일리지 제품 포함), 비회원 주문
배송시간
주문 상세 내역	기본 배송	반품	제주도	도서산간
주문 처리 시간	주문 접수 후 대부분 익일 출고됩니다. (공휴일 제외, 금~일 접수건은 월요일 순차 처리)
모든 주문 내역이 처리되기까지 영업일 기준 약 1~3일 정도가 소요될 수 있습니다.
배송업체
배송시간
(영업일 기준)	1 ~ 3일	2 ~ 4일	4 ~ 6일	4 ~ 7일
총 배송시간*
(영업일 기준)	최대 4일	최대 5일	최대 7일	최대 8일
배송조회
주문/배송 상태 조회를 원하실 경우, 배송확인 이메일에 제공된 송장번호로 진행 상태를 확인하시거나 홈페이지 “주문/배송 조회” 메뉴에서 확인하실 수 있으며,
 랑콤 공식 온라인 몰 고객케어센터 (전화 080-835-0094, 월~금 9:30~17:30) 로 연락 하시거나 1:1 온라인 문의를 통해 문의 하시면 답변을 받아보실 수 있습니다.

반품 및 교환 절차
반품 및 교환을 원하는 경우 고객케어센터 (080-835-0094)로 연락 하시어, 반품 및 교환 접수하시면 로젠 택배 기사님이 고객님의 제품을 픽업하러 방문하겠습니다 
(로젠 택배 기사님께서 픽업 날짜, 시간 및 장소 확인을 위해 고객님께 연락 드릴 예정입니다). 단순 변심에 의한 반품은 환불 계좌로 반품비를 입금해 주시기 바랍니다. 입금확인 후 환불 처리가 진행 됩니다. 

반품비 정책
회원과 비회원의 단순 변심 또는 취소로 반송을 할 경우에는 반품비 2,500원 (도서 산간 지역 5,000원)을 고객이 부담하셔야 하며, 지정된 계좌 (씨티은행) 로 입금해 주셔야 합니다.
 회원/비회원, 주문 취소 후 금액에 따라 배송비 및 반품비를 모두 지불해야 할 수 있으니, 자세한 내용은 하기 테이블 참고 부탁 드립니다.

상품불량 또는 상품 등의 내용이 표시/광고 내용과 다르거나 계약내용과 다르게 이행되어 교환/반품을 하시는 경우, 배송비 및 반품비는 무료입니다.

회원 & 비회원

반품비	무료	배송 전 주문 취소
제품불량으로 인한 반품, 교환
5,000원	회원의 단순 변심으로 인한 전체 주문 취소 및 수취 거절 (*배송비 부과)
10,000원	도서산간 거주 회원의 단순 변심으로 인한 전체 주문 취소 및 수취 거절 (배송비 부과)
(* 배송비 부과 : 제품 주문 시 배송비 지불 대상이 아니었으나, 반품 사유 및 반품 후의 총 주문금액에 따라 배송비를 부과하게 된 경우)
반품 및 교환 기간
반품 및 교환은 결제완료 후 15일 이내에만 가능합니다.
단, 제공받은 상품이 주문제품의 내용과 다르거나 계약 내용과 다르게 이행된 경우는 3개월 이내에 가능합니다.

반품 및 교환이 불가한 경우
단순 변심으로 인한 반품 또는 교환 요청이 결제완료 후 15일이 경과한 경우
상품이 훼손되거나 포장개봉 또는 제품의 사용으로 상품가치가 현저히 감소한 경우
제품 인도 시에 포함되어 있던 사은품이나 샘플이 누락된 경우
시간이 경과되어 재판매가 곤란할 정도로 상품 가치가 상실된 경우 (예: 한정판매 제품, 제품 사용기한의 경과 등)
특별한 할인 혜택이 적용된 제품의 경우

교환 안내
교환 및 일부 품목의 교환은 전체 반품 후 재주문 하셔야 합니다. 단순 변심에 의한 동일 제품의 옵션 (색상 등) 교환 이더라도 전체 반품 후 재주문 부탁 드립니다.

환불 기간
반품 상품이 판매자에게 도착하고 반품사유와 반품비가 확인되면 주문하신 결제 수단에 따라 환불이 진행됩니다. 처리 기간은 최대 2주 가량 소요될 수 있으며, 
신용카드의 경우는 카드사 또는 고객님의 결제일에 따라 처리일정이 달라질 수 있습니다.
주문/배송 불편 신고
주문하신 제품이 누락되었거나 하자 및 파손 등이 있을 경우, 1:1 온라인 문의를 통해 문의하시거나,
 랑콤 공식 온라인 몰 고객케어센터 (전화 080-835-0094, 월~금 9:30~17:30) 로 연락 주시기 바랍니다.
 보다 신속한 도움을 위해 주문번호를 함께 알려주시기 바랍니다. 고객님의 불편사항을 해소할 수 있도록 최선의 노력을 다하겠습니다.

기타
제품사용으로 인해 발생한 피부 트러블로 인한 교환, 반품 및 환불은 의사 소견서를 반드시 첨부하여야 합니다.
랑콤 공식 온라인 몰 (www.lancome.co.kr) 에서 구입한 제품은 오프라인 매장 (백화점 랑콤매장) 에서 반품하실 수 없습니다. 
랑콤 공식 온라인 몰 (www.lancome.co.kr) 에서 구매하신 고객님께서는 택배로 제품을 반송하실 수 있습니다.
 반품 하실 때에는 구입 시 제공된 샘플 및 사은품을 반드시 제품과 함께 반송해 주십시오.
위의 반품 및 교환에 대한 사항은 관련 법령이 판매자가 제시한 조건보다 우선합니다.

그 외 다른 매장에서 구매하신 랑콤 제품은 동일한 구매처로만 반품하실 수 있습니다.

국제 배송
현재 랑콤 공식 온라인 몰에서는 국제 배송 서비스를 제공하지 않습니다.
</pre>
</div>
</div>
<!--container  -->
    

</body>

</html>