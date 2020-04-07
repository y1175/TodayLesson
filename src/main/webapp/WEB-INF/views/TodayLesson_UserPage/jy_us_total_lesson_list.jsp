<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_lesson.css">

<style>
 
.thum{
width:500px; height:auto;
}

</style>


</head>
<body>
   <div class="" style="width: 80%; margin: auto;">

<img class="total_img" alt="img" src="${pageContext.request.contextPath}/resources/imgUpload/category_icon/total_img.jpg">


   <!-- 카테고리 선택 아이콘들 -->
   
   <div id="ej_category_box">
    <div class="ej_category all"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/0" ><div class="ej_category_border"><img class="ej_categoryimg all" alt="all" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/correct.png"/></div><br>전체</a></div>
  <div class="ej_category lang"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/1" ><div class="ej_category_border"><img class="ej_categoryimg exercise" alt="exercise" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/exercise.png"/></div><br>운동</a></div>
    <div class="ej_category it"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/2" ><div class="ej_category_border"><img class="ej_categoryimg lang" alt="lang" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/lang.png"/></div><br>교육</a></div>
     <div class="ej_category cook"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/3" ><div class="ej_category_border"><img class="ej_categoryimg diy" alt="diy" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/diy.png"/></div><br>핸드메이드</a></div>
      <div class="ej_category diy"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/4" ><div class="ej_category_border"><img class="ej_categoryimg it" alt="it" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/it.png"/></div><br>IT</a></div>
      <div class="ej_category exercise"> <a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/5"><div class="ej_category_border"><img class="ej_categoryimg cook" alt="cook" src="${pageContext.request.contextPath }/resources/imgUpload/category_icon/cook.png"/></div><br>요리</a></div>
        <div class="ej_category ect"><a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list/6"><div class="ej_category_border"><img class="ej_categoryimg etc" alt="etc" src="${pageContext.request.contextPath}/resources/imgUpload/category_icon/etc.png"/></div><br>기타</a></div>
       <br> 
       </div>
       
       
<div class="lesson_order">       
<a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?order=lesson_register_date">최신순</a>
<a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?order=lesson_readno">조회수</a>
<a href="${pageContext.request.contextPath }/todaylesson/total_lesson_list?order=lesson_like">좋아요</a>
</div>


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
                      <fmt:formatNumber type="number" maxFractionDigits="3" value="${item.lesson_cost }"/>원
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



<div class="search_and_page">

<form method="get" action="total_lesson_list?currPage=${page.startBlock }">
<select name="search">
<option value="all">전체</option>
<option value="lesson_title">제목</option>
<option value="lesson_content">내용</option>
</select>
<input type="text" name="searchtxt" >
<input type="submit" value="검색">

</form>

 


<c:if test="${page.prev }">
<a href="total_lesson_list?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }&lesson=${order}"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="total_lesson_list?currPage=${index }&search=${search}&searchtxt=${searchtxt}&lesson=${order}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="total_lesson_list?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}&lesson=${order}"><c:out value="다음"/></a>
</c:if>
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
   url :"/todaylesson/lesson_like",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
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
   url :"/todaylesson/lesson_cart",
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