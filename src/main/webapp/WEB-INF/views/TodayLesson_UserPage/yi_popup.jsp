<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${dto1.popup_title }</title>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
</head>
<body>
<table width="100%" height="100%" class="popup_frame"  border="0" cellpadding="0" cellspacing="0">
  <tbody><tr>
    <td><img src="${dto1.popup_filepath }" alt="img" width="100%" height="100%" border="0" onclick="window.open('${dto1.popup_url}')"></td>
  </tr>
  <tr>
    <td height="30" align="right" bgcolor="#000000">
    <table border="0" cellpadding="0" cellspacing="2">
      <form name="frm" method="post" action=""></form>
        <tbody><tr>
         <td><input class="PopupCheck" type="checkbox" name="pop" id="pop" onclick="closePop()"></td>
         <td style="font-size:11px;color:#FFFFFF;">1일동안 이 창을 열지 않음</td>
            <td style="font-size:11px;"><a href="javascript:self.close();" onfocus="this.blur()">[닫기]</a></td>
        </tr>
       
    </tbody></table>
    </td>
  </tr>
</tbody></table>
<script type="text/javascript">
function setCookie(name, value, expiredays){
    var todayDate = new Date();
        todayDate.setDate (todayDate.getDate() + expiredays);
        document.cookie = name + "=" + escape(value) + "; path=/; expires=" + todayDate.toGMTString() + ";";
    }
 
    function closePop(){
        if (document.getElementById("pop").checked){
        setCookie("popname", "done", 1);
    }
    self.close();
}
 
    $(document).ready(function() {
        // 팝업 창 크기를 HTML 크기에 맞추어 자동으로 크기를 조정하는 함수.
        var strWidth;
        var strHeight;

        //innerWidth / innerHeight / outerWidth / outerHeight 지원 브라우저 
        if ( window.innerWidth && window.innerHeight && window.outerWidth && window.outerHeight ) {
            strWidth = $('*').outerWidth() + (window.outerWidth - window.innerWidth);
            strHeight = $('*').outerHeight() + (window.outerHeight - window.innerHeight);
        }
        else {
            var strDocumentWidth = $(document).outerWidth();
            var strDocumentHeight = $(document).outerHeight();

            window.resizeTo ( strDocumentWidth, strDocumentHeight );

            var strMenuWidth = strDocumentWidth - $(window).width();
            var strMenuHeight = strDocumentHeight - $(window).height();

            strWidth = $('*').outerWidth() + strMenuWidth;
            strHeight = $('*').outerHeight() + strMenuHeight;
        }

        //resize 
        window.resizeTo( strWidth, strHeight );

    });    
    
    
</script>
</body>
</html>
