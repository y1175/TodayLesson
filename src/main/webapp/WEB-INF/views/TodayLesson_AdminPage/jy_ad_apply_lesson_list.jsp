<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){
    //최상단 체크박스 클릭
    $("#checkall").click(function(){
        //클릭되었으면
        if($("#checkall").prop("checked")){
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
            $("input[name=check]").prop("checked",true);
            //클릭이 안되있으면
        }else{
            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
            $("input[name=check]").prop("checked",false);
        }
    })
})

</script>

<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_NewLessonAccept_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->


</head>
<body>
 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;"><b>신규 레슨 심사</b></h2>
 </div>
 

 
<form action="${pageContext.request.contextPath }/todaylessonadmin/admin_apply_exam" method="post">

<table class="table" style="width: 80%; margin: 0px auto 40px;">
<tr  style="background-color: #fff2f2;">
<th scope="col"><input type="checkbox" id="checkall"></th>
				<th scope="col">#</th>
				<th scope="col">레슨명</th>
				<th scope="col">카테고리</th>
				<th scope="col">레슨타입</th>
				<th scope="col">등록일자</th>
				<th scope="col">시니어아이디</th>
			</tr>
<thead>

<tbody>

<c:forEach var="item" items="${list}">
<tr>
<td><input type="checkbox" name="check" value="${item.lesson_no}"></td>
<td><c:out value="${item.lesson_no}"/></td>
<td><a href="${pageContext.request.contextPath }/todaylessonadmin/admin_wait_lesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a></td>


<c:choose>

<c:when test="${item.lesson_category == 1}">
<td><c:out value="운동"/></td>
</c:when>

<c:when test="${item.lesson_category == 2}">
<td><c:out value="교육"/></td>
</c:when>

<c:when test="${item.lesson_category == 3}">
<td><c:out value="핸드메이드"/></td>
</c:when>

<c:when test="${cate == 4}">
<td><c:out value="it"/></td>
</c:when>

<c:otherwise>
<td><c:out value="요리"/></td>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type == 1}">
<td><c:out value="원데이 클래스"/></td>
</c:when>

<c:when test="${item.lesson_type == 2}">
<td><c:out value="다회성 클래스"/></td>
</c:when>

<c:otherwise>
<td><c:out value="온라인 클래스"/></td>
</c:otherwise>

</c:choose>

<td><c:out value="${item.lesson_register_date}"></c:out></td>

<td><c:out value="${item.member_id}"></c:out></td>




</tr>
</c:forEach>
</tbody>
</table>

<input type="submit" value="전송">
<input type="reset" value="취소"> 
</form>
</body>
</html>