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

	let token = "${token}";
	let payment_status = "all";

	
	$.ajax({
		method: 'get',
		url: 'https://api.iamport.kr/payments/status/'+payment_status,
	    headers: { "Authorization": token
	    	
	    	
		}, 
		data : {
			payment_status : payment_status,
			limit : 20,
			sorting : '-started'
			
		}
	}).done(
					function(msg) {
						console.log(msg);
						let bank_name = msg.response;
				
					
					});


}


</script>



<input type = button  value="dd" onclick=checkBankHolder();>

</body>
</html>