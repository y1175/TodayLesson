$(document).ready(function(){

	$('.hm_ad_questionbtn').click(function(){
		
		$('#hm_question_answerdiv').show();
		$('.questionlistbtn').hide();
	});
	

$("#hm_answercancel").click(function(){
	
	$('#hm_question_answerdiv').hide();
	location.reload(true);
});

$(".hm_ad_questionbtn2").on('click',function(){
	
	
	var no = $(this).prop("id");
	location.href="/todaylessonadmin/hm_ad_question_delete/"+no;
	
	
});

});
