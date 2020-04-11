$(document).ready(function(){

	$('.hm_ad_questionbtn').click(function(){
		
		$('#hm_question_answerdiv').show();
		$('.questionlistbtn').hide();
	});
	

$("#hm_answercancel").click(function(){
	
	$('#hm_question_answerdiv').hide();
	location.reload(true);
});



});
