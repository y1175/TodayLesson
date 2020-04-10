<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/CSS/jy_sn_lesson_write.css">  
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- CSSstyle -->
   <style type="text/css">
      .hs_sn_ModifyInformation_Title>a{
         color: rgb(224, 62, 82);
      }
   </style>
<!-- CSSstyle -->  

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
	            //$('.bank_name').append(senior_bank_name);
	            $('select[name="senior_bank_name"]').find('option[value='+i+']').attr("selected",true);
	            console.log("dddd");
	            break;
	         }
	      }
	      
	   });
	
});

</script>
</head>
<body>

<script>

function checkBankHolder(){

   let bank_code= document.frm.senior_bank_name.value;
   let bank_num = document.frm.senior_account_num.value;
   let token = document.frm.token.value;
   let account_name = document.frm.senior_account_name.value;
   
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

   } else 
   {
      senior_crno.disabled = false;
      senior_crno_name.disabled = false;

   }
}





  




</script>

<div id="jy_container" style="padding 20px;  width: 80%; margin:0px auto;">

 <div stlye="width:100%;">
 <h2 style="margin-top:40px; text-align: center;">시니어 정보 수정</h2>
 </div>
<form method="post" action="${pageContext.request.contextPath}/todaylessonsenior/update_senior_result" name="frm">

<ul style="padding: 0px;">
<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}">
<input type="hidden" id="token" name="token" value="${token}">

<li>
<label>시니어 닉네임</label>
<input type="text" id="senior_nick" name="senior_nick" required="required" value="${dto.senior_nick }" class="form-control" style="width:20%;">
</li>

<li>
<label>이메일</label>
<input type="text" id="senior_email" name="senior_email" required="required" value="${dto.senior_email }" class="form-control" style="width:20%;">
</li>

<li>
<label>연락처</label>
<input type="text" id="senior_phone" name="senior_phone" required="required" value="${dto.senior_phone }" class="form-control" style="width:20%;">
</li>

<li>
사업자 X <input type="checkbox" id="no_crno" name="no_crno" onClick="checkDisable()">
</li>

<li>
<label>사업자번호</label>
<input type="text" id="senior_crno" name="senior_crno" value="${dto.senior_crno}" class="form-control" style="width:20%;">
</li>

<li>
<label>상호명</label>
<input type="text" id="senior_crno_name" name="senior_crno_name" value="${dto.senior_crno_name}" class="form-control" style="width:20%;">
</li>

<h3 style="text-align: center; margin: 10px auto;" >계좌정보</h3>

<li>
<label>은행명</label>
<select name="senior_bank_name" id = "senior_bank_name">
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
</li>

<li>
<label>예금주</label>
<input type="text" id="senior_account_name" name="senior_account_name" required="required" value="${dto.senior_account_name }" class="form-control" style="width:20%;">
</li>

<li>
<label>계좌번호</label>
<input type="text" id="senior_account_num" name="senior_account_num" required="required" value="${dto.senior_account_num }" class="form-control" style="width:20%;">
</li>


<li>
<input type="button"  class="ej_btn2" value="계좌 실명 확인" onclick="checkBankHolder();" >
</li>
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 
 <li>
<input type="submit" class="ej_btn" value="전송">
<input type="reset"  class="ej_btn2"  value="취소">
</li>

</ul>
</form>
</div>
</body>
</html>