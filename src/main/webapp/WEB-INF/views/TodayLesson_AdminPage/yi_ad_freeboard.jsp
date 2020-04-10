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
     <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/yi_freeboard_admin.css?ver=3">
<!-- CSSstyle -->
<!-- jquery -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Today Lesson Admin</title>
<script>
$(document).ready(function() {
    $('body').bootstrapMaterialDesign();
});
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
<div id="yi_container">
<sec:authentication property="principal" var="pinfo"/>
<span class="pagetitle"><b>커뮤니티 관리</b></span>
<input type="button" class="notice_btn" value="공지등록" onclick="location.href='/todaylessonadmin/freeboard_noticewrite'">	

<form method="get" class="form-inline my-2 my-lg-3" action="admin_freeboard?currPage=${page.startBlock }">
<div align="right" class="container yi_searchbar">
<div class="row">
<div class="col-sm">
<select name="category" class="custom-select mr-sm-4"  id="inlineFormCustomSelect">
<option value="3" selected="selected">전체</option>
<option value="1">자유글</option>
<option value="2">질문과답변</option>
</select>
<select name="search" class="custom-select  mr-sm-4" >
<option value="all">   전체   </option>
<option value="member_nick">   닉네임   </option>
<option value="freeboard_title">  제목   </option>
<option value="freeboard_content">   내용   </option>
</select>
<input type="text" name="searchtxt" class="form-control mr-sm-2" >
<input type="submit" value="검색" class="yi_search_btn">
</div>
</div>
</div>
</form>

<table class="table table-hover">
<thead class="thead-admin-freeboard">
<tr><th>카테고리</th><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>관리</th>
</tr>
</thead>
<tbody class="boardadmin_tbody">
<c:forEach var="notice" items="${notice }">
<tr>
<td>공지사항</td>
<td>${notice.notice_no }</td>
<td>${notice.notice_title }</td>
<td>${notice.member_nick }</td>
<td>${notice.notice_writedate }</td>
<td>
<a class="btn board-detail" style="color:white;"  data-toggle="collapse" data-target="#notice_detail-${notice.notice_no}" role="button" aria-expanded="false" aria-controls="#detail-${notice.notice_no}">
    상세보기
  </a>

</td>
<tr>
<td colspan="6">
<div style="text-align:center;" class="collapse" id="notice_detail-${notice.notice_no}">
  
   
  ${notice.notice_content}<br>
  <form action="/todaylessonadmin/admin_noticemodify/${notice.notice_no }" method="post">
  <input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}"><br>
  <input type="submit" class="noticemodify-btn" value="수정"><input type="button" class="noticedelete-btn" value="삭제"
  onclick="if(!confirm('글을 삭제 하시겠습니까?')){return false;}location.href='/todaylessonadmin/admin_noticedelete/${notice.notice_no}'">
  <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
  </form>


</div>
</td>
</tr>



</c:forEach>
</tbody>

<tbody class="boardadmin_tbody">
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

${item.freeboard_title }		<span class="replycount">[${replist[status.index]}]</span>

</td>
<td><c:out value=" ${item.member_nick }"></c:out></td>
<td><c:out value=" ${item.freeboard_writedate }"></c:out></td>
<td>
<a class="btn board-detail" style="color:white;" data-toggle="collapse" data-target="#freeboard_detail-${item.freeboard_no}" role="button" aria-expanded="false" aria-controls="#detail-${item.freeboard_no}">
   상세보기
  </a>
</td>

</tr>

<tr>
<td colspan="6">
<div  style="text-align:center;" class="collapse" id="freeboard_detail-${item.freeboard_no}">
  
   
  <div>
  <div class="freeboard_content">${item.freeboard_content}</div>
<input type="button" class="boardreply-detail" value="댓글보기/접기" id="reply_view_btn" onclick="reply_view(${item.freeboard_no})">
<table class="ajaxreply-list">
<thead id="add_reply_thead-${item.freeboard_no}"  style="display:none;">
<tr><th>작성자</th><th>내용</th><th>작성일</th><th>삭제</th>
</tr>
</thead>
<tbody id="add_reply-${item.freeboard_no}" >
</tbody>
</table>


  <form action="admin_replyinsert/${item.freeboard_no}" method="post">
  <div class="form-group">
  <textarea class="form-control" style="resize: none;" rows="5" cols="100" name="boardreply_content" required="required"></textarea><br>
  </div>
  <input type="hidden" name="member_id" value="${pageContext.request.userPrincipal.name}"><br>
  <input type="submit" class="boardreply-insert" value="답변" name="admin_reply">
  <input type="button" class="board-delete" value="삭제" name="admin_delete" 
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



<div class="paging">
<div class="paginginside">

<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="admin_freeboard?currPage=${page.startBlock-1}&category=${category}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="admin_freeboard?currPage=${index }&category=${category}&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>
<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>
</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="admin_freeboard?currPage=${page.endBlock+1 }&category${category}&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>
</ul>

</div>
</div>

</div>
</body>
</html>