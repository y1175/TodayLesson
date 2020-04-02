<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<style>

.thum{
width:500px; height:auto;
}

</style>

</head>
<body>


<c:forEach var="item" items="${list}">

<div id="thumb">
<img alt="레슨 썸네일" src="${item.lesson_thumb }">
<c:out value="${item.lesson_no}"/>
<a href="${pageContext.request.contextPath }/todaylessonmypage/mylesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a>


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

<c:choose>

<c:when test="${item.lesson_procent  >= 80.0 } && ${item.lesson_reward == 0}">

수강률 <c:out value="${item.lesson_procent }"/>
<input type ="button" id = "reward_point" value="보상">

</c:when>

<c:otherwise>

수강률 <c:out value="${item.lesson_procent }"/>

</c:otherwise>

</c:choose>



<script>


$("#reward_point").click(function(){
	  let lesson_no=${item.lesson_no};
	  
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
} else {
	alert("포인트가 적립되지 않았습니다.");   
}
}  
,error: function(){
  console.log('error');
  }
}); 


});

</script>



</div>
</c:forEach>

</body>
</html>