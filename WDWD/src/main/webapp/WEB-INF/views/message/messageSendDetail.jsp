<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	
	<meta charset="UTF-8">
	<title>쪽지 상세보기</title>
	<style>
		textarea:focus {
			outline: none;
		}
		body{
			margin-left: 5px !important;
			margin-right: 5px !important;
		    background-color: rgba(161, 206, 244, 0.55) !important;
		}	

		.messageTable {
			width: 100%;
			border-top: solid 1px;
			border-bottom: solid 1px;
			height: 30px;
			clear: both;
			background-color: rgb(52, 152, 219);
			font-weight: bold;
			text-align: center;
			padding-top: 5px;
			color: white;
		}

		.messageDetailBoard {
			border: solid 1px;
			height: 360px;
			margin-top: 10px;
			margin-bottom: 10px;
			padding: 10px;
		}
		
		#sendMs{
			width:200px;
		}
		
		#messageHeader{
			padding : 20px;
			margin-bottom : 20px;
		}
		
		.receiveMsgButton{
			background-color: rgb(52, 152, 219);
		    border-radius: 5px;
		    color:white;
			font-weight: bold;
		}
		
		.sendMsgButton{
			background-color: rgb(52, 152, 219);
		    border-radius: 5px;
		    color:white;
			font-weight: bold;
		}
		
		.deleteButton{
			background-color: #f8585b;
		    border-radius: 5px;
		    color:white;
			font-weight: bold;
		}
		
		#reportButton{
			background-color: #f8585b;
		    border-radius: 5px;
		    color:white;
			font-weight: bold;
		}
	</style>
	<!-- include libraries(jQuery, bootstrap) -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
</head>

<body>
	<div id="messageHeader">
		<img id="sendMs" src="${ contextPath }/resources/images/sendMs.png" alt="">
	</div>

	<form method="get">
		<div style="width:100% ; text-align:right ; padding:0 0 10px 0">
			<input type="button" value="받은쪽지 목록" id="receiveMsgButton" class="receiveMsgButton" role="button"
				aria-disabled="false">
			<input type="button" value="보낸쪽지 목록" id="sendMsgButton" class="sendMsgButton" role="button"
				aria-disabled="false">
		</div>
	</form>

	<c:forEach var="ms" items="${ ms }">
		<!-- 쪽지 상세보기 -->
		<input type="hidden" name="msgNum" value="${ ms.msgNum }">
		<div class="messageTable">
			${ms.msgTitle}
		</div>
		<div class="messageDetailBoard">
			<textarea id="summernote" name="msContent" style="border: 0px; height: 370px; width: 99%; resize: none;"
				readonly>

				발신자 : ${ ms.ssgNick } <br>
				수신자 : ${ ms.rsgNick } <br>
				발신일 : ${ ms.msgDate } <br>
				내용 :  <br><br> ${ ms.msgCon }
            </textarea>
		</div>
	</c:forEach>

	<div>
		<div style="width:30%; display: inline-table;">
			<span style="width:100% ; clear:both ; padding:10px 0 0 0 ; text-align:left;">
				<button id="reportButton" role="button" aria-disabled="false"><span
						class="ui-button-text">신고</span></button>
			</span>
		</div>

		<div style="width:65%; clear:both ; padding:10px 0 0 0 ; text-align:right; display: inline-table;">
			<button id="deleteButton" class="deleteButton" role="button" aria-disabled="false"><span
					class="ui-button-text">선택쪽지 삭제</span></button>
		</div>
	</div>

	<script>
		/* 받은 쪽지 목록 */
		var checkBox = true;
		var msgNum = $('input[name=msgNum]').val();
		$('.receiveMsgButton').click(function () {
			location.href = 'messageList.ms';
		});

		/* 보낸 쪽지 목록 */
		$('.sendMsgButton').click(function () {
			location.href = 'messageSendList.ms';
		});

		/* 받은 쪽지 삭제 */
		$('#deleteButton').click(function () {
			if (checkBox) {
				swal({
					title: "선택한 쪽지를 삭제 하시겠습니까?",
					text: "삭제한 쪽지는 복구할 수 없습니다.",
					icon: "info",
					buttons: {
						cancle: {
							text: '취소',
							value: false
						},
						confirm: {
							text: '삭제',
							value: true
						}
					}
				}).then((result) => {
					jQuery.ajaxSettings.traditional = true;

					//ajax실행해서 배열로 값넘긴 후에 deleteM실행한 후에 다시 돌아온다. 
					$.ajax({
						url: 'deleteMessages.ms',
						type: 'get',
						data: {
							checkArr: msgNum
						}, //쉼표로 구분
						success: function (data) {
							if (data > 0) {
								swal({
									title: "삭제되었습니다!",
									icon: "success"
								})
								location.href = 'messageSendList.ms';
							}

						}, error: function (e) {
							console.log("삭제 안돼");
						}

					});

				})
			}
		});

		/* 보낸 쪽지 삭제 */
		/* 받은 쪽지 삭제 */
		var checkBox = true;
		var msgNum = $('input[name=msgNum]').val();
		$('#deleteSendButton').click(function () {
			if (checkBox) {
				swal({
					title: "선택한 쪽지를 삭제 하시겠습니까?",
					text: "삭제한 쪽지는 복구할 수 없습니다.",
					icon: "info",
					buttons: {
						cancle: {
							text: '취소',
							value: false
						},
						confirm: {
							text: '삭제',
							value: true
						}
					}
				}).then((result) => {
					jQuery.ajaxSettings.traditional = true;

					//ajax실행해서 배열로 값넘긴 후에 deleteM실행한 후에 다시 돌아온다. 
					$.ajax({
						url: 'deleteSendMessages.ms',
						type: 'get',
						data: {
							checkArr: msgNum
						}, //쉼표로 구분
						success: function (data) {
							if (data > 0) {
								swal({
									title: "삭제되었습니다!",
									icon: "success"
								})
								location.href = 'messageSendList.ms';
							}

						}, error: function (e) {
							console.log("삭제 실패했습니다.");
						}

					});

				})
			}
		});



		/* 썸머노트 */
		$('#summernote').summernote({
			airMode: true
		});
	</script>





</body>

</html>