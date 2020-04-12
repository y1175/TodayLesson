<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>  
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSSstyle -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_ad_calculate_list.css?ver=2">  
   <style type="text/css">
      .hs_ad_main_asidenav_nav_SeniorCalculate_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<!-- jQuery DatePicker -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!-- jQuery DatePicker -->
 <script>

$('document').ready(function(){
	
	
	let bank_code= "${dto.senior_bank_name}";
	let token = "${token}";

	console.log(bank_code);
	console.log(token);

	$.ajax({
	   method: 'get',
	   url: 'https://api.iamport.kr/banks',
	    headers: { 
	       "Authorization": token
	   }
	}).done(function(msg) {
	      console.log(msg);
	      let bank_name = msg.response;
		 console.log(bank_name.length);
	      for (var i = 0; i < bank_name.length; i++) {   
	         if (bank_name[i].code == bank_code) {
	            let senior_bank_name = bank_name[i].name;
	            console.log(senior_bank_name);
	            $('.bank_name').append(senior_bank_name);
	            //$('select[name="senior_bank_name"]').find('option[value='+i+']').attr("selected",true);
	            console.log("dddd");
	            break;
	         }
	      }
	      
	   });
	
});

</script> 
   
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
	        , onClose: function( selectedDate ) {
	        // 종료일(toDate) datepicker가 닫힐때
	        // 시작일(fromDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
	        $("#fromDate").datepicker( "option", "maxDate", selectedDate );
	        }
	    });	
	
	    
	  //input을 datepicker로 선언
        $("#hs_admin_start_date").datepicker();                    
        $("#hs_admin_end_date").datepicker();

	 
});
   </script>
<!-- JS -->

</head>
<body>
   <div class="hs_admin_calculate">
      <h2 class="hs_admin_calculate_title">시니어 매출 정산</h2>
         <div class="hs_admin_calculate_searchbox">
            <form method="get" action="${pageContext.request.contextPath}/todaylessonadmin/admin_calculate_list?search=${search}&searchtxt=${searchtxt}">
               <label class="hs_admin_calculate_DatesearchTitle">기간검색</label>
               <div class="hs_admin_calculate_Datesearchbox">
                  <input type="text" name="start_date" id="hs_admin_start_date" placeholder="YYYY-MM-DD" >  <!-- value="${salesList_form.sales_search_enddate}" -->
                  <span class="hs_admin_calculate_Date-"> - </span>
                  <input type="text" name="end_date" id="hs_admin_end_date" placeholder="YYYY-MM-DD" >
                  <input type="button" name="" id="hs_admin_calculate_Datesearch_AllBtn" value="전체">
                  <input type="button" name="" id="hs_admin_calculate_Datesearch_TodayBtn" value="오늘">
                  <input type="button" name="" id="hs_admin_calculate_Datesearch_WeeklyBtn" value="일주일">
                  <input type="button" name="" id="hs_admin_calculate_Datesearch_MonthBtn" value="1개월">
               </div>
               <label class="hs_admin_calculate_TextsearchTitle">검색기준</label>
               <div class="hs_admin_calculate_Textsearchbox">   
                  <label for=""></label>
                  <select name="search" class="hs_admin_calculate_TextsearchOP">
                     <option value="all">전체</option>
                     <option value="lesson_title">레슨명</option>
                     <option value="senior_nick">시니어</option>
                  </select> 
                  <input type="text" id="hs_admin_calculate_Textsearch" name="searchtxt" placeholder="검색어를 입력해주세요">
               </div>
               <div class="hs_admin_calculate_BtnBox">
                  <input type="reset" id="hs_admin_calculate_ResetBtn" value="초기화">
                  <input type="submit" id="hs_admin_calculate_SearchBtn" value="검색">
               </div>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
           </form>    
               </div>
         <div class="hs_admin_calculate_OpExcelBox">
            <form action="${pageContext.request.contextPath}/todaylessonadmin/admin_sales_list">
               <select class="hs_admin_calculate_SelectOP">
                  <option value="">전체</option>
                  <option value="">정산접수</option>
                  <option value="">정산완료</option>
               </select>
               <button class="hs_admin_calculate_ExcelBtn">엑셀다운로드</button>
            </form>
         </div>
         <div class="hs_admin_calculate_requestList">
         <table id="hs_admin_calculate_requestList_Table" class="table table-hover">
            <thead style="border-top: 2px solid rgb(53, 54, 58);">
               <tr>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산번호</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산상태</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨번호</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">지급은행</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">지급계좌</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산신청일</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">시니어</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산요청금액</th>
                  <th colspan="4" style=" border-bottom: 1px solid rgba(53, 54, 58, 0.4);">상세내역</th>
                  <th rowspan="2" style=" border-right: none; border-bottom: 2px solid rgb(53, 54, 58);">정산처리</th>
               </tr>
               <tr>
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨수익금액</th> 
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">포인트사용</th>  
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">정산수수료</th>
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58); border-right: none;">세금계산서부가세</th>
               </tr>
            </thead>
            <tbody style="border-bottom: 2px solid rgb(53, 54, 58);">
               <c:forEach var="cal_requestlist" items="${cal_requestlist}" varStatus="status">
               <input type="hidden" value="${cal_SeniorInfo[status.index].calculate_no}" class="calculate_no">
               <c:if test="${cal_requestlist.orderlist_orderstatus!=4}">
                  <tr>
                     <!-- 정산번호 -->
                     <td>
                        <c:out value="${cal_SeniorInfo[status.index].calculate_no}"/>
                     </td>
                     <!-- 정산상태 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 1}">
                              <c:out value="정산대기"/>
                           </c:when>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 2}">
                              <c:out value="정산가능"/>
                           </c:when>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 3}">
                              <c:out value="정산완료"/>
                           </c:when>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 4}">
                              <c:out value="정산접수"/>
                           </c:when>
                        </c:choose>
                     </td>
                     <!-- 레슨번호 -->
                     <td>
                        <c:out value="${cal_requestlist.lesson_no}"/>
                     </td>
                     <!-- 지급은행 -->
                     <c:set var = "calculate_bank_name1" value = "${cal_SeniorInfo[status.index].calculate_bank_name}"/>
                     <c:set var = "length" value = "${fn:length(calculate_bank_name1)}"/>
                     <c:set var = "calculate_bank_name2" value = "${fn:substring(calculate_bank_name1, 1, length)}" />
                     <td>
                        <c:out value="${calculate_bank_name2}"/>
                     </td> 
                     <!-- 지급계좌 -->
                     <c:set var = "calculate_account_num1" value = "${cal_SeniorInfo[status.index].calculate_account_num}"/>
                     <c:set var = "length2" value = "${fn:length(calculate_account_num1)}"/>
                     <c:set var = "calculate_account_num2" value = "${fn:substring(calculate_account_num1, 1, length2)}" />
                     <td>
                        <c:out value="${calculate_account_num2}"/>
                     </td>
                     <!-- 정산신청일-->
                     <td>
                        <c:out value="${cal_SeniorInfo[status.index].calculate_date}"/>
                     </td>
                     <!-- 시니어 -->
                     <td>
                        <c:out value="${cal_requestlist.senior_nick}"/>
                     </td> 
                     <!-- 정산요청금액-->
                     <td>
                         <c:choose>
                           <c:when test="${cal_SeniorInfo[status.index].calculate_crno==null}">
                              <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_cost_nosurtax}" type="number" maxFractionDigits="3"/>원
                           </c:when>
                           <c:otherwise>
                              <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_cost_surtax}" type="number" maxFractionDigits="3"/>원
                           </c:otherwise>
                        </c:choose> 
                     </td> 
                     <!-- 레슨수익금액 결제완료된금액-->
                     <td>
                        <fmt:formatNumber value="${cal_lessonrevenuecost[status.index].orderlist_cost}" type="number" maxFractionDigits="3"/>원
                     </td> 
                     <!-- 포인트사용 -->
                     <td>
                        <fmt:formatNumber value="${cal_usepointsum[status.index].orderlist_usepoint}" type="number" maxFractionDigits="3"/>원
                     </td> 
                     <!-- 정산수수료 -->
                     <td>
                       <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_comm}" type="number" maxFractionDigits="3"/>원
                     </td> 
                     <!-- 세금계산서부가세 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_SeniorInfo[status.index].calculate_crno==null}">
                              <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_surtax}" type="number" maxFractionDigits="3"/>원
                           </c:when>
                           <c:otherwise>
                              <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_surtax}" type="number" maxFractionDigits="3"/>원
                           </c:otherwise>
                        </c:choose> 
                     </td>
                     <td style="border-right: none;">
                        <button class="hs_admin_calculate_Btn">정산금액지급</button>
                     </td>
                  </tr>
                  </c:if>
                 </c:forEach> 
            </tbody>
         </table>
      </div>
   </div>      
   
   <script type="text/javascript">
   $(document).ready(function(){
	   $(".hs_admin_calculate_Btn").on('click',function(){
			

			if(confirm("정산지급하시겠습니까?")){
				var calculate_no = $(".calculate_no").val();
				location.href="${pageContext.request.contextPath}/todaylessonadmin/admin_calculate_give"
			}
		
			
		});
		
	});
   </script>
</body>
</html>