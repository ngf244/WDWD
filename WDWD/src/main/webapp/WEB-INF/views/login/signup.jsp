<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<title>회원가입</title>
<style>
.signuptitle {
	margin-top: 100px;
	text-align: center;
	border-bottom: 5px solid #A9BCF5;
}

.titletext {
	margin-top: 50px;
	text-align: center;
}

.form-control {
	width: 37%;
	height: 50px;
	font-size: 20px;
}

.birthform {
	width: 10.5%;
	height: 40px;
	font-size: 15px;
}

.select {
	width: 15%;
	height: 45.2px;
	font-size: 15px;
}

.selfintro {
	width: 37%;
	height: 300px;
}

.signbutton {
	text-align: center;
}

#signbutton {
	margin-top: 20px;
	text-align: center;
	height: 70px;
	width: 20%;
	background: skyblue;
	color: white;
}

#cancelbutton {
	margin-top: 20px;
	text-align: center;
	height: 70px;
	width: 20%;
	background: gray;
	color: white;
}

.consent {
	margin-top: 30px;
	text-align: center;
}

.conditions {
	margin-top: 10px;
	overflow: scroll;
	height: 300px;
	width: 30%;
	border: 1px solid gray;
	text-align: center;
}
</style>
</head>
<body>
	<div id="signupWrap" hidden="">
		<div class="signuptitle">
			<form action="signUp.me" method="post" id="joinForm">
			<img src="<%= request.getContextPath() %>/sources/image/logintitle.png" id="logo">
		
		
		<!-- 아이디  -->
		<div class="form-group">
			<label for="user_id">아이디</label><br>
			<input type="text" class="form-control" id="user_id" name="userId" placeholder="ID" required>
			<div class="check_font" id="id_check"></div>
		</div>

		<div class="titletext">
			<h4>비밀번호</h4>
			<input type="password" id="signpwd" name="userPwd" class="inputForm">
			<div class="check_font" id="pw_check"></div>
		</div>

		<div class="titletext">
			<h4>비밀번호 재확인</h4>
			<input type="password" id="signpwd2" name="userPwd" class="inputForm">
			<div class="check_font" id="pw2_check"></div>
		</div>


		<div class="titletext">
			<h4>이름</h4>
			<input type="text" id="signname" name="userName" class="inputForm">
			<div class="check_font" id="name_check"></div>
		</div>
		
		<div class="titletext">
			<h4>생년월일</h4>
			<input type="text" id="signbirth" name="userbirth" class="inputForm">
			<div class="check_font" id="birth_check"></div>
		</div>
		
		
		<div class="titletext">
			<h4>닉네임</h4>
			<input type="text" id="signnick" name="nickName" class="inputForm">
			<div class="check_font" id="nick_check"></div>
		</div>
		
		
		<div class="titletext">
			<h4>이메일</h4>
			<input type="email" id="signemail" name="email" class="inputForm" required>
			<div class="check_font" id="email_check"></div>
		</div>
		
		<div class="titletext">
			<h4>휴대폰</h4>
			<input type="text" id="signphone" name="phone" class="inputForm">
			<div class="check_font" id="phone_check"></div>
		</div>

		<div class="titletext">
			<h4>자기소개</h4>
			<input type="text" id="intro" name="intro" class="selfintro">
		</div>

	
		<div class="signbutton">
			<button onclick="goBack()" id="cancelbutton">취소</button>
			<button type="submit" id="signbutton" name="signin">가입하기</button>
		</div>
		
		<!-- 취소 버튼시 이전페이지 이동 -->
		<script>
		function goBack(){
			window.history.back();
		}
		</script>
		</form>
	</div>
</div>	
	
</body>
</html>