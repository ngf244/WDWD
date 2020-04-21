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

.inputForm {
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
		

		<div class="titletext">
			<h4>아이디</h4>
			<input type="text" id="signId" name="signinId" class="inputForm">
			<div class="check_font" id="id_check"></div>
		</div>

		<div class="titletext">
			<h4>비밀번호</h4>
			<input type="password" id="signpwd" name="signinPwd" class="inputForm">
			<div class="check_font" id="pw_check"></div>
		</div>

		<div class="titletext">
			<h4>비밀번호 재확인</h4>
			<input type="password" id="signpwd2" name="signreinPwd" class="inputForm">
			<div class="check_font" id="pw2_check"></div>
		</div>


		<div class="titletext">
			<h4>이름</h4>
			<input type="text" id="signname" name="signinname" class="inputForm">
			<div class="check_font" id="name_check"></div>
		</div>
		
		<div class="titletext">
			<h4>생년월일</h4>
			<input type="text" id="signbirth" name=signinbirth class="inputForm">
			<div class="check_font" id="birth_check"></div>
		</div>
		
		
		<div class="titletext">
			<h4>닉네임</h4>
			<input type="text" id="signnick" name="signinnick" class="inputForm">
			<div class="check_font" id="nick_check"></div>
		</div>
		
		
		<div class="titletext">
			<h4>이메일</h4>
			<input type="text" id="signemail" name="signinemail" class="inputForm">
			<div class="check_font" id="email_check"></div>
		</div>
		
		<div class="titletext">
			<h4>휴대폰</h4>
			<input type="text" id="signphone" name="signinphone" class="inputForm">
			<div class="check_font" id="phone_check"></div>
		</div>
		
		
		<div class="titletext">
			<h4>성별</h4><br>
			<input type="checkbox" id="mem_gender" name="mem_gender" value="M">남
			<input type="checkbox" id="mem_gender" name="mem_gender" value="F">여
		</div>

		<div class="titletext">
			<h4>자기소개</h4>
			<input type="text" id="intro" class="selfintro">
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
	
	
	<script type="text/javascript">
	
	// 모든 공백 정규식
	var empJ = /\s/g;
	
	// 아이디 정규식
	var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
	
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	
	// 이름 정규식
	var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
	
	// 닉네임 정규식
	var nickJ = /^[가-힣]{2,4}|[a-zA-z]{2,10}\s[a-zA-Z]{2,10}$/;
	
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;

	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	/^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/
	
	
	var birthJ = false;
	
	$(document).ready(function(){
		
    //아이디 중복 확인 
    if($("#signId").val()==''){
		$('#id_check').text('아이디를 입력해주세요.');
		$('#id_check').css('color', 'red');
		
	} else if(idJ.test($('#signId').val())!=true){
		$('#id_check').text('4~12자 영문, 숫자만 입력해주세요');
		$('#id_check').css('color','red');
	} else if($('#signId').val()!=''){
		
		// servlet 전달
		var signId=$('#signId').val();
		$.ajax({
			async : true,
			type : 'POST',
			data : singId,
			url: 'idcheck.do',
			dataType: 'json',
			succes : function(date){
				
				
			if(data.cnt > 0){
				$('#id_check').text('중복된 아이디 입니다.');
					$('#id_check').css('color', 'red');
					$("#usercheck"),attr("disabled", true);
			}else{
				if(idJ.test(signId)){
					$('#id_check').text('사용가능한 아이디 입니다');
					$('#id_check').css('color', 'blue');
					$("#usercheck").attr("disabled", false);
				}
				
				else if(signId=''){
					$('#id_check').text('아이디를 입력해주세요.');
						$('#id_check').css('color','red');
						$("#usercheck").attr("disabled", true);
				}
				
				else{
					$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다.");
					$('#id_check').css('color','red');
					$("#usercheck").attr("disabled", true);
					
				}
			}
		}
		});
	 }
	});
	
	$('#joinForm').on('submit',function(){
		var inval_Arr = new Array(8).fill(false);
		if(idJ.test($('#singId').val())){
			inval_Arr[0] = true;
		}else{
			inval_Arr[0] = false;
			alert('아이디를 확인하세요.');
			return false;
		}
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		
		if(($('signpwd').val() == ($('signpwd2').val()))
				&& pwJ.test($('#signpwd').val())){
			inval_Arr[1] = true;
		}else{
			inval_Arr[1] = false;
			alert('비밀번호를 확인해주세요.');
			
			return false;
			
		}	
		
		// 이름 정규식
		
		if(nameJ.test($('#signname').val())){
			inval_Arr[3] = true;
		}else{
			inval_Arr[3] = false;
			alert('이름을 확인해주세요');
			
			return false;
			
			
		}	
		
		// 닉네임 정규식
		if(nickJ.test($('#signnick').val())){
			inval_Arr[2] = true;
		}else{
			inval_Arr[2] = false;
			alert('닉네임을 확인해주세요');			
			
			return false;
			
		}
		
		
		
		// 생년월일 정규식
		if(birthJ){
			console.log(birthJ);
			inval_Arr[3] = true;
		} else{
			inval_Arr[3] = false;
			alert('생년월일을 입력해주세요');
			return false;
			
		}
		
		// 이메일 정규식
		if(mailJ.test($('#signmail').val())){
			console.log(mailJ.test($('#signmail').val()));
			inval_Arr[4]=true;
			
		}else{
			inval_Arr[4] = false;
			alert('이메일을 확인해주세요');
			return false;
			
		}
		
		
		// 휴대폰 정규식
		if(phonej.test($('#signphone').val())){
			console.log(phoneJ.test($('#signphone').val()));
			inval_Arr[5] = true;
			
		} else{
			inval_Arr[5] = false;
			alert('휴대폰 번호를 확인해주세요');
			return false;
		}
		
		// 성별 확인 정규식
		if(member.mem_gender[0].checked==false&&member.men_gender[1].checked==false){
			inval_Arr[6] = false;
			alert('성별을 확인하세요');
			return false;
			
		} else{
			inval_Arr[6] = true;
		}
		
		
		// 전체 유효성 검사
		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			if(inval_Arr[i] == false){
				validAll = false;
				
			}
		}
		
		if(validAll == true){
			alert('왓두워너두 회원가입이 되었습니다');	
		}else{
			alert('정보를 다시 확인해주세요')
		}
			
		});
	
	
	$('#signId').blur(function(){
		if(idJ.test($('#signId').val())){
			console.log('true');
			$('#id_check').text('');
		}else{
			console.log('false');
			$('#id_check').text('5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.');
			$('#id_check').css('color', 'red');
		}	
			
		});
	$('#signpwd').blur(function(){
		if(pwJ.test($('#signpwd').val())){
			console.log('true');
			$('#pw_check').text('');
		}else{
			console.log('false');
			$('#pw_check').text('4~12자의 숫자, 문자만 가능합니다');
			$('#pw_check').css('color', 'red');
		}
	});
			
	// 1~2 패스워드 일치 확인
	$('#signpwd2').blur(function(){
	
		if($('#signpwd').val() != $(this).val()){
			$('#pw2_check').text('비밀번호가 일치하지 않습니다');
			$('#pw2_check').css('color', 'red');
		}else{
			$('#pw2_check').text('');
		}	
	});
	
	
	// 이름에 특수문자 들어가지 않도록 설정
	$("signname").blur(function(){
		if(nameJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$("#name_check").text('');
		}else{
			$('#name_check').text('한글 2~4자 이내로 입력하세요 특수,기호,공백 사용불가');
			$('#name_check').css('color','red');
		}
	});
	
	//닉네임도 특수문자 안들어가게 설정
	$("signnick").blur(function(){
		if(nickJ.test($(this).val())){
			console.log(nickJ.test($(this).val()));
			$("#nick_check").text('');
		}else{
			$('#nick_check').text('닉네임 2~4자 이내로 입력하세요');
			$('#nick_check').css('color', 'red');
		}
	});
	
	//이메일 설정
	$("signemail").blur(function(){
		if(mailJ.test($(this).val())){
			$("#email_check").text('');
		}else{
			$('#email_check').text('이메일을 확인해주세요');
			$('#email_check').css('color','red');
		}	
	});
	// 생일 유효성 검사
		var birthJ  = false;
		
		// 생년월일 birthJ 에 대한 유효성 검사
		
		$('#signbirth').blur(function(){
			var dateStr = $(this).val();
				var year = Number(dateStr.substr(0,4)); //입력한 값의 0~4자리 까지 (연)
				var month = Number(dateStr.substr(4,2)); //입력한 값의 4번째 자리부터 2자리 숫자 (월)
				var day = Number(dateStr.substr(6,2)); // 입력한 값의 6번째 자리부터 2자리 까지 (일)
				var today = new Date(); // 날짜변수 선언
				var yearNow = today.getFullYear(); // 올해 연도를 불러옴
				
				if(dateStr.length <=8){ // 연도의 경우 1900보다 자거나 yearNow보다 크다면 false를 반환한다.
					
					if(year > yearNow || year < 1900){
						$('birth_check').text('생년월일을 확인해주세요');
						$('birth_check').css('color', 'red');
					}
				else if (month < 1 || month > 12) {
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color','red');
					
				
				}else if (day < 1 || day > 31){
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color','red');
						
						
				}else if((month==4 || month==6 || month==9 || month==11) && day==31){
					$('#birth_check').text('생년월일을 확인해주세요');
					$('#birth_check').css('color','red');
				}else if(month ==2){
					var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));	
				
					
					if(day>29 || (day==29 && !isleap)){
					
						$('#birth_check').text('생년월일을 확인해주세요');
						$('#birth_check').css('color', 'red');
						
					}else{
						$('#birth_check').text('');
						birthJ = true;
					}
					}else{
						$('#birth_check').text('');
						birthJ = true;
					} 
						
					}else{
						$('#birth_check').text('생년월일을 확인해주세요');
						$('#birth_check').css('color','red');
					}	
				});
		
		
		// 휴대폰 정규식
		$('#signphone').blur(function(){
			if(phoneJ.test($(this).val())){
				console.log(nameJ.test($(this).val()));
				$("#phone_check").text('');
			}else{
				$('#phone_check').text('휴대폰번호를 확인해주세요');
				$('#phone_check').css('color','red');
			}
		});
	</script>
</body>
</html>