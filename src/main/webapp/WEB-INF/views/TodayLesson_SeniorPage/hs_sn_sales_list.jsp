<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle --> 
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_sn_sales_list.css?ver=6">
   <style type="text/css">
      .hs_sn_main_asidenav_nav_salestitle>a{
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
   //날짜
   function formatDate(date)
  {
   	var d = new Date(date),
       month = '' + (d.getMonth() + 1),
       day = '' + d.getDate(),
       year = d.getFullYear();

   if (month.length < 2) 
       month = '0' + month;
   if (day.length < 2) 
       day = '0' + day;

   return [year, month, day].join('-');
  }
   var now=new Date();
   var week=new Date();
   var month=new Date();
   
   var dayOfMonth=week.getDate();
   var monthOfYear=month.getMonth();
   
   var weekday=week.setDate(dayOfMonth-7);
   var monthday=month.setMonth(monthOfYear-1);
   
   var todayval= formatDate(now);       
   var weekval=formatDate(weekday);
   var monthval=formatDate(monthday); 
   
   
   
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
        $("#hs_sn_sales_startdate").datepicker();                    
        $("#hs_sn_sales_enddate").datepicker();

	 

       
       //날짜 설정 버튼 (날짜값은 위에 있음) 
        $("#hs_senior_sales_Datesearch_AllBtn").click(function(){
        	$("#hs_sn_sales_startdate").val("");
        	$("#hs_sn_sales_enddate").val("");
        });
        $("#hs_senior_sales_Datesearch_TodayBtn").click(function(){
        	$("#hs_sn_sales_startdate").val(todayval);
        	$("#hs_sn_sales_enddate").val(todayval);
        });
        $("#hs_senior_sales_Datesearch_WeeklyBtn").click(function(){
        	$("#hs_sn_sales_startdate").val(weekval);
        	$("#hs_sn_sales_enddate").val(todayval);
        });
        $("#hs_senior_sales_Datesearch_MonthBtn").click(function(){
        	$("#hs_sn_sales_startdate").val(monthval);
        	$("#hs_sn_sales_enddate").val(todayval);
        });

        
});
   
   
   </script>
<!-- JS -->
</head>
<body>
   <div class="hs_senior_sales">
      <h2 class="hs_senior_sales_title">매출 현황</h2>
      <div class="">
            <form method="get" action="${pageContext.request.contextPath}/todaylessonsenior/senior_sales_list/${senior_no}?currPage=${Totalpage.startBlock}">
               <div class="hs_senior_sales_searchbox">
               <label class="hs_senior_sales_DatesearchTitle">기간검색</label>
               <div class="hs_senior_sales_Datesearchbox">
                  <input type="text" name="start_date" id="hs_sn_sales_startdate" placeholder="YYYY-MM-DD" >  <!-- value="${salesList_form.sales_search_enddate}" -->
                  <span class="hs_senior_sales_Date-"> - </span>
                  <input type="text" name="end_date" id="hs_sn_sales_enddate" placeholder="YYYY-MM-DD" >
                  <input type="button" name="" id="hs_senior_sales_Datesearch_AllBtn" value="전체">
                  <input type="button" name="" id="hs_senior_sales_Datesearch_TodayBtn" value="오늘">
                  <input type="button" name="" id="hs_senior_sales_Datesearch_WeeklyBtn" value="일주일">
                  <input type="button" name="" id="hs_senior_sales_Datesearch_MonthBtn" value="1개월">
               </div>
               <label class="hs_senior_sales_TextsearchTitle">검색기준</label>
               <div class="hs_senior_sales_Textsearchbox">   
                  <label for=""></label>
                  <select name="search" class="hs_senior_sales_TextsearchOP">
                     <option value="all">전체</option>
                     <option value="lesson_title">레슨명</option>
                     <option value="member_name">구매자</option>
                  </select> 
                  <input type="text" id="hs_senior_sales_Textsearch" name="searchtxt" placeholder="검색어를 입력해주세요">
               </div>
               <div class="hs_senior_Sales_BtnBox">
                  <input type="reset" id="hs_senior_Sales_ResetBtn" value="초기화">
                  <input type="submit" id="hs_senior_Sales_SearchBtn" value="검색">
               </div>
               </div>
               <div class="hs_senior_Sales_OpExcelBox">
                  <select name="" class="hs_senior_sales_SelectOP">
                     <option value="">전체</option>
                     <option value="">결제완료</option>
                     <option value="">결제취소</option>
                  </select>
                  <button class="hs_senior_Sales_ExcelBtn">엑셀다운로드</button>
               </div> 
               <%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  --%>          
            </form>
      </div>     
      <div class="hs_sn_salesList">
         <table id="hs_sn_sales_table" class="table table-hover" >
            <thead style="border-top: 2px solid rgb(53, 54, 58);">
               <tr>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);" >NO.</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);" >결제상태</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨종류</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);" >레슨번호</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);" >레슨명</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);" >구매일</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">구매자</th>
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
               <c:set var="sales_sum" value="0"/> <!-- 시니어매출합계 -->
               <c:set var="cost_sum" value="0"/> <!-- 결제금액합계 -->
               <c:set var="usepoint_sum" value="0"/> <!-- 포인트사용합계 -->
               <c:set var="comm_sum" value="0"/> <!-- 정산수수료합계 -->
               <c:set var="surtaxsum" value="0"/> <!-- 세금계산서 부가세합계-->
               <c:forEach var="salesList" items="${salesList}" varStatus="status">
                  <tr>
                     <!-- NO. -->
                     <td>
                        <c:out value="${status.count}"/>
                     </td> 
                     <!-- 결제상태 -->
                     <td>
                      <c:choose>
                        <c:when test="${salesList.orderlist_paystatus==1}">
                           <c:out value="결제완료"/>
                        </c:when> 
                        <c:when test="${salesList.orderlist_paystatus==3}">
                           <c:out value="결제취소"/>
                        </c:when>
                     </c:choose> 
                     </td>
                     <!-- 레슨종류 -->
                     <td>
                        <c:choose>
                           <c:when test="${salesList.lesson_type == 1}">
                              <c:out value="원데이레슨"/>
                           </c:when> 
                           <c:when test="${salesList.lesson_type == 2}">
                              <c:out value="다회성레슨"/>
                           </c:when>
                           <c:when test="${salesList.lesson_type == 3}">
                              <c:out value="동영상레슨"/>
                           </c:when>
                        </c:choose>                  
                     </td>
                     <!-- 레슨번호 -->
                     <td>
                        <c:out value="${salesList.lesson_no}"/>
                     </td> 
                     <!-- 레슨명 -->
                     <td>
                        <c:out value="${salesList.lesson_title}"/>
                     </td> 
                     <!-- 구매일 -->
                     <td>
                        <c:out value="${salesList.orderlist_date}"/>
                     </td> 
                     <!-- 구매자 -->
                     <td>
                        <c:out value="${salesList.member_name}"/>
                     </td> 
                     <!-- 시니어매출 = 결제금액-(포인트+정산수수료+부가세) -->
                     <c:set var="cost" value="${salesList.lesson_cost}"/> <!-- 결제금액 -->
                     <c:set var="point" value="${salesList.orderlist_usepoint}"/> <!-- 포인트  -->
                     <c:set var="comm" value="${cost*0.1}"/> <!-- 정산수수료 -->
                     <c:set var="surtax" value="${(cost*1.1)*0.1}"/> <!-- 부가세 -->
                     <c:set var="senior_salessum" value="${cost-point-comm}"/>
                     <fmt:parseNumber var="senior_sales" value="${senior_salessum}" type="number" integerOnly="true"/>
                        <td>
                           <fmt:formatNumber value="${senior_sales}" type="number" maxFractionDigits="3"/>원
                        </td> 
                     <!-- 결제금액 -->
                        <td>
                           <fmt:formatNumber value="${salesList.lesson_cost}" type="number" maxFractionDigits="3"/>원
                        </td> 
                     <!-- 포인트사용 -->
                        <td>
                           <fmt:formatNumber value="${salesList.orderlist_usepoint}" type="number" maxFractionDigits="3"/>원
                        </td> 
                     <!-- 정산수수료 -->
                     <td>
                        <fmt:formatNumber value="${comm}" type="number" maxFractionDigits="3"/>원
                     </td> 
                     <!-- 세금계산서부가세 -->
                     <%-- <c:choose>
                        <c:when test="${salesList.senior_crno!=null}"> 
                           <td>
                              <fmt:formatNumber value="${surtax}" type="number" maxFractionDigits="3"/>
                           </td>
                        </c:when>
                        <c:otherwise>
                           <td>
                              <c:out value="0"/>
                           </td>    
                        </c:otherwise>
                     </c:choose>  --%>
                     <td style="border-right: none;">
                        <c:out value="0"/>원
                     </td> 
                  </tr>
                  <c:set var="sales_sum" value="${sales_sum+senior_sales}"/> <!-- 시니어매출합계 -->
                  
                     <!-- 결제금액합계 -->
                     <c:set var="cost_sum" value="${cost_sum+salesList.orderlist_cost}"/>
                     <!-- 포인트사용합계 -->
                     <c:set var="usepoint_sum" value="${usepoint_sum+salesList.orderlist_usepoint}"/>
                     <!-- 정산수수료합계 -->
                     <c:set var="comm_sum" value="${comm_sum+comm}"/>
                     <!-- 세금계산서 부가세합계-->
                     <c:set var="surtaxsum" value="${surtaxsum+surtax}"/> 
                     <fmt:parseNumber var="taxsum" value="${surtaxsum}" type="number" integerOnly="true"/>
                     
               </c:forEach>
            </tbody>
            <tfoot style="border-bottom: 2px solid rgb(53, 54, 58); border-top: 2px solid rgb(53, 54, 58); font-weight: bold;">
               <tr>
                  <td colspan="7">합계</td>
                  <td> <!-- 시니어매출합계 -->
                     <fmt:formatNumber value="${sales_sum}" type="number" maxFractionDigits="3"/>원
                  </td> 
                  <td> <!-- 결제금액합계 -->
                     <fmt:formatNumber value="${cost_sum}" type="number" maxFractionDigits="3"/>원
                  </td> 
                  <td> <!-- 포인트사용합계 -->
                     <fmt:formatNumber value="${usepoint_sum}" type="number" maxFractionDigits="3"/>원
                  </td> 
                  <td> <!-- 정산수수료합계 -->
                     <fmt:formatNumber value="${comm_sum}" type="number" maxFractionDigits="3"/>원 
                  </td> 
                  <td style="border-right: none;"> <!-- 세금계산서 부가세합계-->
                     <c:out value="0"/>원
                   <%--  <c:choose>
                           <c:when test="${salesList.senior_crno!=null}"> 
                               <fmt:formatNumber value="${taxsum}" type="number" maxFractionDigits="3"/>
                           </c:when>
                           <c:otherwise>
                              
                           </c:otherwise>
                     </c:choose>  --%>
                     
                  </td> 
               </tr>
            </tfoot>
         </table>
      </div>
   </div>
   
<div class="">
<!-- 이전페이지블럭 -->
<c:if test="${Totalpage.prev }">
<a href="${pageContext.request.contextPath}/todaylessonsenior/senior_sales_list/${senior_no}?currPage=${Totalpage.startBlock-1}&search=${search}&searchtxt=${searchtxt }"><c:out value="이전"/></a>
</c:if>

<!-- 현재 페이지블럭 -->
<c:forEach var="index" begin="${Totalpage.startBlock }" end="${Totalpage.endBlock }">

<!-- if 인덱스가 현재페이지가 아니면 a태그 -->
<c:if test="${index!= Totalpage.currPage }">
<a href="${pageContext.request.contextPath}/todaylessonsenior/senior_sales_list/${senior_no}?currPage=${index }&search=${search}&searchtxt=${searchtxt}">${index }</a>
</c:if>

<!--  if 인덱스가 현재페이지면 현재페이지 출력 -->
<c:if test="${index==Totalpage.currPage }">
${index }
</c:if>
</c:forEach>

<!-- 다음페이지블럭 -->
<c:if test="${Totalpage.next }">
<a href="${pageContext.request.contextPath}/todaylessonsenior/senior_sales_list/${senior_no}?currPage=${Totalpage.endBlock+1 }&search=${search}&searchtxt=${searchtxt}"><c:out value="다음"/></a>
</c:if>
</div>
   
   
</body>
</html>