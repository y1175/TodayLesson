<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
      <h3>정산신청</h3>
      <div>
         <b>정산 가능 금액</b>
         <div>
            <div>
               <span>원</span> <!-- 정산가능 금액 나타내는거... 누르면 매출내역뜨는건 고민좀... -->
               <span>정산 계좌를 등록해주세요.</span>
               <span>계좌 등록시 회원가입 이름과 동일해야 합니다.</span>
               <button>+계좌등록</button>
            </div>
            <div>
               <button>정산FAQ</button>
               <button>정산신청</button>
            </div>
         </div>
         <div>
         <b>정산 대기 금액</b>
            <div>
               <span>원</span> 
               <span>* 정산 기준인 클래스 수업 종료 5일이내의 금액으로
                                        각 <span>수업종료 5일 이후 정산가능 금액으로 변경</span>됩니다. 
               </span>
            </div>
         </div>
      </div>
      <div>
         <b>정산 기준 안내</b>
         <div>
            <span>1. 클래스 수업종료 5일ㄹ 이후 정산가능 금액으로 변경되면, 정산 신청이 가능합니다.</span>
            <span>2. 정산 신청후 5일 이내 입금 처리됩니다.</span>
            <span>3. 계좌인증이 완료 된 정산 계좌가 등록되어 있어야 정산 신청이 가능합니다.</span>
         </div>
      </div>
      <div>
         <button>엑셀다운로드</button>
      </div> 
      <div>
         <table class="">
            <thead>
               <tr>
                  <th rowspan="2">NO.</th>
                  <th rowspan="2">정산번호</th>
                  <th rowspan="2">정산상태</th>
                  <th rowspan="2">정산신청일</th>
                  <th rowspan="2">결제건수</th>
                  <th rowspan="2">정산기간</th>
                  <th rowspan="2">정산계좌</th>
                  <th rowspan="2">정산금액</th>
                  <th colspan="4">상세내역</th>
               </tr>
               <tr>
                  <th>레슨수익금액</th> 
                  <th>포인트사용</th>  
                  <!-- <th>레슨취소금액</th>
                  <th>포인트취소</th> -->
                  <th>정산수수료</th>
                  <th>세금계산서부가세</th>
               </tr>
            </thead>
            <tbody>
               <c:forEach var="cal_requestlist" items="${cal_requestlist}" varStatus="status">
               <c:forEach var="cal_paycount" items="${cal_paycount}">
               <c:forEach var="cal_lessonrevenuecost" items="${cal_lessonrevenuecost}"> 
               <c:forEach var="cal_usepointsum" items="${cal_usepointsum}"></c:forEach>
                  <tr>
                     <!-- NO. -->
                     <td>
                        <c:out value="${status.count}"/>
                     </td>
                     <!-- 정산번호 정산신청완료했을시에만 나타나게 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_requestlist.calculate_no == null}">
                              <c:out value=" - "/>
                           </c:when>
                           <c:when test="${cal_requestlist.calculate_no != null}">
                              <c:out value="${cal_requestlist.calculate_no}"/>
                           </c:when>
                        </c:choose>
                     </td> 
                     <!-- 정산상태 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 0}">
                              <c:out value="정산대기"/>
                           </c:when>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 1}">
                              <c:out value="정산신청"/>
                           </c:when>
                        </c:choose>
                     </td>
                     <!-- 정산신청일  정산 완료 됐을시만 나타나게 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_requestlist.calculate_date == null}">
                              <c:out value=" - "/>
                           </c:when>
                           <c:when test="${cal_requestlist.calculate_date != null}">
                              <c:out value="${cal_requestlist.calculate_date}"/>
                           </c:when>
                        </c:choose>
                     </td> 
                     <!-- 결제건수 -->
                     <td>
                        <c:out value="${cal_paycount}"/>
                     </td> 
                  
                     <!-- 정산기간 -->
                     <td>
                        <c:out value="${cal_requestlist.lesson_open_period}"/>
                        <span> - </span>
                        <c:out value="${cal_requestlist.lesson_close_period}"/>
                     </td> 
                     <!-- 정산계좌 -->
                     <td>
                        <c:out value="${cal_requestlist.senior_bank_name}"/>
                        <br>
                        <c:out value="${cal_requestlist.senior_account_num}"/>
                        <br>
                        <c:out value="${cal_requestlist.s.senior_account_name}"/>
                     </td>
                     <!-- 정산금액 -->
                     <td>
                     
                     </td> 
                     <!-- 레슨수익금액 결제완료된금액-->
                     <td>
                        <c:out value="${cal_lessonrevenuecost}"/>
                     </td> 
                     <!-- 포인트사용 -->
                     <td>
                        <c:out value="${cal_usepointsum}"/>
                     </td> 
                     <!-- 레슨취소금액 -->
                     <!-- <td>
                     
                     </td>  -->
                     <!-- 취소포인트 -->
                     <!-- <td>
                     
                     </td> --> 
                     <!-- 정산수수료 -->
                     <td>
                        <c:out value="${cal_lessonrevenuecost*0.1}"/>   
                     </td> 
                     <!-- 세금계산서부가세 -->
                     <td>
                        <c:choose>
                        <c:when test="${salesList.senior_crno == null}"> 
                           <td>
                              <c:out value="0"/>
                           </td>
                        </c:when>
                        <c:otherwise>
                           <td>
                              <c:out value="${(cal_lessonrevenuecost/1.1)*0.1}"/>  
                           </td>    
                        </c:otherwise>
                     </c:choose>
                     </td>
                  </tr>
               </c:forEach>  
               </c:forEach>
               </c:forEach>       
            </tbody>
         </table>
      </div>
   </div>
</body>
</html>