<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>회원통계</h3>
<table>
<thead>
<tr>
<th>날짜</th><th>접속건수</th><th>접속자수</th><th>누적접속건수</th><th>누적접속자수</th>
</tr>
</thead>
<tbody>

<c:forEach var="item" items="${list }" varStatus="status">
<tr>
<td>${item.stat_logdate }</td>
<td>${item.total }</td>
<td>${distinctMember[status.index].member_total }</td>
<td>${cumlist[status.index]}</td>
<td>${distinctList[status.index] }</td>

</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>