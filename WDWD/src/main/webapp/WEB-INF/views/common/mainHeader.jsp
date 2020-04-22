<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
	header {
		width : 100%;
		height: auto;
		text-align: center;
	}
	#titleHeader {
		background-color: rgba(161, 206, 244, 0.55);
		height: 200px;
		text-align: center;
		position: relative;
	}
	#mainIcon {
		width: auto;
		height: 120px;
		display: inline-block;
		margin: 25px;
		vertical-align: middle;
		cursor: pointer;
	}
	#mainLetter{
		width: 400px;
		height: 50px;
		position: absolute;
		top: 30px;
		left: 35%;
		display: inline-block;
		vertical-align: middle;
	}

	#mainLetter img{
		width: 100%;
		height: 100%;
	}

	#mainSearch {
		display: inline-block;
		vertical-align: middle;
		margin-top: 75px;
	}
	#mainSearch input {
		display: inline-table;
		width: 350px;
		height: 34px;
		border: 3px solid rgb(108, 191, 255);
	}
	#mainSearch img {
		position: absolute;
		width: 42px;
		height: 42px;
	}
	#basicForm {
		width: 250px;
		height: 150px;
		display: inline-block;
		vertical-align: middle;
		margin-left: 30px;
	}
	#loginView, #signupBtn, #welcomeName, #logout{
		padding: 10px;
		background-color : rgb(52, 152, 219);
		color : white;
		border-radius: 5px;
		margin: 10px;
		/* line-height: 40px; */
		font-weight: bold;
		display: inline-block;
		cursor: pointer;
	}
	#notice, #modalMenu {
		width: 40px;
		height: 40px;
		margin: 10px;
		cursor: pointer;
	}
	#smallInfo {
		display: none;
		position: fixed;
		z-index: 100;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgba(0,0,0,0.5);
	}
	#smallInfoContent {
		position: absolute;
		right: -350px;
		background-color: white;
		width: 350px;
		height: 100%;
		float: right;
		transition: right 0.5s ease;
	}
	#smallInfoContent.open {
		right: 0px;
	}
	#profile_wrap {
		display: table;
		margin: 0 auto;
	}
	#profile_img {
		width: 80px;
		height: 80px;
		display: inline-table;
		border-radius: 50%;
		margin-right: 20px;
		overflow: hidden;
		
		border: 1px solid black;
	}
	#profile_img img {
		width: 100%;
		height: 100%;
		overflow: hidden;
	}
	#profile_wrap b {
		height: 80px;
		display: table-cell;
		vertical-align: middle;
		font-size: 16pt;
	}
	.smallMenu {
		width: 100px;
		display: inline-table;
		margin: 8px;
		font-size: 13pt;
		padding: 10px;
		border-radius: 25px;
		cursor: pointer;
	}
	.yellow {
		background-color: rgb(255, 249, 196);
	}
	.blue {
		background-color: rgb(179, 229, 252);
	}
	.smallMenu img {
		width: 80px;
		height: 80px;
		margin-bottom: 10px;
	}
	#recently {
		width: 200px;
		display: inline-table;
		font-size: 14pt;
		font-weight: bold;
		padding: 10px;
		margin-bottom: 20px;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
	}
	.recentlyBoard {
		margin: 0 auto;
		width: 300px;
		padding: 10px;
		font-size: 13pt;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		cursor: pointer;
	}
	
	#menuHeaderWrap {
		background-color: rgb(52, 152, 219);
		height: 60px;
	}
	#menuHeader {
		width: 70%;
		margin: 0 auto;
	}
	.menubar {
		float: left;
		color: white;
		display: inline-block;
		font-size: 15pt;
		margin: 15px;
		cursor: pointer;
	}
	#menuHeaderText {
		float: right;
		color: white;
		display: inline-block;
		font-size: 13pt;
		line-height: 60px;
		margin-right: 50px;
		max-height: 60px;
	}
	#noticeArea{
		display: none;
		border-style: outset;
		background-color: lightgrey;
		opacity: 0.5;
		width: 350px;
		height: 200px;
	}

	#left-side{
		width: 14%;
		min-height: 600px;
		float:left;
	}
	#main {
		width : 69.8%;
     	min-height : 600px;
     	margin-bottom: 20px;
		margin-right: 0.1%;
		margin-left: 0.1%;
		float: left;
		/* border: 1px solid black; */
	}
	#right-side{
		width : 16%;
		min-height : 600px;
		float: left;
		text-align: center;
	}
	section:after {
		content:""; 
		display: block;
		clear:both;
		/* border: 1px solid black;
		background-color: brown; */
	}
	/* section:after을 사용 못할 경우 section 마지막에 div class=sectionafter 을 만들어서 해결 */
	.sectionafter{
		clear: both;
		height: 0px;
	}
	
	span.smallOption{
		color : gray;
		font-weight: bold;
	}

	#smallOptionBlock{
		background-color: rgb(211, 211, 211);
		width: 10%;
		position: fixed;
		color: black;
		display: none;
		z-index: 99;
	}

	#smallOptionBlock div{
		border-bottom: 1px dotted white;
	}
	#smallOptionBlock div:hover{
		background-color: rgb(41, 40, 41);
		color: white;
		cursor: pointer;
	}

	#restrictForm{
		position: fixed;
		width: 30%;
		min-height: 100px;
		top: 25%;
		left: 35%;
		background-color: beige;
		z-index: 100;
		text-align: left;
		/* column-width: 300px;
		column-gap: 5px;
		column-rule: 1px solid black; */
		padding: 15px;
		border: outset;
		display: none;
	}

	#restrictForm textarea{
		width: 95%;
		height: 100px;
	}

	#restrictForm div{
		text-align: right;
		margin-right: 3%;
		margin-top: 50px;
	}

	#restrictForm button{
		width: 30%;
		height: 30px;
	}

	#reportForm{
		position: fixed;
		width: 30%;
		min-height: 100px;
		top: 25%;
		left: 35%;
		background-color: rgb(245, 222, 220);
		z-index: 100;
		text-align: left;
		/* column-width: 300px;
		column-gap: 5px;
		column-rule: 1px solid black; */
		padding: 15px;
		border: outset;
		display: none;
	}

	#reportForm textarea{
		width: 95%;
		height: 100px;
	}

	#reportForm div{
		text-align: right;
		margin-right: 3%;
		margin-top: 50px;
	}

	#reportForm button{
		width: 30%;
		height: 30px;
	}




</style>
<title>Insert title here</title>
</head>
<body>
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<header>
		<div id="titleHeader">
			<img id="mainIcon" src="${ contextPath }/resources/images/logo.png" onclick="location.href='index.me'">
			<div id="mainSearch">
				<input type="text">
				<img src="${ contextPath }/resources/images/search.png">
			</div>
			<div id="basicForm">
				<c:if test="${ empty sessionScope.loginUser }">
				<c:if test="${ empty sessionScope.signup }">
					<div id="loginView">login</div>
					<div id="signupBtn">sign up</div>
					
					<script>
						$('#loginView').click(function(){
							$('#loginWrap').show();
						})
						
						$('#signupBtn').click(function(){
							$('#signupWrap').show();
						})
					</script>
				</c:if>
			</c:if>
				<c:if test="${ !empty sessionScope.loginUser }">
          <div id="welcomeName">${ sessionScope.loginUser.nickName }님 환영합니다</div>
          <img id="notice" class="notice" src="${ contextPath }/resources/images/알림.PNG">
          <img id="modalMenu" src="${ contextPath }/resources/images/메뉴.PNG">
            <div id="noticeArea" class="notice">
            </div>

            <div id="smallInfo">
              <div id="smallInfoContent">
                <div style="height: 60px;"></div>
                <div id="profile_wrap">
                  <div id="profile_img"><img src=''></div>
                  <b>${ sessionScope.loginUser.nickName } 님</b>
                </div>

                <div style="height: 30px;"></div>

                <div class="smallMenu yellow">
                  <img src="${ contextPath }/resources/images/point.png">
                  <br><b><fmt:formatNumber value="${ sessionScope.loginUser.point }" type="number" groupingUsed="true"/> POINT</b>
                </div>

                <div class="smallMenu yellow">
                  <img src="${ contextPath }/resources/images/cash.png">
                  <br><b><fmt:formatNumber value="${ sessionScope.loginUser.cash }" type="number" groupingUsed="true"/> CASH</b>
                </div>

                <div class="smallMenu blue" onclick="goMyPage();">
                  <img src="${ contextPath }/resources/images/info.png">
                  <br><b>마이페이지</b>
                </div>

                <div class="smallMenu blue">
                  <img src="${ contextPath }/resources/images/logout.png" onclick="location.href='logout.me'">
                  <br><b>로그아웃</b>
                </div>

                <div style="height: 60px;"></div>

                <div id="recently">최근 본 글</div>
                <div class="recentlyBoard">
                  1번글제목이 엄청나게 길면 어떻게 될까요ㅎㅎㅎㅎㅎㅎㅎㅎㅎ
                </div>
                <div class="recentlyBoard">
                  2번글제목
                </div>
                <div class="recentlyBoard">
                  3번글제목
                </div>
                <div class="recentlyBoard">
                  4번글제목
                </div>
                <div class="recentlyBoard">
                  5번글제목
                </div>				
                </div>
              </div>
            </c:if>
				<script>
					$('#modalMenu').click(function() {
						$('#smallInfo').css('display', 'block');
						setTimeout(function() {
							$('#smallInfoContent').addClass("open");
						}, 1);
					});
					$('#smallInfo').click(function() {
						if(!($('#smallInfoContent').is(":hover"))) {
							$('#smallInfoContent').removeClass("open");
							$('#smallInfo').css('display', 'none');
							setTimeout(() => {
							}, 500);
						}
					});

					$('#notice').click(function(e){
						$('#noticeArea').slideToggle();
					})

					$('html').click(function(e){
						if(!$(e.target).hasClass("notice")){
							$('#noticeArea').slideUp();
						}
					})
				</script>
			</div>
		</div>
		<div id="smallOptionBlock" class="smallOptionBlock">
			<div>마이페이지</div>
			<div>게시글 보기</div>
			<div>작성 댓글 보기</div>
			<div id="restrictBtn">제재</div>
			<input type="hidden" name="userId">
		</div>

		<div id="restrictForm">
			<form>
				아이디 : <input type="text" name="resUserId" readonly>
				<br><br>
				제재 사유 :
				<br>
				<textarea></textarea>
				<br><br>
				제재 기간 : <br>
				<input type="date" id="restrictToday"> ~ <input type="date" id="restrictTerm">
				<br>
				<div>
					<button type="button" class="registRes">등록</button>
					<button type="button" class="cancelRes">취소</button>
				</div>
			</form>
		</div>

		<div id="reportForm">
			<form>
				글 번호 : <input type="text" name="boardNo" readonly>
				<br><br>
				신고 대상 : <input type="text" name="reported" readonly>
				<br><br>
				신고자 : <input type="text" name="reporter" readonly>
				<br><br> 
				신고 사유 : 
				<br>
				<textarea></textarea>
				<br><br>
				
				<div>
					<button type="button" class="registRes">등록</button>
					<button type="button" class="cancelRes">취소</button>
				</div>
			</form>
		</div>
		<script>
			$('#restrictBtn').click(function () {
				$('#restrictForm').css('display','block');
				var targetId = $(this).parent().children('input[name=userId]').val();
				console.log(targetId);
				$('#restrictForm input[name=resUserId]').val(targetId);
				// var now = new Date();
				// var date = now.getDate();
				// var month = now.getMonth()+1;
				// var year = now.getFullYear();
				// var com = year + " - " + month + " - " + date;
				document.getElementById("restrictToday").valueAsDate = new Date();
			})

			$('.cancelRes').click(function () {
				$('#restrictForm').css('display','none');
				$('#reportForm').css('display','none');

				console.log($('#restrictToday').val());
				console.log($('#restrictTerm').val());
			})

		</script>
					
		
		<div id="menuHeaderWrap">
			<div id="menuHeader">
				<div class="menubar">공지사항</div>
				<div class="menubar" onclick="guide.jsp">가이드</div>
				<div class="menubar">사진</div>
				<div class="menubar">미디어</div>
				<div class="menubar">HIT 갤러리</div>
				<div class="menubar">문의</div>
				<div class="menubar">충전소</div>
				
				<div id="menuHeaderText">
					<span id="menuTextBoard">등록된 게시물 123개</span>
					<span id="menuTextReply">등록된 댓글 321개</span>
				</div>
			
				<script>
					$('#menuTextReply').hide();
					!function loop(){
						setTimeout(function() {
							if($("#menuTextReply").css("display") == "none"){
								$('#menuTextBoard').hide();
								$('#menuTextReply').slideDown();	
							} else {
								$('#menuTextReply').hide();
								$('#menuTextBoard').slideDown();	
							}
							loop();
						}, 1500)
					}()
					
					/* !function name() {
						console.log('되나');
					}() -> !로 시작하고 ()로 끝내면 자동실행*/
					
					function goMyPage(){
						var userId = "${loginUser.userId}";
						location.href="main.my?userId=" + userId;
					}
					
					
					function checkTime(board) {
						var timer = setInterval(function() {
							if(new Date().getTime() >= new Date(board.cbDate).getTime()) {
								$.ajax({
									url: 'timeOut.ch',
									data: {boNum: board.boNum},
									type: 'post',
									success: function(data){
										clearInterval(timer);
									}
								});
								clearInterval(timer);
							}
						}, 1000);
					}
					
					if("${sessionScope.loginUser.nickName}" == '운영자') {
						$.ajax({
							url: 'checkTime.ch',
							type: 'post',
							success: function(data){
								for(var i = 0; i < data.list.length; i++) {
									checkTime(data.list[i]);
								}
							}
						});
					}
					
					if('${param.sysMsg}' == "1") {
						alert('작업중인 게시물은 에디터와 작성자만 확인할 수 있습니다.');
					} else if('${param.sysMsg}' == "2") {
						alert('선택 완료되었습니다.');
					} else if('${param.sysMsg}' == "3") {
						alert('작성 완료되었습니다.');
					}
				</script>
			</div>
		</div>
	</header>
	
	<br>
	<div>
		<jsp:include page="../login/login.jsp"/>
		<jsp:include page="../login/signup.jsp"/>
	</div>

	
</body>
</html>