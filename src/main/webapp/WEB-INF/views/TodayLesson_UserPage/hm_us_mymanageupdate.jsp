<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<title>오늘의 레슨 회원정보수정</title>                               

</head>
<body>
<h2>회원정보 수정</h2>
<c:set var="dto" value="${dto}"></c:set>
아이디
${dto.member_id}
<form method="post" id="smsForm" >
<label>연락처</label>
     <c:choose>
     <c:when test="${to eq null }">
     <input type="text" name="to" id="text1" placeholder=" 전화번호 입력 " 
     value="${dto.member_phone}"/> 
     </c:when>
     <c:otherwise>
     <input type="text" name="to" id="text1" placeholder=" 전화번호 입력 " 
     value="${to}"/>
     </c:otherwise>
     </c:choose>
     
      <input type="hidden" name="text" id="text2" > 
      <input type="button" name="sendSMS" id="sendSMS" value="인증번호 요청" /><br>
      <label>인증번호 확인:</label>
<input type="text" name="numcheck" id="numcheck" required="required" placeholder="인증번호 입력" onkeyup="smscheckfunction()"><br>
<div class="alert alert-success" id="alert-success2">인증번호가 일치합니다.</div>
<div class="alert alert-danger" id="alert-danger2" >인증번호가 일치하지않습니다.</div>

    <input type="hidden" id="authNum" value="${auth_num}">
    <input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />         
</form>



<form method="post" action="${pageContext.request.contextPath}/todaylessonmypage/hm_us_mymanageupdate" name="frm" id="frm">
<input type="hidden" name="member_id" id="member_id" value ="${dto.member_id}" ><br>
<label>비밀번호</label>
<input type="password" name="member_pwd" id="member_pwd" required="required" placeholder="비밀번호"><br>
<label>비밀번호확인</label>
<input type="password" name="pwdcheck" id="pwdcheck" required="required" placeholder="비밀번호확인"
onkeyup="passwordCheckFunction();"><br>
<div class="alert alert-success" id="alert-success">비밀번호가일치합니다.</div>
<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지않습니다.</div>
<br><label>이름</label>
<input type="text" name="member_name" id="member_name" value="${dto.member_name}" required="required"><br>
<label>생년월일</label>
<input type="date" name="member_birth" id="member_birth" value="${dto.member_birth}" required="required"><br>
 <label>e-mail</label>
<input type="email" name="member_email" id="member_email" value="${dto.member_email}" required="required"><br>
 <input type="hidden" name="member_phone" id="member_phone" value="${to}" required="required"><br>
 
 <h3>계좌정보</h3>
<label>은행명</label>
<select name="member_bank_name" id="member_bank_name">
<c:if test="${empty dto.member_bank_name }">
<option disabled="disabled" selected="selected">-----</option>
</c:if>
<c:if test="${!empty dto.member_bank_name }">
<option id="bank_name"></option>
</c:if>
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

<label>예금주</label>
<c:if test="${!empty dto.member_account_name}">
<input type="text" id="member_account_name" name="member_account_name" value="${dto.member_account_name}" required="required">
</c:if>
<c:if test="${empty dto.member_account_name }">
<input type="text" id="member_account_name" name="member_account_name" required="required" value="">
</c:if>
<label>계좌번호</label>
<c:if test="${!empty dto.member_account_num }">
<input type="text" id="member_account_num" name="member_account_num" value="${dto.member_account_num}" required="required">
</c:if>
<c:if test="${empty dto.member_account_num}">
<input type="text" id="member_account_num" name="member_account_num" value="" required="required">
</c:if>
<input type="hidden" id="token" name="token" value="${token}">
<input type="button" value="계좌 실명 확인" onclick="checkBankHolder();">
 <br>
 
 
<label for='addr'>주소</label>
					<div class='form-row'>
						<div class='col-5'>
							<input type="text" id="sample4_postcode" name='member_zipcode'
								value="${dto.member_zipcode}" class='form-control'>
						</div>
						<input type="button" onclick="sample4_execDaumPostcode()"
							value="우편번호 찾기" readonly="readonly" class='btn btn-primary'><br>
					</div>
					<div class='juso'>
						<input type="text" id="sample4_roadAddress"  value="${dto.member_addr}"
							name="roadaddr" readonly="readonly" class="form-control">
						<input type="radio" id='roadAddress' name='addrselect' value="0"
							required><label for="addrselect">도로명주소 선택</label> <br>

						<input type="text" id="sample4_jibunAddress" placeholder="지번주소"
							name="jibunaddr" readonly="readonly" class="form-control">
						<input type="radio" id='jibunAddress' name='addrselect' value="1"><label
							for="addrselect">지번주소 선택</label><br>
					</div>
					<span id="guide" style="color: #999"></span> <label
						for="detailaddr">상세주소</label> <input type="text" id="detailaddr"
						name="detailaddr" class="form-control"> 
<label>닉네임</label>
<input type="text" name="member_nick" value="${dto.member_nick}" required="required"><br>
<button type="submit" id="submit" class="btn btn-primary">정보 수정</button><br>
<input type="hidden" name="${_csrf.parameterName}"value="${_csrf.token}" />
</form>

<%-- <input type="button" value="회원탈퇴" onclick="location.href='/todaylessonmypage/hm_us_memberwithdraw/'+${dto.member_id}"> --%>
<input type="reset" value="취소">

<script src="https://code.jquery.com/jquery-3.4.1.min.js" type="text/javascript"></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script>
		//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 도로명 조합형 주소 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}
							// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
							if (fullRoadAddr !== '') {
								fullRoadAddr += extraRoadAddr;
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode; //5자리 새우편번호 사용
							document.getElementById('sample4_roadAddress').value = fullRoadAddr;
							document.getElementById('sample4_jibunAddress').value = data.jibunAddress;

							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								//예상되는 도로명 주소에 조합형 주소를 추가한다.
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								//document.getElementById('guide').innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
								document.getElementById('sample4_roadAddress').value = expRoadAddr;
							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								//document.getElementById('guide').innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
								document.getElementById('sample4_jibunAddress').value = expJibunAddr;
							} else {
								document.getElementById('guide').innerHTML = '';
							}
						}
					}).open();
		}
	</script>
	<script>

	/* 은행명 */
	$(document).ready(function() {

	   let bank_code= "${dto.member_bank_name}";
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
	         
	         for (var i = 0; i < bank_name.length; i++) {
	            console.log(bank_name[i]);
	            console.log(bank_name[i].code);
	            console.log(bank_name[i].name);
	            //console.log(bank_code);
	            
	            if (bank_name[i].code == bank_code) {
	               let senior_bank_name = bank_name[i].name;
	               $('#bank_name').append(senior_bank_name);
	               break;
	            }
	         }
	         
	      });
	   
	   
	});

	
	
	
	

	function checkBankHolder(){

		let target = document.getElementById("member_bank_name");
		let bank_code = target.options[target.selectedIndex].value;
		let token = document.getElementById("token").value;
		let bank_num = document.getElementById("member_account_num").value;
		let account_name = document.getElementById("member_account_name").value;
		
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
	<script>
		$(function(){
			$("#alert-success").hide();
			$("#alert-danger").hide();
			$("input").keyup(function() {
				var pwd1 = $("#member_pwd").val();
				var pwd2 = $("#pwdcheck").val();
				if (pwd1 != "" || pwd2 != "") {
					if (pwd1 == pwd2) {
						$("#alert-success").show();
						$("#alert-danger").hide();
						$("#submit").removeAttr("disabled");
					} else {
						$("#alert-success").hide();
						$("#alert-danger").show();
						$("#submit").attr("disabled", "disabled");
					}
				}
			});

			$("input")

		});
	

	</script>
 
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>
	<script src="/resources/JS/hm_us_mymanageupdate.js?ver=1"></script>

</body>
</html>