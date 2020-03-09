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
$(document).ready(function() {
	$('#reply_form_button').one('click', function () {
		let freeboard_no=$('.freeboard_no').html();
		console.log(freeboard_no);
		$.ajax({
			url:'/freeboard_detailjson/'+freeboard_no
			,dataType:'json'
			,success:function(data){
				
				console.log(data.freeboard_no);
				let repdetail="<tr><td colspan='4'>";
				repdetail+="<form method='post' action='/insert_reply' id='repdetail'>";
				repdetail+="<input type='hidden' name='freeboard_no' value='"+data.freeboard_no+"'>";
				repdetail+="<input type='hidden' id='member_id' name='member_id' value='${pageContext.request.userPrincipal.name}'> ";
				/* repdetail+="<div class='form-group'>"+"<label for='btitle'>제목</label>"; */
				/* repdetail+="<input type='text' name='btitle' id='btitle' class='form-control'value='"+data.btitle+">>댓글 : '></div>"; */
				repdetail+="<div class='form-group'>"+"<label for='boardreply_content'>내용</label>";
				repdetail+="<input type='text' name='boardreply_content' id='boardreply_content' class='form-control'></div>";
				repdetail+="<div class='form-group'>"+"<input type='submit' value='입력'>"+"<input type='reset' value='취소'></form></td></tr>";
				$('.rep_form').append(repdetail);
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
<c:set var="item" value="${dto }"></c:set>
글번호 : <div class="freeboard_no">${item.freeboard_no }</div> <br>
작성자 : ${item.member_nick } <br>
조회수 : ${item.freeboard_readno } <br>
제목 : ${item.freeboard_title } <br>
내용 : ${item.freeboard_content } <br>

<input type="button" id="reply_form_button" value="댓글달기">
<div class="rep_form">
<form method='post' action='/insert_reply' id='repdetail'>
<input type='hidden' name='freeboard_no' value='"+data.freeboard_no+"'><br>
<input type='hidden' id='member_id' name='member_id' value='${pageContext.request.userPrincipal.name}'><br>
<div class='form-group'>"+"<label for='boardreply_content'>내용</label>
 
</div>
<table>
<thead>
<tr><th>댓글번호</th><th>작성자</th><th>내용</th><th>삭제</th>
</tr>
</thead>
<tbody>
</tbody>
</table><br>
<a href="/freeboard">목록으로</a>

</body>
</html>
