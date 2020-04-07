$(document).ready(function(){
	
	$('#hm_us_question_insertbtn').on('click',function(){
		
		var group = document.hmquestionform.question_group.value;
		var title = document.getElementById('question_title').value; 
		var content = document.getElementById('question_content').value;
		
		
		
		if(group == ""){
			alert("문의유형을 선택해 주세요.");
			document.hmquestionform.question_group.focus();
			return false;
		}else if(title == ""){
			alert("제목을 입력해주세요.");
			document.hmquestionform.question_title.focus();
			return false;
			
		}else if(content == ""){
			alert("내용을 입력해주세요.");
			document.hmquestionform.question_title.focus();
			return false;
		}else{
			document.hmquestionform.submit();
		}
		
		
		
	});
	
});										