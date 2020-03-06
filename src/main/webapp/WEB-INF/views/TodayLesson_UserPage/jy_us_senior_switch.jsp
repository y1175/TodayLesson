<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>

<script>

function checkDisable()
{
    if(no_crno.checked == true ){
	   senior_crno.disabled = true;
	} else 
	{
	   senior_crno.disabled = false;
	}
}

</script>


<!-- 시니어 모드에 있는 시니어 정보 관리로 이동하기 -->
<h2>시니어 지원하기</h2>
<form method="post" action="${pageContext.request.contextPath}/plus_senior" name="frm">

<input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}">

<label>시니어 닉네임</label>
<input type="text" id="senior_nick" name="senior_nick" required="required">

<label>이메일</label>
<input type="text" id="senior_email" name="senior_email" required="required">

<label>연락처</label>
<input type="text" id="senior_phone" name="senior_phone" required="required">

<label>사업자번호</label>
<input type="text" id="senior_crno" name="senior_crno">
사업자 번호 없음<input type="checkbox" id="no_crno" name="no_crno" onClick="checkDisable()">

<h3>계좌정보</h3>
<label>은행명</label>
<input type="text" id="senior_bank_name" name="senior_bank_name" required="required">

<label>예금주</label>
<input type="text" id="senior_account_name" name="senior_account_name" required="required">

<label>계좌번호</label>
<input type="text" id="senior_account_num" name="senior_account_num" required="required">


<%-- <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
 --%>
<input type="submit" value="전송">
<input type="reset" value="취소">

</form>

</body>
</html>