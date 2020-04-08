<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_us_my_lesson_list.css">



</head>
<body>



 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;">온라인 레슨</h2>
 </div>

   
      <c:forEach var="list" items="${list}">
      <div id="lesson_div" class= "lesson_div">
   <div class="my_lesson_line"></div>
        <span class="lessonimg">
<img alt="레슨 썸네일" src="${list.lessondetail_thumb }">
		</span>

                  <ul class="lesson_text">
                  <li class="lesson_group">

${list.lessondetail_chapter}

                  </li>
                  
                  <li>
				<c:set var="lessondetail_no" value="${list.lessondetail_no} "></c:set>
				<a href="${pageContext.request.contextPath }/todaylessonmypage/select_lessondetail_this_chapter/${lessondetail_no}"><c:out value="${list.lessondetail_title}"/></a>
</li>

<li>

<c:if test="${list.lessondetail_comp == 1 }">
챕터 수강 여부 : O
</c:if>

<c:if test="${list.lessondetail_comp == 0 }">
챕터 수강 여부 : X
</c:if>


</li>
</ul>
</div>
</c:forEach>


</body>
</html>