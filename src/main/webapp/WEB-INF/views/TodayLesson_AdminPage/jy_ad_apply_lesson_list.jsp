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
</head>
<body>

<form action="${pageContext.request.contextPath }/admin_apply_exam" method="post">
<table class="table">
<thead>
<tr>
<th scope="col"><input type="checkbox" id="checkall"></th><th scope="col">레슨번호</th><th scope="col">레슨명</th><th scope="col">카테고리</th><th scope="col">레슨타입</th><th scope="col">등록일자</th><th scope="col">시니어 아이디</th><th scope="col">승인 상태</th>
</tr>
</thead>

<tbody>

<c:forEach var="item" items="${list}">
<tr>
<td><input type="checkbox" name="check" value="${item.lesson_no}"></td>
<td><c:out value="${item.lesson_no}"/></td>
<td><a href="/admin_wait_lesson_detail/${item.lesson_no}"><c:out value="${item.lesson_title}"/></a></td>


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


<c:choose>

<c:when test="${item.lesson_result == 0}">
<td><c:out value="신청완료"/></td>
</c:when>

<c:when test="${item.lesson_result == 1}">
<td><c:out value="심사중"/></td>
</c:when>

<c:when test="${item.lesson_result == 2}">
<td><c:out value="레슨승인"/></td>
</c:when>

<c:otherwise>
<td><c:out value="레슨거절"/></td>
</c:otherwise>

</c:choose>



</tr>
</c:forEach>
</tbody>
</table>

<input type="submit" value="전송">
<input type="reset" value="취소"> 
</form>
</body>
</html>