<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_sn_lesson_write.css?ver=1">  

<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script>

$(document).ready(function(){
	
	location.rload();
	opener.location.reload();
	
});


</script>
</head>
<body>

<script>
function checkBankHolder(){

	 
	 
	   let bank_code = $('#senior_bank_name').val();
	   let bank_num = $('#senior_account_num').val();
	   let token = $('#token').val();
	   let account_name = $('#senior_account_name').val();
	  // let se_name = $('#se_name').val();

	   
/*    let bank_code = document.getElementById('senior_bank_name').value;
let bank_num = document.getElementById('senior_account_num').value;   
let token = document.getElementById('token').value;
let account_name = document.getElementById('senior_account_name').value; */

console.log(bank_code);
console.log(bank_num);

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
            /*    let adn = msg.documents[0].bank_holder;
               console.log
               (adn); */

               let bank = msg.response;
               //let name = bank.parse().bank_holder;
               console.log(bank);
               console.log(bank["bank_holder"]);
               
               let bank_holder = bank["bank_holder"];
               
               if (account_name == bank_holder) {
                  alert("실명 인증 성공");
                  $('#se_name').val() = 1;
                  se_bank();
               } else {
                  alert("실명 인증 실패");
               }
            
            });
}

	

function checkDisable()
{
    if(no_crno.checked == true ){
	   senior_crno.disabled = true;
	   senior_crno_name.disabled = true;
	} else {
	   senior_crno.disabled = false;
	   senior_crno_name.disabled = false;
	}
}

</script>



<!-- 시니어 모드에 있는 시니어 정보 관리로 이동하기 -->
<div id="jy_container" >

 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center; font-weight: bold;">시니어 지원하기</h2>
 </div>
<form method="post" action="${pageContext.request.contextPath}/todaylessonsenior/plus_senior" name="frm">

<table style="width:60%; text-align:center; margin:0 auto; border:none;">
<tr><td><b>시니어 닉네임</b></td>
<td><input type="text" id="senior_nick" name="senior_nick" required="required"  class="form-control" style="width:70%; margin:5px;"></td></tr>
<tr><td><b>이메일</b></td>
<td><input type="text" id="senior_email" name="senior_email" required="required"  class="form-control" style="width:70%; margin:5px;"></td></tr>
<tr><td><b>연락처</b></td
><td><input type="text" id="senior_phone" name="senior_phone" required="required"  class="form-control" style="width:70%;margin:5px;"></td></tr>
<tr><td><b>사업자 X </b></td
><td><input type="checkbox" id="no_crno" name="no_crno" onClick="checkDisable()" style="float:left;"></td></tr>
<tr><td><b>사업자 번호</b></td>
<td><input type="text" id="senior_crno" name="senior_crno" class="form-control" style="width:70%; margin:5px;"></td></tr>
<tr><td><b>상호명</b></td>
<td><input type="text" id="senior_crno_name" name="senior_crno_name" class="form-control" style="width:70%; margin:5px;"></td></tr>
<tr><td colspan="2"><h3><b>계좌정보</b></h3></td></tr>
<tr><td><b>은행명</b></td
><td><select name="senior_bank_name" id = "senior_bank_name" style="float:left; width:70%; margin:5px;" class="custom-select">
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
</select></td></tr>
<tr><td><b>예금주</b></td><td><input type="text" id="senior_account_name" name="senior_account_name" required="required" class="form-control" style="width:70%; margin:5px;""></td></tr>
<tr><td><b>계좌번호</b></td><td><input type="text" id="senior_account_num" name="senior_account_num" required="required" class="form-control" style="width:70%;display:inline-block;float:left; margin:5px;"">
<input type="button"  class="ej_btn2" value="계좌 실명 확인" onclick="checkBankHolder();" ></td></tr>
</table>
<ul style="margin-left:40%; margin-top: 40px;">
 <li>
<input type="submit" class="ej_btn" value="전송" id="submit">
<input type="reset"  class="ej_btn2"  value="취소">
</li>

</ul>
<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" id="token" name="token" value="${token}">

<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
</form>
</div>
</body>
</html>