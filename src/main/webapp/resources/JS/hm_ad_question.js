$(document).ready(function(){
	$('.questionbtn').click(function(){
		let no = $('.questiondetailno').html();
		console.log(no);
		location.href="hm_ad_question_detail/"+no;
	});
});