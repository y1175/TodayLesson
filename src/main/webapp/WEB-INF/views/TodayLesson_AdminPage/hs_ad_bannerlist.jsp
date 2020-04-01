<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdmin</title>

<!-- CSSstyle --> 
   <link rel ="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_bannerlist.css?ver=1">
   <style type="text/css">
      .hs_ad_main_asidenav_nav_Banner_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<!-- Banner JS -->
   <script src="${pageContext.request.contextPath}/resources/JS/hs_ad_bannerlist.js"></script>
<!-- Banner JS -->
</head>
<body>
   <div class="hs_Admin_BannerBox">
      <h4>배너관리</h4>
      <div>
         <form method ="get" action="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${page.startBlock }" style="text-align: center;  margin-top: 40px;">
            <select name="search">
               <option value="all">전체</option>
               <option value="event_title">제목</option>
            </select>
            <input type="text" name="searchtxt">
            <input type="submit" value="검색">
           
         </form>
      </div> 
       <input type="button" id="hs_ad_bannerRegistrationrBtn" class="" value="배너등록">
      <div class="hs_ad_bannerLine"></div>   
       
      <c:forEach var="adminBannerList" items="${adminBannerList}">
         <div>
            <div>
               <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_detail/${adminBannerList.banner_no}">
                  <img src="${adminBannerList.banner_filepath}" alt="banner_filepath" >
               </a>
            </div>
            <div>
               <span>등록일</span>
               <span>
                  <c:out value="${adminBannerList.banner_registrationdate}"/>
               </span>
               <span>
                  <c:out value="${adminBannerList.banner_title}"/>
               </span>
            </div>
            <div>
               <button>수정</button>
               <button>삭제</button>
            </div>
         </div>
         <div class="hs_ad_bannerLine"></div>
      </c:forEach>
   </div>  
   
   <c:if test="${page.prev}">
      <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${page.startBlock-1}&search=${search}&searchtxt=${searchtxt}"><c:out value="이전"/></a>
   </c:if>

   <c:forEach var="index" begin="${page.startBlock}" end="${page.endBlock}">
      <c:if test="${index!= page.currPage }"></c:if>
      <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index}</a>
   </c:forEach>

   <c:if test="${page.next}">
      <a href="${pageContext.request.contextPath}/todaylessonadmin/admin_banner_list?currPage=${page.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
   </c:if>
   
   
</body>
</html>