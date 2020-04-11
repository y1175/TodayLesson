<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_us_mypage_my1_1question>a{
         color: white;
      }
      .hs_us_mypage_mymanage>a{
	     color : #757575;
       }
   </style>
<!-- CSSstyle -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_us_question.css?ver=2">                               
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>



<div class="usquestionmain">


<img alt="faq" src="${pageContext.request.contextPath}/resources/IMG/faq.png" class="usquestionimg">
<h2>1:1 문의하기</h2>
<div>
<h3>궁금하신 사항이 있으시다면 언제든지 문의해주시기 바랍니다</h3>
<h5>고객센터 연결이 힘드신 경우 1:1문의를 이용하시면 빠르게 답변드리겠습니다</h5>
<p>CALL CENTER  010-9988-2728</p>
<p>서비스 운영시간 : 오전 9시 ~ 오후 6시 월 ~ 금(토,일 ,공휴일 제외)</p>
<input type ="button" onclick="location.href='${pageContext.request.contextPath}/todaylessonmypage/hm_question_insert'" class="question_btn" id="question_btn" value="문의하기">
</div>
</div>



<c:if test="${!empty list}" > 


	<table class="table" style="text-align:center; width: 80%; margin: 0px auto 100px;">
		<thead>
			<tr class="table-warning">
				<th scope="col" style="background-color:#fff2f2; text-align:center;">#</th>
				<th scope="col" style="background-color:#fff2f2; text-align:center;">문의유형</th>
				<th scope="col" style="background-color:#fff2f2; text-align:center;">제목</th>
				<th scope="col" style="background-color:#fff2f2; text-align:center;">처리상태</th>
				<th scope="col" style="background-color:#fff2f2; text-align:center;">문의일</th>
				<th scope="col" style="background-color:#fff2f2; text-align:center;">상세보기</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach var="item" items="${list}">
		<tr>
		<td>
		<input type="hidden" id="question_no" class = "question_no" value="${item.question_no}">
		
		<!-- 미답변시 하얀하트 -->
		<c:if test="${empty item.question_answer}">
		<svg class="bi bi-heart" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M8 2.748l-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01L8 2.748zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143c.06.055.119.112.176.171a3.12 3.12 0 01.176-.17C12.72-3.042 23.333 4.867 8 15z" clip-rule="evenodd"/>
		</svg>
		</c:if>
		
		<!-- 답변완료시 까만하트 -->
		<c:if test="${!empty item.question_answer}">
		<svg class="bi bi-heart-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  		<path fill-rule="evenodd" d="M8 1.314C12.438-3.248 23.534 4.735 8 15-7.534 4.736 3.562-3.248 8 1.314z" clip-rule="evenodd"/>
		</svg>
		</c:if>
		
		</td>
		<c:choose>
		<c:when test="${item.question_group eq '0'}">
		<td>
		<p>레 슨</p>
		</td>
		</c:when>
		<c:when test="${item.question_group eq '1'}">
		<td>
		<p>시니어</p>
		</td>
		</c:when>
		<c:when test="${item.question_group eq '2'}">
		<td>
		<p>스토어</p>
		</td>
		</c:when>
		<c:when test="${item.question_group eq '3'}">
		<td>
		<p>주  문</p>
		</td>
		</c:when>
		<c:when test="${item.question_group eq '4'}">
		<td>
		<p>기  타</p>
		</td>
		</c:when>
		</c:choose>
		
		<td>
		${item.question_title}
		</td>
		
		<c:choose>
		<c:when test="${item.question_situation eq '0'}">
		<td>
		<p>답변대기</p>
		</td>
		</c:when>
		<c:when test="${item.question_situation eq '1'}">
		<td>
		<p>답변완료</p>
		</td>
		</c:when>
		</c:choose>

		<td>
		${item.question_writedate}
		</td>
		<td>
		<input type ="button" onclick="location.href='${pageContext.request.contextPath}/todaylessonmypage/hm_us_question_detail/'+${item.question_no}" class ="hm_us_questiondetailbtn" id="${item.question_no}" value="상세보기">
		</td>
		</tr>
		</c:forEach>
		</tbody>
		</table>
		<div class="paging">
		<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonmypage/hm_us_question?currPage=${page.startBlock-1}">PREV
</a></li>
</c:if>
<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonmypage/hm_us_question?currPage=${index }">${index }
</a></li>
</c:if>
<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>
</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonmypage/hm_us_question?currPage=${page.endBlock+1 }">NEXT
</a></li>
</c:if>
</ul>
</div>		
		
		</c:if>






</body>
</html>