$(document).ready(function(){
	
	function chcek_selectbox()
	{
		if(hm_question_insert.question_group.value==""){
			alert("문의 유형을 선택해주세요.")
			hm_question_insert.question_group.focus();
			return false;
			}
	}
	
});