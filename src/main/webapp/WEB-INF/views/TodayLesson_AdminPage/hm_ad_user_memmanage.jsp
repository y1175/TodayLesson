<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
 
<table>
<thead><tr><th>no</th><th>Id</th><th>이름</th>
<th>닉네임</th><th>적립금</th><th>회원등급</th><th>가입일</th></tr></thead>
<tbody>
<c:forEach var="item" items="${list}">
<tr><td>${item.member_no}</td>
<td>${item.member_id}</td>
<td>${item.member_name}</td>
<td>${item.member_nick}</td>
<td>${item.member_point}</td>
<form method="post" action="adminmember_levelupdate">
<td>
<input type="hidden" name="member_id" id="member_id" value="${item.member_id}">
<select id="member_level" name="member_level" id="member_level">
<option value="">${item.member_level} 레벨</option>
<option value="0">0 관리자</option>
<option value="1">1 주니어</option>
<option value="2">2 시니어</option>
<option value="3">3 불량회원</option>
</select> 
<input type="submit" value="수정">
</td>
</form>
<td>${item.member_join_date}</td></tr>
</c:forEach>




</tbody>
</table> 


</body>
</html>