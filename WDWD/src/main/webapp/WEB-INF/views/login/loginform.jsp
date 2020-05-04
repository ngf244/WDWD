<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>로그인</title>
<style>
.loginTitle {
	margin-top: 60px;
	text-align: center;
	border-bottom: 5px solid #A9BCF5;
}

#logo {
	/* margin-top: -20px; */
	height: 100px;
	width: auto;
	padding-bottom: 20px;
}

.loginform {
	text-align: center;
}

.inputForm {
	margin-top: 40px;
	width: 37%;
	height: 50px;
	font-size: 20px;
}

.inputPwForm {
	margin-top: 1px;
	width: 37%;
	height: 50px;
	font-size: 20px;
}

#loginbtn {
	background-color: rgb(52, 152, 219);
	color: white;
	margin-top: 20px;
	font-weight: bold;
	display: inline-block;
	cursor: pointer;
	width: 37.5%;
	height: 70px;
	font-size: 20px;
	line-height: 70px;
	border-radius: 5px;
	font-weight: bold;
}

#kakaoBtn {
	margin-top: 10px;
	text-align: center;
	width: 37.5%;
	height: 50px;
	font-size: 20px;
}

#googleBtn {
	margin-top: 10px;
	text-align: center;
	width: 37.5%;
	height: 50px;
	font-size: 20px;
}

.title {
	margin-top: 10px;
	text-align: center;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.gotofind {
	text-align: center;
}
</style>
</head>
<body>
	<div id="loginlogo">
		<img src="${ contextPath }/resources/images/logo.png"
			onclick="location.href='index.me'">
	</div>
	<form id="loginaction" action="login.me" method="post">
		<div class="loginform">
			<input type="text" id="loginId" name="userId" class="inputForm"
				placeholder="&nbsp;아이디" onkeypress="javascript:capsLock(this);">
			<br>
			<br>
			<div class="check_font" id="id_check"></div>
			<input type="password" id="loginPw" name="userPwd"
				class="inputPwForm" placeholder="&nbsp;비밀번호"><br>
			<br>
			<div class="check_font" id="pw_check"></div>
		</div>
		<div class="gotofind">
			<a href='../login/findid.jsp'>아이디찾기&nbsp;&nbsp;</a>/ <a
				href='../login/findpwd.jsp'>&nbsp;&nbsp;비밀번호찾기</a>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a
				href="#" onclick="location.href='gosignUp.me';">회원가입</a>

		</div>
		<div class="loginform">
			<div id="loginbtn" onclick="loginbtn();">로그인</div>
			<br>
			<br>
			<button type="button" id="kakaoBtn">카카오아이디 로그인</button>
			<br>
			<button type="button" id="googleBtn">구글아이디 로그인</button>
		</div>
	</form>
	<script>
		function validate(){
			var re = /^[a-zA-Z0-9]{4,12}$/
		}
		
		var id = document.getElementById("id");
		var pw = documnet.getElementById("pw");
		
		
		
		
		</script>

	<script>
	 	//CapsLock 스크립트	
	 			$('#loginId').bind('keypress', function(e) {
    			var keyCode  = 0;
    			var shiftKey  = false;
  			    keyCode   = e.keyCode;
    			shiftKey   = e.shiftKey;

   				 if (((keyCode >= 65 && keyCode <= 90)&& !shiftKey)||((keyCode >= 97 && keyCode <= 122)&& shiftKey)) {
    			 alert("CapsLock이 켜져 있습니다");
     			 return;
    }
   });
	 	</script>
	<script src="http://developers.kakao.com/sdk/js/kakao.min.js"></script>
	<div id="kakao_btn_changed">
		<a id="custom-login-btn" href="javascript:loginWithKakao()"> <img
			src="../images/sns/Kakao_login_btn.png" width="300" /></a>
	</div>
	<script type='text/javascript'>
	// 버튼 이미지 전환 
		$(document).ready(function(){
 
 	   $("#custom-login-btn, #custom-logout-btn").hover(
    	function(){
        $("#custom-login-btn img").attr('src','../images/sns/Kakao_login_btn_c.png');
        $("#custom-logout-btn img").attr('src','../images/sns/Kakao_logout_btn_c.png');
        
    	}, 
    	function(){
        $("#custom-login-btn img").attr('src','../images/sns/Kakao_login_btn.png');
        $("#custom-logout-btn img").attr('src','../images/sns/Kakao_logout_btn.png');
        
    });
 
});
 
 
	// 로그인 및 로그아웃 버튼 생성 처리
	var cookiedata = document.cookie;
 
	if(cookiedata.indexOf('kakao_login=done') < 0){
    createLoginKakao();
	}else{
    createLogoutKakao();
	}
 
	/* 로그인 관련 쿠키 생성 및 삭제 */
	function setCookie( name , value , expired ){
 
 	var date = new Date();
 	date.setHours(date.getHours() + expired);
 	var expried_set = "expries="+date.toGMTString();
	 document.cookie = name + "=" + value + "; path=/;" + expried_set + ";"
 
	}
 
	/* 쿠키 삭제 다른방법
	function deleteCookie( name ){
    
    var date = new Date();
     date.setHours(date.getHours() - 1);
     var expried_set = "expries="+date.toGMTString();
     document.cookie = name + "="  + "; path=/;" + expried_set + ";"
	}
	*/
 
	// 
	function getCookie(name){
 
    var nameofCookie = name + "=";
    var x = 0;
    while(x <= document.cookie.length){
        var y = ( x + nameofCookie.length);
        if(document.cookie.substring(x,y) == nameofCookie){
            if((endofCookie = document.cookie.indexOf(";",y)) == -1)
                endofCookie = document.cookie.length;
            return unescape(document.cookie.substring(y,endofCookie));
        }
        x = document.cookie.indexOf(" ",x) + 1;
        if( x == 0 )
            break;
        }
        
        return "";
}
 
 
	// 카카오 script key 입력
	Kakao.init('95ce6efddfdc472c72e3453a2345e32d');
 
 	// 로그인 처리
	function loginWithKakao(){
    
    Kakao.Auth.cleanup();
    Kakao.Auth.login({
        persistAccessToken: true,
        persistRefreshToken: true,
        success: function(authObj) {
            setCookie("kakao_login","done",1); // 쿠키생성 (로그인)
            //alert(cookiedata);
            createLogoutKakao();
            window.location.href="../index.html";
        },
            fail: function(err) {
             alert(JSON.stringify(err));
        }
                 
    });
}
 
 
	// 로그아웃 처리
	function logoutWithKakao(){
    Kakao.Auth.logout();
    alert('카카오 로그아웃 완료!');
    setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃)
    //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
    createLoginKakao();
    window.location.href="../index.html";

	
		}
 
 
 
	// 로그인 버튼생성
	function createLoginKakao(){
 	var login_btn = "<a id='custom-login-btn' href='javascript:loginWithKakao()'>"+
                "<img src='../images/sns/Kakao_login_btn.png' width='250'/>"+
                "</a>";
 	document.getElementById('kakao_btn_changed').innerHTML  = login_btn;
	}
 
 
	// 로그아웃 버튼생성
	function createLogoutKakao(){
 	var logout_btn = "<a id='custom-logout-btn' href='javascript:logoutWithKakao()'>"+
                "<img src='../images/sns/Kakao_logout_btn.png' width='200'/>"+
                "</a>";
 	document.getElementById('kakao_btn_changed').innerHTML  = logout_btn;
 
}
 
 
  //]]>
</script>
</body>
</html>