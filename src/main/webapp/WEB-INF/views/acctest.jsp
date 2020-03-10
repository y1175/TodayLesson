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
function checkBankHolder(){

	$.ajax({
		method: 'get',
		url: 'https://api.iamport.kr/vbanks/holder',
	    headers: { "Authorization": "76b4afd84bf30db7c243a3e501760cd6e29f934c"}, 
		data : {
			bank_code : "004",
			bank_num : "91295121565"
		}
	}).done(
					function(msg) {
						console.log(msg);
						let adn = msg.documents[0].bank_holder;
						console.log
						(adn);
					});
}
	
</script>



${token}

<input type=button onclick="checkBankHolder();" value="토큰 값 확인하기">

<form action="${pageContext.request.contextPath }/test_result" method="get">

<input type="text" name="bank_code"  id="bbank_code">
<input type="text" name="bank_num"  id="bank_num">

</form>

</body>
</html>