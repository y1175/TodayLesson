<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_us_mypage_mylesson>a{
         color: white;
      }
      .hs_us_mypage_mymanage>a{
	     color : #757575;
       }
   </style>
<!-- CSSstyle -->


   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_my_lesson_list.css?ver=2">

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


</head>
<body>
<div id="jy_container">


 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;"><b>나의 레슨관리</b></h2>
 </div>
 
 <!-- 검색 --> 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:29%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" >
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylesson/total_lesson_list?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-3" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
 <option value="all">전체</option>
 <option value="lesson_title">제목</option>
 <option value="lesson_content">내용</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <button class="ej_btn" style="background-color: rgb(224, 62, 82); padding:3px 15px;" type="submit">검색</button>
    </form>
  </div>
</nav>
<!-- 검색완료 -->
 


 
 
 
 
   
      <c:forEach var="item" items="${list}">
      
      
      <div id="lesson_div" class= "lesson_div">
   <div class="my_lesson_line"></div>
        <span class="lessonimg">
		<img alt="레슨 썸네일" src="${item.lesson_thumb }">
		</span>

                  <ul class="lesson_text">
                  <li class="lesson_group">


<c:choose>

<c:when test="${item.lesson_category == 1}">
<c:out value="운동"/>
</c:when>

<c:when test="${item.lesson_category == 2}">
<c:out value="교육"/>
</c:when>

<c:when test="${item.lesson_category == 3}">
<c:out value="핸드메이드"/>
</c:when>

<c:when test="${item.lesson_category == 4}">
<c:out value="it"/>
</c:when>

<c:when test="${item.lesson_category == 5}">
<c:out value="요리"/>
</c:when>

<c:otherwise>
<c:out value="기타"/>
</c:otherwise>

</c:choose>
                  </li>
					<c:choose>

<c:when test="${item.lesson_type == 1}">
<c:out value="원데이 클래스"/>
</c:when>

<c:when test="${item.lesson_type == 2}">
<c:out value="다회성 클래스"/>
</c:when>

<c:otherwise>
<td><c:out value="온라인 클래스"/></td>
</c:otherwise>

</c:choose>

<c:if test="${item.lesson_type == 3 }">
<li class="lesson-head">
<a href="${pageContext.request.contextPath}/todaylessonmypage/mylesson_detail/${item.lesson_no}">${item.lesson_title}</a></li>
</c:if>

<c:if test="${item.lesson_type != 3 }">
<li class="lesson-head">
<a href="${pageContext.request.contextPath}/todaylesson/lesson_detail/${item.lesson_no}">${item.lesson_title}</a></li>
</c:if>


					
<c:if test="${item.lesson_type == 3 }">
<li id="l_pro">


수강률 <c:out value="${item.lesson_procent }"/>%
</li>

<c:if test="${item.lesson_procent  >= 80.0 && item.lesson_reward == 0}">

<button id ="reward_point" class="ej_btn" onclick="reward(${item.lesson_no});">포인트 받기</button>

</c:if>



</c:if>


                  </ul>
                  </div> 






<script>


function reward(lesson_no){
	

	  let data = {
			  lesson_no : lesson_no,
	  };
	
	
$.ajax({
url :"/todaylessonmypage/reward_point",// 클라이언트가 HTTP 요청을 보낼 서버의 URL 주소
//request mapping value랑 맞추면되는듯
type : "post",
data : data,
success : function(result){
   if(result=="success"){
		alert("10,000 포인트가 적립 되었습니다.");
		location.reload();
} else {
	alert("포인트가 적립되지 않았습니다.");   
}
}  
,error: function(){
  console.log('error');
  }
}); 


}

</script>


</c:forEach>
</div>




</body>
</html>