<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>

<!-- CSSstyle --> 
   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_bannerlist.css?ver=8">
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Banner_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<!-- Banner JS -->
   <script src="${pageContext.request.contextPath}/resources/JS/hs_ad_bannerlist.js?ver=2"></script>
<!-- Banner JS -->
</head>
<body>
   <div class="hs_Admin_Banner">
      <h2 class="hs_Admin_Banner_Title">배너관리</h2>
      <form class="row" method ="post" action="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${page.startBlock }" style="text-align: center;  margin-top: 40px;">
         <div class="col-md-7" style="text-align: left;">
            <select name="search" class="hs_admin_banner_SelectOP">
               <option value="all">전체</option>
               <option value="event_title">제목</option>
            </select>
            <input type="text" name="searchtxt" class="hs_admin_banner_Textsearch">
            <input type="submit" class="hs_admin_banner_TextsearchBtn" value="검색">
         </div>
         <div class="col-md-5" style="text-align: right;">
            <input type="button" id="hs_ad_bannerRegistrationrBtn" value="배너등록">
         </div>
      </form>
      <div class="hs_ad_bannerLine"></div>   
      <c:forEach var="adminBannerList" items="${adminBannerList}">
         <input type="hidden" value="${adminBannerList.banner_no}" class="banner_no">
         <div class="row" style="height: 200px;">
            <div class="col-md-6">
               <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_detail/${adminBannerList.banner_no}">
                  <img src="${adminBannerList.banner_filepath}" alt="banner_filepath" style="height: 200px;" >
               </a>
            </div>
            <div class="col-md-4">
               <p style="font-weight: 600;">
                  <c:choose>
                     <c:when test="${adminBannerList.banner_group eq '0'}">
                        <c:out value="Main Banner Slider"/>
                     </c:when>
                     <c:when test="${adminBannerList.banner_group eq '1'}">
                        <c:out value="Main Event Banner Slider"/>
                     </c:when>
                     <c:when test="${adminBannerList.banner_group eq '2'}">
                        <c:out value="Main Img Banner"/>
                     </c:when>
                  </c:choose>  
                  
               </p> 
               <p style="font-size: 17px; font-weight: 700;">
                  <c:out value="${adminBannerList.banner_title}"/>             
               </p>
               <p>
                  <c:out value="${adminBannerList.banner_registrationdate}"/>             
               </p>   
            </div>
            <div class="col-md-2" style="text-align: center; position: relative; top: 85px;">
               <button class="hs_admin_bannerupdateBtn">수정</button>
               <button class="hs_admin_bannerdeleteBtn">삭제</button>
            </div>
         </div>
         <div class="hs_ad_bannerLine"></div>
      </c:forEach>
      <div class="row">
      
      <ul class="pagination pagination-danger" style="margin: auto;">
         <c:if test="${page.prev}">
         <li class="page-item">
            <a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}">PREV
            </a></li>
         </c:if>
                     <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
                        <c:if test="${index!= page.currPage}">
                        <li class="page-item">
                        <a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${index }&search=${search}&searchtxt=${searchtxt}" class="page-link">${index}
                        </a></li>
                        </c:if>
                        
                        <c:if test="${index==page.currPage }">
						<li class="active page-item"><a href="javascript:void(0);" class="page-link">${index }</a></li>
						</c:if>
                        
                     </c:forEach>
         
         <c:if test="${page.next}">
         <li class="page-item">
            <a class="page-link" href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}">NEXT
            </a></li>
         </c:if>
         </ul>
      
      </div>
      
   </div>  
   
   
</body>
</html>