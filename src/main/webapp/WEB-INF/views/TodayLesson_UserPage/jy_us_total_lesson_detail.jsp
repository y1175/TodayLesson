<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- Bootstrap4 summernote -->
   <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<!-- Bootstrap4 summernote -->

<!--summernote css/js/ko-kr-->
   <link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.css" rel="stylesheet">
   <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.11/summernote-bs4.js"></script>
   <script src="${pageContext.request.contextPath }/resources/JS/summernote-ko-KR.js"></script>
<!--summernote css/js/ko-kr-->
<!--owl carousel css, js-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.carousel.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.theme.default.css">
   <script src="${pageContext.request.contextPath}/resources/JS/owl.carousel.js"></script>
   <script src="${pageContext.request.contextPath}/resources/JS/owl.carousel.min.js"></script>
<!--owl carousel css, js-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_lesson_detail.css?ver=2">  


<style>
 .selected {
	display: none;
} 

#accordian li {
	list-style: none;
}

#accordian li>h1 {
	cursor: pointer;
}

li>ul {
	display: none;
}  


/* li>ul>li {
	color: #00F;
} */

</style>

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
	       nav: true,
	       autoplay:true,
	       autoplayTimeout:1000,
	       autoplayHoverPause:true
	   });
	   
	    $('.owl-carousel').owlCarousel();
	    
	    
	
	$('html, body').animate({
		scrollTop: $('html').offset().top
	}, 'slow');
	
	
	$('#summernote').summernote({
		placeholder : 'content',
		minHeight : 370,
		maxHeight : null,
		focus : true,
		lang : 'ko-KR'
	});	
	
	
	$("#pas").hide();
	
	$("#sec").change(function(){
        if($("#sec").is(":checked")){
        	$("#pas").show();
        }else{
        	$("#pas").hide();
        }
    });
	
	
	
	// 온라인 클래스의 경우 주소가 없음 > 그니까 온라인의 경우(온라인은 타입 3번) 아예 그 부분을 hide시켜버림
	
	let state = ${dto.lesson_type};
	console.log(state);
	if ( state == 3 ) {
		$('.layer').addClass('selected');
	} else {
		$('.layer').removeClass('selected');
	}
	
	
	// 썸머노트로 작성한 부분을 html코드로 변환해서 가져옴
	$('.summer').html();

	

    $('#sec').change(function() {
       if ( $('#sec').prop('checked')) {
       	document.getElementById('lesson_qa_reply_secret').value='Y';
       } else {
       document.getElementById('lesson_qa_reply_secret').value='N';
    }
    
       console.log( document.getElementById('lesson_qa_reply_secret').value);

    });
    
    
    

    
    
    

	
});



</script>




</head>
<body>

<div id="ej_container">

<input type="hidden" name="lesson_no" id="lesson_no" value="${dto.lesson_no}">


  <form role="form" method="post" id="form1" name="form" style="height: 400px">
 
<!--썸네일 이미지 원본 맨위에 보여줌-->
<div class="ej_top img">
<img src="${dto.lesson_thumb }" id="lesson_thumb" width="150%">
</div>

<div class="ej_top right">

<a href="${pageContext.request.contextPath}/todaylesson/ej_store_main/0"><img alt="banner" src="${pageContext.request.contextPath}/resources/IMG/lesson_detailbanner.png" ></a>
<br><br>

<c:choose>

		<c:when test="${dto.lesson_category == 1}">
			<c:out value="운동" />
		</c:when>

		<c:when test="${dto.lesson_category == 2}">
			<c:out value="교육" />
		</c:when>

		<c:when test="${dto.lesson_category == 3}">
			<c:out value="핸드메이드" />
		</c:when>

		<c:when test="${dto.lesson_category == 4}">
			<c:out value="it" />
		</c:when>

		<c:otherwise>
			<c:out value="요리" />
		</c:otherwise>

	</c:choose>
	
    /      
        
	<c:choose>

		<c:when test="${dto.lesson_type == 1}">
			<c:out value="원데이 클래스" />

		</c:when>

		<c:when test="${dto.lesson_type == 2}">
			<c:out value="다회성 클래스" />
		</c:when>

		<c:otherwise>
			<c:out value="온라인 클래스" />
		</c:otherwise>
	</c:choose>
	
	
<h2 id="lt"><c:out value="${dto.lesson_title}"></c:out></h2>


    <div class="hs_user_store_newprodct_cost">
     <jsp:useBean id="now" class="java.util.Date"  />
	<div style="display: none;">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
	<fmt:parseDate value="${dto.lesson_open_period}" var="dateFmt" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${dateFmt.time / (1000*60*60*24)}" integerOnly="true" var="isDate"  /> 
	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="itDate" /> 
	</div>
	
<span class="ej_top font">가격   </span>
<div id="ej_cost">
	<c:if test="${dto.lesson_earlybird eq 1 }">
	

	<c:if test="${itDate - isDate <= 7}">
	<h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.lesson_cost * 0.73}"/>원</h3>
	</c:if>
	
	<c:if test="${itDate - isDate > 7 }">
<span class="ej_top font middle logintxt"></span>		
<h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.lesson_cost}"/>원	</h3>
	</c:if>
	
	</c:if>
	
	<c:if test="${dto.lesson_earlybird eq 0}">
<span class="ej_top font middle logintxt"></span>	
<h3><fmt:formatNumber type="number" maxFractionDigits="3" value="${dto.lesson_cost}"/>원	</h3>
		</c:if>

</div>
	
	<br>
	
<span class="ej_top font middle logintxt"></span>로그인 후, 적립혜택이 제공됩니다.<br>


<span class="ej_top font">배송</span>배송비 무료<br>
<span class="ej_top font middle"></span>오후3시 주문상품까지 당일출고<br>
<br>

<c:set var="possible_junior" value="${dto.lesson_member_max - dto.lesson_junior_count}" />
최대 주니어 수 / 현재 수강 가능한 주니어 수 <br>
<c:out value="${dto.lesson_member_max}" /> / <c:out value="${possible_junior}" /><br>
<br>
<div class="ej_line top_right"></div>


<div class="ej_grid fist">
<input type="hidden" id= "is_it_possible" name="is_it_possible" value="${possible_junior}"/>
	<!-- 수강 가능 인원이 0이면 구매 못하게 -->
<%-- <a href="${pageContext.request.contextPath}/todaylesson/lesson_buy/${dto.lesson_no}"> </a>--%>
<button id="to_orderform" class="ej_btn" >결제하기</button></div>
<div class="ej_grid second">
<a href="#"><div class="fas fa-heart insert_my_like" ></div></a></div>
<div class="ej_grid third">
<a href="#"><div class="fa fa-shopping-cart insert_my_cart" ></div></a></div>

</div>


<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
</div>
 </form>

	<!-- 레슨명, 이런 기본적인건 옆에 배치 -->


	<script>
	
	
	
    // 풀캘

	
	
	let pos = $("#is_it_possible").val();
	
	 $("#to_orderform").click(function(){

		 let member_id='${pageContext.request.userPrincipal.name}';

		 
		 if (pos > 0) {
			 if(member_id==''){
				  alert('로그인이 필요합니다.');
				   	  
		 	} else {
			 
		 $("form").attr("action", "${pageContext.request.contextPath}/todaylesson/lesson_buy/${dto.lesson_no}");
		 $("form").submit();  	
		 	}
		 } else {
			alert("품절된 레슨은 수강하실 수 없습니다.");
		}
		 
	 });

	
$(".insert_my_like").click(function(){
	 
  let lesson_no=document.getElementById('lesson_no').value;
  let member_id='${pageContext.request.userPrincipal.name}';
  
  let data = {
		  lesson_no : lesson_no,
	      member_id: member_id,
	   };
	 
  
  console.log(member_id);
  
  if(member_id=='')
  {
  alert('로그인이 필요합니다.');
  
  } else {
 
  $.ajax({
   url :"${pageContext.request.contextPath }/todaylesson/lesson_like",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
   //request mapping value랑 맞추면되는듯
   type : "post",
   data : data,
   success : function(result){
	   if(result=="success"){
   		alert("♥");
   } else {
		alert("좋아요는 한번만 할 수 있습니다.");   
   }
   }  
   ,error: function(){
      console.log('error');
      }
  }); 
  }
 });
 


$(".insert_my_cart").click(function(){
	 
 let lesson_no=document.getElementById('lesson_no').value;
 let member_id='${pageContext.request.userPrincipal.name}';


 let data = {
	  lesson_no : lesson_no,
      member_id: member_id,
   };
 
 if(member_id=='')
 {
 alert('로그인이 필요합니다.');
 }else{

 $.ajax({
  url :"${pageContext.request.contextPath }/todaylesson/lesson_cart",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
  //request mapping value랑 맞추면되는듯
  type : "post",
  data : data,
  success : function(result){
	  if(result=="success"){
  		alert("장바구니에 레슨이 담겼습니다!");
   	}    	else if(result=="soldout")
		{
		alert('품절된 레슨은 장바구니에 추가할 수 없습니다.');
		}
    	else{
    		alert('이미 장바구니에 추가된 상품입니다.');
    	}
  }
  ,error: function(){
     console.log('error');
     }
 }); 
 }
});




</script>


<h3>관련상품</h3>
<div id="ej_line_narrow"></div>
 <!--관련상품 슬라이더  -->

	<div class="owl-carousel owl-theme">
  	 <c:forEach var="item" items="${list}" begin="1" end="12"> 
  		<div class="item">
  			<a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/${item.lesson_no}"><img src="${item.lesson_thumb }" alt="thumb"><br>
  			<h4>${item.lesson_title }</h4>
  			</a>
  			<br>
  			<fmt:formatNumber value="${item.lesson_cost}" type="number" maxFractionDigits="3"/>원 
  		</div>
  	</c:forEach>  
  	</div> 
  	
  	
  	 <div id='cssmenu'>
	<ul>
   		<li><a href="#ej_box_first">레슨</a></li>
   		<li><a href="#ej_box_second">문의</a></li>
   		<li><a href="#ej_box_third">후기</a></li>
   		<li><a href="#ej_box_fourth">배송/교환/환불</a></li>
 
	</ul>
</div>

<br>

<div id="ej_container_content">
<div class="ej_box first" id="ej_box_first">
<span class="ej_left"><h3>레슨소개</h3></span>

<img alt="banner" src="${pageContext.request.contextPath}/resources/IMG/lesson_point.png" >
 <img alt="topimg" src="${pageContext.request.contextPath}/resources/IMG/lesson_product_topimg.png" >
 
 
 <div class="lesson_info">
  <img alt="topimg" src="${pageContext.request.contextPath}/resources/IMG/lesson_info.png" >
 
 <c:if test="${dto.lesson_type != 3 }">
  <div class="lesson_info_content1" style="	 position: absolute;
     top:2630px;
     left:730px;
     font-size: 23px;">
     </c:if>
     
     <c:if test="${dto.lesson_type == 3 }">
  <div class="lesson_info_content1" style="	 position: absolute;
     top:2565px;
     left:700px;
     font-size: 23px;">
     </c:if>
     
     
	<c:choose>
		<c:when test="${dto.lesson_category == 1}">
			<c:out value="운동" />
		</c:when>

		<c:when test="${dto.lesson_category == 2}">
			<c:out value="교육" />
		</c:when>

		<c:when test="${dto.lesson_category == 3}">
			<c:out value="핸드메이드" />
		</c:when>

		<c:when test="${dto.lesson_category == 4}">
			<c:out value="it" />
		</c:when>

		<c:when test="${dto.lesson_category == 5}">
			<c:out value="요리" />
		</c:when>
		
		<c:otherwise>
			<c:out value="기타" />
		</c:otherwise>
	</c:choose>
	</div>
	
	 <c:if test="${dto.lesson_type != 3 }">
	
	<div class="lesson_info_content2" style="	 position: absolute;
     top:2690px;
     left:700px;
     font-size: 23px;">
     </c:if>
     
          <c:if test="${dto.lesson_type == 3 }">
  <div class="lesson_info_content2" style="	 position: absolute;
     top:2627px;
     left:700px;
     font-size: 23px;">
     </c:if>
     
     
     
	<c:out value="${dto.lesson_number}" />
</div>
</div>
 </div>
 
	<div class="summer">${dto.lesson_content}</div>



	

	
  	
<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">




	<br><h3> <b>레슨 판매 기간</b></h3>
	<br>
	<h4>★<c:out value="${dto.lesson_open_period}" />
	~
	<c:out value="${dto.lesson_close_period}" />★</h4>

<br>
	<div class="layer">
	<br>
	
	
		 <h3><b>레슨 일자 및 시간</b></h3><br>
		<h4>★<c:out value="${dto.lesson_date_time}" />★</h4>
		<br> 
		<br>
		<h3><b>레슨 주소</b></h3>
		<br> 우편번호
		<h4><c:out value="${dto.lesson_zipno}" /></h4>
		<br> 주소
		<h4><c:out value="${dto.lesson_addr}" /></h4>
		<br>
		<!-- 여기에 map가져오기 -->

<div id="map" style="width:750px;height:350px; margin: 0px auto"></div>

<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c30db34dfed42d05a59b83a50829000e"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(${dto.lesson_lat}, ${dto.lesson_long}), // 지도의 중심좌표
	        level: 1, // 지도의 확대 레벨
	        mapTypeId : kakao.maps.MapTypeId.ROADMAP // 지도종류
	    }; 
	// 지도를 생성한다 
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	// 지도에 마커를 생성하고 표시한다
	var marker = new kakao.maps.Marker({
	    position: new kakao.maps.LatLng(${dto.lesson_lat}, ${dto.lesson_long}), // 마커의 좌표
	    map: map // 마커를 표시할 지도 
	});
</script>


	</div>
	
	<br>
	<br>
	<h4>안녕하세요, 시니어 <c:out value="${dto.lesson_senior_title}" /> 입니다.</h4>
	<br>
	<div class="summer" style="margin-bottom: 30px;"><h4>${dto.lesson_senior_content}</h4></div>

<button onclick="location.href='${pageContext.request.contextPath }/todaylesson/total_lesson_list'" class="ej_btn" id="to_list">목록으로</button>


<div class="ej_box second" id="ej_box_second">
<span class="ej_left"><h3>문의</h3></span>
<hr>
	
		
			<div>

				
				<!--작성된 문의글 목록  -->
		<form id="commentListForm" name="commentListForm" method="post">
			<div id="commentList"></div>
		</form>
		<hr>
		
	<form id="commentForm" name="commentForm" method="post">
	    <div class="jy_left">
        <label>궁금한 게 있으신가요?</label><br>
          <input type="text" id="lesson_qa_reply_title" name="lesson_qa_reply_title" placeholder="제목을 입력하세요" class="form-control" required="required">
         </div>
								<textarea rows="3" cols="140" id="lesson_qa_reply_content"
									name="lesson_qa_reply_content" placeholder="댓글을 입력하세요" class="form-control"></textarea>
									<br><br>
									
		<div class="jy_right">
		<label>비밀글</label><input type="checkbox" name="sec" id="sec" >
		<a href='#' onClick="fn_comment('${dto.lesson_no }')" class="ej_btn">등록</a>
		</div>
				
				
				<input type="hidden" name="lesson_qa_reply_secret" id="lesson_qa_reply_secret" value='N'>
				<input type="hidden" name="lesson_no" value="${dto.lesson_no}" id="lesson_no"> 
				<input type="hidden" name="senior_id" value="${dto.member_id}" id="senior_id"> 
				<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}" />
			</div>
		</form>




<div class="ej_box third"  id="ej_box_third">
<span class="ej_left"><h3>후기</h3></span>
<hr>
</div>
		<form id="reviewListForm" name="reviewListForm" method="post">
			<div id="reviewList"></div>
		</form>
	
	<button id="jy_openbtn" class="ej_btn">후기남기기</button>
	

		<form id="reviewForm" name="reviewForm" method="post">
			<br>
			<br>
		
					<label>제목</label>
                        <input type="text" id="lreview_title" name="lreview_title" class="form-control" placeholder="리뷰 제목을 입력하세요" required="required">
                        <br>
						<textarea rows="3" cols="30" id="summernote" name="lreview_content" placeholder="리뷰 내용을 입력하세요"></textarea>
								<br>
								<a href='#' onClick="fn_review('${dto.lesson_no }')" class="ej_btn">리뷰 등록</a>
							
							
							
				<input type="hidden" name="lesson_no" value="${dto.lesson_no}" id="lesson_no"> 
				<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}" />
			
		</form>
		
		
	</div>
	
	<div class="ej_box fourth"  id="ej_box_fourth">
<span class="ej_left"><h3>배송/교환/환불</h3></span>
</div>
<hr>
<img alt="delivery_rule" src="${pageContext.request.contextPath}/resources/IMG/delivery_rule.png">
	
	</div>

	</div>

	<script>
	/* 후기남기기 버튼(silde up, down) */
	$('#reviewForm').slideUp();
	$('#jy_openbtn').click(function(){
		$('#reviewForm').toggle();
	});
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(lesson_no){
    
	let member_id ='${pageContext.request.userPrincipal.name}';
		
	 if(member_id=='')
     {
	 $("#lesson_qa_reply_title").val("");
     $("#lesson_qa_reply_content").val("");
     alert('로그인이 필요합니다.');
     return false;
     } 
	 
    $.ajax({
        type:'POST',
        url : "<c:url value='${pageContext.request.contextPath }/todaylesson/lesson_detail/${dto.lesson_no}/lesson_reply_insert'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
            	alert("댓글 등록 완료!");
                getCommentList();
                $("#lesson_qa_reply_title").val("");
                $("#lesson_qa_reply_content").val("");
                $("#lesson_qa_reply_password").val("");
                $('input[name="sec"]').prop("checked", false);
            	$("#pas").hide();

            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}


  
  
/**
 * 초기 페이지 로딩시 댓글, 리뷰 불러오기
 */
$(function(){
    
    getCommentList();
    getLreviewList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){
	
	let member_id ='${pageContext.request.userPrincipal.name}';
	let senior_id = document.getElementById('senior_id').value;
	//console.log(member_id);
	//console.log(senior_id);
    $.ajax({
        type:'get',
        url : "<c:url value='${pageContext.request.contextPath }/todaylesson/lesson_detail/${dto.lesson_no}/lesson_reply_list'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            let html = "";
            let cCnt = data.length;
       
            
   if (data.length > 0){
		console.log(data);
		

                for(i=0; i<data.length; i++){
                   if (i == 0) {
                	   //console.log(data[i].member_id);
                   	    html += "<div id='accordian'>";
                   	    html += "<ul><li><h5><b>"+data[i].member_id+"</b>               " +data[i].lesson_qa_reply_title +"<span class='ico_ar'>▼</span></h5>";
                        html += "<ul><li><h5>"+data[i].lesson_qa_reply_content +"            "+"<span class='date'>"+data[i].lesson_qa_register_date+  "</li></h5>";
                        if (data[i].lesson_qa_answer_content != null) {
                            html += "<li><h5><b style='color : red;'><i class='far fa-user'></i>시니어 "+ "</b> " +data[i].lesson_qa_answer_content + "</li>";
						}
              
						 if (member_id == senior_id) { 
                        	
							 console.log(data[i].member_id);
                        	html += "<li class='ans'>";
				            html += "<input type ='hidden' id = 'lesson_qa_reply_secret"+ data[i].lesson_qa_no +"' name='lesson_qa_reply_secret' value="+data[i].lesson_qa_reply_secret+">";
                           	html += "<input type ='hidden' name='lesson_qa_no' value="+data[i].lesson_qa_no+">";
	                        html += "<input type = 'text' class='lesson_qa_answer_content' id = 'lesson_qa_answer_content"+data[i].lesson_qa_no+"' name='lesson_qa_answer_content' placeholder='댓글을 입력하세요' class='form-control' >"; 
                        	html += "<input type ='button' onClick='fn_answer("+data[i].lesson_qa_no+")' class='ej_btn' value='등록'></li></ul></li>"; 
							 
                        	}  else { 
                        
                        		html+= "</ul></li>"; 
                        	
                       		}
                        
                        
                   } else if(i == data.length-1){
                  
                  		html += "<li><h5><b>"+data[i].member_id+"</b>    " +data[i].lesson_qa_reply_title +"<span class='ico_ar'>▼</span></h5>";
                        html += "<ul><li><h5>"+data[i].lesson_qa_reply_content +"  "+"<span class='date'>"+data[i].lesson_qa_register_date +"</span>"+"</li>";
                        if (data[i].lesson_qa_answer_content != null) {
                            html += "<li><h5><b style='color : red;'><i class='far fa-user'></i>시니어 "+ "</b> " +data[i].lesson_qa_answer_content + "</h5></li>";
						}
						 if (member_id == senior_id) { 
							 console.log(data[i].member_id);
	                        html += "<li class='ans'>";
				             html += "<input type ='hidden' id = 'lesson_qa_reply_secret"+ data[i].lesson_qa_no +"' name='lesson_qa_reply_secret' value="+data[i].lesson_qa_reply_secret+">";
                           	html += "<input type ='hidden' name='lesson_qa_no' value="+data[i].lesson_qa_no+">";
	                        html += "<input type = 'text' class='lesson_qa_answer_content' id = 'lesson_qa_answer_content"+data[i].lesson_qa_no+"' name='lesson_qa_answer_content' placeholder='댓글을 입력하세요' class='form-control' >"; 
                        	html += "<input type='button' onClick='fn_answer("+ data[i].lesson_qa_no +")'  class='ej_btn' value='등록'></li></ul></li></ul></div>"; 
                        
                        }  else { 
                        
                        	html+= "</ul></li></ul></div>"; 
                        	
                        }
 
                  		
                   } else {
                	   
                        html += "<li><h5><b>"+data[i].member_id+" </b>   " +data[i].lesson_qa_reply_title +"<span class='ico_ar'>▼</span></h6>";
                        html += "<ul><li><h5>"+data[i].lesson_qa_reply_content +"  "+"<span class='date'>"+data[i].lesson_qa_register_date+"</span>"+ "</li>";
                        if (data[i].lesson_qa_answer_content != null) {
                            html += "<li><h5><b style='color : red;'><i class='far fa-user'></i>시니어 "+ "</b> " +data[i].lesson_qa_answer_content + " </h5></li>";
						}
						 if (member_id == senior_id) { 
							 console.log(data[i].member_id);
	                         html += "<li class='ans'>";
				             html += "<input type ='hidden' id = 'lesson_qa_reply_secret"+ data[i].lesson_qa_no +"' name='lesson_qa_reply_secret' value="+data[i].lesson_qa_reply_secret+">";
			                 html += "<input type ='hidden' name='lesson_qa_no' value="+data[i].lesson_qa_no+">";
		                     html += "<input type = 'text' class='lesson_qa_answer_content' id = 'lesson_qa_answer_content"+data[i].lesson_qa_no+"' name='lesson_qa_answer_content' placeholder='댓글을 입력하세요' class='form-control' >"; 
                        	 html += "<input type='button' onClick='fn_answer(" +data[i].lesson_qa_no+")'  class='ej_btn' value='등록'></li></ul></li>"; 
                        
                        }  else { 
                        
                        	html+= "</ul></li>"; 
                        	
                        }
 
                   }

                }
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
            
             $(function(){
            	$("#accordian h5").click(function(){
            		$("#accordian ul ul").hide();
            		$('.ico_ar').css('transform','none');
            		if(!$(this).next().is(":visible"))
            		{
            			$(this).next().show();
            			//$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
            		}
            	})
            }) 
            
        },
        error:function(request,status,error){
            
       }
        
    });
}




//답댓
function fn_answer(lesson_qa_no){

	console.log(lesson_qa_no);
	
	let senior_id = '${pageContext.request.userPrincipal.name}';
	let lesson_no = document.getElementById('lesson_no').value;
	let lesson_qa_answer_content = document.getElementById('lesson_qa_answer_content'+lesson_qa_no).value;
	let lesson_qa_reply_secret = document.getElementById('lesson_qa_reply_secret'+lesson_qa_no).value;

	console.log(senior_id);
	
	
	
	let data = {
			
			lesson_qa_answer_content : lesson_qa_answer_content,
			senior_id : senior_id,
			lesson_qa_no : lesson_qa_no,
			lesson_no : lesson_no,
			lesson_qa_reply_secret : lesson_qa_reply_secret
	}
	
	console.log('dddd',data);
	
 $.ajax({
     type:'post',
     url : '${pageContext.request.contextPath }/todaylesson/lesson_detail/${dto.lesson_no}/lesson_answer_insert',
     data : data,
     success : function(result){
         if(result=="success")
         {
         	alert("답변 등록 완료!");
             getCommentList();
             $("#lesson_qa_answer_content"+lesson_qa_no).val("");
             //$("#lesson_qa_reply_content").val("");
             //$('input[name="sec"]').prop("checked", false);
         	//$("#pas").hide();

         } else if (result == "has_answer"){
        	 alert("답변은 하나만 달 수 있습니다.");
             getCommentList();
             $("#lesson_qa_answer_content"+lesson_qa_no).val("");

         } else {
        	 alert("추가 실패");
             getCommentList();
             $("#lesson_qa_answer_content"+lesson_qa_no).val("");
		}
     },
     error:function(request,status,error){
         //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
    }
     
 });
	
}



/*
 * 리뷰 등록하기(Ajax)
 */
function fn_review(lesson_no){
    
	let member_id ='${pageContext.request.userPrincipal.name}';
		
	 if(member_id=='')
     {
	 $("#lreview_title").val("");
     $("#lreview_content").val("");
     alert('로그인이 필요합니다.');
     return false;
     } 
	 
    $.ajax({
        type:'POST',
        url : '${pageContext.request.contextPath }/todaylesson/lesson_detail/${dto.lesson_no}/lesson_review_insert',
        data:$("#reviewForm").serialize(),
        success : function(data){
            if(data=="success")
            {
            	alert("리뷰 등록 완료!");
            	getLreviewList();
                $("#lreview_title").val("");
                $("#lreview_content").val("");

            }
        },
        error:function(request,status,error){
     	   console.log('error');
     	   alert('구매한 고객만 후기를 작성 할 수 있습니다.');
       }
        
    });
}



/**
 * 리뷰 불러오기(Ajax)
 */
function getLreviewList(){
	
    $.ajax({
        type:'get',
        url : '${pageContext.request.contextPath }/todaylesson/lesson_detail/${dto.lesson_no}/lesson_lreview_list',
        dataType : 'json',
        data:$("#reviewForm").serialize(),
        contentType: 'application/x-www-form-urlencoded; charset=UTF-8', 
        success : function(data){
            
            let html = "";
            let cCnt = data.length;
       
            
   if (data.length > 0){
		console.log(data);
                for(i=0; i<data.length; i++){
                   if (i == 0) {
                   	    html += "<div id='accordian'>";
                   	    html += "<ul><li><h5><b>"+data[i].member_id+"</b> " +data[i].lreview_title + " "+data[i].lreview_date+"<span class='ico_ar'>▼</span></h5>";
                        html += "<ul><div class='summer'><li>"+data[i].lreview_content+"</li></div></ul></li>";
                       
           			 }else if(i == data.length-1){
                         
                   		html += "<li><h5><b>"+data[i].member_id+" </b>   " +data[i].lreview_title + " "+data[i].lreview_date+"<span class='ico_ar'>▼</span></h5>";
                        html += "<ul><div class='summer'><li>"+data[i].lreview_content +"</li></div></ul></li></ul></div>";
           			 } else {
           				html += "<li><h5><b>"+data[i].member_id+"</b>    " +data[i].lreview_title + " "+data[i].lreview_date+"<span class='ico_ar'>▼</span></h5>";
                        html += "<ul><div class='summer'><li>"+data[i].lreview_content +"</li></div></ul></li>";

           			 }
                }
   			} else {
                
              			html += "<div>";
              			html += "<div><table class='table'><h6><strong>등록된 리뷰가 없습니다.</strong></h6>";
               		    html += "</table></div>";
                		html += "</div>";
               		 
            }
            
            $("#cCnt").html(cCnt);
            $("#reviewList").html(html);
            
            
            $(function(){
            	$("#accordian h5").click(function(){
            		$("#accordian ul ul").hide();
            		$('.ico_ar').css('transform','none');
            		if(!$(this).next().is(":visible"))
            		{
            			$(this).next().show();
            			//$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
            		}
            	})
            }); 
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
    
    

   </script>

</body>
</html>