<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"/>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>로그인</title>
<style>
   .loginTitle{
   margin-top: 60px;
   text-align: center;
   border-bottom: 5px solid #A9BCF5;
   }
   
   #logo{
   /* margin-top: -20px; */
   height: 100px;
   width: auto;
   padding-bottom: 20px;
   }
   
   
   .loginform {
         text-align: center;
   }
   
   .inputForm{
   margin-top: 40px;
   width: 37%;
   height: 50px;
   font-size: 20px;
   }
   
    .inputPwForm{
    margin-top: 1px;
    width: 37%;
   	height: 50px;
  	font-size: 20px;
    }
   
   
   #loginbtn{
   background-color : rgb(52, 152, 219);
   color : white;
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
   
   #kakaoBtn{
   margin-top: 10px;
   text-align: center;
   width: 37.5%;
   height: 50px;
   font-size: 20px;
   
   }
   
   #googleBtn{
   
   margin-top: 10px;
   text-align: center;
   width: 37.5%;
   height: 50px;
   font-size: 20px;
   
   }
   
   .title{
   margin-top: 10px;
   text-align: center;
   }
  	
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
	a:hover { color: black; text-decoration: underline;}
   
   .gotofind{
   	text-align: center;
   }
   
   
   
</style>
</head>
<body>
	<div id="loginlogo">
		<img src="${ contextPath }/resources/images/logo.png" onclick="location.href='index.me'">
	     		 </div>
	     <form id="loginaction" action="login.me" method="post">
	      <div class="loginform">
	         <input type="text" id="loginId" name="userId" class="inputForm" placeholder="&nbsp;아이디" > <br><br>
	         	<div class="check_font" id="id_check"></div>
	         		<input type="password" id="loginPw" name="userPwd" class="inputPwForm" placeholder="&nbsp;비밀번호" ><br><br>
	         			<div class="check_font" id="pw_check"></div>
	       			</div>  
	       				<div class="gotofind">
	        			 <a href='../login/findid.jsp'>아이디찾기&nbsp;&nbsp;</a>/
	        	 			<a href='../login/findpwd.jsp'>&nbsp;&nbsp;비밀번호찾기</a>
	        	 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	 				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	        	 				<a href="#" onclick="location.href='gosignUp.me';">회원가입</a>
	        	 				
	      	 					</div> 
	        						<div class="loginform">
	         							<div id="loginbtn">로그인</div><br><br>
	        							<button type="button" id="kakaoBtn">카카오아이디 로그인</button><br>
	         							<button type ="button" id="googleBtn">구글아이디 로그인</button>
	     	 </div>
	      </form>
		<script type="text/javascript">
	     	window.onload = function(){
	     		document.getElementById('loginbtn').onclick = function(){
	     			document.getElementById('loginaction').submit();
	     		};
	     	};
	     	
	     	//공백 체크 정규식
	     	
	     	var empJ = /\s/g
	     	
	     	var idJ = /^[az0-9][a-z0-9_\-]{4,19}$/;
	     	
	     	$("userId").blur(function(){
	     		if($('userId').val()==''){
	     			$('#id_check').text('필수정보 입니다');
	     			$('#id_check').css('color', 'red');
	     		}
	     	});
	     </script>
</body>
</html>