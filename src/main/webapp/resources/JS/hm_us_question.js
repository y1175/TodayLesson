$(document).ready(function(){

	$('#question_btn').click(function(){
		
		location.href="/todaylessonmypage/hm_question_insert";
	});
	
	
	$('.hm_us_questiondetailbtn').on('click',function(){
		
		var no = $('.question_no').val();
		location.href="/todaylessonmypage/hm_us_question_detail/"+no;
		
		
	});
	
	
});