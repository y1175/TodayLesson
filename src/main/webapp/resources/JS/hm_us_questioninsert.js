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
         bad_check();
      }
      
   });
   
   
});    

function bad_check(){
   

   var YokList = new Array('개새끼','개색기','바보','script','iframe');
   var Tmp;
   var Tmp2;
   var Yok=0;
   for(i=0; i<YokList.length; i++){
      
      Tmp = hmquestionform.question_content.value.toLowerCase().indexOf(YokList[i]);
      Tmp2 = hmquestionform.question_title.value.toLowerCase().indexOf(YokList[i]);
      
      if(Tmp>=0){
         alert('불건전한 내용이 들어있어 문의가 불가합니다.');
         document.hmquestionform.question_content.focus();
         Yok++;
         return false;
      }else if(Tmp2>=0){
         alert('불건전한 내용이 들어있어 문의가 불가합니다.');
         document.hmquestionform.question_title.focus();
         Yok++;
         return false;
      }

   }
   if(Yok==0)
      {
   document.hmquestionform.submit();
   alert('문의가 등록됐습니다.');
  /* window.location=document.referrer;*/
   /*location.href="/todaylessonmypage/hm_us_question";*/
      }
};