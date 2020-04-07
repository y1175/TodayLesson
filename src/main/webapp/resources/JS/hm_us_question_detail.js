$(document).ready(function(){
	$('.question_answerbtn').on('click',function(){
		
		var no = $(this).prop("id");
		location.href="/todaylessonmypage/hm_us_question_delete/"+no;
		
		
	});
});