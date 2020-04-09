<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!--aside nav style-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_sn_main_leftaside_nav.css?ver=3">
<!--aside nav style-->

</head>
<body>
   <nav class="hs_sn_main_asidenav_nav">
   
         <b class="hs_sn_main_asidenav_nav_title">시니어</b>
         <p class="hs_sn_ModifyInformation_Title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/senior_switch_update">시니어정보수정</a>
         </p>   
      
      <div class="hs_sn_main_asidenav_line"></div>   
         
      <b class="hs_sn_main_asidenav_nav_title">레슨</b>
         <p class="hs_sn_LessonWrite_Title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/lesson_write">레슨등록</a>
         </p>   
         <p class="hs_sn_AllLessonList_Title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/lesson_list">전체레슨</a>
         </p>
         <p class="hs_sn_approveLessonList_Title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/my_approve_lesson">승인레슨</a>
         </p>
         
      <div class="hs_sn_main_asidenav_line"></div>
      
      <b class="hs_sn_main_asidenav_nav_title">매출정산</b>
         <p class="hs_sn_main_asidenav_nav_salestitle">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/senior_sales_list/${seniorPageInfo.senior_no}">매출현황</a>
         </p>
         <p class="hs_sn_main_asidenav_nav_calRequest_title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_requestlist/${seniorPageInfo.senior_no}">정산신청</a>
         </p>
         <p class="hs_sn_main_asidenav_nav_calStatment_title">
            <a href="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_statementlist/${seniorPageInfo.senior_no}">정산내역</a>
         </p>
         
      <div class="hs_sn_main_asidenav_line"></div>
      
   </nav>

</body>
</html>