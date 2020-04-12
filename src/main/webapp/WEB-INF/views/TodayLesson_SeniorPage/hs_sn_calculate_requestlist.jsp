<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSSstyle -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/hs_sn_calculate_requestlist.css?ver=6">  
   <style type="text/css">
      .hs_sn_main_asidenav_nav_calRequest_title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->

<!-- JS -->
   <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/resources/JS/hs_sn_calculate_requestlist.js"></script>
<!-- JS -->

<script type="text/javascript">
/* 은행명 */
  $('document').ready(function(){
		
		
		let bank_code= "${accountdetalidto.senior_bank_name}";
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
		            let senior_bank_name = bank_name[i].code;
		            
		            console.log(senior_bank_name);
		            //$('.bank_name').append(senior_bank_name);
		            $('select[name="senior_bank_name"]').find('option[value='+senior_bank_name+']').attr("selected",true);
		            console.log("dddd");
		            break;
		         }
		      }
		      
		   });
		
	});
</script>
<script>
	$('document').ready(function() {

		let bank_code = "${accountdetalidto.senior_bank_name}";
		let token = "${token}";

		console.log(bank_code);
		console.log(token);

		$.ajax({
			method : 'get',
			url : 'https://api.iamport.kr/banks',
			headers : {
				"Authorization" : token
			}
		}).done(function(msg) {
			console.log(msg);
			let bank_name = msg.response;

			for (var i = 0; i < bank_name.length; i++) {
				console.log(bank_name[i]);
				console.log(bank_name[i].code);
				console.log(bank_name[i].name);
				//console.log(bank_code);

				if (bank_name[i].code == bank_code) {
					let senior_bank_name = bank_name[i].name;
					$('.bank_name').append(senior_bank_name);
					break;
				}
			}

		})
	});
</script>

</head>
<body>

   <div class="hs_senior_calculate_request">
      <h4 class="hs_senior_calculate_request_title">정산신청</h4>
      <div class="hs_senior_calculate_possible_wait_box">
         <div class="col-md-6" style="display: inline-block;">
            <b class="hs_senior_calculate_possiblebox_title">정산 가능 금액</b>
            <div class="card m card-default" style="margin-top: 10px; height: 160px;"> <!-- 이거 빼고 확인해보기   -->
               <div class="card-block" style="padding: 25px 10px;">
                  <div class="col-sm-7" style="display: inline-block;">
                     <b style="font-size: 18px;">
                        <c:choose>
                           <c:when test="${calculate_possibilitycost==null}">
                              <c:out value="0원"/>
                           </c:when>
                           <c:otherwise>
                              <fmt:formatNumber value="${calculate_possibilitycost}" type="number" maxFractionDigits="3"/>원
                           </c:otherwise>
                        </c:choose>
                     </b> <!-- 정산가능 금액 나타내는거... 누르면 매출내역뜨는건 고민좀... -->
                     <br>
                     <div class = "bank_name" style="font-size: 15px; font-weight: 600; margin: 10px 0px 0px 0px; color: rgba(53, 54, 58, 0.5);"></div>
                     <span style="font-size: 15px; font-weight: 600; margin: 10px 0px 0px 0px; color: rgba(53, 54, 58, 0.5);">
                        <c:out value="${accountdetalidto.senior_account_num}"/>
                     </span>
                     <span style="font-size: 15px; font-weight: 600; margin: 10px 0px 0px 0px; color: rgba(53, 54, 58, 0.5);">
                        <c:out value="${accountdetalidto.senior_account_name}"/>
                     </span>
                        <br>
                  <button type="button" data-toggle="modal" data-target="#hs_senior_AccountModal" class="hs_senior_AccountUpdate">계좌수정</button>
                  <!-- Account Update modal -->
                  <div class="modal fade" id="hs_senior_AccountModal" tabindex="-1" role="dialog" aria-labelledby="hs_senior_AccountModal_title" aria-hidden="true">
                     <div class="modal-dialog" role="document">
                        <div class="modal-content">
                           <div class="modal-body" style="padding: 12px 16px 16px; color: rgb(53, 54, 58);">
                              <form method="post" action="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_accountupdateresult">
                                 <div class="hs_senior_AccountModal_HeaderDiv">
                                    <b class="hs_senior_AccountModal_Title" id="hs_senior_AccountModal_title">계좌정보수정</b>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                 </div>
                                 <div class="form-row">
                                    <div class="form-group col-md-4">
                                       <select name="senior_bank_name" id="senior_bank_name" class="form-control" style="font-size: 15px;">
                                          <option class="bank_name"></option>
                                          <option value="004">KB국민은행</option>
                                          <option value="023">SC제일은행</option>
                                          <option value="039">경남은행</option>
                                          <option value="034">광주은행</option>
                                          <option value="003">기업은행</option>
                                          <option value="011">농협</option>
                                          <option value="031">대구은행</option>
                                          <option value="032">부산은행</option>
                                          <option value="002">산업은행</option>
                                          <option value="007">수협</option>
                                          <option value="088">신한은행</option>
                                          <option value="048">신협</option>
                                          <option value="005">외환은행</option>
                                          <option value="020">우리은행</option>
                                          <option value="071">우체국</option>
                                          <option value="037">전북은행</option>
                                          <option value="035">제주은행</option>
                                          <option value="012">축협</option>
                                          <option value="081">하나은형(서울은행)</option>
                                          <option value="027">한국씨티뱅크(한미은행)</option>
                                          <option value="089">K뱅크</option>
                                          <option value="090">카카오뱅크</option>
                                          <option value="209">유안타증권</option>
                                          <option value="218">현대증권</option>
                                          <option value="230">미래에셋증권</option>
                                          <option value="238">대우증권</option>
                                          <option value="240">삼성증권</option>
                                          <option value="243">한국투자증권</option>
                                          <option value="247">우리투자증권</option>
                                          <option value="261">교보증권</option>
                                          <option value="262">하이투자증권</option>
                                          <option value="263">에이치엠씨투자증권</option>
                                          <option value="264">키움증권</option>
                                          <option value="265">이트레이드증권</option>
                                          <option value="266">에스케이증권</option>
                                          <option value="267">대신증권</option>
                                          <option value="268">솔로몬투자증권</option>
                                          <option value="269">한화증권</option>
                                          <option value="270">하나대투증권</option>
                                          <option value="278">굿모닝신한증권</option>
                                          <option value="279">동부증권</option>
                                          <option value="280">유진투자증권</option>
                                          <option value="287">메리츠증권</option>
                                          <option value="289">엔에이치투자증권</option>
                                          <option value="290">부국증권</option>
                                       </select>
                                    </div>
                                    <div class="form-group col-md-8">
                                       <input type="text" id="senior_account_num" name="senior_account_num" required="required" value="${accountdetalidto.senior_account_num}" class="form-control">
                                    </div>
                                 </div>
                                 <div class="form-group col-md-14">
                                    <input type="text" id="senior_account_name" name="senior_account_name" required="required" value="${accountdetalidto.senior_account_name}" class="form-control">
                                 </div>
                                 <div class="hs_senior_AccountModal_WarningDiv">
                                    <p>일반(간이)사업자의 예금주는 대표자명 또는 사업자등록증의 상호명과 동일해야하며</p>
                                    <p>법인 사업자의 예금주는 사업자등록증의 법인명의와 동일해야 합니다.</p>
                                    <p style="color: rgb(224, 62, 82); ">※정산계좌에 문제가 있을 경우에는 정산이 불가능합니다.</p>
                                 </div>
                                 <div class="hs_senior_AccountModal_FooterDiv">
                                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                                    <input type="button" value="계좌실명확인" name="hs_senior_AccountModal_RealnameCheck" class="hs_senior_AccountModal_RealnameCheck" onclick="checkBankHolder();" >
                                    <input type="submit" value="정산계좌수정" class="hs_senior_AccountModal_AccountUpdate">
                                 </div>
                                 <input type="hidden" id="token" name="token" value="${token}">
                              </form>
                           </div>
                        </div>
                     </div>
                  </div>
                  <script>
                  
                 	function checkBankHolder(){
              		
             
                  	let target = document.getElementById("senior_bank_name");
		            let bank_code = target.options[target.selectedIndex].value;
		            let token = document.getElementById("token").value;
		            let bank_num = document.getElementById("senior_account_num").value;
		            let account_name = document.getElementById("senior_account_name").value;
		
	            	console.log(bank_code);
             		console.log(bank_num);
	             	console.log(token);
	            	console.log(account_name);
                  	
                  	
                  	$.ajax({
                  		method: 'get',
                  		url: 'https://api.iamport.kr/vbanks/holder',
                  	    headers: { "Authorization": token
                  		}, 
                  		data : {
                  			bank_code : bank_code,
                  			bank_num : bank_num
                  		}
                  	}).done(
                  					function(msg) {
                  						console.log(msg);
                  					/* 	let adn = msg.documents[0].bank_holder;
                  						console.log
                  						(adn); */

                  						let bank = msg.response;
                  						//let name = bank.parse().bank_holder;
                  						console.log(bank);
                  						console.log(bank["bank_holder"]);
                  						
                  						var bank_holder = bank["bank_holder"];
                  						
                  						if (account_name == bank_holder) {
                  							alert("실명 인증 성공");
                  						} else {
                  							alert("실명 인증 실패");
                  						}
                  					
                  					});
              	}
                  
               </script>
                 
                  <!-- Account Update modal -->
               </div>
               
               <div class="col-sm-5 text-right" style="display: inline-block; float: right;">
                  <!-- <button>정산FAQ</button> -->
                  <button  data-toggle="modal" data-target="#hs_senior_CulateRequestModal" class="hs_senior_CulateRequestBtn">
                  <i class='fas fa-won-sign'></i>
                                정산신청
                  </button>
                  <!-- CulateRequest modal -->
                  <div class="modal fade" id="hs_senior_CulateRequestModal" tabindex="-1" role="dialog" aria-labelledby="hs_senior_CulateRequestModal_title" aria-hidden="true">
                     <div class="modal-dialog modal-xl" role="document">
                        <div class="modal-content">
                           <div class="modal-body" style="padding: 12px 16px 16px; color: rgb(53, 54, 58);">
                              <form method="post" action="${pageContext.request.contextPath}/todaylessonsenior/senior_calculate_senior_calculate_requestresult">
                                 <div class="hs_senior_CulateRequestModal_HeaderDiv">
                                    <b class="hs_senior_CulateRequestModal_Title" id="hs_senior_CulateRequestModal_title">정산신청</b>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                 </div>
                                 <div class="form-row" style="width:100%; margin-bottom: 15px;border-top: 1px solid rgba(53, 54, 58, 0.3); border-bottom: 1px solid rgba(53, 54, 58, 0.3);">
                                    <div class="col-md-6 text-left" style="display: inline-block; text-align: left; margin : 15px -20px 15px 20px;">
                                       <span style="font-size: 20px; font-weight: bold; color:rgba(53, 54, 58, 0.3); ">정산가능금액</span>
                                    </div>
                                    <div class="col-md-6 text-right" style="display: inline-block; text-align:right; margin : 15px 20px 15px -20px;">
                                       <span style="font-size: 20px; font-weight: bold;">
                                          <fmt:formatNumber value="${calculate_possibilitycost}" type="number" maxFractionDigits="3"/>원
                                       </span>
                                    </div>
                                 </div>
                                 <!-- 계좌정보 -->
                                 <div class="col-md-6" style="display: inline-block; text-align: left; float: left;">
                                    <b class="hs_senior_CulateRequestModal_accountdetail">계좌정보</b>
                                       <div class="card-block" style="padding: 10px 0px;">
                                          <table class="table table-hover" style="border-top: 2px solid rgb(53, 54, 58); border-bottom: 2px solid rgb(53, 54, 58);">
                                             <tr class="hs_senior_CulateRequestModal_accountdetail_tr">
                                                <th>은행</th>
                                                <td class = "bank_name">
                                                   
                                                </td>
                                             </tr>
                                             <tr class="hs_senior_CulateRequestModal_accountdetail_tr">
                                                <th>계좌번호</th>
                                                <td>
                                                   <c:out value=""/>${accountdetalidto.senior_account_num}
                                                </td>
                                             </tr>
                                             <tr class="hs_senior_CulateRequestModal_accountdetail_tr">   
                                                <th>예금주</th>
                                                <td>
                                                   <c:out value="${accountdetalidto.senior_account_name}"/>
                                                </td>
                                             </tr>
                                          </table>      
                                       </div> 
                                       <div class="card-block" style=" width:100%; padding: 12px; background-color: rgba(53, 54, 58, 0.3); font-size: 14px;">
                                          <input type="radio" id="hs_senior_CulateRequestModal_crno_o" 
                                                 name="hs_senior_CulateRequestModal_crno_ch" value="1" checked="checked">
                                          <label style="font-weight: 600; font-size: 13px; margin-right: 20px; margin-bottom: 12px;">개인사업자(법인)</label>
                                          <input type="radio" id="hs_senior_CulateRequestModal_crno_x" 
                                                 name="hs_senior_CulateRequestModal_crno_ch" value="2">
                                          <label style="font-weight: 600; font-size: 13px; margin-bottom: 12px;">개인</label>
                                          <!-- 사업자번호 있는 사람  -->
                                          <div id="hs_senior_CulateRequestModal_crno_o_detail" class="hs_senior_CulateRequestModal_crno_o_detail">
                                             <label for="hs_sn_cal_calculate_crno_o" style="width: 120px; font-weight: 600;">사업자등록번호</label>
                                             <input type="text" id="hs_sn_cal_calculate_crno_o" name="calculate_crno">
                                             <br>
                                             <label for="hs_sn_cal_calculate_crno_name_o" style="width: 120px; font-weight: 600;">업체명(법인명)</label>
                                             <input type="text" id="hs_sn_cal_calculate_crno_name_o" name="calculate_crno_name">
                                             <br>
                                             <label for="hs_sn_cal_calculate_bank_name_o" style="width: 120px; font-weight: 600;">정산신청은행</label>
                                             <select name="calculate_bank_name" id="hs_sn_cal_calculate_bank_name_o" style="font-size: 15px; margin-bottom: 10px;"> 
                                                <option class=""></option>
                                                <option value="KB국민은행">KB국민은행</option>
                                                <option value="023">SC제일은행</option>
                                                <option value="039">경남은행</option>
                                                <option value="034">광주은행</option>
                                                <option value="003">기업은행</option>
                                                <option value="011">농협</option>
                                                <option value="031">대구은행</option>
                                                <option value="032">부산은행</option>
                                                <option value="002">산업은행</option>
                                                <option value="007">수협</option>
                                                <option value="신한은행">신한은행</option>
                                                <option value="048">신협</option>
                                                <option value="005">외환은행</option>
                                                <option value="우리은행">우리은행</option>
                                                <option value="071">우체국</option>
                                                <option value="037">전북은행</option>
                                                <option value="035">제주은행</option>
                                                <option value="012">축협</option>
                                                <option value="081">하나은형(서울은행)</option>
                                                <option value="027">한국씨티뱅크(한미은행)</option>
                                                <option value="K뱅크">K뱅크</option>
                                                <option value="카카오뱅크">카카오뱅크</option>
                                                <option value="209">유안타증권</option>
                                                <option value="218">현대증권</option>
                                                <option value="230">미래에셋증권</option>
                                                <option value="238">대우증권</option>
                                                <option value="240">삼성증권</option>
                                                <option value="243">한국투자증권</option>
                                                <option value="247">우리투자증권</option>
                                                <option value="261">교보증권</option>
                                                <option value="262">하이투자증권</option>
                                                <option value="263">에이치엠씨투자증권</option>
                                                <option value="264">키움증권</option>
                                                <option value="265">이트레이드증권</option>
                                                <option value="266">에스케이증권</option>
                                                <option value="267">대신증권</option>
                                                <option value="268">솔로몬투자증권</option>
                                                <option value="269">한화증권</option>
                                                <option value="270">하나대투증권</option>
                                                <option value="278">굿모닝신한증권</option>
                                                <option value="279">동부증권</option>
                                                <option value="280">유진투자증권</option>
                                                <option value="287">메리츠증권</option>
                                                <option value="289">엔에이치투자증권</option>
                                                <option value="290">부국증권</option>
                                             </select>
                                             <!-- <input type="text" id="hs_sn_cal_calculate_bank_name_o" name="calculate_bank_name">  -->
                                             <br>
                                             <label for="hs_sn_cal_calculate_account_name_o" style="width: 120px; font-weight: 600;">예금주</label>
                                             <input type="text" id="hs_sn_cal_calculate_account_name_o" name="calculate_account_name" > 
                                             <br>
                                             <label for="hs_sn_cal_calculate_account_num_o" style="width: 120px; font-weight: 600;">계좌번호</label>
                                             <input type="text" id="hs_sn_cal_calculate_account_num_o" name="calculate_account_num" >
                                             <br>
                                             <label for="hs_sn_cal_calculate_name_o" style="width: 120px; font-weight: 600;">신청자</label>
                                             <input type="text" id="hs_sn_cal_calculate_name_o" name="calculate_name">
                                             <br>
                                             <label for="hs_sn_cal_calculate_phone_o" style="width: 120px; font-weight: 600;">연락처</label>
                                             <input type="text" id="hs_sn_cal_calculate_phone_o" name="calculate_phone">
                                          </div>
                                          <!-- 개인 -->
                                          <div id="hs_senior_CulateRequestModal_crno_x_detail" style="display: none;">
                                             <label for="hs_sn_cal_calculate_bank_name_x" style="width: 120px; font-weight: 600;">정산신청은행</label>
                                             <select name="calculate_bank_name" id="hs_sn_cal_calculate_bank_name_x">
                                                <option class=""></option>
                                                <option value="KB국민은행">KB국민은행</option>
                                                <option value="SC제일은행">SC제일은행</option>
                                                <option value="경남은행">경남은행</option>
                                                <option value="광주은행">광주은행</option>
                                                <option value="기업은행">기업은행</option>
                                                <option value="농협">농협</option>
                                                <option value="대구은행">대구은행</option>
                                                <option value="부산은행">부산은행</option>
                                                <option value="002">산업은행</option>
                                                <option value="007">수협</option>
                                                <option value="신한은행">신한은행</option>
                                                <option value="048">신협</option>
                                                <option value="005">외환은행</option>
                                                <option value="우리은행">우리은행</option>
                                                <option value="071">우체국</option>
                                                <option value="037">전북은행</option>
                                                <option value="035">제주은행</option>
                                                <option value="012">축협</option>
                                                <option value="081">하나은형(서울은행)</option>
                                                <option value="027">한국씨티뱅크(한미은행)</option>
                                                <option value="K뱅크">K뱅크</option>
                                                <option value="카카오뱅크">카카오뱅크</option>
                                                <option value="209">유안타증권</option>
                                                <option value="218">현대증권</option>
                                                <option value="230">미래에셋증권</option>
                                                <option value="238">대우증권</option>
                                                <option value="240">삼성증권</option>
                                                <option value="243">한국투자증권</option>
                                                <option value="247">우리투자증권</option>
                                                <option value="261">교보증권</option>
                                                <option value="262">하이투자증권</option>
                                                <option value="263">에이치엠씨투자증권</option>
                                                <option value="264">키움증권</option>
                                                <option value="265">이트레이드증권</option>
                                                <option value="266">에스케이증권</option>
                                                <option value="267">대신증권</option>
                                                <option value="268">솔로몬투자증권</option>
                                                <option value="269">한화증권</option>
                                                <option value="270">하나대투증권</option>
                                                <option value="278">굿모닝신한증권</option>
                                                <option value="279">동부증권</option>
                                                <option value="280">유진투자증권</option>
                                                <option value="287">메리츠증권</option>
                                                <option value="289">엔에이치투자증권</option>
                                                <option value="290">부국증권</option>
                                             </select>
                                             <!-- <input type="text" id="hs_sn_cal_calculate_bank_name_x" name="calculate_bank_name">  -->
                                             <br>
                                             <label for="hs_sn_cal_calculate_account_name_x" style="width: 120px; font-weight: 600;">예금주</label>
                                             <input type="text" id="hs_sn_cal_calculate_account_name_x" name="calculate_account_name"> 
                                             <br>
                                             <label for="hs_sn_cal_calculate_account_num_x" style="width: 120px; font-weight: 600;">계좌번호</label>
                                             <input type="text" id="hs_sn_cal_calculate_account_num_x" name="calculate_account_num">
                                             <br>
                                             <label for="hs_sn_cal_calculate_name_x" style="width: 120px; font-weight: 600;">신청자</label>
                                             <input type="text" id="hs_sn_cal_calculate_name_x" name="calculate_name" >
                                             <br>
                                             <label for="hs_sn_cal_calculate_phone_x" style="width: 120px; font-weight: 600;">연락처</label>
                                             <input type="text" id="hs_sn_cal_calculate_phone_x" name="calculate_phone" >
                                          </div>
                                       </div>
                                       <div id="hs_senior_CulateRequestModal_calculateguide_detail1" class="card-block" style="padding: 20px 0px; font-size: 13px;">
                                          <pre style="margin: 0px 0px 7px;">※ 최초 1회 정산시 증빙서류 제풀이 필요하며, 확인시 정산이 정상적으로 진행됩니다.</pre>
                                          <pre style="margin: 0px 0px 5px;">  [담당자 - 하화수 / E-Mail - todaylesson144@gmail.com]</pre>
                                          <pre style="margin: 0px 0px 0px;">  - 사업자 : 사업자등록증 사본, 사업자 통장사본</pre>
                                          <pre style="margin: 0px 0px 0px;">  - 개인 : 주민등록등본 사본, 본인 명의 통장 사본(비용처리에 필요한정보)</pre>
                                       </div>
                                 </div>
                                 <!-- 계좌정보 -->
                                 <!-- 정산가이드 -->
                                 <div class="col-md-6" style="display: inline-block; text-align : left; float: right;">
                                    <b class="hs_senior_CulateRequestModal_calculateguide">정산가이드</b>
                                    <div id="hs_senior_CulateRequestModal_calculateguide_detail2" class="card-block" style="padding: 15px 0px; font-size: 14px;">
                                       <pre style="margin: 0px 0px 7px; ">※ 정산 조건을 확인 하였습니까? </pre>
                                       <pre>   1.가입정보와 일치한 증빙 서류 제출</pre>
                                       <pre>     [담당자 - 하화수 / E-Mail - todaylesson144@gmail.com]</pre>
                                       <pre>     - 사업자 : 사업자등록증 사본, 사업자 통장사본</pre>
                                       <pre>     - 개인 : 주민등록등본 사본, 본인 명의 통장 사본(비용처리에 필요한정보)</pre>
                                       <pre>   2.정산신청 금액과 일치하는 공금가액으로 발행 된 '세금계산서'</pre>
                                       <pre>   3.환급신청 금액을 입금받으실 정확한 '계좌번호'</pre>
                                       <pre>   4.정산수수료 - 매출금액의 10% (VAT 별도)</pre>
                                    </div>
                                 </div>
                                 <!-- 정산가이드 -->
                                 <div class="col-md-12" style="clear: both; text-align: center;">
                                    <button type="submit" class="hs_senior_CulateRequestModal_Btn">
                                       <i class='fas fa-won-sign'></i>
                                                                     정산신청하기
                                    </button>
                                 </div>
                                 <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />  
                              </form>
                           </div>
                        </div>
                     </div>
                  </div>
                  <!-- CulateRequest modal -->
               </div>
            </div>   
            
         </div>
         </div>
         <div class="col-md-6" style="display: inline-block; float: right;">
         <b class="hs_senior_calculate_waitbox_title">정산 대기 금액</b>
         <div class="card m card-default" style="margin-top: 10px; height: 160px;">
            <div class="card-block" style="padding: 25px 10px;">
            <div class="col-sm-10">
               <b style="font-size: 18px;">
                  <fmt:formatNumber value="${calculate_waitingcost}" type="number" maxFractionDigits="3"/>원
               </b>
               <br>
               <br> 
               <span style="font-size: 14px;">* 정산 기준인 레슨 결제일 기준 5일이내의 금액으로  
               <br>                 
               <span style="font-size: 14px;"> 각 </span><span style="color: rgb(224, 62, 82);">레슨 결제 5일 이후 정산가능 금액으로 변경</span>됩니다. 
               </span>
            </div>
            </div>
         </div>
         </div>
      </div>
      <div class="col-md-7" style="margin-top: 15px;">
         <b class="hs_senior_calculate_standardtbox_title">정산 기준 안내</b>
         <div class="col-sm-14" style="padding: 10px; font-size: 14px; font-weight: 500;">
            <span>1. 레슨 결제일 기준 5일 이후 정산가능 금액으로 변경되며, 정산 신청이 가능합니다.</span>
            <br>
            <span>2. 정산 신청후 5일 이내 입금 처리됩니다.</span>
            <br>
            <span>3. 계좌인증이 완료 된 정산 계좌가 등록되어 있어야 정산 신청이 가능합니다.</span>
            <br>
            <span>4. 정산수수료 10%, 주니어포인트사용내역 제외하여 정산금액이 계산됩니다. </span>
            <br>
            <span>5. 사업자의 경우 정산금액에서 별도의 세금계산서부가세 금액을 제외하여 정산이 진행됩니다.</span>
         </div>
      </div>
      <div class="hs_senior_CalculateRequest_ExcelBox" style="text-align: right; margin-right: 15px;">
         <button class="hs_senior_CalculateRequest_ExcelBtn">엑셀다운로드</button>
      </div> 
      <div class="hs_senior_calculate_requestList">
         <table id="hs_senior_calculate_requestList_Table" class="table table-hover">
            <thead style="border-top: 2px solid rgb(53, 54, 58);">
               <tr>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">NO.</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨번호</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산번호</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산상태</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산신청일</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">결제건수</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산기간</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산계좌</th>
                  <th rowspan="2" style=" border-bottom: 2px solid rgb(53, 54, 58);">정산금액</th>
                  <th colspan="4" style="border-right: none; border-bottom: 1px solid rgba(53, 54, 58, 0.4);">상세내역</th>
               </tr>
               <tr>
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">레슨수익금액</th> 
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">포인트사용</th>  
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58);">정산수수료</th>
                  <th style=" border-bottom: 2px solid rgb(53, 54, 58); border-right: none;">세금계산서부가세</th>
               </tr>
            </thead>
            <tbody style="border-bottom: 2px solid rgb(53, 54, 58); ">
               <c:forEach var="cal_requestlist" items="${cal_requestlist}" varStatus="status">
               <c:if test="${cal_requestlist.orderlist_orderstatus!=4}">
                  <tr>
                     <!-- NO. -->
                     <td>
                        <c:out value="${status.count}"/>
                     </td>
                     <!-- 레슨번호 -->
                     <td>
                        <c:out value="${cal_requestlist.lesson_no}"/>
                     </td>
                     <!-- 정산번호 정산신청완료했을시에만 나타나게 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_requestlist.calculate_no==null || cal_requestlist.calculate_no==0}">
                              <c:out value=" - "/>
                           </c:when>
                           <c:when test="${cal_requestlist.calculate_no!=null}">
                              <c:out value="${cal_requestlist.calculate_no}"/>
                           </c:when>
                        </c:choose>
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
                        <fmt:formatNumber value="${cal_paycount[status.index].orderdate_count}" type="number" maxFractionDigits="3"/> 
                     </td> 
                  
                     <!-- 정산기간  / 결제일기준-->
                     <td>
                        <c:out value="${cal_requestlist.orderlist_date}"/>
                     </td> 
                     <!-- 정산계좌 -->
                     <c:set var = "calculate_bank_name1" value = "${cal_SeniorInfo[status.index].calculate_bank_name}"/>
                     <c:set var = "length1" value = "${fn:length(calculate_bank_name1)}"/>
                     <c:set var = "calculate_bank_name2" value = "${fn:substring(calculate_bank_name1, 1, length1)}" />
                     
                     <c:set var = "calculate_account_num1" value = "${cal_SeniorInfo[status.index].calculate_account_num}"/>
                     <c:set var = "length2" value = "${fn:length(calculate_account_num1)}"/>
                     <c:set var = "calculate_account_num2" value = "${fn:substring(calculate_account_num1, 1, length2)}" />
                     
                     <c:set var = "calculate_account_name1" value = "${cal_SeniorInfo[status.index].calculate_account_name}"/>
                     <c:set var = "length3" value = "${fn:length(calculate_account_name1)}"/>
                     <c:set var = "calculate_account_name2" value = "${fn:substring(calculate_account_name1, 1, length3)}" />
                     <td style="vertical-align: middle;">
                        <c:choose>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 1 || cal_requestlist.orderlist_calculatestatus == 2 }">
                              <c:out value=" - "/>
                           </c:when>
                           <c:when test="${cal_requestlist.orderlist_calculatestatus == 3 || cal_requestlist.orderlist_calculatestatus == 4 }">
                              <c:out value="${calculate_bank_name2}"/>
                              <br>
                              <c:out value="${calculate_account_name2}"/>
                              <br>
                              <c:out value="${calculate_account_num2}"/>
                           </c:when>
                        </c:choose>
                     </td>
                     <!-- 정산금액 -->
                     <td>
                        <c:choose>
                           <c:when test="${cal_SeniorAccount[status.index].senior_crno == null}"> 
                              <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_cost_nosurtax}" type="number" maxFractionDigits="3"/>
                           </c:when>
                           <c:when test="${cal_SeniorAccount[status.index].senior_crno != null}"> 
                              <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_cost_surtax}" type="number" maxFractionDigits="3"/>
                           </c:when>
                        </c:choose>
                     </td> 
                     <!-- 레슨수익금액 결제완료된금액-->
                     <td>
                        <fmt:formatNumber value="${cal_lessonrevenuecost[status.index].orderlist_cost}" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 포인트사용 -->
                     <td>
                        <fmt:formatNumber value="${cal_usepointsum[status.index].orderlist_usepoint}" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 정산수수료 -->
                     <td>
                       <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_comm}" type="number" maxFractionDigits="3"/>
                     </td> 
                     <!-- 세금계산서부가세 -->
                     <td style="border-right: none;">
                        <c:choose>
                           <c:when test="${cal_SeniorInfo[status.index].senior_crno == null && cal_requestlist.orderlist_calculatestatus == 1 || cal_requestlist.orderlist_calculatestatus == 2 }"> 
                              <c:out value="0"/>
                           </c:when>
                           <c:when test="${cal_SeniorInfo[status.index].senior_crno != null && cal_requestlist.orderlist_calculatestatus == 3 || cal_requestlist.orderlist_calculatestatus == 4 }"> 
                              <fmt:formatNumber value="${cal_CommSurtax[status.index].calculate_surtax}" type="number" maxFractionDigits="3"/>
                           </c:when>
                        </c:choose>
                     </td>
                  </tr>
                  </c:if>
                 </c:forEach> 
            </tbody>
         </table>
      </div>
   </div>
</body>
</html>