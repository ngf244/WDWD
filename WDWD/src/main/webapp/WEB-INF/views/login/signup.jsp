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
	text-align: center;
	background : #E0F2F7;
}

.selfintrotext {
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

.signform {
	text-align: center;
}

#signbutton {
	display: inline-block;
	margin-top: 20px;
	text-align: center;
	height: 70px;
	width: 18.5%;
	background-color : rgb(52, 152, 219);
	line-height: 70px;
	color: white;
	font-weight: bold;
	
}

#cancel {
	display: inline-block;	
	margin-top: 20px;
	text-align: center;
	height: 70px;
	width: 18.5%;
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

.labeltext{
	text-align: left;
}

.meintro{
	width: 37%;	
}

label{
 font-weight: bold;
	float: left;
	text-align: left;
	margin-left: 31.3%;
}

#textlogo{
	text-align: center;
}


</style>
</head>
<body>
		<div class="signuptitle">
			<img src="${ contextPath }/resources/images/textlogo.png" onclick="location.href='index.jsp';" id="textlogo">
		</div>	
			<form action="signUp.me" method="post" id="joinForm">
		
		<!-- 아이디  -->
		<div class="form-group">
			<label>아이디</label><br>
			<input type="text" class="form-control" id="user_id" name="userId" placeholder="아이디" onkeypress="javascript:capsLock(this);">
			<div class="check_font" id="id_check">
			<br>
			</div>
		</div>

		<!-- 비밀번호 -->
		<div class="form-group">
			<label for="inform">비밀번호</label><br>
			<input type="password" id="signpwd" name="userPwd" class="form-control" placeholder="비밀번호">
			<div class="check_font" id="pw_check">
			<br>
			</div>
		</div>

		<!-- 비밀번호 재확인 -->
		<div class="form-group">
			<label for="inform">비밀번호 재확인</label><br>
			<input type="password" id="signpwd2" name="userPwd" class="form-control" placeholder="비밀번호 확인">
			<div class="check_font" id="pw2_check">
			<br>
			</div>
		</div>


		<div class="form-group">
			<label for="inform">이름</label><br>
			<input type="text" id="signname" name="userName" class="form-control">
			<div class="check_font" id="name_check">
			<br>
			</div>
		</div>
		
		<div class="form-group">
			<label for="inform">생년월일</label><br>
			<input type="text" id="signbirth" name="userbirth" class="form-control">
			<div class="check_font" id="birth_check">
			<br>
			</div>
		</div>
		
		
		<div class="form-group">
			<label for="inform">닉네임</label><br>
			<input type="text" id="signnick" name="nickName" class="form-control">
			<div class="check_font" id="nick_check">
			<br>
			</div>
		</div>
		
		
		<div class="form-group">
			 <label for="inform">이메일</label><br>
			<input type="email" id="signemail" name="email" class="form-control" required>
			<div class="check_font" id="email_check">
			<br>
			</div>
		</div>
		
		<div class="form-group">
			<label for="inform">휴대폰</label><br>
			<input type="text" id="signphone" name="phone" class="form-control" placeholder="('-')빼고입력">
			<div class="check_font" id="phone_check">
			<br>
			</div>
		</div>
		
		<div class="form-group">
			<h4>포인트 충전/디자인 의뢰시 필요한 계좌명을 적어주세요</h4>		
			<label for="inform">은행명</label><br>
			<input type="text" id="signbank" name="bank" class="form-control" placeholder="은행명">
			<div class="check_font" id="bank_check">
			<br>
			</div>
		</div>	
		
		<div class="form-group">
			<label for="inform">계좌번호</label><br>
			<input type="text" id="signcash" name="account" class="form-control" placeholder="('-')빼고입력">
			<br><br>
		</div>		

		<div class="intro">
			<label for="inform">자기소개</label><br>
			<textarea rows="10" cols="79" name="intro" style="resize: none;" class="meintro">
			</textarea>
			<br>
			
		</div>
	
		<div class="form-groupBtn">
			<div id="cancel" onclick="location.href='gomain.me';">취소</div>
			<div id="signbutton">가입하기</div>
		</div>
		</form>
	
	<script type="text/javascript">
		window.onload = function(){
			document.getElementById('signButton').onclick = function () {
				document.getElementById('joinForm').submit();
			};
		};
	</script>
	<script>
	//아이디 정규식
	var idJ = /^[a-z0-9]{4,12}$/;
	//아이디 유효성 검사
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#user_id').val();
		$.ajax({
			url : "signUp.me"
			type : 'get',
			success : function(data) {
				// f12 콘솔창에 중복확인 
				// 1 = 중복되는 값
				// 0 = 중복되는 값이 아닐시
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#user_id").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#user_id").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#user_id").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#user_id").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script>
	<script>
	//CapsLock 스크립트	
		$('#user_id').bind('keypress', function(e) {
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
	<script>
	
	// 모든 공백 체크 정규식
	var empJ = /\s/g;
	
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/;
	
	// 이름 정규식
	var nameJ = /^[가-힣]{2,6}$/;
	
	// 이메일 검사 정규식 
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	
	//이름에 특수문자가 안들어가게 설정
	$("#signname").blur(function(){
		if (nameJ.test($(this).val()){
			console.log(nameJ.test($(this).val()));
			$("name_check").text('');
		}else{
			$('#name_check').text('이름을 확인해주세요');
			$('#name_check').css('color', 'red');
		}
	});
		
	// 휴대전화
	$('#signphone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(nameJ.test($(this).val()));
			$('#phone_check').text('');
		}else{
			$('#phone_check').text('휴대폰번호를 확인해주세요');
			$('#phone_check').css('color','red');
		}
	});
	
	// 생일유효성 검사
	var birthJ = false;
	
	$('#signbirth').blur(function(){
		var dateStr = $(this).val();
		var year = Number(dateStr.substr(0,4));
		var month = Number(dateStr.substr(4,2));
		var day = Number(dateStr.substr(6,2));
		var today = new Date();
		var yearNow = today.getFullyear();
		
		if (dateStr.length <=8) {
			 
			if (1900 > year || year > yearNow){
				$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red');
		} else if (month < 1 || month > 12){
			
			$('#birth_check').text('생년월일을 확인해주세요');
			$('#birth_check').css('color', 'red');
			
		 }else if (day < 1 || day > 31) {
		    	
		    	$('#birth_check').text('생년월일을 확인해주세요 :)');
				$('#birth_check').css('color', 'red'); 
		    	
		    }else if ((month==4 || month==6 || month==9 || month==11) && day==31) {
		    	 
		    	$('#birth_check').text('생년월일을 확인해주세요');
				$('#birth_check').css('color', 'red'); 
		    	 
		    }else if (month == 2) {
		    	 
		       	var isleap = (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0));
		       	
		     	if (day>29 || (day==29 && !isleap)) {
		     		
		     		$('#birth_check').text('생년월일을 확인해주세요 ');
					$('#birth_check').css('color', 'red'); 
		    	
				}else{
					$('#birth_check').text('');
					birthJ = true;
				}//end of if (day>29 || (day==29 && !isleap))
		     	
		    }else{
		    	
		    	$('#birth_check').text(''); 
				birthJ = true;
			}//end of if
			
			}else{
				//1.입력된 생년월일이 8자 초과할때 :  auth:false
				$('#birth_check').text('생년월일을 확인해주세요 ');
				$('#birth_check').css('color', 'red');  
			}
		});
	</script>
	
</body>
</html>