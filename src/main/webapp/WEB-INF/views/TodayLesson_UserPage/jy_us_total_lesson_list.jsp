<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_lesson.css?ver=6">

<style>
 
.thum{
width:500px; height:auto;
}

</style>


</head>
<body>


   <div class="" style="width: 80%; margin: auto;">

<img class="total_img" alt="img" src="${pageContext.request.contextPath}/resources/IMG/total_lesson_img.png">
 

   <!-- 카테고리 선택 아이콘들 -->
   
   <div id="ej_category_box">
    <div class="ej_category all"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?cate=0" ><div class="ej_category_border"><img class="ej_categoryimg all" alt="all" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/correct.png"/></div><br>전체</a></div>
  <div class="ej_category lang"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?cate=1" ><div class="ej_category_border"><img class="ej_categoryimg exercise" alt="exercise" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/exercise.png"/></div><br>운동</a></div>
    <div class="ej_category it"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?cate=2" ><div class="ej_category_border"><img class="ej_categoryimg lang" alt="lang" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/lang.png"/></div><br>교육</a></div>
     <div class="ej_category cook"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?cate=3" ><div class="ej_category_border"><img class="ej_categoryimg diy" alt="diy" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/diy.png"/></div><br>핸드메이드</a></div>
      <div class="ej_category diy"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?cate=4" ><div class="ej_category_border"><img class="ej_categoryimg it" alt="it" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/it.png"/></div><br>IT</a></div>
      <div class="ej_category exercise"> <a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?cate=5"><div class="ej_category_border"><img class="ej_categoryimg cook" alt="cook" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/cook.png"/></div><br>요리</a></div>
        <div class="ej_category ect"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?cate=6"><div class="ej_category_border"><img class="ej_categoryimg etc" alt="etc" src="${pageContext.request.contextPath}/resources/imgUpload/category_icon/etc.png"/></div><br>기타</a></div>
       <br> 
       </div>
       



<!-- 검색 --> 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:29%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylesson/total_lesson_list?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-3" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
 <option value="all">전체</option>
<option value="lesson_title">레슨명</option>
 <option value="lesson_content">레슨내용</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <button class="ej_btn" style="background-color: rgb(224, 62, 82); padding:3px 15px;" type="submit">검색</button>
    </form>
  </div>
</nav>
<!-- 검색완료 -->


<%--   <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylesson/total_lesson_list?currPage=${page.startBlock }"
 style="margin:0px auto;">
 
 <select name="search" class="custom-select mr-sm-3" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
 <option value="all">전체</option>
<option value="lesson_title">레슨명</option>
 <option value="lesson_content">레슨내용</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <button class="ej_btn" type="submit">검색</button>
    </form>
      </div> --%>
       
<div class="lesson_order" >       
<button class="ej_btn order" onclick="location.href='${pageContext.request.contextPath }/todaylesson/total_lesson_list?order=lesson_register_date'">최신순</button>
<button class="ej_btn order" onclick="location.href=' ${pageContext.request.contextPath }/todaylesson/total_lesson_list?order=lesson_readno'">조회수순</button>
<button class="ej_btn order" onclick="location.href='${pageContext.request.contextPath }/todaylesson/total_lesson_list?order=lesson_like'">좋아요순</button>
</div>



<br>

<c:forEach var="item" items="${list}">
            <div class="col-md-3 col-sm-6">
               <div class="hs_user_store_newproduct">
                  <div class="hs_user_store_newproduct_img">
<a href="${pageContext.request.contextPath}/todaylesson/lesson_detail/${item.lesson_no}">
<img alt="레슨 썸네일" src="${item.lesson_thumb }">
</a>
                     <ul class="hs_user_store_newproduct_social" >
  <li>
                             <a href="#" ><div class="fas fa-heart" id="${item.lesson_no}"></div></a>
  
  </li>
  <li>
                           <a href="#" ><div class="fa fa-shopping-cart" id="${item.lesson_no}"></div></a>
  </li>
   </ul>
</div>
                  <div class="hs_user_store_newproduct_content">





<c:choose>

<c:when test="${item.lesson_category == 1}">
 <b class="hs_user_store_newproduct_category">
                              <c:out value="운동"/>
                           </b>   
</c:when>

<c:when test="${item.lesson_category == 2}">
<b class="hs_user_store_newproduct_category">  
                              <c:out value="교육"/>
                           </b>
</c:when>

<c:when test="${item.lesson_category == 3}">
<b class="hs_user_store_newproduct_category">  
                              <c:out value="핸드메이드"/>
                           </b>
</c:when>

<c:when test="${item.lesson_category == 4}">
<b class="hs_user_store_newproduct_category">  
                              <c:out value="IT"/>
                           </b>
</c:when>

<c:when test="${item.lesson_category == 5}">
<b class="hs_user_store_newproduct_category">  
                              <c:out value="요리"/>
                           </b>
</c:when>

<c:otherwise>
<b class="hs_user_store_newproduct_category">  
                              <c:out value="기타"/>
                           </b>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type == 1}">
 <b class="hs_user_store_newproduct_category">
<c:out value="원데이 클래스"/>
</b>
</c:when>

<c:when test="${item.lesson_type == 2}">
 <b class="hs_user_store_newproduct_category">

<c:out value="다회성 클래스"/>
</b>
</c:when>

<c:otherwise>
 <b class="hs_user_store_newproduct_category">
<c:out value="온라인 클래스"/>
</b>
</c:otherwise>

</c:choose>



<h6 class="hs_user_store_newprodct_title">
                        <a href="${pageContext.request.contextPath}/todaylesson/lesson_detail/${item.lesson_no}">${item.lesson_title}</a>
                     </h6>
         
         
         <div class="hs_user_store_newproduct_line"></div>
                      <c:set var="junior_count" value="${item.lesson_member_max - item.lesson_junior_count}"/>
                           <c:if test="${junior_count==0}">
                           <div class="ej_soldout">soldout</div>
                    
                           </c:if>
    <div class="hs_user_store_newprodct_cost">
     <jsp:useBean id="now" class="java.util.Date"  />
	<div style="display: none;">
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
	<fmt:parseDate value="${item.lesson_open_period}" var="dateFmt" pattern="yyyy-MM-dd"/>
	<fmt:parseNumber value="${dateFmt.time / (1000*60*60*24)}" integerOnly="true" var="isDate"  /> 
	<fmt:parseNumber value="${now.time / (1000*60*60*24)}" integerOnly="true" var="itDate" /> 
	</div>
	

		
		
	<c:if test="${item.lesson_earlybird eq 1 }">
	
	<c:if test="${itDate - isDate <= 7}">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.lesson_cost * 0.73}"/>원
	</c:if>
	
	<c:if test="${itDate - isDate > 7 }">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.lesson_cost }"/>원
	</c:if>
	
	</c:if>
	
	<c:if test="${item.lesson_earlybird eq 0}">
	<fmt:formatNumber type="number" maxFractionDigits="3" value="${item.lesson_cost }"/>원
	</c:if>
	

	

	
	
	
                         </div>
                     <div class="hs_user_store_newprodct_likenum_box">                
                        <span class="hs_user_store_newprodct_likenum">
                           <i class="fas fa-heart"></i>
                           ${item.lesson_like}
                          
                        </span>
                     </div>     
                  </div>
               </div>
                                



</div>


</c:forEach>





 
<div class="dim"></div>
<div class="paging">
<div class="paginginside">
<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }&lesson=${order}">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?currPage=${index }&search=${search}&searchtxt=${searchtxt}&lesson=${order}">${index }
</a></li>
</c:if>


<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>

</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}&lesson=${order}">NEXT
</a></li>
</c:if>
</ul>
</div>
</div>

</div>

<script>


 $(".fas.fa-heart").click(function(){
 let lessonno=$(this).prop("id");
 let memberid='${pageContext.request.userPrincipal.name}';

  
  let data = {
       lesson_no : lessonno,
       member_id: memberid
    };
  if(memberid=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"${pageContext.request.contextPath }/todaylesson/lesson_like",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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
    	    location.href = "${pageContext.request.contextPath }/todaylesson/total_lesson_list";
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


$(".fa.fa-shopping-cart").click(function(){ 

 let lessonno=$(this).prop("id");
  let memberid='${pageContext.request.userPrincipal.name}';
  
  let data = {
       lesson_no : lessonno,
       member_id: memberid
    };
  console.log(memberid);
  if(memberid=='')
  {
  alert('로그인이 필요합니다.');
  }else{
 
  $.ajax({
   url :"${pageContext.request.contextPath }/todaylesson/lesson_cart",
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
    	    location.href = "${pageContext.request.contextPath }/todaylesson/total_lesson_list";
    		}
    	else if(result=="soldout")
		{
		alert('품절된 레슨은 장바구니에 추가할 수 없습니다.');
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