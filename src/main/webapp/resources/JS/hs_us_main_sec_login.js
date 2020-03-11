<<<<<<< HEAD

    
    
    $(document).ready(function(){
    	  //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('900636bd56e9bde7242ee9f2b10945bb');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            alert(JSON.stringify(authObj));
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
      //]]>
    });
=======
/*
    
    
    $(document).ready(function(){
    	  //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('9f3f9d25f7971214c15ec68bb10baddc');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            alert(JSON.stringify(authObj));
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
      //]]>
    	
    	
    
    });*/
>>>>>>> branch 'master' of https://github.com/Hahwasoo/TodayLesson.git
