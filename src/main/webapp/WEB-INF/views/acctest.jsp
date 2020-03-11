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
	    headers: { "Authorization": "d64de63b64de68f54a00cc6fb6ce0b5e81d01a65"}, 
		data : {
			bank_code : "004",
			bank_num : "91295121565"
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