<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">

<!-- CSSstyle --> 
   <style type="text/css">
      .hs_ad_main_asidenav_nav_FreeBoard_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<title>게시글 목록</title>
<script>
function reply_view(no)
{

	var freeboard_no=no;
	var obj=document.getElementById("add_reply-"+freeboard_no);

 if(obj.hasChildNodes())
{

	 obj.removeChild(obj.firstChild); 
} 



if(obj.hasChildNodes()!=true)
	{
document.getElementById("add_reply_thead-"+freeboard_no).removeAttribute("style");
 
	$.ajax({
		url:'/todaylessonadmin/freeboard_replyjson/'+freeboard_no
		,dataType:'json'
		,success:function(item){

			console.log(item[0].member_id);
			
			for(var i in item)
				{
				
				let member_nick=item[i].member_nick;
				let boardreply_content=item[i].boardreply_content;
				let boardreply_writedate=item[i].boardreply_writedate;
			/* 	$('.add_reply').append(repdetail); */
			
			var textnode=document.createTextNode(member_nick);
			var textnode2=document.createTextNode(boardreply_content);
			var textnode3=document.createTextNode(boardreply_writedate);
			
			var button=document.createElement("input");
			button.setAttribute("type", "button");
			button.setAttribute("class", "boardreply_delete");
			button.setAttribute("value","삭제");
			button.setAttribute("id",item[i].boardreply_no);
			
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
			
			
			document.getElementById("add_reply-"+freeboard_no).appendChild(node);
				
			

				
				
				} /*for문 끝*/
				
				$('.boardreply_delete').on('click',function(){
					
		        	$(this).parent().parent().remove();	
					let reno=$(this).attr('id');
						$.ajax({
					        url: "/todaylessonadmin/del_replyajax/"+reno
					        ,type:"post"
					        ,success: function(){
					        
					        	console.log("삭제:"+reno);
					        
	
					        }

					
						});
						
					})
					
				
				
		},error:function(data,status,jqXHR){
			console.log('실패',data);
			console.log(status);
			console.log(jqXHR);
			
		}
	});
 

	}
else
	{

	
	document.getElementById("add_reply_thead-"+freeboard_no).style.display="none";
	while(obj.hasChildNodes())
		{
	obj.removeChild(obj.firstChild);
		}
	
	}
	
	
	} /*function reply_view 끝*/

	

</script>
</head>
<body>
<sec:authentication property="principal" var="pinfo"/>
게시판 관리페이지<br>

<input type="button" value="공지등록" onclick="location.href='/todaylessonadmin/freeboard_noticewrite'">	
<table class="table">
<thead>
<tr><th>카테고리</th><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>관리</th>
</tr>
</thead>
<tbody>
<c:forEach var="notice" items="${notice }">
<tr>
<td>공지사항</td>
<td>${notice.notice_no }</td>
<td>${notice.notice_title }</td>
<td>${notice.member_nick }</td>
<td>${notice.notice_writedate }</td>
<td>
<a class="btn btn-primary" data-toggle="collapse" data-target="#notice_detail-${notice.notice_no}" role="button" aria-expanded="false" aria-controls="#detail-${notice.notice_no}">
    상세보기
  </a>

</td>
<tr>
<td colspan="6">
<div style="text-align:center;" class="collapse" id="notice_detail-${notice.notice_no}">
  
   
  내용 : ${notice.notice_content}<br>
  <form action="/todaylessonadmin/admin_noticemodify/${notice.notice_no }" method="post">
  <input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}"><br>
  <input type="submit" value="수정"><input type="button" value="삭제"
  onclick="if(!confirm('글을 삭제 하시겠습니까?')){return false;}location.href='/todaylessonadmin/admin_noticedelete/${notice.notice_no}'">
  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
  </form>


</div>
</td>
</tr>



</c:forEach>
</tbody>

<tbody>
<tr>
<tr><th>카테고리</th><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>관리</th>
</tr>
<c:forEach var="item" items="${list }" varStatus="status">


<tr>
<td>
<c:choose>
<c:when test="${item.freeboard_category eq 1 }">자유글</c:when>
<c:when test="${item.freeboard_category eq 2 }">질문과답변</c:when>
</c:choose>
</td>
<td>${item.freeboard_no}</td>
<td>

${item.freeboard_title }		[${replist[status.index]}]

</td>
<td><c:out value=" ${item.member_nick }"></c:out></td>
<td><c:out value=" ${item.freeboard_writedate }"></c:out></td>
<td>
<a class="btn btn-primary" data-toggle="collapse" data-target="#freeboard_detail-${item.freeboard_no}" role="button" aria-expanded="false" aria-controls="#detail-${item.freeboard_no}">
   상세보기
  </a>
</td>

</tr>

<tr>
<td colspan="6">
<div  style="text-align:center;" class="collapse" id="freeboard_detail-${item.freeboard_no}">
  
   
  <div>
  내용 : ${item.freeboard_content}<br>
<input type="button" value="댓글보기/접기" id="reply_view_btn" onclick="reply_view(${item.freeboard_no})">
<table>
<thead id="add_reply_thead-${item.freeboard_no}" style="display:none;">
<tr><th>작성자</th><th>내용</th><th>작성일</th><th>삭제</th>
</tr>
</thead>
<tbody id="add_reply-${item.freeboard_no}" >
</tbody>
</table>


  <form action="admin_replyinsert/${item.freeboard_no}" method="post">
  <textarea style="resize: none;" rows="5" cols="100" name="boardreply_content" required="required"></textarea><br>
  <input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}"><br>
  <input type="submit" value="답변" name="admin_reply">
  <input type="button" value="삭제" name="admin_delete" 
  onclick="if(!confirm('글을 삭제 하시겠습니까?')){return false;}location.href='admin_delete/${item.freeboard_no}'">
  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
   </form>
  
 
  </div>

</div>
</td>
</tr>

</c:forEach>
</tbody>
</table>
<form method="get" action="admin_freeboard?currPage=${page.startBlock }">
<select name="category">
<option value="3" selected="selected">전체</option>
<option value="1">자유글</option>
<option value="2">질문과답변</option>
</select>
<select name="search">
<option value="all">전체</option>
<option value="member_nick">닉네임</option>
<option value="freeboard_title">제목</option>
<option value="freeboard_content">내용</option>
</select>
<input type="text" name="searchtxt" >
<input type="submit" value="검색">

</form>



<c:if test="${page.prev }">
<a href="admin_freeboard?currPage=${page.startBlock-1}&category=${category}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="admin_freeboard?currPage=${index }&category=${category}&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="admin_freeboard?currPage=${page.endBlock+1 }&category${category}&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>
</body>
</html>