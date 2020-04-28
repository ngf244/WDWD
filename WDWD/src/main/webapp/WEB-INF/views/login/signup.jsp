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
}

.selfintrotext {
	margin-top: 50px;
	text-align: center;
}

.introtext{
	margin-top: 50px;
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

.signform {
	text-align: center;
}

#signbutton {
	margin-top: 20px;
	text-align: center;
	height: 70px;
	width: 20%;
	background-color : rgb(52, 152, 219);
	line-height: 70px;
	color: white;
	font-weight: bold;
	
}

#cancel {
	margin-top: 20px;
	text-align: center;
	height: 70px;
	width: 20%;
	background-color : gray;
	color: white;
	line-height: 70px;
	font-weight: bold;
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


.meintro{

}


</style>
</head>
<body>
		<div class="signuptitle">
			<form action="signUp.me" method="post" id="joinForm">
			<img src="<%= request.getContextPath() %>/sources/image/logintitle.png" id="logo">
		
		
		<!-- 아이디  -->
		<div class="form-group">
			<label for="inform">아이디</label>
			<br><input type="text" class="form-control" id="user_id" name="userId" placeholder="아이디" required>
			<div class="check_font" id="id_check"></div>
		</div>

		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="inform">비밀번호</label><br>
			<input type="password" id="signpwd" name="userPwd" class="form-control" placeholder="비밀번호">
			<div class="check_font" id="pw_check"></div>
		</div>

		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="inform">비밀번호 재확인</label><br>
			<input type="password" id="signpwd2" name="userPwd" class="form-control" placeholder="비밀번호 확인">
			<div class="check_font" id="pw2_check"></div>
		</div>


		<div class="form-group">
			<label for="inform">이름</label><br>
			<input type="text" id="signname" name="userName" class="form-control">
			<div class="check_font" id="name_check"></div>
		</div>
		
		<div class="form-group">
			<label for="inform">생년월일</label><br>
			<input type="text" id="signbirth" name="userbirth" class="form-control">
			<div class="check_font" id="birth_check"></div>
		</div>
		
		
		<div class="form-group">
			<label for="inform">닉네임</label><br>
			<input type="text" id="signnick" name="nickName" class="form-control">
			<div class="check_font" id="nick_check"></div>
		</div>
		
		
		<div class="form-group">
			 <label for="inform">이메일</label><br>
			<input type="email" id="signemail" name="email" class="form-control" required>
			<div class="check_font" id="email_check"></div>
		</div>
		
		<div class="form-group">
			<label for="inform">휴대폰</label><br>
			<input type="text" id="signphone" name="phone" class="form-control" placeholder="('-')빼고입력">
			<div class="check_font" id="phone_check"></div>
		</div>
		
		<div class="form-group">
			<h4>포인트 충전/디자인 의뢰시 필요한 계좌명을 적어주세요</h4>		
			<label for="inform">은행명</label><br>
			<input type="text" id="signbank" name="bank" class="form-control" placeholder="은행명">
			<div class="check_font" id="bank_check"></div>
		</div>	
		
		<div class="form-group">
			<label for="inform">계좌번호</label><br>
			<input type="text" id="signcash" name="account" class="form-control" placeholder="('-')빼고입력">
		</div>		

		<div class="intro">
			<label for="inform">자기소개</label><br>
			<textarea rows="10" cols="79" name="intro" style="resize: none;" class="meintro"></textarea>
			
		</div>
	
		<div class="titletext">
			<div id="cancel" onclick="location.href='gomain.me';">취소</div>
			<div id="signbutton">가입하기</div>
		</div>
		</form>
	</div>
</body>
</html>