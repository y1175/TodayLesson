/*팝업창 띄우기*/
function pevent(){
    function getCookie(name){
        var nameOfCookie = name + "=";
        var x = 0;
        while (x <= document.cookie.length){
            var y = (x + nameOfCookie.length);
            if (document.cookie.substring(x, y) == nameOfCookie){
            if ((endOfCookie = document.cookie.indexOf(";", y)) == -1){
            endOfCookie = document.cookie.length;
            }
            return unescape (document.cookie.substring(y, endOfCookie));
            }
            x = document.cookie.indexOf (" ", x) + 1;
            console.log();
            if (x == 0) break;
        }
        return "";
    }
    if (getCookie("popname") != "done"){
        var popUrl = "${pageContext.request.contextPath}/popupOpen";
        var popOption = "width=400%, height=235%, resizable=no, scrollbars=no, status=no;";
        window.open(popUrl,"",popOption);
    }
}