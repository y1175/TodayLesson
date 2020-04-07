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
   <script src="/resources/JS/summernote-ko-KR.js"></script>
<!--summernote css/js/ko-kr-->
<!--owl carousel css, js-->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.carousel.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/owl.theme.default.css">
   <script src="${pageContext.request.contextPath}/resources/JS/owl.carousel.js"></script>
   <script src="${pageContext.request.contextPath}/resources/JS/owl.carousel.min.js"></script>
<!--owl carousel css, js-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_lesson_detail.css">  

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

li>ul>li {
	color: #00F;
}
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
	       nav: true/* 
	       autoplay:true,
	       autoplayTimeout:1000,
	       autoplayHoverPause:true */
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


  <form role="form" method="post" id="form1" name="form" >
 
<!--썸네일 이미지 원본 맨위에 보여줌-->
<div class="ej_top img">
<img src="${dto.lesson_thumb }" id="lesson_thumb" width="60%">
</div>

<div class="ej_top right">
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
	<br>
          
<h3><c:out value="${dto.lesson_title}"></c:out><br></h3>
<h4 class="beforecost" id="ej_cost"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.lesson_cost }"/>원
</h4>

	<jsp:useBean id="now" class="java.util.Date"  />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" /></div>
	<fmt:parseDate value="${dto.lesson_open_period}" var="dateFmt" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${dateFmt.time / (1000*60*60*24)}" integerOnly="true" var="isDate"  /> 
	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="itDate" /> 
	<c:if test="${dto.lesson_earlybird eq 1 }">
	<c:if test="${itDate - isDate <= 7}">
	<c:out value="${dto.lesson_cost* 0.82}"/>
	</c:if>
	</c:if>
		<c:if test="${dto.lesson_earlybird eq 0}">
		<c:out value="${dto.lesson_cost}" />
	</c:if>
	<c:if test="${itDate - isDate > 7 }">
	    <c:out value="${dto.lesson_cost}" />
	</c:if>
	



수량 <input type=text size="1" name="pdcount" id="pdcount" placeholder="1" size="2" value=1 required="required" readonly="readonly"><br>
배송비 무료<br>


<div class="ej_grid fist">
	<input type="hidden" name="is_it_possible" value="${possible_junior}"/>
	<!-- 수강 가능 인원이 0이면 구매 못하게 -->
	
<c:if test="${possible_junior != 0}">
<input type="button" value="구매하기" id="to_orderform" class="ej_btn"  onclick="location.href='${pageContext.request.contextPath }/todaylesson/lesson_buy/${dto.lesson_no}'"><br></div>
</c:if>

<div class="ej_grid second">
<a href="#"><div class="fas fa-heart insert_my_like" ></div></a></div>
<div class="ej_grid third">
<a href="#"><div class="fa fa-shopping-cart insert_my_cart" ></div></a></div>


<input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>
 </form>


	<!-- 레슨명, 이런 기본적인건 옆에 배치 -->


	<script>

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
   url :"/todaylesson/lesson_like",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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
  url :"/todaylesson/lesson_cart",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
  //request mapping value랑 맞추면되는듯
  type : "post",
  data : data,
  success : function(result){
	  if(result=="success"){
  		alert("장바구니에 레슨이 담겼습니다!");
   	} else {
		alert("레슨은 장바구니에 딱 한번만 담을 수 있습니다.");   
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
  			<a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/${list.lesson_no}"><img src="${list.lesson_thumb }" alt="thumb"><br>
  			<h4>${list.lesson_title }</h4>
  			</a>
  			<br>
  			<fmt:formatNumber value="${list.lesson_cost}" type="number" maxFractionDigits="3"/>원 
  		</div>
  	</c:forEach>  
  	</div> 
  	
  	
  	 <div id='cssmenu'>
	<ul>
   		<li><a href="#ej_box_first">상품소개</a></li>
   		<li><a href="#ej_box_second">문의</a></li>
   		<li><a href="#ej_box_third">후기</a></li>
   		<li><a href="#ej_box_fourth">배송/교환/환불</a></li>
 
	</ul>
</div>

<br>

<div id="ej_container_content">
<div class="ej_box first" id="ej_box_first">
<span class="ej_left"><h3>레슨소개</h3></span>
 <img alt="topimg" src="${pageContext.request.contextPath}/resources/IMG/lesson_product_topimg.png" >
 
 <br> 이 강의는 "
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
	"에 관심이 있는 분들을 위한 강의이며,
	<br> 총
	<c:out value="${dto.lesson_number}" />
	강으로 구성되어 있습니다.
	
 
	<div class="summer">${dto.lesson_content}</div>


수강 가능한 최대 주니어수
	<br>
	<c:out value="${dto.lesson_member_max}" />
	
	<br> 
	
	현재 수강 중인 주니어 수
	<br>
	<c:out value="${dto.lesson_junior_count}" />
	<br> 수강 가능한 주니어 수
	<br>
	<c:set var="possible_junior"
		value="${dto.lesson_member_max - dto.lesson_junior_count}" />
	<c:out value="${possible_junior}" />
	

	
  	
<input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}">




	<br> 레슨 판매 기간
	<br>
	<c:out value="${dto.lesson_open_period}" />
	~
	<c:out value="${dto.lesson_close_period}" />
	<br> 레슨 타입
	<br>
	<c:choose>

		<c:when test="${dto.lesson_type == 1}">
			<c:out value="원데이 클래스" />
			<br>
		</c:when>

		<c:when test="${dto.lesson_type == 2}">
			<c:out value="다회성 클래스" />
			<br>
		</c:when>

		<c:otherwise>
			<c:out value="온라인 클래스" />
			<br>
		</c:otherwise>

	</c:choose>

	<div class="layer">
		레슨 일자 및 시간
		<c:out value="${dto.lesson_date_time}" />
		<br> 레슨 주소<br> 우편번호
		<c:out value="${dto.lesson_zipno}" />
		<br> 주소
		<c:out value="${dto.lesson_addr}" />
		<br>
		<!-- 여기에 map가져오기 -->

		<div id="map" style="width: 750px; height: 350px;"></div>

		<script
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c30db34dfed42d05a59b83a50829000e"></script>
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

	시니어 명
	<c:out value="${dto.lesson_senior_title}" />
	<br> 시니어 소개
	<div class="summer">${dto.lesson_senior_content}</div>
	<a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list">목록으로</a>


<div class="ej_box second" id="ej_box_second">
<span class="ej_left"><h3>문의</h3></span>
	<div class="container">
		<form id="commentForm" name="commentForm" method="post">
			<br>
			<br>
			<div>
				<div>
					<span><strong>Comments</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
							<td>비밀글 <input type="checkbox" name="sec" id="sec">
							<input type="hidden" name="lesson_qa_reply_secret" id="lesson_qa_reply_secret" value='N'> 
							
                        <label>제목</label> 
                        
                        <input type="text" id="lesson_qa_reply_title" name="lesson_qa_reply_title">
								<textarea rows="3" cols="30" id="lesson_qa_reply_content"
									name="lesson_qa_reply_content" placeholder="댓글을 입력하세요"></textarea>
								<br>
								<div>
									<a href='#' onClick="fn_comment('${dto.lesson_no }')" class="btn pull-right btn-success">등록</a>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<input type="hidden" name="lesson_no" value="${dto.lesson_no}" id="lesson_no"> 
				<input type="hidden" name="senior_id" value="${dto.member_id}" id="senior_id"> 
				<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}" />
			</div>
		</form>
	</div>
	<div class="container">
		<form id="commentListForm" name="commentListForm" method="post">
			<div id="commentList"></div>
		</form>
	</div>


<div class="container">
<div class="ej_box third"  id="ej_box_third">
<span class="ej_left"><h3>후기</h3></span>
</div>
		<form id="reviewForm" name="reviewForm" method="post">
			<br>
			<br>
			<div>
				<div>
					<span><strong>리뷰</strong></span> <span id="cCnt"></span>
				</div>
				<div>
					<table class="table">
						<tr>
                        <td><label>제목</label>
                        <input type="text" id="lreview_title" name="lreview_title">
						<textarea rows="3" cols="30" id="summernote" name="lreview_content" placeholder="리뷰 내용을 입력하세요"></textarea>
								<br>
								<div>
									<a href='#' onClick="fn_review('${dto.lesson_no }')" class="btn pull-right btn-success">리뷰 등록</a>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<input type="hidden" name="lesson_no" value="${dto.lesson_no}" id="lesson_no"> 
				<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}" />
			</div>
		</form>
	</div>
	<div class="container">
		<form id="reviewListForm" name="reviewListForm" method="post">
			<div id="reviewList"></div>
		</form>
	</div>
	</div>
	<div class="ej_box fourth"  id="ej_box_fourth">
<span class="ej_left"><h3>배송/교환/환불</h3></span>
</div>
<hr>
<img alt="delivery_rule" src="${pageContext.request.contextPath}/resources/IMG/delivery_rule.png">
	
	</div>
</div>

	<script>
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
        url : "<c:url value='/todaylesson/lesson_detail/${dto.lesson_no}/lesson_reply_insert'/>",
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
    $.ajax({
        type:'get',
        url : "<c:url value='/todaylesson/lesson_detail/${dto.lesson_no}/lesson_reply_list'/>",
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
                   	    html += "<div id='accordian'>";
                   	    html += "<ul><li><h6>"+data[i].member_id+" " +data[i].lesson_qa_reply_title +"<span class='ico_ar'>▼</span></h6>";
                        html += "<ul><li>"+data[i].lesson_qa_reply_content +"  "+data[i].lesson_qa_register_date+  "</li>";
                        if (data[i].lesson_qa_answer_content != null) {
                            html += "<li>시니어 "+ " " +data[i].lesson_qa_answer_content + " " +data[i].lesson_qa_register_date + "</li>";
						}
              
						 if (member_id == senior_id) { 
                        	
							
                        	html += "<li>";
				            html += "<input type ='hidden' id = 'lesson_qa_reply_secret"+ data[i].lesson_qa_no +"' name='lesson_qa_reply_secret' value="+data[i].lesson_qa_reply_secret+">";
                           	html += "<input type ='hidden' name='lesson_qa_no' value="+data[i].lesson_qa_no+">";
	                        html += "<input type = 'text' id = 'lesson_qa_answer_content"+data[i].lesson_qa_no+"' name='lesson_qa_answer_content' placeholder='댓글을 입력하세요'>"; 
                        	html += "<input type ='button' onClick='fn_answer("+data[i].lesson_qa_no+")' class='btn pull-right btn-success' value='등록'></li></ul></li>"; 
							 
                        	}  else { 
                        
                        		html+= "</ul></li>"; 
                        	
                       		}
                        
                        
                   } else if(i == data.length-1){
                  
                  		html += "<li><h6>"+data[i].member_id+"    " +data[i].lesson_qa_reply_title +"<span class='ico_ar'>▼</span></h6>";
                        html += "<ul><li>"+data[i].lesson_qa_reply_content +"  "+data[i].lesson_qa_register_date + "</li>";
                        if (data[i].lesson_qa_answer_content != null) {
                            html += "<li>시니어 "+ " " +data[i].lesson_qa_answer_content + " " +data[i].lesson_qa_register_date + "</li>";
						}
						 if (member_id == senior_id) { 
                        	
	                        html += "<li>";
				             html += "<input type ='hidden' id = 'lesson_qa_reply_secret"+ data[i].lesson_qa_no +"' name='lesson_qa_reply_secret' value="+data[i].lesson_qa_reply_secret+">";
                           	html += "<input type ='hidden' name='lesson_qa_no' value="+data[i].lesson_qa_no+">";
	                        html += "<input type = 'text' id = 'lesson_qa_answer_content"+data[i].lesson_qa_no+"' name='lesson_qa_answer_content' placeholder='댓글을 입력하세요'>"; 
                        	html += "<input type='button' onClick='fn_answer("+ data[i].lesson_qa_no +")' class='btn pull-right btn-success' value='등록'></li></ul></li></ul></div>"; 
                        
                        }  else { 
                        
                        	html+= "</ul></li></ul></div>"; 
                        	
                        }
 
                  		
                   } else {
                	   
                        html += "<li><h6>"+data[i].member_id+"    " +data[i].lesson_qa_reply_title +"<span class='ico_ar'>▼</span></h6>";
                        html += "<ul><li>"+data[i].lesson_qa_reply_content +"  "+data[i].lesson_qa_register_date+ "</li>";
                        if (data[i].lesson_qa_answer_content != null) {
                            html += "<li>시니어 "+ " " +data[i].lesson_qa_answer_content + " " +data[i].lesson_qa_register_date + "</li>";
						}
						 if (member_id == senior_id) { 
                        	
	                         html += "<li>";
				             html += "<input type ='hidden' id = 'lesson_qa_reply_secret"+ data[i].lesson_qa_no +"' name='lesson_qa_reply_secret' value="+data[i].lesson_qa_reply_secret+">";
			                 html += "<input type ='hidden' name='lesson_qa_no' value="+data[i].lesson_qa_no+">";
		                     html += "<input type = 'text' id = 'lesson_qa_answer_content"+data[i].lesson_qa_no+"' name='lesson_qa_answer_content' placeholder='댓글을 입력하세요'>"; 
                        	 html += "<input type='button' onClick='fn_answer(" +data[i].lesson_qa_no+")' class='btn pull-right btn-success' value='등록'></li></ul></li>"; 
                        
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
            	$("#accordian h6").click(function(){
            		$("#accordian ul ul").slideUp();
            		$('.ico_ar').css('transform','none');
            		if(!$(this).next().is(":visible"))
            		{
            			$(this).next().slideDown();
            			$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
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
     url : '/todaylesson/lesson_detail/${dto.lesson_no}/lesson_answer_insert',
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
        url : '/lesson_detail/${dto.lesson_no}/lesson_review_insert',
        data:$("#reviewForm").serialize(),
        success : function(data){
            if(data=="success")
            {
            	alert("리뷰 등록 완료!");
                getReviewList();
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
        url : '/todaylesson/lesson_detail/${dto.lesson_no}/lesson_lreview_list',
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
                   	    html += "<ul><li><h6>"+data[i].member_id+" " +data[i].lreview_title + " "+data[i].lreview_date+"<span class='ico_ar'>▼</span></h6>";
                        html += "<ul><li><div class='summer'>"+data[i].lreview_content+"</div></li></ul></li>";
                       
           			 }else if(i == data.length-1){
                         
                   		html += "<li><h6>"+data[i].member_id+"    " +data[i].lreview_title + " "+data[i].lreview_date+"<span class='ico_ar'>▼</span></h6>";
                        html += "<ul><li><div class='summer'>"+data[i].lreview_content +"</div></li></ul></li></ul></div>";
           			 } else {
           				html += "<li><h6>"+data[i].member_id+"    " +data[i].lreview_title + " "+data[i].lreview_date+"<span class='ico_ar'>▼</span></h6>";
                        html += "<ul><li><div class='summer'>"+data[i].lreview_content +"</div></li></ul></li>";

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
            	$("#accordian h6").click(function(){
            		$("#accordian ul ul").slideUp();
            		$('.ico_ar').css('transform','none');
            		if(!$(this).next().is(":visible"))
            		{
            			$(this).next().slideDown();
            			$(this).find('.ico_ar:eq(0)').css('transform','rotate(180deg)');
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