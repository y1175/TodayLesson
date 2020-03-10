<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>
$(document).ready(function() {
	$('.reply_submit').on('click', function () {
		let freeboard_no=$('.freeboard_no').html();
		

		let today = new Date();
		let day = today.getDate();
		let month = today.getMonth()+1; //January is 0!
		let yyyy = today.getFullYear();

		if (month < 10) 
		var mm="0"+month;
		else
			mm=month;
		if (day <10) 
		var dd="0"+day;
		else
			dd=day;
		
		var formData = $("#repdetail").serialize();
		$.ajax({
			url:'/freeboard_detailjson/'+freeboard_no
			,dataType:'json'
			,data: formData
			,success:function(data){

				
 				console.log(data.freeboard_no);	
				console.log(data.member_nick);
				console.log("id"+data.member_id);
				let onclickfunction = "if(!confirm()){return false;}location.href='/boardreply_delete/${item.boardreply_no+1}'";
				let repdetail="<tr><td>"+data.member_nick+"</td>";
				repdetail+="<td>"+data.boardreply_content+"</td>";
			    repdetail+="<td>"+yyyy+"-"+mm+"-"+dd+"</td>";
			    repdetail+="<td>";
			    repdetail+="<input type='button' class='delete' value='삭제'>";
			    repdetail+="</td></tr>";
				$('.add_reply').append(repdetail);
			},error:function(data,status,jqXHR){
				console.log('실패',data);
				console.log(status);
				console.log(jqXHR);
				
			}
		});
		

	});


});


</script>

</head>
<body>
<sec:authentication property="principal" var="pinfo"/>		
<sec:authorize access="isAnonymous()">
로그인 하세요.
</sec:authorize>		
<sec:authorize access="isAuthenticated()">
<c:set var="item" value="${dto }"></c:set>
글번호 : <div class="freeboard_no">${item.freeboard_no }</div> <br>
작성자 : ${item.member_nick } <br>
조회수 : ${item.freeboard_readno } <br>
제목 : ${item.freeboard_title } <br>
내용 : ${item.freeboard_content } <br>


<div class="rep_form">
<form method='post' action='/freeboard_detailjson' id='repdetail'>
<input type='hidden' name='freeboard_no' value="${item.freeboard_no }"><br>
<input type='hidden' id='member_id' name='member_id' value='${pageContext.request.userPrincipal.name}'><br>
<input type="hidden" id="boardreply_no" name="boardreply_no" value='${item.boardreply_no+1 }'><br>
<label for='boardreply_content'>내용</label>
<input type='text' name='boardreply_content' id='boardreply_content' class='form-control'>
<input type='button' class='reply_submit' value='입력'>
</form>

</div>

<table>
<thead>
<tr><th>작성자</th><th>내용</th><th>작성일</th><th>삭제</th>
</tr>
</thead>
<tbody class="add_reply">
<c:forEach var='rep_list' items='${rep_list}'>
<tr>
<td>${rep_list.member_nick}</td>
<td>${rep_list.boardreply_content}</td>
<td>${rep_list.boardreply_writedate }</td>
<td>
<c:if test="${rep_list.member_id eq pageContext.request.userPrincipal.name }">
<input type="button" class="delete" value="삭제" 
onclick="if(!confirm('삭제 하시겠습니까?')){return false;}location.href='/boardreply_delete/${rep_list.boardreply_no}'">
</c:if>
</td></tr>
</c:forEach>

</tbody>
</table><br>
<c:if test="${item.member_id eq pageContext.request.userPrincipal.name }">
<input type="button" class="delete" value="삭제">
</c:if>
<a href="/freeboard">목록으로</a>
</sec:authorize>
</body>
</html>
