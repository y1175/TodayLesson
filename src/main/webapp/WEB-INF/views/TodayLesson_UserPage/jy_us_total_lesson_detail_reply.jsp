<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script> 

$(document).ready(function() { 
	
	$("#pas").hide();
	
	$("#sec").change(function(){
        if($("#sec").is(":checked")){
        	$("#pas").show();
        }else{
        	$("#pas").hide();
        }
    });
	
	
}); 
</script>


</head>
<body>


<div class="container">
    <form id="commentForm" name="commentForm" method="post">
    <br><br>
        <div>
            <div>
                <span><strong>Comments</strong></span> <span id="cCnt"></span>
            </div>
            <div>
                <table class="table">                    
                    <tr>
                        <td>
                        비밀글
                        <input type="checkbox" name="sec" id="sec">
                        <input type="hidden" name="lesson_qa_reply_secret" id="lesson_qa_reply_secret">
                        
                        <script>
                        
                        if ($('input[name=sec]').is(":checked")) {
                            $('input[name=lesson_qa_reply_secret]').val('Y');
                        } else {
                            $('input[name=lesson_qa_reply_secret]').val('N');
                        }
                        
                        
                        </script>


						<div id="pas">
                        <input type="text" name="lesson_qa_reply_password" id="lesson_qa_reply_password">
                        </div>
                            <textarea rows="3" cols="30" id="lesson_qa_reply_content" name="lesson_qa_reply_content" placeholder="댓글을 입력하세요"></textarea>
                            <br>
                            <div>
                                <a href='#' onClick="fn_comment('${dto.lesson_no }')" class="btn pull-right btn-success">등록</a>
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <input type="hidden" id="lesson_no" name="lesson_no" value="${dto.lesson_no }" />       
        <input type="hidden" id="member_id" name="member_id" value="${pageContext.request.userPrincipal.name}" />         
    </form>
</div>
<div class="container">
    <form id="commentListForm" name="commentListForm" method="post">
        <div id="commentList">
        </div>
    </form>
</div>


<script>
/*
 * 댓글 등록하기(Ajax)
 */
function fn_comment(lesson_no){
    
	let member_id ='${pageContext.request.userPrincipal.name}';
		
	
	 if(member_id=='')
     {
     $("#lesson_qa_reply_content").val("");
     alert('로그인이 필요합니다.');
     return false;
     } 
	 
    $.ajax({
        type:'POST',
        url : "<c:url value='/lesson_detail/${dto.lesson_no}/lesson_reply_insert.do'/>",
        data:$("#commentForm").serialize(),
        success : function(data){
            if(data=="success")
            {
                getCommentList();
            	$("#pas").hide();

            }
        },
        error:function(request,status,error){
            //alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
       }
        
    });
}
 
/**
 * 초기 페이지 로딩시 댓글 불러오기
 */
$(function(){
    
    getCommentList();
    
});
 
/**
 * 댓글 불러오기(Ajax)
 */
function getCommentList(){

    $.ajax({
        type:'get',
        url : "<c:url value='/lesson_detail/${dto.lesson_no}/lesson_reply_list.do'/>",
        dataType : "json",
        data:$("#commentForm").serialize(),
        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
        success : function(data){
            
            let html = "";
            let cCnt = data.length;
            
            if (data.length > 0){
                
                for(i=0; i<data.length; i++){
                    html += "<div>";
                    html += "<div><table class='table'><h6><strong>"+data[i].member_id+"</strong></h6>";
                    html += "<tr><td>"+data[i].lesson_qa_reply_content +"</td><td>"+data[i].lesson_qa_register_date+"</td></tr>";
                    html += "</table></div>";
                    html += "</div>";
                }
                
            } else {
                
                html += "<div>";
                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
                html += "</table></div>";
                html += "</div>";
                
            }
            
            $("#cCnt").html(cCnt);
            $("#commentList").html(html);
            
        },
        error:function(request,status,error){
            
       }
        
    });
}
 
</script>


</body>
</html>