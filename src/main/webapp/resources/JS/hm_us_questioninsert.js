$(document).ready(function(){
	
	$('#hm_us_question_insertbtn').on('click',function(){
		
		var group = document.hmquestionform.question_group.value;
		
		if(group == ""){
			alert("문의유형을 선택해 주세요.");
			document.hmquestionform.question_group.focus();
			return false;
		}else{
			document.hmquestionform.submit();
		}
		
		
	});
	
});										