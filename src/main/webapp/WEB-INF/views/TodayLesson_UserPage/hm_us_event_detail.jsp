<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_event.css?ver=2"> 
<script src="${pageContext.request.contextPath}/resources/JS/hm_us_event.js"></script> --%> 
<script>
function reply_view(no)
{

	var event_no=no;
	var obj=document.getElementById("event_replysubmit-"+event_no);

 if(obj.hasChildNodes())
{

	 obj.removeChild(obj.firstChild); 
} 



if(obj.hasChildNodes()!=true)
	{
document.getElementById("event_replysubmit_thead-"+event_no).removeAttribute("style");
 
	$.ajax({
		url:'/todaylessonadmin/event_replyjson/'+event_no
		,dataType:'json'
		,success:function(item){

			console.log(item[0].member_id);
			
			for(var i in item)
				{
				
		/* 		let member_nick=item[i].member_nick; */
				let event_reply_content=item[i].event_reply_content;
				let event_reply_date=item[i].event_reply_date;
			/* 	$('.add_reply').append(repdetail); */
			
			var textnode=document.createTextNode(member_nick);
			var textnode2=document.createTextNode(event_reply_content);
			var textnode3=document.createTextNode(event_reply_date);
			
			var button=document.createElement("input");
			button.setAttribute("type", "button");
			button.setAttribute("class", "eventreply_delete");
			button.setAttribute("value","삭제");
			button.setAttribute("id",item[i].event_reply_no);
			
			var node=document.createElement("TR");
			
			var nodeId= new Array();
			
			
			var node2=document.createElement("TD");
			var node3=document.createElement("TD");
			var node4=document.createElement("TD");
			var node5=document.createElement("TD");
			
			node2.appendChild(textnode);
			node3.appendChild(textnode2);
			node4.appendChild(textnode3);
			node5.appendChild(button);
			
			node.appendChild(node2);
			node.appendChild(node3);
			node.appendChild(node4);
			node.appendChild(node5);
			
			
			document.getElementById("event_replysubmit-"+event_no).appendChild(node);
				
			
} /*for문 끝*/
		}	 /*function reply_view 끝*/
	});
	}
}
</script>
</head>
<body>
<sec:authentication property="principal" var="pinfo"/>
<!-- ModelAttribute dto -->
<c:set var="item" value="${dto}"></c:set>

${item.event_content}



<div class="event_rep_form">
<form method="post" action="/todaylesson/hm_us_eventreply/${item.event_no}" id="event_rep">
<input type="hidden" name="member_id" id="member_id" value='${pageContext.request.userPrincipal.name}'>
<input type="hidden" name="event_reply_no" id="event_reply_no" value="${item.event_no}">
<label for="event_reply_content">내용</label>
<textarea style="resize:none;"  rows="5" cols="100" name="event_reply_contetn" id="event_reply_content" required="required"></textarea>
<input type="submit" value="댓글달기" name="event_replysubmit">
</form>
</div>


<table>
<thead>
<tr><th>작성자</th><th>내용</th><th>작성일</th><th>삭제</th>
</tr>
</thead>
<tbody>


</tbody>
</table>
<a href="${pageContext.request.contextPath}/todaylesson/hm_us_event">목록으로</a>
</body>
</html>