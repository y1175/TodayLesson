$(document).ready(function(){
	/* 인증번호 */
   $("#alert-success2").hide();
	$("#alert-danger2").hide();
	
    $("#sendSMS").on('click',function(){
       var result = Math.floor(Math.random() * 1000000)+100000;
        if(result>1000000){
           result = result - 100000;
        }
        
      document.getElementById('text2').value= null;
       document.getElementById('text2').value = result;
       var result2 = document.getElementById('text2').value;
      console.log("hidden : "+ result2);
      
        console.log("문자를 전송합니다.");
         console.log(" 인증번호:"+result);
         $("#smsForm").attr("action",  "hm_us_mymanagesms"); //위에 있는 폼태그를 컨트롤러로 전송한다.
         $("#smsForm").submit();  
         
        
    })
    
});
function smscheckfunction() {
	$("#alert-success2").hide();
	$("#alert-danger2").hide();
	$("#numcheck").keyup(function() {
	var authnum =$("#authNum").val();
		console.log("authnum:"+authnum)
		var numcheck = $("#numcheck").val();
		console.log("numcheck:",numcheck);
		if (authnum != "" || numcheck != "") {
			if (authnum == numcheck) {
				$("#alert-success2").show();
				$("#alert-danger2").hide();
				$("#submit").removeAttr("disabled");
			} else {
				$("#alert-success2").hide();
				$("#alert-danger2").show();
				$("#submit").attr("disabled", "disabled");
				
				}
		}
	});


}


function checkBankHolder(){

	/*let bank_code= document.frm.member_bank_name.value;
	let bank_num = document.frm.member_account_num.value;
	let token = document.frm.token.value;
	let account_name = document.frm.member_account_name.value;*/
	let target = document.getElementById("member_bank_name");
	let bank_code = target.options[target.selectedIndex].value;
	let token = docunment.frm.tken.value;
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