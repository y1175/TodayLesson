<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>TodayLessonAdminPage</title>

<!-- CSSstyle --> 
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_sales_list.css">
   <style type="text/css">
      .hs_ad_main_asidenav_nav_SeniorSales_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<!-- jQuery DatePicker -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery DatePicker -->
<!-- JS -->
   
   <script type="text/javascript">
   $(document).ready(function(){
		
	   $.datepicker.setDefaults({
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
            ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
            ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
            ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
            ,minDate: "-1Y" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
            ,maxDate: "+1M" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)     
	        ,nextText: '다음 달'
	        ,prevText: '이전 달'
	    });	
	
	    
	  //input을 datepicker로 선언
        $("#hs_admin_start_date").datepicker();                    
        $("#hs_admin_end_date").datepicker();

	 
});
   </script>
<!-- JS -->

</head>
<body>
   <div class="hs_admin_sales">
      <h3 class="hs_admin_sales_title">시니어 매출 현황</h3>
         <div class="hs_admin_sales_searchbox">
               <label class="hs_admin_sales_DatesearchTitle">기간검색</label>
               <div class="hs_admin_sales_Datesearchbox">
                  <input type="text" name="start_date" id="hs_admin_start_date" placeholder="YYYY-MM-DD" >  <!-- value="${salesList_form.sales_search_enddate}" -->
                  <span class="hs_admin_sales_Date-"> - </span>
                  <input type="text" name="end_date" id="hs_admin_end_date" placeholder="YYYY-MM-DD" >
                  <input type="button" name="" id="hs_admin_sales_Datesearch_AllBtn" value="전체">
                  <input type="button" name="" id="hs_admin_sales_Datesearch_TodayBtn" value="오늘">
                  <input type="button" name="" id="hs_admin_sales_Datesearch_WeeklyBtn" value="일주일">
                  <input type="button" name="" id="hs_admin_sales_Datesearch_MonthBtn" value="1개월">
               </div>
               <label class="hs_admin_sales_TextsearchTitle">검색기준</label>
               <div class="hs_admin_sales_Textsearchbox">   
                  <label for=""></label>
                  <select name="search" class="hs_admin_sales_TextsearchOP">
                     <option value="">전체</option>
                     <option value="">레슨명</option>
                     <option value="">시니어</option>
                  </select> 
                  <input type="text" id="hs_admin_sales_Textsearch" name="searchtxt" placeholder="검색어를 입력해주세요">
               </div>
               <div class="hs_admin_Sales_BtnBox">
                  <input type="reset" id="hs_admin_Sales_ResetBtn" value="초기화">
                  <input type="submit" id="hs_admin_Sales_SearchBtn" value="검색">
               </div>
               </div>
         <div class="hs_admin_Sales_OpExcelBox">
            <form action="${pageContext.request.contextPath}/todaylessonadmin/admin_sales_list">
               <select class="hs_admin_sales_SelectOP">
                  <option value="">전체</option>
                  <option value="">최대매출순</option>
                  <option value="">상품번호순</option>
               </select>
               <button class="hs_admin_Sales_ExcelBtn">엑셀다운로드</button>
            </form>
         </div>
      <div class="hs_ad_salesList">
         <table id="hs_ad_sales_table" class="table table-hover" >
            <thead style=" border-top: 2px solid rgb(53, 54, 58);">
               <tr>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">NO.</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">카테고리</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨종류</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨번호</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨명</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">구매일</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">시니어</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">시니어매출</th>
                  <th colspan="4" style="border-right: none; border-bottom: 1px solid rgba(53, 54, 58, 0.4);">상세내역</th>
               </tr>
               <tr>
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">결제금액</th>   
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">포인트사용</th>
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">정산수수료</th>
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58); border-right: none;">세금계산서부가세</th>
               </tr>
            </thead>
            <tbody>
               <c:set var="ad_sales_sum" value="0"/> <!-- 시니어매출합계 -->
               <c:set var="ad_cost_sum" value="0"/> <!-- 결제금액합계 -->
               <c:set var="ad_usepoint_sum" value="0"/> <!-- 포인트사용합계 -->
               <c:set var="ad_comm_sum" value="0"/> <!-- 정산수수료합계 -->
               <c:set var="ad_surtaxsum" value="0"/> <!-- 세금계산서 부가세합계-->
               <c:forEach var="adminSeniorSalesList" items="${adminSeniorSalesList}" varStatus="status">
                  <tr>
                     <!-- NO. -->
                     <td>
                        <c:out value="${status.count}"/>
                     </td> 
                     <!-- 카테고리 -->
                     <td>
                        <c:set var="category" value="${adminSeniorSalesList.lesson_category}"/>
                     <c:choose>
                        <c:when test = "${category==1}">
                              <c:out value="운동"/>
                        </c:when>
                        <c:when test = "${category==2}">
                              <c:out value="교육"/>
                        </c:when>
                        <c:when test = "${category==3}">
                              <c:out value="핸드메이드"/>
                        </c:when>
                        <c:when test = "${category==4}">
                              <c:out value="IT"/>
                        </c:when>
                        <c:when test = "${category==5}">
                              <c:out value="요리"/>
                        </c:when>
                        <c:when test = "${category==6}">
                              <c:out value="기타"/>
                        </c:when>
                     </c:choose>
                     </td>
                     <!-- 레슨종류 -->
                     <td>
                        <c:choose>
                           <c:when test="${adminSeniorSalesList.lesson_type==1}">
                              <c:out value="원데이레슨"/>
                           </c:when> 
                           <c:when test="${adminSeniorSalesList.lesson_type==2}">
                              <c:out value="다회성레슨"/>
                           </c:when>
                           <c:when test="${adminSeniorSalesList.lesson_type==3}">
                              <c:out value="동영상레슨"/>
                           </c:when>
                        </c:choose>                  
                     </td>
                     <!-- 레슨번호 -->
                     <td>
                        <c:out value="${adminSeniorSalesList.lesson_no}"/>
                     </td> 
                     <!-- 레슨명 -->
                     <td>
                        <c:out value="${adminSeniorSalesList.lesson_title}"/>
                     </td> 
                     <!-- 구매일 -->
                     <td>
                        <c:out value="${adminSeniorSalesList.orderlist_date}"/>
                     </td>
                     <!-- 시니어 -->
                     <td>
                        <c:out value="${adminSeniorSalesList.senior_nick}"/>
                     </td> 
                     <!-- 시니어매출 = 결제금액-(포인트+정산수수료+부가세) -->
                     <c:set var="cost" value="${adminSeniorSalesList.lesson_cost}"/> <!-- 결제금액 -->
                     <c:set var="point" value="${adminSeniorSalesList.orderlist_usepoint}"/> <!-- 포인트  -->
                     <c:set var="comm" value="${adminSeniorSalesList.sales_comm}"/> <!-- 정산수수료 -->
                     <c:set var="surtax" value="${adminSeniorSalesList.sales_surtax}"/> <!-- 부가세 -->
                     <c:set var="senior_sales" value="${cost-(point+comm+surtax)}"/>
                        <td>
                           <fmt:formatNumber value="${senior_sales}" type="number" maxFractionDigits="3"/>
                        </td> 
                     <!-- 결제금액 -->
                        <td>
                           <fmt:formatNumber value="${adminSeniorSalesList.lesson_cost}" type="number" maxFractionDigits="3"/>
                        </td> 
                     <!-- 포인트사용 -->
                        <td>
                           <fmt:formatNumber value="${adminSeniorSalesList.orderlist_usepoint}" type="number" maxFractionDigits="3"/>
                        </td> 
                     <!-- 정산수수료 -->
                     <td>
                        <fmt:formatNumber value="${adminSeniorSalesList.sales_comm}" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 세금계산서부가세 -->
                     <td style="border-right: none;">
                        <c:choose>
                           <c:when test="${salesList.senior_crno == null}"> 
                              <c:out value="0"/>
                           </c:when>
                           <c:otherwise>
                              <fmt:formatNumber value="${adminSeniorSalesList.sales_surtax}" type="number" maxFractionDigits="3"/>
                           </c:otherwise>
                        </c:choose>
                     </td>
                  </tr>
                  <c:set var="sales_sum" value="${sales_sum+senior_sales}"/> <!-- 시니어매출합계 -->
                  
                     <!-- 결제금액합계 -->
                     <c:set var="ad_cost_sum" value="${ad_cost_sum+adminSeniorSalesList.lesson_cost}"/> 
                     <!-- 포인트사용합계 -->
                     <c:set var="ad_usepoint_sum" value="${ad_usepoint_sum+adminSeniorSalesList.orderlist_usepoint}"/> 
                     <!-- 정산수수료합계 -->
                     <c:set var="ad_comm_sum" value="${ad_comm_sum+adminSeniorSalesList.sales_comm}"/> 
                     <!-- 세금계산서 부가세합계-->
                     <c:set var="ad_surtaxsum" value="${ad_surtaxsum+adminSeniorSalesList.sales_surtax}"/> 
               </c:forEach>
            </tbody>
            <tfoot style="border-bottom: 2px solid rgb(53, 54, 58); border-top: 2px solid rgb(53, 54, 58); font-weight: bold;">
               <tr>
                  <td colspan="7">합계</td>
                 <td> <!-- 시니어매출합계 -->
                     <fmt:formatNumber value="${sales_sum}" type="number" maxFractionDigits="3"/>
                  </td> 
                  <td> <!-- 결제금액합계 -->
                     <fmt:formatNumber value="${cost_sum}" type="number" maxFractionDigits="3"/>
                  </td> 
                  <td> <!-- 포인트사용합계 -->
                     <fmt:formatNumber value="${usepoint_sum}" type="number" maxFractionDigits="3"/>
                  </td> 
                  <td> <!-- 정산수수료합계 -->
                     <fmt:formatNumber value="${comm_sum}" type="number" maxFractionDigits="3"/> 
                  </td> 
                  <td style="border-right: none;"> <!-- 세금계산서 부가세합계-->
                     <fmt:formatNumber value="${surtaxsum}" type="number" maxFractionDigits="3"/> 
                  </td> 
               </tr>
            </tfoot>
         </table>
      </div>   
   </div>
</body>
</html>