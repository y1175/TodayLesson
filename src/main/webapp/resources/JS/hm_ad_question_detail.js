$(document).ready(function(){

	$('.hm_ad_questionbtn').click(function(){
		
		$('#hm_question_answerdiv').show();
		
	});
	
	
$("#question_answerbtn").click(function(){
		
		let no = $('#questiondetail_no').html();
		location.href="hm_ad_question_update/"+no;
		
	})
});
