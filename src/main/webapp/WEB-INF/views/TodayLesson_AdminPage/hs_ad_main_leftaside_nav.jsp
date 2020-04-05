<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdminPage</title>

<!--aside nav style-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_main_leftaside_nav.css?ver=2">
<!--aside nav style-->

</head>
<body>
   <nav class="hs_ad_main_asidenav_nav">
   
      <b>회원관리</b>
         <p class="hs_ad_main_asidenav_nav_Member_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_hm_memmanage">회원관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_Senior_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/all_senior">시니어관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_MemberOrder_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_orderlist">회원주문관리</a>
         </p>   
      
      <div class="hs_ad_main_asidenav_line"></div>
      
      <b>레슨관리</b>
         <p class="hs_ad_main_asidenav_nav_Lesson_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/alllesson">레슨관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_NewLessonEvaluation_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/wait_lesson">신규레슨심사</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_SeniorSales_Title">
            <a href="">시니어매출현황</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_SeniorCalculate_Title">
         <a href="">시니어매출정산</a>
         </p>

      <div class="hs_ad_main_asidenav_line"></div>
      
      <b>스토어관리</b>
         <p class="hs_ad_main_asidenav_nav_Product_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/ej_ad_productlist">상품관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_OrderList_Title">
            <a href="">주문내역관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_OrderCancel_Title">
            <a href="">주문취소관리</a>
         </p>   

      <div class="hs_ad_main_asidenav_line"></div>

      <b>운영관리</b>
         <p class="hs_ad_main_asidenav_nav_Event_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_event_manage">이벤트관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_FreeBoard_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_freeboard">커뮤니티관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_ProductReview_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/ad_product_reviewlist">후기관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_question_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/hm_ad_question">1:1문의관리</a>
         </p>   

      <div class="hs_ad_main_asidenav_line"></div>

      <b>통계관리</b>
         <p class="hs_ad_main_asidenav_nav_StatSales_Title">
            <a href="">매출통계</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_StatMember_Title"> 
            <a href="${pageContext.request.contextPath}/todaylessonadmin/member_statistics">회원통계</a>
         </p>   
      
      <div class="hs_ad_main_asidenav_line"></div>
        
      <b>기타관리</b>
         <p class="hs_ad_main_asidenav_nav_Banner_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list">배너관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_PopUp_Title">
            <a href="">팝업관리</a>
         </p>
         <p class="hs_ad_main_asidenav_nav_Administrator_Title">
            <a href="${pageContext.request.contextPath}/todaylessonadmin//admin_administrator">관리자설정</a>
         </p>
      
      <div class="hs_ad_main_asidenav_line"></div>   

   </nav>

</body>
</html>