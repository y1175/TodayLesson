<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script> 
<!-- jQuery -->
<!--  -->
<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->
<style>
.ej_grid{
display: inline-block;
width: 80px;
height: 70px;
}
/* .ej_grid a div{
width:140px;
color: solid black;
} */
div.fas.fa-check-double{

}
/* Main Bunner 슬라이더(자동 좌우적용) */
body{
	margin : opx auto;
	padding: 0; 
} 

.hs_us_home_mainBanner{
	width:100%;
	margin-top: -10px;
	height: 400px;
}

.hs_us_home_mainBannerbox{
	position:relative;
	overflow: hidden;
	height: 400px;
	width: 100%;
	background-color: pink
}
.hs_us_home_mainBannerslide{
	width:100%; /* 이미지 크기 * 이미지 개수 + 여유 */
	display: inline; 
    /* position:absolute;  이거 풀면 이미지 넘어가면서 배경색 같이나옴 */
}

.hs_us_home_mainBannerslide>a>img{
	width:100%;
	height : 400px;
	position: absolute;
	transition: all 2s;
}  
/* Main Bunner 슬라이더(자동 좌우적용) */

/* 신규레슨 */
/* 슬라이더 묶는 박스 */
.hs_us_newlesson_container {
    max-width: 100%;
    /* margin-bottom: 30px; */
}
/* 슬라이더 안 a tag에 포함된 모든것에 공통적으로 적용  */
.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items a {
    display: inline-block;
    notice the comments between inline-block items margin-right: 10px;
    width: 23%;
     margin: 12.5px;
    /*text-align: center;*/
    text-decoration: none;
}
/* 썸네일 */
.hs_storecontent_cg_img{
	width: 100%;
	/* padding: 15px 0px; */
    /* height:200px; */
}
/* p tag 공통적용 */
.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items a p {
    margin: 0px;
    color: rgb(53, 54, 58);
    position: relative;
    /* text-align: center; */
}
/* 카테고리 및 시니어 닉네임(첫번째 p를 선택하는 타입넣어줌) */
.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items a p:first-of-type{
	font-size: 10px;
	font-weight: 900;
	color: #999;
	margin:10px 0px 0px;
}
/* 2번째 P 타이틀 */
.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items a p:nth-of-type(2){
	font-size:17px;
	font-weight:600;
	text-transform:capitalize; /* 영어단어 첫글자를 대문자로 바꿔주는거 */
	margin:10px 0px;
	transition:all .3s ease 0s
}
/* 3번째 p 세일된가격가격  */
.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items a p:nth-of-type(3){
	font-size:16px;
	font-weight:700;
	transition:all .3s
}
/* 이전가격 */
.hs_us_newlesson_BFcost{
	color:#999;
	font-size:16px;
	font-weight:500;
	text-decoration:line-through;
	margin-left:7px;
}
/* 4번째 p 좋아요 수  */
.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items a p:nth-of-type(4){
	font-size: 12px;
	font-weight:400;
}
/* 썸네일 안데 장바구니 좋아요 아이콘 */	
/* .hs_us_newlesson_social {
	padding:0;
	margin:0;
	list-style:none;
	position:absolute;
	bottom:100px;
	right:13px;
	z-index:1
	}
.hs_us_newlesson_social li{
	opacity:0;
	transform:translateY(3px);
	transition:all .5s ease 0s
	}
.hs_us_newlesson_items:hover .hs_us_newlesson_social li{
	margin:0 0 10px;
	opacity:1;
	transform:translateY(0)
	}
.hs_us_newlesson_items:hover .hs_us_newlesson_social li:nth-child(1){
	transition-delay:.2s  트랜지션 지연시간(애니메이션을 지연시킬 때)
	}
.hs_us_newlesson_items:hover .hs_us_newlesson_social li:nth-child(2){
	transition-delay:.4s 트랜지션 지연시간(애니메이션을 지연시킬 때)
	}
썸네일 안데 장바구니 좋아요 아이콘 위치	
.hs_us_newlesson_social li a{
	color:white;
	font-size:17px;
	line-height:40px;
	text-align:center;
	height:40px;
	width:40px;
	border:1px solid white;
	display:block;
	transition:all .5s ease-in-out
	}
.hs_us_newlesson_social li a:hover{
	color:rgb(224, 62, 82);
	border-color:rgb(224, 62, 82)
	} */
/* 썸네일 안데 장바구니 좋아요 아이콘 위치 */	

.hs_us_newlesson_g-scrolling-carousel {
    position: relative;
}

.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items {
    overflow-x: scroll;
    white-space: nowrap;
    width: 100%;
    -webkit-overflow-scrolling: touch;
}

.hs_us_newlesson_g-scrolling-carousel .hs_us_newlesson_items::-webkit-scrollbar {
    display: none;
}

.jc-right,
/*동그라미*/
.jc-left {
    color: #757575;
    margin-bottom: auto;
    margin-top: auto;
    cursor: pointer;
    position: absolute;
    top: 0;
    bottom: 0;
    z-index: 2;
    opacity: 0.94;

}

.jc-right {
    /*위치조절*/
    right: 0px;
}

.jc-left {
    left: -40px;
}

.jc-right:hover,
.jc-left:hover {
    opacity: 0.98;
}

.jc-right svg,
/*화살표*/
.jc-left svg {
    position: absolute;
    left: 0px;
    right: 0;
    bottom: 10px;
    top: 0;
    margin: auto;
    width: 50px;
    height: 50px;
    fill: #222;
}

.jc-right:hover svg,
.jc-left:hover svg {
    fill: rgb(0, 153, 255);
}

@media (pointer: coarse) {

    .jc-right,
    .jc-left {
        display: none !important;
    }
}

.noselect {
    -webkit-touch-callout: none;
    /* iOS Safari */
    -webkit-user-select: none;
    /* Safari */
    -khtml-user-select: none;
    /* Konqueror HTML */
    -moz-user-select: none;
    /* Firefox */
    -ms-user-select: none;
    /* Internet Explorer/Edge */
    user-select: none;
}
.hs_us_newlesson_content{
	display: inline-block;
}
/* 신규레슨 */

/* 스토어 신규 상품 */
/* 썸네일 _ 설명 묶은 DIV */
.hs_user_store_newproduct{
	position:relative;
	z-index:1;
	}
/* 썸네일 a tag*/
.hs_user_store_newproduct_img a{
	display:block
	}
/* 썸네일  img */
.hs_user_store_newproduct_img img{
	width:100%;
	
	}
/* 썸네일 안데 장바구니 좋아요 아이콘 */	
.hs_user_store_newproduct_social {
	padding:0;
	margin:0;
	list-style:none;
	position:absolute;
	bottom:100px;
	right:13px;
	z-index:1
	}
.hs_user_store_newproduct_social li{
	opacity:0;
	transform:translateY(3px);
	transition:all .5s ease 0s
	}
.hs_user_store_newproduct:hover .hs_user_store_newproduct_social li{
	margin:0 0 10px;
	opacity:1;
	transform:translateY(0)
	}
.hs_user_store_newproduct:hover .hs_user_store_newproduct_social li:nth-child(1){
	transition-delay:.2s  /* 트랜지션 지연시간(애니메이션을 지연시킬 때) */
	}
.hs_user_store_newproduct:hover .hs_user_store_newproduct_social li:nth-child(2){
	transition-delay:.4s /* 트랜지션 지연시간(애니메이션을 지연시킬 때) */
	}
/* 썸네일 안데 장바구니 좋아요 아이콘 위치 */	
.hs_user_store_newproduct_social li div{
	color:white;
	font-size:17px;
	line-height:40px;
	text-align:center;
	height:40px;
	width:40px;
	border:1px solid white;
	display:block;
	transition:all .5s ease-in-out
	}
	/* 좋아요 hover시 색바뀜 */
.hs_user_store_newproduct_social li a div:hover{
	color:rgb(224, 62, 82);
	border-color:rgb(224, 62, 82)
	}

/* 세일% 라벨 */		
.hs_user_store_newproduct_label{
	display:block;
	width : 38px;
	height : 38px;
	padding: 8px;
	color:#fff;
	background-color:FF4141;
	position:absolute;
	top:10px;
	left : 10px;
	/* right:10px; */
	/* padding:4px 15px 4px 30px; */
	/* -webkit-clip-path:polygon(34% 0,100% 0,100% 100%,0 100%);
	clip-path:polygon(34% 0,100% 0,100% 100%,0 100%); */
	-webkit-clip-path:circle(50% at 50% 50%);
	clip-path:circle(50% at 50% 50%);
	
	}
/* 상품 설명 */	
.hs_user_store_newproduct_content{
	padding:10px 0 0
	}
/* 상품카테고리 */	
.hs_user_store_newproduct_category{
	font-size: 10px;
	font-weight: 900;
	color: #999;
}	
/* 상품명 */
.hs_user_store_newprodct_title{
	font-size:17px;
	font-weight:600;
	text-transform:capitalize; /* 영어단어 첫글자를 대문자로 바꿔주는거 */
	margin:10px 0px;
	transition:all .3s ease 0s
	}
.hs_user_store_newprodct_title a{
	color: rgb(53, 54, 58);
	}
/* 상품명 상품가격 사이 라인 */	
.hs_user_store_newproduct_line{
	width: 100%;
	height: 1px;
	background-color: rgba(220,220,220,0.5);
	margin: 5px 0px;
}
/* 상품가격(이전 / 세일된 가격)  */
.hs_user_store_newprodct_cost{
	color: rgb(53, 54, 58);
	font-size:16px;
	font-weight:700;
	/* text-align:left; */
	transition:all .3s
	}
/* 이전 상품가격 */	
.hs_user_store_newprodct_BFcost{
	color:#999;
	font-size:16px;
	font-weight:500;
	text-decoration:line-through;
	margin-left:7px;
	display:inline-block
	}
/* 좋아요수  */
.hs_user_store_newprodct_likenum_box{
	margin:5px 0px 30px;;
}
.hs_user_store_newprodct_likenum{
	font-size: 12px;
	font-weight:400;
}	
.hs_user_store_newprodct_likenum i{
	color: rgb(224, 62, 82);

}
@media only screen and (max-width:990px){
	.product-grid8{margin-bottom:30px
	}
}
	

</style>
</head>

<body>
 <c:set var="member_id" value="${pageContext.request.userPrincipal.name}"></c:set>
 ${member_id }회원님의
<a href="/todaylessonmypage/mycart/${member_id}" id="mycart">내장바구니</a>
<a href="/todaylessonmypage/mylike/${member_id}" id="mylike">내 좋아요</a><br>
<br>

<!--  <form role="form" method="post" autocomplete="off">   -->
<c:set var="now" value="<%=new java.util.Date()%>" />

   <div class="" style="width: 80%; margin: auto;">
   <!-- 카테고리 선택 아이콘들 -->
    <div class="ej_grid all"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/0"><div class="fas fa-check-double"><br>전체</div></a></div>
  <div class="ej_grid lang"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/1"><div class="fas fa-globe-americas"><br>외국어</div></a></div>
    <div class="ej_grid it"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/2"><div class="fas fa-desktop"><br>IT</div></a></div>
     <div class="ej_grid cook"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/3"><div class="fas fa-pizza-slice"><br>요리</div></a></div>
      <div class="ej_grid diy"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/4"><div class="fas fa-hammer"><br>DIY</div></a></div>
      <div class="ej_grid exer"> <a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/5"><div class="fas fa-running"><br>운동</div></a></div>
        <div class="ej_grid ect"><a href="${pageContext.request.contextPath }/todaylesson/ej_store_main/6"><div class="fas fa-ellipsis-h"><br>기타</div></a></div>
       <br>
        <!-- 스토어 상품 -->
      <b class="" style="font-size: 25px;"> 전체</b>
      <div class="" style="margin-top: 30px;">
         <c:forEach var="storenewproductlist" items="${list}">
            <div class="col-md-3 col-sm-6">
               <div class="hs_user_store_newproduct">
                  <div class="hs_user_store_newproduct_img">
                     <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">
                        <img src="${storenewproductlist.product_thumb}"/>
                     </a>
                     <ul class="hs_user_store_newproduct_social" >
                        <li>
                           <a href="#" ><div class="fas fa-heart" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                        <li>
                         <a href="#" ><div class="fa fa-shopping-cart"" id="${storenewproductlist.product_no}"></div></a>
                        </li>
                     </ul>
                     <span class="hs_user_store_newproduct_label">
                        <c:out value="${storenewproductlist.product_sale}%"/>
                     </span> 
                  </div>
                  <div class="hs_user_store_newproduct_content">
                     <c:set var="category" value="${storenewproductlist.product_category }"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="외국어"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==2}">
                           <b class="hs_user_store_newproduct_category">  
                              <c:out value="IT"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==3}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="요리"/>
                           </b>   
                        </c:when>
                        <c:when test = "${category==4}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="DIY"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==5}">
                           <b class="hs_user_store_newproduct_category">
                              <c:out value="운동"/>
                           </b>
                        </c:when>
                        <c:when test = "${category==6}">
                           <b class="hs_user_store_newproduct_category"> 
                              <c:out value="기타"/>
                           </b>   
                        </c:when>
                     </c:choose>
                     <h6 class="hs_user_store_newprodct_title">
                        <a href="${pageContext.request.contextPath }/todaylesson/ej_store_detail/${storenewproductlist.product_no}">${storenewproductlist.product_name}</a>
                     </h6>
                     <div class="hs_user_store_newproduct_line"></div>
                      <c:set var="stock" value="${storenewproductlist.product_stock}"/>
                           <c:if test="${stock<=0}">
                           soldout
                           </c:if>
                     <div class="hs_user_store_newprodct_cost">
                      <fmt:formatNumber value="${storenewproductlist.product_after_cost}" type="number" maxFractionDigits="3"/>원
                        <span class="hs_user_store_newprodct_BFcost">
                       
                           <c:out value="${storenewproductlist.product_cost}원"/>
                           
                        </span>
                        
                     </div>
                     <div class="hs_user_store_newprodct_likenum_box">                
                        <span class="hs_user_store_newprodct_likenum">
                           <i class="fas fa-heart"></i>
                           ${storenewproductlist.product_like}
                          
                        </span>
                     </div>     
                  </div>
               </div>
            </div>
         </c:forEach>
      </div>
   </div>   
 <input type="hidden"name="${_csrf.parameterName}"value="${_csrf.token}"/>

   <!-- 스토어 -->
   <script type="text/javascript">
   /* Main Banner Slider */
	var idx = 0; // 함수 호출 횟수
	var i=0; // 이미지 인덱스
	var imgNum=3; // 이미지 개수
	var imgSize=100; // 이미지 크기
	function imgSlide() {
	   idx = idx + 1; // 함수 호출 회수 증가
		i=(idx-1)%imgNum; // 이미지는 3개를 돌려 쓸거라서
	  // idx-1을 해주는 이유 : idx>1 일 때부터 리스트 삭제, 추가가 이루어짐(1초 뒤부터 리스트 추가)
		if(i==0){
			i=imgNum; // 1,2,3,1,2,3 이 반복되어야 함
		}
		
		$('.hs_us_home_mainBannerslide').css({"left":"0px"}); // 0 -> -imgSize을 반복하기 위해
		
	   	$('.hs_us_home_mainBannerslide').stop().animate({'left' : -imgSize+"%"}, "slow");
		if(idx>1){ //idx>0으로 하면 첫 번째 리스트가 슬라이스되기전에 삭제가 된다.
			$('.hs_us_home_mainBannerslide>a:first').remove(); // 제일 첫 <a> 삭제
			$('.hs_us_home_mainBannerslide').append('<a><img src="/resources/Banner/main_banner'+i+'.jpg" alt="s">');
	    //마지막에 <a> 추가
		}
		
	}
	// 3초에 한번 함수를 실행
	setInterval(function() { imgSlide() }, 3000);
	/* Main Banner Slider */ 

   </script>
 <script>
$("#mycart").click(function(){
	if(${member_id}==null)
		{
		alert('로그인이 필요한 페이지입니다.');
		}

});
</script>
<script>

 $(".fas.fa-heart").click(function(){
 var productno=$(this).prop("id");
 var memberid='${pageContext.request.userPrincipal.name}';

  
  var data = {
       product_no : productno,
       member_id: memberid
    };
  if(memberid=='')
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
<script>
$(".fa.fa-shopping-cart").click(function(){ 

 var productno=$(this).prop("id");
  var memberid='${pageContext.request.userPrincipal.name}';
  
  var data = {
       product_no : productno,
       member_id: memberid
    };
  console.log(memberid);
  if(memberid=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"/todaylesson/cartjson",
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
    		alert('장바구니에 추가되었습니다.');
    		}
    	else{
    		alert('이미 장바구니에 추가된 상품입니다.');
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






</body>
</html>