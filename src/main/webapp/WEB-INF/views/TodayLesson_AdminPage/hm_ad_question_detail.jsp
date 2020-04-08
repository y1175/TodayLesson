 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="utf-8">
<title>관리자 1:1문의 상세페이지</title>
<!-- CSSstyle --> 
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hm_ad_question_detail.css?ver=2">
   <style type="text/css">
      .hs_ad_main_asidenav_nav_question_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->
<script src = "https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/JS/hm_ad_question_detail.js?ver=4"></script>
</head>
<body>


<div class="adfaqdetailmain">

<div class="adfaqgroup">
<c:choose>
<c:when test="${dto.question_group eq '0'}">
<p>레  슨</p>                          
</c:when>
<c:when test="${dto.question_group eq '1'}">
<p>시니어</p>
</c:when>
<c:when test="${dto.question_group eq '2'}">
<p>스토어</p>
</c:when>
<c:when test="${dto.question_group eq '3'}">
<p>주  문</p>
</c:when>
<c:when test="${dto.question_group eq '4'}">
<p>기  타</p>
</c:when>
</c:choose>
</div>

<!-- 타이틀 -->
<h3>
<svg class="bi bi-question-circle-fill" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" d="M16 8A8 8 0 110 8a8 8 0 0116 0zM6.57 6.033H5.25C5.22 4.147 6.68 3.5 8.006 3.5c1.397 0 2.673.73 2.673 2.24 0 1.08-.635 1.594-1.244 2.057-.737.559-1.01.768-1.01 1.486v.355H7.117l-.007-.463c-.038-.927.495-1.498 1.168-1.987.59-.444.965-.736.965-1.371 0-.825-.628-1.168-1.314-1.168-.901 0-1.358.603-1.358 1.384zm1.251 6.443c-.584 0-1.009-.394-1.009-.927 0-.552.425-.94 1.01-.94.609 0 1.028.388 1.028.94 0 .533-.42.927-1.029.927z" clip-rule="evenodd"/>
</svg>

${dto.question_title}
</h3>
<div class="hmadfaq">
<h6>문의일 : ${dto.question_writedate}</h6>
<div class="hmfaqline"></div>
<p>${dto.question_content}</p>
</div>
<!-- 문의 내용 뽑아주기 완료 -->

<!-- 기존 답변이 있을 시 & 없을 시 구분해주기 -->
<!-- 답변이 없을 시 -->
<c:choose>
<c:when test="${empty dto.question_answer }">
<div class="hmfaqdetailbtn">
<input type="button" id="hm_ad_questionbtn" class="hm_ad_questionbtn" value="답변하기">
<button onclick="location.href='${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question'" class="questionlistbtn">목록으로</button>
</div>
</c:when>




<c:when test="${!empty dto.question_answer }">
<h3 style="margin-top:100px;">
<svg class="bi bi-arrow-return-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
<path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 01.708 0l3 3a.5.5 0 010 .708l-3 3a.5.5 0 01-.708-.708L12.793 9l-2.647-2.646a.5.5 0 010-.708z" clip-rule="evenodd"/>
<path fill-rule="evenodd" d="M3 2.5a.5.5 0 00-.5.5v4A2.5 2.5 0 005 9.5h8.5a.5.5 0 000-1H5A1.5 1.5 0 013.5 7V3a.5.5 0 00-.5-.5z" clip-rule="evenodd"/>
</svg>
${dto.question_title}
</h3>
<div class="hmadfaq" >
<h6>답변일 : ${dto.question_answerwritedate}</h6>
<div class="hmfaqline"></div>
<p>${dto.question_answer}</p>
</div>


<div class="hmfaqdetailbtn">
<input type="button" id="${dto.question_no}" class="hm_ad_questionbtn2" value="답변삭제">
<input type="button" id="hm_faq_answerupdate" class="hm_ad_questionbtn" value="답변수정">
<button onclick="location.href='${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question'" class="hm_ad_questionbtn">목록으로</button>
</div>

</c:when>
</c:choose>
</div>
<!--
버튼에 right를 먹여놔서 button순서가 반대 
 기존 답변이 있을 시 & 없을 시 구분해주기 끝 -->




<!-- 답글달기 -->
<div id="hm_question_answerdiv" class="adfaqdetailmain" style="display :none;">

<h3 style="margin-top:100px;">
<svg class="bi bi-arrow-return-right" width="1em" height="1em" viewBox="0 0 16 16" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
  <path fill-rule="evenodd" d="M10.146 5.646a.5.5 0 01.708 0l3 3a.5.5 0 010 .708l-3 3a.5.5 0 01-.708-.708L12.793 9l-2.647-2.646a.5.5 0 010-.708z" clip-rule="evenodd"/>
  <path fill-rule="evenodd" d="M3 2.5a.5.5 0 00-.5.5v4A2.5 2.5 0 005 9.5h8.5a.5.5 0 000-1H5A1.5 1.5 0 013.5 7V3a.5.5 0 00-.5-.5z" clip-rule="evenodd"/>
</svg>
${dto.question_title}
</h3>

<form method="post" action="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question_update">
<input type="hidden" value="${dto.question_no}" id="question_no" name="question_no">
<div class="form-group">
<label for="question_answer" style="margin-left:5%;">답변 내용</label>
<textarea class="form-control" id="question_answer" name="question_answer" required="required" rows="20" cols="90" style="width:90%; margin-left:5%;" >
${dto.member_id} 님 안녕하세요.<br>
오늘의 레슨 고객 센터팀입니다. <br>
</textarea>
</div>
<div class="hmfaqdetailbtn">
<input type="button" id="hm_answercancel" class="hm_ad_questionbtn4" value="답변취소">
<input type="submit" id="question_answerbtn" class="hm_ad_questionbtn3" value="답변달기">
</div>
<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>
</div>
<!-- 답글 끝 -->
 

</body>
</html>