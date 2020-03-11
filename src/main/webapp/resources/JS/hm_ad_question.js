$(document).ready(function(){
	$('.questionbtn').click(function(){
		
		var str = "";
		var tdArr = new Array();
		var checkBtn = $(this);
		
		var tr = checkBtn.parent().parent();
		var td = tr.children();
		
		var no = td.eq(0).text();
		
		location.href="hm_ad_question_detail/"+no;
	});
});