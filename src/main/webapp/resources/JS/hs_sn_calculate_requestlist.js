$(document).ready(function(){
    //정산신청 모달 개인사업자 or 개인 선택시 다른 div 보여주기
	$('input[type=radio][name=hs_senior_CulateRequestModal_crno_ch]').on('click', function(){
		
		var radiovalue = $('input[type=radio][name=hs_senior_CulateRequestModal_crno_ch]:checked').val();
		
		if(radiovalue == '1'){
			$('#hs_senior_CulateRequestModal_crno_o_detail').css('display','block');
			$('#hs_senior_CulateRequestModal_crno_x_detail').css('display','none');
			
		}
		else if(radiovalue == '2'){
        	$('#hs_senior_CulateRequestModal_crno_o_detail').css('display','none');
			$('#hs_senior_CulateRequestModal_crno_x_detail').css('display','block');
			
		}	
	});

	
});