<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">

<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
<title>게시글 목록</title>
<script>
function reply_view(no)
{

	var freeboard_no=no;
	var obj=document.getElementById("add_reply-"+freeboard_no);
	
if(obj.hasChildNodes())
obj.removeChild(obj.firstChild);

	
if(obj.hasChildNodes()===false)
	{
document.getElementById("add_reply_thead-"+freeboard_no).removeAttribute("style");
 
	$.ajax({
		url:'/freeboard_replyjson/'+freeboard_no
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
			
			var node=document.createElement("TR");
			var node2=document.createElement("TD");
			var node3=document.createElement("TD");
			var node4=document.createElement("TD");
						
			node2.appendChild(textnode);
			node3.appendChild(textnode2);
			node4.appendChild(textnode3);
			
			node.appendChild(node2);
			node.appendChild(node3);
			node.appendChild(node4);
				document.getElementById("add_reply-"+freeboard_no).appendChild(node);
				}
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
	}


</script>
</head>
<body>
<sec:authentication property="principal" var="pinfo"/>
게시판 관리페이지<br>
<input type="button" value="공지등록" onclick="location.href='/freeboard_noticewrite'">	
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
  <form action="" method="post">
  <input type="hidden" name="member_id" value=""><br>
  <input type="button" value="수정"><input type="button" value="삭제">
  </form>


</div>
</td>
</tr>



</c:forEach>
</tbody>

<tbody>
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


  <form action="" method="post">
  <textarea style="resize: none;" rows="5" cols="100" name="boardreply_content"></textarea><br>
  <input type="hidden" name="member_id" value=""><br>
  <input type="button" value="답변"><input type="button" value="삭제">
  </form>
  </div>

</div>
</td>
</tr>

</c:forEach>
</tbody>
</table>
<form method="get" action="admin_freeboard?currPage=${page.startBlock }">
<select name="search">
<option value="all">전체</option>
<option value="member_nick">닉네임</option>
<option value="freeboard_title">제목</option>
<option value="freeboard_content">내용</option>
</select>
<input type="text" name="searchtxt" >
<input type="submit" value="검색">

</form>

<sec:authorize access="isAuthenticated()">
<input type="button" id="write" value="글쓰기" onclick="location.href='/freeboard_insert'"><br>
</sec:authorize>

<c:if test="${page.prev }">
<a href="admin_freeboard?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
</c:if>
<a href="admin_freeboard?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:forEach>

<c:if test="${page.next }">
<a href="admin_freeboard?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>
</body>
</html>