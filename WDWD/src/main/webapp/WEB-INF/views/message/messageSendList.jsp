<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<style>
		a:link { color: black; text-decoration: none;}
		a:visited { color: black; text-decoration: none;}
		a:hover{ color: black; text-decoration: none;}
		div.tableRow:hover{background-color: antiquewhite}
		div.tableTitle {
			width: 100%;
			border-top: solid 1px;
			border-bottom: solid 1px;
			height: 30px;
			clear: both;
			background-color: #EDEDED;
			font-weight: bold;
		}


		div.tableRow {
			border-bottom: solid 1px #eaeaea;
			width: 100%;
			clear: both;
			height: 30px;
		}

		div.tableCol {
			text-align: center;
			float: left;
			padding: 5px 3px 0 3px;
			overflow-x: hidden;
			overflow-y: hidden;
			height: 20px;
		}


		#bottom-side {
			width: 100%;
		}
		#sendMs{
			width:200px;
		}
		.currentP{
			border: 1px solid aquamarine;
		}
	</style>

	<meta charset="UTF-8">
	<title>쪽지</title>
</head>

<body>
	<div id="messageHeader">
		<img id="sendMs" src="${ contextPath }/resources/images/sendMs.png" alt="">
	</div>
	<form method="get">
		<div style="width:100% ; text-align:right ; padding:0 0 10px 0">
			<select name="messageCate">
				<option value="title">제목</option>
				<option value="con">내용</option>
				<option value="sender">작성자</option>
			</select>
			<input type="text" class="searchText" size="20" name="keyword" value="">
			<span id="searchButton" class="button" value="검색"><button onclick="searchBtn();">검색</button></span>
			<input type="button" value="받은쪽지 목록" id="receiveMsgButton" class="receiveMsgButton" role="button"
				aria-disabled="false">
		</div>
	</form>

	<form name="frm" method="post">
		<input type="hidden" name="action" value="receiver">
		<input type="hidden" name="type" value="many">

		<!-- 리스트 출력 -->
		<div class="tableTitle">
			<div class="tableCol checkBox" style="padding-left:0; padding-right:0; width:5%; text-align:center;"><input
					type="checkbox" onclick="lfCheckAll(this.checked);"></div>
			<div class="tableCol sender" style="padding-left:0; padding-right:0; width:20%; text-align:center;">
				발신자</div>
			<div class="tableCol subject" style="padding-left:0; padding-right:0; width:45%; text-align:center;">제목
			</div>
			<div class="tableCol sendDate" style="padding-left:0; padding-right:0; width:25%; text-align:center;">발신일
			</div>
		</div>
		<c:forEach var="ms" items="${ list }">
			<c:url var="msDetail" value="msDetail.ms">
				<c:param name="page" value="${ pi.currentPage }" />
				<c:param name="msNum" value="${ ms.msgNum }" />
			</c:url>

			<!-- 보낸 리스트 -->
			<div class=tableRow>
				<div class="tableCol checkBox" style="padding-left:0; padding-right:0; width:5%; text-align:center;">
					<input type=checkbox name="msgkeys[]" value="${ ms.msgNum }" class=letterCheckBox></div>
				<div class="tableCol sender" style="padding-left:0; padding-right:0; width:20%;"> ${ ms.rsgNick }</div>
				<div class="tableCol subject" style="padding-left:0; padding-right:0; width:45%;">&nbsp;<a
						href="messageSendDetail.ms?msgNum=${ ms.msgNum }"> ${ ms.msgTitle }</a></div>  
				<div class="tableCol sendDate" style="padding-left:0; padding-right:0; width:25%; text-align:center;">${
					ms.msgDate }</div>
			</div>
		</c:forEach>
	</form>

	<div style="width:100% ; text-align:right; display: inline-block; margin-top: 10px; margin-bottom: 10px;">

		<!-- 페이징 -->
		<div class="pagingCenter">
			<div class="pagination">
				<!-- 페이징 처리 -->
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<a class="currentP">${ p }</a>
					</c:if>

					<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="messageSendList.ms">
								<c:param name="page" value="${ p }" />
							</c:url>
							<a href="${ pagination }&searchCon=${ searchCon }&searchWord=${ searchWord }">${ p }</a>
							&nbsp;
					</c:if>
					
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="messageSendList.ms">
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
					</c:if>
				</c:forEach>
			</div>
		</div>


	</div>

	<div style="width:100% ; clear:both ; padding:10px 0 0 0 ; text-align:right">
		<input type="button" id="deleteSendButton" class="deleteSendButton" aria-disabled="false" value="선택쪽지 삭제">
	</div>

	<div id="bottom-side">
		<a href="#"></a>
	</div>

	<script>
		function lfCheckAll(bl) {
			$("input.letterCheckBox").attr("checked", bl);
		}

		/* 받은 쪽지 삭제 */
		$('#deleteButton').click(function () {
			var checkArr = new Array();

			var checkBox = $("input.letterCheckBox").is(":checked");
			console.log(checkBox);
			if (checkBox == false) {
				swal({
					title: "선택된 쪽지가 없습니다!",
					icon: "error"
				})
			}



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
					if (result) {
						$('input.letterCheckBox:checked').each(function () {
							checkArr.push($(this).val()); //체크한 쪽지 배열로 저장
							console.log(checkArr);
						});

						jQuery.ajaxSettings.traditional = true;

						//ajax실행해서 배열로 값넘긴 후에 deleteM실행한 후에 다시 돌아온다. 
						$.ajax({
							url: 'deleteMessages.ms',
							type: 'get',
							data: {
								checkArr: checkArr
							}, //쉼표로 구분
							success: function (data) {
								if (data > 0) {
									swal({
										title: "삭제되었습니다!",
										icon: "success"
									})
									location.href = 'messageList.ms';
								}

							}, error: function (e) {
								console.log("삭제 안돼");
							}

						});
					} else {
						swal({
							title: "쪽지",
							text: "쪽지 삭제를 취소했습니다.",
							icon: "error" //"info,success,warning,error" 중 택1
						});
					}
				})
			}
		});


		/* 보낸 쪽지 삭제 */
		$('#deleteSendButton').click(function () {
			var checkArr = new Array();

			var checkBox = $("input.letterCheckBox").is(":checked");
			console.log(checkBox);
			if (checkBox == false) {
				swal({
					title: "선택된 쪽지가 없습니다!",
					icon: "error"
				})
			}
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
					if (result) {
						$('input.letterCheckBox:checked').each(function () {
							checkArr.push($(this).val()); //체크한 쪽지 배열로 저장
							console.log(checkArr);
						});

						jQuery.ajaxSettings.traditional = true;

						$.ajax({
							url: 'deleteSendMessages.ms',
							type: 'get',
							data: {
								checkArr: checkArr
							}, //쉼표로 구분
							success: function (data) {
								if (data > 0) {
									swal({
										title: '삭제되었습니다!',
										icon: 'success'
									})
									location.href = 'messageSendList.ms';
								}

							}, error: function (e) {
								console.log("삭제 안돼");
							}

						});
					} else {
						swal({
							title: "쪽지",
							text: "쪽지 삭제를 취소했습니다.",
							icon: "error" //"info,success,warning,error" 중 택1
						});
					}
				})
			}
		});


		/* 보낸쪽지리스트 */
		$('.sendMsgButton').on('click', function () {
			location.href = "messageSendList.ms";
		});
		/* 받은쪽지리스트 */
		$('.receiveMsgButton').on('click', function () {
			location.href = "messageList.ms";
		});
	</script>

	<script>
		$("#bottom-side").on('load', function () {
			console.log("choiceADD", choiceAd);
			var ranNum = 1 + Math.floor(Math.random() * 6);

			ads = new Array();

			ads[1] = '<a href="#"><img src="${ contextPath }/resources/images/ad/11.png"></a>';
			// ads[2] = '<a href="#"><img src="${ contextPath }/resources/images/ad/2.png"></a>';
			// ads[3] = '<a href="#"><img src="${ contextPath }/resources/images/ad/3.png"></a>';
			// ads[4] = '<a href="#"><img src="${ contextPath }/resources/images/ad/4.png"></a>';
			// ads[5] = '<a href="#"><img src="${ contextPath }/resources/images/ad/5.png"></a>';
			// ads[6] = '<a href="#"><img src="${ contextPath }/resources/images/ad/6.png"></a>';

			var choiceAd = ads[ranNum];
			$('#bottom-side').append(choiceAd);
			$('#bottom-side img').css({ 'width': '80%', 'height': '100%' });

		});
	</script>

	<!-- 검색 -->
	<script>
		var result = ${ list };
		console.log("result", result);
		function searchBtn(){
			var emptyCheck = {
				isNotEmpty: function (_str) {
					obj = String(_str);
					if (obj == null || obj == '' || obj == 'null' || obj == 'undefined' || obj == undefined)
						return false;
					else return true;
				},
				isEmpty: function (_str) {
					return !emptyCheck.isNotEmpty(_str);
				}
			}
			if (emptyCheck.isEmpty(result)) {
				alert("검색 결과가 없습니다.");
				$('.searchText').val("");
				window.history.back();
			}
		}
	</script>
</body>

</html>