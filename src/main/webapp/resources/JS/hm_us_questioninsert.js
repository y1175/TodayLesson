$(document).ready(function(){
	
	function chcek_selectbox()
	{
		var f = document.hmquestionform;
		
		if(f.question_group.value==''){
			alert('문의 유형을 선택해 주세요');
			f.question_group.focus();
			return false;
		}
		return true;
	}
});