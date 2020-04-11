<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Lesson_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
     <link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/CSS/jy_ad_all_lesson.css?ver=6">   
	<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- CSSstyle -->
   
   <script type="text/javascript">
   $(document).ready(function(){
		
	   $( "#lesson_open_period" ).datepicker({
			dateFormat:"yy-mm-dd" //Input Display Format 변경
		    	,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
	            ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
		    	,changeMonth: false  //콤보박스에서 월 선택 가능 
		        ,changeYear: false  //콤보박스에서 년 선택 가능
		        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
	            ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
	            ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
	            ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트  
	            ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
	            ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
	            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip 텍스트

	         onClose: function( selectedDate ) {
	        	  $("#lesson_close_period").datepicker( "option", "minDate", selectedDate );
	       	}
	    });	
	  
	  $( "#lesson_close_period" ).datepicker({
	    	dateFormat:"yy-mm-dd"
	    	,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
           ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
	    	,changeMonth: false  //콤보박스에서 월 선택 가능 
	        ,changeYear: false  //콤보박스에서 년 선택 가능
	        ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시  
           ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
           ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
           ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트  
           ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
           ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
           ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'], //달력의 월 부분 Tooltip 텍스트
	         onClose: function( selectedDate ) {
                // 종료일(toDate) datepicker가 닫힐때
                // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#fromDate").datepicker( "option", "maxDate", selectedDate );
            }                


	    });	
	  
	  
	 
});
   </script>

</head>
<body>
<div id="jy_container">
 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: left;"><b>레슨 관리</b></h2>
 </div>
<%--  
 <!-- 검색 --> 
 <nav class="navbar navbar-expand-lg navbar-light bg-light" style="width:31.5%; margin:40px auto;">
  <div class="collapse navbar-collapse" id="navbarSupportedContent" style="margin:0px auto;">
 <form class="form-inline my-2 my-lg-0" method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${page.startBlock }"
 style="margin:0px auto;">
 <select name="search" class="custom-select mr-sm-3" id="inlineFormCustomSelect" style="height:34px; font-size: 1em;">
 <option value="all">전체</option>
<option value="lesson_title">레슨명</option>
 <option value="member_id">시니어 아이디</option>
</select>
 <input class="form-control mr-sm-2" name="searchtxt" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-secondary" style="background-color: rgb(224, 62, 82);" type="submit">검색</button>
    </form>
  </div>
</nav>
<!-- 검색완료 -->
  --%>

          <div class="hs_admin_sales_searchbox">
            <form method="post" action="${pageContext.request.contextPath}/todaylessonadmin/alllesson?search=${search}&searchtxt=${searchtxt}&st">
               <label class="hs_admin_sales_DatesearchTitle">기간검색</label>
               <div class="hs_admin_sales_Datesearchbox">
                  <input type="text" name="start_date" id="lesson_open_period" placeholder="YYYY-MM-DD" >  <!-- value="${salesList_form.sales_search_enddate}" -->
                  <span class="hs_admin_sales_Date-"> - </span>
                  <input type="text" name="end_date" id="lesson_close_period" placeholder="YYYY-MM-DD" >
                  <input type="button" name="" id="hs_admin_sales_Datesearch_AllBtn" value="전체">
                  <input type="button" name="" id="hs_admin_sales_Datesearch_TodayBtn" value="오늘">
                  <input type="button" name="" id="hs_admin_sales_Datesearch_WeeklyBtn" value="일주일">
                  <input type="button" name="" id="hs_admin_sales_Datesearch_MonthBtn" value="1개월">
               </div>
               <label class="hs_admin_sales_TextsearchTitle">검색기준</label>
               <div class="hs_admin_sales_Textsearchbox">   
                  <label for=""></label>
                  <select name="search" class="hs_admin_sales_TextsearchOP">
                     <option value="all">전체</option>
                     <option value="lesson_title">레슨명</option>
                     <option value="senior_nick">시니어</option>
                  </select> 
                  <input type="text" id="hs_admin_sales_Textsearch" name="searchtxt" placeholder="검색어를 입력해주세요">
               </div>
               <div class="hs_admin_Sales_BtnBox">
                  <input type="reset" id="hs_admin_Sales_ResetBtn" value="초기화" class="ej_btn2">
                  <input type="submit" id="hs_admin_Sales_SearchBtn" value="검색" class="ej_btn">
               </div>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           </form>    
               </div>
 


	<table class="table table-hover" style="width: 100%; margin: 0px auto 40px;">
		<thead>
			<tr  style="background-color: #fff2f2;">
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_no">#</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_title">레슨명</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_category">카테고리</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_type">레슨타입</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_register_date">등록일자</a></th>
				<th scope="col">오픈일</th>
				<th scope="col">마감일</th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=member_id">시니어아이디</a></th>
				<th scope="col"><a href="${pageContext.request.contextPath }/todaylessonadmin/alllesson?order=lesson_result">승인상태</a></th>
				
			</tr>
		</thead>
		<tbody>
<thead>
<tbody>
			<c:forEach var="item" items="${list}">
				<tr>
					<td>${item.lesson_no}</td>
					<td><a href="${pageContext.request.contextPath }/todaylessonadmin/admin_lesson_detail/${item.lesson_no}">${item.lesson_title}</a></td>

<c:choose>

<c:when test="${item.lesson_category == 1}">
<td><c:out value="운동"/></td>
</c:when>

<c:when test="${item.lesson_category == 2}">
<td><c:out value="교육"/></td>
</c:when>

<c:when test="${item.lesson_category == 3}">
<td><c:out value="핸드메이드"/></td>
</c:when>

<c:when test="${item.lesson_category == 4}">
<td><c:out value="it"/></td>
</c:when>

<c:otherwise>
<td><c:out value="요리"/></td>
</c:otherwise>

</c:choose>


<c:choose>

<c:when test="${item.lesson_type == 1}">
<td><c:out value="원데이 클래스"/></td>
</c:when>

<c:when test="${item.lesson_type == 2}">
<td><c:out value="다회성 클래스"/></td>
</c:when>

<c:otherwise>
<td><c:out value="온라인 클래스"/></td>
</c:otherwise>

</c:choose>
					<td>${item.senior_register_date}</td>
					<td><c:out value="${item.lesson_open_period}"></c:out></td>
<td><c:out value="${item.lesson_close_period}"></c:out></td>
<td><c:out value="${item.member_id}"></c:out></td>
<c:choose>

<c:when test="${item.lesson_result == 0}">
<td><c:out value="신청완료"/></td>
</c:when>

<c:when test="${item.lesson_result == 1}">
<td><c:out value="심사중"/></td>
</c:when>

<c:when test="${item.lesson_result == 2}">
<td><c:out value="레슨승인"/></td>
</c:when>

<c:otherwise>
<td><c:out value="레슨거절"/></td>
</c:otherwise>

</c:choose>


</tr>
</c:forEach>
</tbody>
</table>

<div class="paging">
<div class="paginginside">

<ul class="pagination pagination-danger">
<c:if test="${page.prev }">
<li class="page-item">
<a href="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt }">PREV
</a></li>
</c:if>

<c:forEach var="index" begin="${page.startBlock }" end="${page.endBlock }">
<c:if test="${index!= page.currPage }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }
</a></li>
</c:if>

<c:if test="${index==page.currPage }">
<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
</c:if>

</c:forEach>

<c:if test="${page.next }">
<li class="page-item">
<a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/alllesson?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
</a></li>
</c:if>
</ul>
</div>
</div>
</div>

</body>
</html>