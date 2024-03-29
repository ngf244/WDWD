<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="http://localhost:82/socket.io/socket.io.js"></script>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);

<link href ="https: //fonts.googleapis.com /css?family=Noto+Sans+KR&display =swap "rel ="stylesheet "> 
body {
	font-family: "Noto Sans KR", sans-serif;
}

header {
	width: 100%;
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
	margin: 40px;
	margin-left: 0px;
	margin-right: 20px;
	vertical-align: middle;
	cursor: pointer;
}

#mainLetter {
	width: 400px;
	height: 50px;
	position: absolute;
	top: 30px;
	left: 35%;
	display: inline-block;
	vertical-align: middle;
}

#mainLetter img {
	width: 100%;
	height: 100%;
}

#mainSearch {
	display: inline-block;
	vertical-align: middle;
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
	width: 14%;
	height: 150px;
	display: inline-block;
	vertical-align: middle;
	text-align: center;
	margin-left: 90px;
	position: relative;
}

#signupBtn, #welcomeName {
	padding: 10px;
	background-color: rgb(52, 152, 219);
	color: white;
	border-radius: 5px;
	margin: 10px;
	/* line-height: 40px; */
	font-weight: bolder;
	font-size: large;
	height: 25px;
	line-height: 25px;
	cursor: pointer;
}

#loginView {
	padding: 10px;
	background-color: rgb(52, 152, 219);
	color: white;
	border-radius: 5px;
	margin: 10px;
	/* line-height: 40px; */
	font-weight: bold;
	display: inline-block;
	cursor: pointer;
	width: 60%;
}

#notice, #modalMenu {
	width: 20%;
	margin: 10px;
	height: 60px;
	cursor: pointer;
}

#notice {
	margin-right: 12%;
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
	background-color: rgba(0, 0, 0, 0.5);
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
	width: 80px;
	height: 80px;
	overflow: hidden;
}

#profile_wrap b {
	height: 80px;
	display: table-cell;
	vertical-align: middle;
	font-size: 16pt;
}

.smallMenu {
	width: 130px;
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
	width: 60px;
	height: 60px;
	margin-bottom: 10px;
}

.recently {
	width: 200px;
	display: inline-table;
	font-size: 14pt;
	font-weight: bold;
	padding: 10px;
	margin-bottom: 10px;
	border-top: 2px solid gray;
	border-bottom: 2px solid gray;
}

.recentlyBoard, .scrapBoard {
	margin: 0 auto;
	width: 300px;
	padding: 8px;
	font-size: 12pt;
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

.adminPageBtn {
	margin-left: 350px;
	color: yellow;
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

#noticeArea {
	display: none;
	border-style: outset;
	background-color: rgba(233, 233, 233, 0.5);
	width: 350px;
	height: 200px;
	overflow: auto;
	text-align: left;
	z-index: 100;
}

.ul_list {
	list-style: none;
	-webkit-padding-start: 10px;
}

.ul_list li {
	margin-bottom: 10px;
}

#left-side {
	width: 14%;
	min-height: 600px;
	float: left;
}

#main {
	width: 69.8%;
	min-height: 600px;
	margin-bottom: 20px;
	margin-right: 0.1%;
	margin-left: 0.1%;
	float: left;
	/* border: 1px solid black; */
}

#right-side {
	width: 16%;
	min-height: 600px;
	float: left;
	text-align: center;
}

section:after {
	content: "";
	display: block;
	clear: both;
	/* border: 1px solid black;
		background-color: brown; */
}
/* section:after을 사용 못할 경우 section 마지막에 div class=sectionafter 을 만들어서 해결 */
.sectionafter {
	clear: both;
	height: 0px;
}

span.smallOption {
	color: gray;
	font-weight: bold;
	cursor: pointer;
}

#smallOptionBlock {
	background-color: rgb(211, 211, 211);
	width: 10%;
	position: fixed;
	color: black;
	display: none;
	z-index: 99;
	text-align: center;
}

#smallOptionBlock div {
	border-bottom: 1px dotted white;
}

#smallOptionBlock div:hover {
	background-color: rgb(41, 40, 41);
	color: white;
	cursor: pointer;
}

#restrictForm {
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

#restrictForm textarea {
	width: 95%;
	height: 100px;
}

#restrictForm div {
	text-align: right;
	margin-right: 3%;
	margin-top: 50px;
}

#restrictForm button {
	width: 30%;
	height: 30px;
}

#reportForm {
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

#reportForm textarea {
	width: 95%;
	height: 100px;
}

#reportForm div {
	text-align: right;
	margin-right: 3%;
	margin-top: 50px;
}

#reportForm button {
	width: 30%;
	height: 30px;
}

.getMessage:hover {
	background-color: yellow;
}
.getMessage div{
	z-index: 100;
}

.getMessage div p {
    margin-top: 0px;
    margin-bottom: 0px;
	
}

.list_count {
	position: absolute;
	display: inline-block;
	border: 1px solid black;
	width: 25px;
	height: 25px;
	border-radius: 50%;
	top: 65px;
	left: 33%;
	color: white;
	background-color: black;
	opacity : 0.5;
	font-size: large;
	font-weight: bolder;
}
	
.cursorPointer{
	cursor: pointer;
}

.messageListBtn {
	text-align: center;
}

.messageList {
	width: 200px;
	background-color: #ffa500;
	border-radius: 30%;
}

.messageGo {
	display: inline-block;
	padding-top: 2px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<c:set var="contextPath"
		value="${ pageContext.servletContext.contextPath }"
		scope="application" />
	<header>
		<div id="titleHeader">
			<img id="mainIcon" src="${ contextPath }/resources/images/logo.png"
				onclick="location.href='index.home'">
			<div id="mainSearch">
				<input type="text">
				<img class="cursorPointer" src="${ contextPath }/resources/images/search.png">
			</div>
			<div id="basicForm">
				<c:if test="${ empty sessionScope.loginUser }">
					<div id="loginView" onclick="location.href='gologin.me';">login</div>
				</c:if>

				<c:if test="${ !empty sessionScope.loginUser }">
					<div id="welcomeName">${ sessionScope.loginUser.nickName }님 환영합니다</div>
					<img id="notice" class="notice" src="${ contextPath }/resources/images/alarm.png">
					<div class="list_count"></div>
					<!-- 알림 카운트 -->
					<img id="modalMenu" src="${ contextPath }/resources/images/menu.png">

					<div id="noticeArea" class="notice">
						<div class="messageListBtn">
							
							<button class="messageList"><img class="messageGo"
								src="${ contextPath }/resources/images/messageGo.png" width="24"
								height="26"></button>
						</div>
						<ul class="ul_list">
							<li></li>
						</ul>
						<div class="row_grid"></div>
					</div>

					<div id="smallInfo">
						<div id="smallInfoContent">
							<div style="height: 30px;"></div>
							<div id="profile_wrap">
								<div id="profile_img">
									<img src=''>
								</div>
								<b>${ sessionScope.loginUser.nickName } 님</b>
							</div>

							<div style="height: 30px;"></div>

							<div class="smallMenu yellow" onclick="goPointShop();">
								<img src="${ contextPath }/resources/images/point.png"> <br>
								<b><span id="havePoint"></span><br>POINT</b>
							</div>

							<div class="smallMenu yellow" onclick="goCharge();">
								<img src="${ contextPath }/resources/images/cash.png"> <br>
								<b><span id="haveCash"></span><br>CASH</b>
							</div>

							<div class="smallMenu blue" onclick="goMyPage();">
								<img src="${ contextPath }/resources/images/info.png"> <br>
								<b>마이페이지</b>
							</div>

							<div class="smallMenu blue" onclick="location.href='logout.me'">
								<img src="${ contextPath }/resources/images/logout.png"> <br>
								<b>로그아웃</b>
							</div>

							<div style="height: 30px;"></div>

							<div class="recently">최근 본 글</div>

							<input type="hidden" value="0">
							<div class="recentlyBoard"></div>
							<input type="hidden" value="0">
							<input type="hidden" value="0">
							<div class="recentlyBoard"></div>
							<input type="hidden" value="0">
							<input type="hidden" value="0">
							<div class="recentlyBoard"></div>
							<input type="hidden" value="0">
							<input type="hidden" value="0">
							<div class="recentlyBoard"></div>
							<input type="hidden" value="0">
							<input type="hidden" value="0">
							<div class="recentlyBoard"></div>
							<input type="hidden" value="0">

							<div style="height: 30px;"></div>

							<div class="recently">최근 스크랩 한 글</div>

							<div class="scrapBoard"></div>
							<input type="hidden" value="0">
							<div class="scrapBoard"></div>
							<input type="hidden" value="0">
							<div class="scrapBoard"></div>
							<input type="hidden" value="0">
						</div>
					</div>
				</c:if>
			</div>

			<script>
				$('#modalMenu').click(function() {
					$.ajax({
						url: 'sessionUpdate.me',
						data: {userId: '${ sessionScope.loginUser.userId }'},
						type: 'post',
						success: function(data) {
							var list = data.list;
															
							var point = Number(list[0].point);
							var cash = Number(list[0].cash);
							
							$('#smallInfo').css('display', 'block');
							$('#havePoint').text(point.toLocaleString());
							$('#haveCash').text(cash.toLocaleString());
							
							if(list[0].profileImg == null) {
								$('#profile_img').children().attr('src', '${ contextPath }/resources/images/default_profile.png');
							} else {
								$('#profile_img').children().attr('src', '${ contextPath }/resources/profile_Image/' + list[0].profileImg);
							}
							
							var recentlyCheck = 1;
							for(var i = 1; i < 6; i++) {
								if(list[recentlyCheck] == null) {
									break;
								} else {
									if(list[0].recent1 == list[i].boNum) {
										$('.recentlyBoard').eq(0).prev().val(list[i].boNum);
										$('.recentlyBoard').eq(0).text(list[i].boTitle);
										$('.recentlyBoard').eq(0).next().val(list[i].boGroup);
									} else if(list[0].recent2 == list[i].boNum) {
										$('.recentlyBoard').eq(1).prev().val(list[i].boNum);
										$('.recentlyBoard').eq(1).text(list[i].boTitle);
										$('.recentlyBoard').eq(1).next().val(list[i].boGroup);
									} else if(list[0].recent3 == list[i].boNum) {
										$('.recentlyBoard').eq(2).prev().val(list[i].boNum);
										$('.recentlyBoard').eq(2).text(list[i].boTitle);
										$('.recentlyBoard').eq(2).next().val(list[i].boGroup);
									} else if(list[0].recent4 == list[i].boNum) {
										$('.recentlyBoard').eq(3).prev().val(list[i].boNum);
										$('.recentlyBoard').eq(3).text(list[i].boTitle);
										$('.recentlyBoard').eq(3).next().val(list[i].boGroup);
									} else if(list[0].recent5 == list[i].boNum) {
										$('.recentlyBoard').eq(4).prev().val(list[i].boNum);
										$('.recentlyBoard').eq(4).text(list[i].boTitle);
										$('.recentlyBoard').eq(4).next().val(list[i].boGroup);
									}
									recentlyCheck++;
								}
							}
							
							for(var i = 0; i < 3; i++) {
								if(list[recentlyCheck + i] == null) {
									break;
								}
								
								$('.scrapBoard').eq(i).next().val(list[recentlyCheck + i].boNum);
								$('.scrapBoard').eq(i).text(list[recentlyCheck + i].boTitle);
							}
							
							setTimeout(function() {
								$('#smallInfoContent').addClass("open");
							}, 100);
						}
					})
				});
				
				$('#smallInfo').click(function() {
					if(!($('#smallInfoContent').is(":hover"))) {
						$('#smallInfoContent').removeClass("open");
						$('#smallInfo').css('display', 'none');
						setTimeout(() => {
						}, 500);
					}
				});
				
				$('.recentlyBoard').click(function() {
					if($(this).next().val() == 1) {
						location.href= "detail.bo?boNum=" + $(this).prev().val();
					} else {
						location.href= "detailView.ch?boNum=" + $(this).prev().val();
					}
				});
				
				$('.scrapBoard').click(function(){
					location.href= "detail.bo?boNum=" + $(this).next().val();
				})

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
		<div id="smallOptionBlock" class="smallOptionBlock">
			<div>마이페이지</div>
			<div>자유게시글 보기</div>
			<div>캐시게시글 보기</div>
			<div>작성 댓글 보기</div>
			<div onclick="messageSend();">쪽지 보내기</div>
			<c:if test="${loginUser.userId == 'admin'}">
				<div id="restrictBtn">제재</div>
			</c:if>
			<input type="hidden" name="userId" id="smallOptionUserId">
		</div>

		<script>
			$('#smallOptionBlock div:nth-of-type(1)').click(function () {

				location.href = "main.my?userId=" + $('#smallOptionUserId').val();
			})
			$('#smallOptionBlock div:nth-of-type(2)').click(function () {
				location.href = "freeBoardList.my?userId=" + $('#smallOptionUserId').val();
			})
			$('#smallOptionBlock div:nth-of-type(3)').click(function () {
				location.href = "cashBoardList.my?userId=" + $('#smallOptionUserId').val();
			})
			$('#smallOptionBlock div:nth-of-type(4)').click(function () {
				location.href = "myReplyList.my?userId=" + $('#smallOptionUserId').val();
			})
		</script>

		<div id="restrictForm">
			<form method="POST" id="banForm">
				아이디 : <input type="text" name="banUserId" readonly> <br>
				<br> 제재 사유 : <br>
				<textarea name="banContentBefore" class="banContentBefore1"></textarea>
				<input type="hidden" name="banContent" class="banContent1">
				<br> <br> 제재 기간 : <br> <input type="date"
					id="banToday"> ~ <input type="date" name="banTerm">
				<br>
				<div>
					<button type="button" class="regisBan">등록</button>
					<button type="button" class="cancelRes">취소</button>
				</div>
			</form>
		</div>

		<div id="reportForm">
			<form method="POST" id="reportingForm">
				글 번호 : <input type="text" name="boNum" readonly> 
				<input type="hidden" name="deCate" readonly> <br> <br>
				신고 대상 : <input type="text" name="deReportedNick" readonly> <br>
				<br> 신고자 : <input type="text" name="deReporterNick" readonly>
				<input type="hidden" name="deReporterId" readonly> <br>
				<br> 신고 사유 : <br>
				<textarea name="deContent"></textarea>
				<br> <br>

				<div>
					<button type="button" class="regisReport">등록</button>
					<button type="button" class="cancelRes">취소</button>
				</div>
			</form>
		</div>

		<script>
			$('#restrictBtn').click(function () {
				$('#restrictForm').css('display','block');
				var targetId = $(this).parent().children('input[name=userId]').val();
				$('#restrictForm input[name=banUserId]').val(targetId.trim());
				// var now = new Date();
				// var date = now.getDate();
				// var month = now.getMonth()+1;
				// var year = now.getFullYear();
				// var com = year + " - " + month + " - " + date;
				document.getElementById("banToday").valueAsDate = new Date();
			})

			$('.cancelRes').click(function () {
				$('#restrictForm').css('display','none');
				$('#reportForm').css('display','none');
			})

			$('.regisReport').click(function () {
				var formData = $('#reportingForm').serialize();

				$.ajax({
					cache : false,
					url : "insertReport.au",
					type : 'POST', 
					data : formData, 
					success : function(data) {
							console.log(data.trim());
							console.log(data.trim()=="전송완료");
						if(data.trim() == "전송완료"){
							swal("Send Complete", "신고 완료", "success");
							$('.cancelRes').trigger('click');
						}
					}
				});
			})

			$('.regisBan').click(function () {
				var banContentBefore = $('.banContentBefore1').val();
				if(banContentBefore.length < 5){
                    swal("error", "사유 5자 이상 입력해야함", "error");
					return false;
                }

				var checkend = $('input[name=banTerm]').eq(0).val();
                var checkstart = $('#banToday').val();
				
				// console.log(checkstart);
                // console.log(checkend);
                if(checkend == ""){
                    swal("error", "해제 예정일 넣어라", "error");
                    return false;
                }

                // 날짜 비교 모듈
                var startDateArr = checkstart.split('-');
                var endDateArr = checkend.split('-');
                        
                var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
                var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
                
                // console.log(startDateArr);
                // console.log(endDateArr);
                // console.log(startDateCompare);
                // console.log(startDateCompare.getTime());
                // console.log(endDateCompare);
                // console.log(endDateCompare.getTime());

                if(startDateCompare.getTime() > endDateCompare.getTime()) {
                    swal("error", "어떻게 종료일이 시작일보다 빠르냐 멍청아", "error");
                    return false;
                }
				swal({
                    title: "Confirm",
                    text: "정말 제재하시겠습니까?",
                    icon: "warning",
                    buttons: ["NO", "YES"],
                    dangerMode: true,
                }).then((YES) => {
                    if (YES) {
						var banContentAfter = banContentBefore.replace(/(?:\r\n|\r|\n)/g, '<br />');
						$('.banContent1').val(banContentAfter);

						var formData = $('#banForm').serialize();

						$.ajax({
							cache : false,
							url : "insertBan.au",
							type : 'POST', 
							data : formData, 
							success : function(data) {
								if(data.trim() == 1){
									swal("Restrict Complete", "제재 완료", "success");
									$('.cancelRes').trigger('click');
								}
							}
						});
					}else{
                        return false;
                    }
				})
			})
		</script>


		<div id="menuHeaderWrap">
			<div id="menuHeader">
				<div class="menubar" onclick="location.href='qnalist.guide';">가이드(Q&A)</div>
				<div class="menubar" onclick="location.href='actionList.ch'">자유게시판</div>
				<div class="menubar"
					onclick="javascript:location.href='actionList.ch#cashBoardTop'">캐쉬게시판</div>
				<div class="menubar"
					onclick="javascript:location.href='pointShop.ps';">포인트샵</div>
				<c:if test="${ !empty loginUser }">
					<div class="menubar" onclick="goCharge();">충전소</div>
				</c:if>
				<c:if test="${ loginUser.userId eq 'admin'}">
					<div class="menubar adminPageBtn"
						onclick="javascript:location.href='trade.au';">관리자 페이지</div>
				</c:if>
				<div id="menuHeaderText">
					<span id="menuTextBoard"></span> <span id="menuTextReply"></span>
				</div>

				<script>
					$.ajax({
						url: 'callTodayData.me',
						type: 'post',
						success: function(data){
							$('#menuTextBoard').text('등록된 게시물 ' + data[0] + '개');
							$('#menuTextReply').text('등록된 댓글 ' + data[1] + '개');
						}
					});
				
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
					
					function goCharge() {
						var userId = "${loginUser.userId}";
						location.href="cashChange.my?userId="+userId;
					}
					
					function goPointShop(){
						location.href="pointShop.ps";
					}
					
					function autoSendMsg(type, boNum, msgCon, reId){
						$.ajax({
							url: 'autoSendMsg.ms',
							type : "POST",
							data : {type : type, boNum : boNum, msgCon : msgCon, reId : reId},
							success : function (data) {
								/* 쪽지 전송 조건
								
								type 1. 캐시게시판 글 작성으로 캐시 차감시
								text : 의뢰 요청으로 인해 캐시가 차감되었습니다. [게시글 이동]

								type 2. 경매 캐시게시판 글 매칭시
								text : 지원한 게시글이 의뢰 성사되었습니다. [게시글 이동]

								type 3. 콘테스트 게시판 마감시
								text : 등록한 콘테스트 의뢰글이 마감되었습니다. 우승자를 선택해주세요. [게시글 이동]

								type 4. 게시글 3단계로 넘어갈 때
								text : 거래가 성공적으로 진행되어 캐시가 지급되었습니다. [게시글 이동]

								type 5. 콘테 3단계로 넘어갈 때
								text : 작업한 콘테스트에서 우승하여 캐시가 지급되었습니다. [게시글 이동] */
								
								socket.emit("receiveMsg", data);
							}
						})
					}
					
					function checkTime(board) {
						var timer = setInterval(function() {
							if(new Date().getTime() >= new Date(board.cbDate).getTime()) {
								autoSendMsg(2, board.boNum, '', '');
								
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
						
						var socket = io("http://localhost:82");
						socket.on('addCount', function (board) {
							checkTime(board);
					    });
					}
					
					if('${param.sysMsg}' == "1") {
						swal({
							title: "해당 게시물은 에디터와 작성자만 확인할 수 있습니다.",
							icon: "error"
						});
					} else if('${param.sysMsg}' == "2") {
						swal({
							title: "선택 완료되었습니다.",
							icon: "success"
						});
					} else if('${param.sysMsg}' == "3") {
						swal({
							title: "작성 완료되었습니다.",
							icon: "success"
						});
					} else if('${param.sysMsg}' == "4") {
						swal({
							title: "신청 완료되었습니다.",
							icon: "success"
						});
					} else if('${param.sysMsg}' == "5") {
						swal({
							title: "거절 완료되었습니다.",
							icon: "success"
						});
					}
				</script>

				<!-- 쪽지 리스트  -->
				<script>
					$('.messageList').on('click', function(){
						window.screen.width
						window.screen.height
						
						var popupWidth = 500;
						var popupHeight = 600;
						
						var popupX = (window.screen.width / 2) - (popupWidth / 2);
						var popupY= (window.screen.height / 2) - (popupHeight / 2);
						
						window.open("messageList.ms", "_blank", 'toolbar=no, menubar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);	
					});
					
					function messageSend(){
						var rsgNick = $.trim(id);
						
						console.log("id 뭐임?", id);
						window.screen.width
						window.screen.height
						
						var popupWidth = 500;
						var popupHeight = 600;
						
						var popupX = (window.screen.width / 2) - (popupWidth / 2);
						var popupY= (window.screen.height / 2) - (popupHeight / 2);
						
						//받는 사람 id와 nick을 보낸다. 
						window.open("messageSendView.ms?rsgNick="+rsgNick, "_blank", 'toolbar=no, menubar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);	
						
					}
					
					var socket = io("http://localhost:82");
				
					function addCashAlert(cash, Content){
						$.ajax({
							url: 'addAlert.ms',
							type : "POST",
							data : {aaCash : cash, aaContent : Content},
							success : function (data) {
								if(data == 1){
									socket.emit("receiveMsg", '${ sessionScope.loginUser.nickName }');
								}
							}
						})
					}
					
					socket.on('receiveMsg', function(data) {
						console.log("data : " + data);
						if(data == '${ sessionScope.loginUser.nickName }') {
							$('#notice').attr('src', '${ contextPath }/resources/images/moveBell.gif');
							swal("쪽지 도착!", "쪽지함을 확인해주세요.", "success");
							
							var count = $('.list_count').text();
							if(count == "") {
								$('.list_count').text(1);
							} else {
								$('.list_count').text(Number(count) + 1);
							}
						}
                    });
				
					var msgData;
				
					if('${ sessionScope.loginUser }' != "") {
						$.ajax({ 
	                    	url: "messageListAlert.ms",
	                    	type: "get",
	                    	dataType : "json",
	                    	success: function(data){
	                    		msgData = data;
	                    		if(data.length > 0){
	                    			$('#notice').attr('src', '${ contextPath }/resources/images/moveBell.gif');
	                    			$('.list_count').text(data.length);
	                    		}
                    		}
	                    });
					}
				
					$('.notice').on('click', function(){
						var ul_list = $('.ul_list');
            			ul_list.empty();
						
						$.ajax({ 
	                    	url: "messageListAlert.ms",
	                    	type: "get",
	                    	dataType : "json",
	                    	success: function(data){
	                    		if(data.length > 0){
	                    			for(var i=0; i < data.length; i++){
	                    				var title_add = $.trim(data[i].msgTitle);
	                    				var date_add = data[i].msgDate.substring(12,19);
	                    				var amount = $.trim(data[i].msgCon);
	                    				var $input = $('<input type="hidden" class="msgNum" value="' + data[i].msgNum +'">');
	                    				if(data[i].rsgStatus == 'N'){
	                        				var $li = $('<li class="getMessage" style="font-weight: bold; cursor:pointer;">' + "[" + title_add + "]" +  "<div>내용 : " + amount +  date_add + "<div></li>");
	                    				} 
	                    				$li.append($input);
	                    				ul_list.append($li);
	                    				
	                    				$('#notice').attr('src', '${ contextPath }/resources/images/alarm.png');
	                    			}
	                    		}
                    		}, error: function() {
                    			ul_list.html('<p style="text-align:center;">받은 쪽지가 없습니다.</p>');
                    		}
	                    });
					})
					
					$(document).on('click', '.getMessage', function(){
						window.screen.width
						window.screen.height
						
						var popupWidth = 500;
						var popupHeight = 600;
						
						var popupX = (window.screen.width / 2) - (popupWidth / 2);
						var popupY= (window.screen.height / 2) - (popupHeight / 2);
						
						window.open('messageDetail.ms?msgNum=' + $(this).children('input').val(), "_blank", 'toolbar=no, menubar=no, height=' + popupHeight  + ', width=' + popupWidth  + ', left='+ popupX + ', top='+ popupY);
						
						var count = $('.list_count').text();
						if(count == 1) {
							$('.list_count').text("");
							$('.ul_list').html('<p style="text-align:center;">받은 쪽지가 없습니다.</p>');
						} else {
							$('.list_count').text(Number(count) - 1);
						}
						$(this).remove();
					})
				</script>
			</div>
		</div>
	</header>
	<br>
</body>
</html>