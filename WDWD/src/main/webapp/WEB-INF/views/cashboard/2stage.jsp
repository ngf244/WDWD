<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${ contextPath }/resources/naver_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
	#editorDetail {
		background-color: rgba(255, 245, 230, 0.8); 
	}
	#registWrap {
		margin-top: 50px;
		width: auto;
		min-height: 100px;
		height: auto;
	}
	#buyerInfo {
		width: 80%;
		margin: 0 auto;
		margin-bottom: 30px;
		border-style: double;
	}
	.buyerInfoOption {
		display: inline-table;
		text-align: center;
		border-radius: 15px;
		background-color: rgba(161, 206, 244, 0.55);
		cursor: pointer;
		font-weight: bold;
		font-size: 11pt;
		margin-left: 30px;
		padding-left: 10px;
		padding-right: 10px;
	}
	#notRegist {
		width: 60%;
		margin: 0 auto;
		text-align: center;
		font-size: 14pt;
	}
	#contentWrap {
		width: 80%;
		margin: 0 auto;
	}
	#content {
		width: 98%;
		height: 300px;
	}
	.fileArea {
		position: relative;
		display: inline-table;
		width: 150px;
		margin: 5px;
		font-size: 11pt;
		line-height: 25px;
		color: white;
		background: rgba(44, 62, 80, 0.5);
		text-align: center;
		font-weight: bold;
		margin-bottom: 15px;
		border-radius: 5px;
	}
	.fileArea p {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 140px;
		height: 25px;
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
	}
	.fileAreaImg {
		width: 140px;
		height: 140px;
		margin: 3px;
	}
	#fileAdd {
		display: inline-table;
		padding: 8px;
		background-color: rgb(44, 62, 80);
		cursor: pointer;
		height: 30px;
		font-size: 12pt;
		color: white;
		line-height: 30px;
	}
	#fileAdd img {
		position: absolute;
		width: 30px;
		height: 30px;
	}
	#fileAdd span {
		margin-left: 40px;
	}
	#registChat {
		position: absolute;
		right: 50px;
		width: 300px;
		background-color: white;
		box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
	}
	#chatTitle {
		height: 40px;
		background-color: rgba(161, 206, 244, 0.55);
		line-height: 40px;
		border: 1px solid black;
		font-weight: bold;
		text-align: center;
	}
	#chatMain {
		height: 400px;
		overflow: auto;
		text-align: center;
	}
	.chatDate {
		font-size: 10pt;
	}
	.leftChat {
		float: left;
		max-width: 70%;
		background-color: rgb(224, 224, 224);
		text-align: left;
		padding: 10px;
		margin: 10px 10px 0px 10px;
		border-radius: 20px;
		font-size: 11pt;
		word-break: break-all;
	}
	.leftChatTime {
		float: left;
		text-align: left;
		margin-left: 5%;
		font-size: 10pt;
		margin-bottom: 5px;
	}
	.rightChat {
		float: right;
		max-width: 70%;
		background-color: rgba(243, 156, 18, 0.32);
		text-align: right;
		padding: 10px;
		margin: 10px 10px 0px 10px;
		border-radius: 20px;
		font-size: 11pt;
		word-break: break-all;
	}
	.rightChatTime {
		float: right;
		text-align: right;
		margin-right: 5%;
		font-size: 10pt;
		margin-bottom: 5px;
	}
	#chatCheck {
		height: 20px;
		line-height: 20px;
		font-size: 13px;
		text-align: center;
	}
	#chatBottom {
		border: 1px solid black;
	}
	#chatBottom textarea {
		width: 240px;
		min-height: 50px;
		resize: none;
		font-size: 11pt;
		border: none;
		/* overflow-y:hidden */
	}
	#chatBottom div {
		display: inline-table;
		width: 45px;
		height: 30px;
		line-height: 30px;
		float: right;
		margin-top: 10px;
		margin-right: 1px;
		text-align: center;
		border-radius: 4px;
		background-color: rgb(255, 241, 118);
		cursor: pointer;
		font-size: 10pt;
	}
	#disputeArea {
		position: absolute;
		left: 50px;
		width: 300px;
		background-color: white;
		display: none;
		background-color: #EEEEEE;
		padding: 20px;
		box-shadow: 2px 2px 2px;
		font-size: 12pt;
	}
	#disputeTitle {
		text-align: center;
		font-size: 13pt;
		font-weight: bold;
	}
	#disputeArea img {
		width: 25px;
		height: 25px;
		position: absolute;
		right: 20px;
		top: 20px;
		cursor: pointer;
	}
	
	#btnList {
		text-align: center;
		margin-top: 30px;
	}
	.button {
		display: inline-table;
		width: 150px;
		height: 50px;
		margin: 10px;
		line-height: 50px;
		font-size: 14pt;
		text-align: center;
		background-color: rgba(161, 206, 244, 0.55);
		border-radius: 5px;
		cursor: pointer;
		font-weight: bold;
	}
	.red-button {
		display: inline-table;
		width: 150px;
		height: 50px;
		margin: 10px;
		line-height: 50px;
		font-size: 14pt;
		text-align: center;
		background-color: #FFCCBC;
		border-radius: 5px;
		cursor: pointer;
		font-weight: bold;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side"></div>

		<div id="main">
			<div id="mainWrap">
				<jsp:include page="cBoardDetail.jsp"/>
				
				<div id="editorDetail">
					<div id="logoImg">
						<img src='${ contextPath }/resources/images/writeIcon.jpg'>1
					</div>
					<div id="mainTitle">
						참여 에디터 : <span class="smallOption">${ cBoard.reId }</span>
					</div>
					
					<div id="registWrap">
						<div id="buyerInfo">
							<div class="leftLine">
								의뢰인 정보
							</div>
							<div class="rightLine">
								<span class="smallOption">${ cBoard.boWriter }</span>
								<div class="buyerInfoOption">마이페이지</div>
								<div class="buyerInfoOption">작성 글 보기</div>
								<div class="buyerInfoOption">작성 댓글 보기</div>
							</div>
						</div>
						
						<div id="registViewWrap">
							<c:if test="${ cBoard.reId ne sessionScope.loginUser.nickName }">
								<c:if test="${ empty reqB }">
									<div id="notRegist">
										<img src='${ contextPath }/resources/images/drawing.jpg' style="width: 100%;"><br><br>
										에디터가 작업중입니다.
									</div>
								</c:if>
								
								<c:if test="${ !empty reqB }">
									<div id="boardcontent">
										${ reqB.boContent }
									</div>
									
									<div class="leftLine">
										<span class="redColor">＞ </span>첨부파일
									</div>
									<div class="rightLine">
										<c:if test="${ empty reqFileList}">
											첨부된 파일이 없습니다.
										</c:if>
										
										<c:if test="${ !empty reqFileList }">
											<c:forEach var="file" items="${ reqFileList }">
												<span class="downloadName">${ file.conOri }</span> <a class="downloadBtn" href="${ file.conUrl }/${ file.conCop }" download="${ file.conOri }">download</a><br>
											</c:forEach>
										</c:if>
									</div>
								</c:if>
							</c:if>
							
							<c:if test="${ cBoard.reId eq sessionScope.loginUser.nickName }">
								<c:if test="${ empty reqB }">
									<form action="registWrite.ch" method="post" id="registWriteForm">
										<div id="contentWrap">
											<input type="hidden" value="${ cBoard.boNum }" name="boardNum">
											<input type="hidden" value=0 name="updateCheck">
											<textarea name="boContent" id="content"></textarea>
											<div id="fileList"></div>
										</div>
									</form>
								</c:if>
								
								<script>
									var editor_object = [];
									
									function editorLoad() {
										nhn.husky.EZCreator.createInIFrame({
											oAppRef: editor_object,
											elPlaceHolder: "content",
											sSkinURI: "${ contextPath }/resources/naver_editor/SmartEditor2Skin.html",
											htParams : {
												bUseToolbar : true,
												bUseVerticalResizer : true,
												bUseModeChanger : true,
											}
										});
									}
									editorLoad();
									
									var contentValue = "";
									var imgCount = 0;
									var imgTempCount = 0;
									var imgIndexStart = 0;
									var imgIndexEnd = 0;
									var imgSrc = new Array;
									var imgName = new Array;
									
									!function imgCheck(){
										setTimeout(function() {
											editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
											
											contentValue = $('#content').val();
											imgTempCount = (contentValue.match(/<img src=/g) || []).length;
											
											if(imgTempCount != imgCount) {
												$('#fileList').empty();
												imgCount = imgTempCount;
												imgSrc = new Array;
												imgName = new Array;
												
												for(var i = 0; i < imgCount; i++) {
													imgIndexStart = contentValue.indexOf('<img src=', imgIndexEnd) + 10;
													imgIndexEnd = contentValue.indexOf('"', imgIndexStart);
													
													imgSrc.push(contentValue.substring(imgIndexStart, imgIndexEnd));
													
													imgIndexStart = contentValue.indexOf('title=', imgIndexEnd) + 7;
													imgIndexEnd = contentValue.indexOf('"', imgIndexStart);
													
													imgName.push(contentValue.substring(imgIndexStart, imgIndexEnd));
													
													changeFile(imgSrc[i], imgName[i]);
												}
												
												imgIndexStart = 0;
												imgIndexEnd = 0;
											}
											
											imgCheck();
										}, 500)
									}()
									
									function changeFile(fileUrl, fileName) {
										var $div = $('<div class="fileArea">');
										var $img = $('<img class="fileAreaImg" name="imgFile">');
										var $input1 = $('<input type="hidden" name="conUrl" value=' + fileUrl.substring(0, fileUrl.lastIndexOf('/')) + '>');
										var $input2 = $('<input type="hidden" name="conCop" value=' + fileUrl.substring(fileUrl.lastIndexOf('/') + 1) + '>');
										var $input3 = $('<input type="hidden" name="conOri" value=' + fileName + '>');
										var $p = $('<p>')
										
										$p.text(fileName);
										
										$img.attr("src", fileUrl);
										
										$div.append($img);
										$div.append($input1);
										$div.append($input2);
										$div.append($input3);
										$div.append($p);
										
										$('#fileList').append($div);
									}
								</script>
								
								<c:if test="${ !empty reqB }">
									<div id="boardcontent">
										${ reqB.boContent }
									</div>
									
									<div class="leftLine">
										<span class="redColor">＞ </span>첨부파일
									</div>
									<div class="rightLine">
										<c:if test="${ empty reqFileList }">
											첨부된 파일이 없습니다.
										</c:if>
										
										<c:if test="${ !empty reqFileList }">
											<c:forEach var="file" items="${ reqFileList }">
												<span class="downloadName">${ file.conOri }</span> <a class="downloadBtn" href="${ file.conUrl }/${ file.conCop }" download="${ file.conOri }">download</a><br>
											</c:forEach>
										</c:if>
									</div>
								</c:if>
							</c:if>
						</div>
						
						<script>
							$('.buyerInfoOption').click(function(){
								var whatIndex = $(this).index();
								var nickName = $(this).parent().find('span').text();
								
								$.ajax({
									url: 'callmeId.ch',
									data: {nickName: nickName},
									type: 'post',
									success: function(data){
										console.log(whatIndex)
										if(whatIndex == '1') {
											location.href = "main.my?userId=" + data
										} else if(whatIndex == '2') {
											location.href = "actionList.ch?searchWord=" + nickName
										} else if(whatIndex == '3') {
											location.href = "myReplyList.my?userId=" + data
										}
									}
								});
							});
						
							$('#registViewWrap .downloadBtn').click(function(e){
								if("${cBoard.boWriter}" == "${sessionScope.loginUser.nickName}") {
									e.preventDefault();
									swal({
										title: "원본 파일은 게시글을 채택한 후에 다운로드할 수 있습니다.",
										icon: "error"
									});
								}
							})
							
							function showWaterMark() {
								for(var i = 0; i < $('#boardcontent img').length; i++) {
									var $watermark = $('<img>');
									$watermark.attr('class', 'watermark_free');
									$watermark.attr('src', '${ contextPath }/resources/images/watermark_free.png');
									
									$('header').append($watermark);
									setWaterMark($('#boardcontent img').eq(i), $watermark);
								}	
							}
							showWaterMark();
						
							function loadChat(chatCon, chatDate, position) {
								var date = new Date(chatDate);
	                        	
								var $div0 = $('<div class="chatDate">');
								$div0.text(date.getFullYear() + "년 " + (date.getMonth() + 1) + "월 " + date.getDate() + "일");
								
								if($('.chatDate').last().text() != $div0.text()) {
									$('#chatMain').append($div0);
								}
								
	                        	var $div1 = $('<div class="' + position + 'Chat">');
	                        	var $div2 = $('<div class="sectionafter">');
	                        	var $div3 = $('<div class="' + position + 'ChatTime">');
								var $div4 = $('<div class="sectionafter">');
								$div1.text(chatCon);
								$div3.text((date.getHours() >= 10 ? date.getHours() : ("0" + date.getHours()))
										+ ":" 
										+ (date.getMinutes() >= 10 ? date.getMinutes() : ("0" + date.getMinutes())));
								
								var prevTime = $('#chatMain').children().last().prev();
								if(prevTime.attr('class') == $div3.attr('class') && prevTime.text() == $div3.text()) {
									prevTime.remove();
								}
								
								$('#chatMain').append($div1);
								$('#chatMain').append($div2);
								$('#chatMain').append($div3);
								$('#chatMain').append($div4);
							}
						</script>
						
						<div id="registChat">
							<div id="chatTitle">1:1 채팅방</div>
							<div id="chatMain">
								<c:if test="${ empty chatList }">
									<div id="chatStart" style="margin-top: 100px;">채팅을 시작해보세요!</div>
								</c:if>
							</div>
							
							<c:if test="${ !empty chatList }">
								<c:forEach var="chat" items="${ chatList }">
									<c:if test="${ chat.chatWriter eq loginUser.nickName }">
										<script>
											loadChat('${ chat.chatCon }', '${chat.chatDate}', 'right');
										</script>
									</c:if>
									
									<c:if test="${ chat.chatWriter ne loginUser.nickName }">
										<script>
											loadChat('${ chat.chatCon }', '${chat.chatDate}', 'left');
										</script>
									</c:if>
								</c:forEach>
							</c:if>
							
							<div id="chatCheck"></div>
							
							<div id="chatBottom">
								<textarea id="inputText"></textarea>
								<div id="sendText">전송</div>
							</div>
						</div>
						
				        <script>
					        $("#inputText").scroll(function(){
						    	$("#inputText").height($("#inputText").height() + 13 + 'px')
						    });
				        
				        	if("${cBoard.boWriter}" != "${sessionScope.loginUser.nickName}" && "${cBoard.reId}" != "${sessionScope.loginUser.nickName}" && "${sessionScope.loginUser.nickName}" == '운영자') {
				        		$('#registChat').hide();
				        	}
				        
				        	$('#chatMain').scrollTop($('#chatMain')[0].scrollHeight);
				        	
			            	$(document).ready(function(){
			                    var socket = io("http://localhost:82");
			                    
			                    //msg에서 키를 누를떄
			                    $("#inputText").keyup(function(key){
			                        //해당하는 키가 엔터키(13) 일떄
			                        if(key.keyCode == 13){
			                            //msg_process를 클릭해준다.
			                            if($("#inputText").val() == '\n') {
			                            	$("#inputText").val('');
			                            } else {
			                            	$('#inputText').val($('#inputText').val().substr(0, $('#inputText').val().length - 1));
			                            	$('#sendText').click();	
			                            }
			                        }
			                    });
			                    
			                    //msg_process를 클릭할 때
			                    $("#sendText").click(function(){
			                        //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
			                        var chatArr = [$("#inputText").val(), '${ loginUser.userId }', "${ cBoard.boNum }"];
			                        
			                        /* ajax로 채팅db에 등록할 것 */
			                        $.ajax({
										url: 'sendChat.ch',
										data: {chatCon: chatArr[0], chatWriter: chatArr[1], chatRefNum: chatArr[2]},
										type: 'post',
										success: function(data){
											socket.emit("chatArr", data);
										}
									});
			                        
			                        //#msg에 벨류값을 비워준다.
			                        $("#inputText").val('');
			                        $("#inputText").height(50 + 'px');
			                    });
			                    
			                    //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
			                    socket.on('chatArr', function(chatArr) {
			                    	if(chatArr.chatNum == "${ cBoard.boNum }") {
			                    		$('#chatStart').hide();
				                        if(chatArr.chatWriter == '${ loginUser.nickName }') {
				                        	loadChat(chatArr.chatCon, chatArr.chatDate, 'right');
				                        } else {
				                        	loadChat(chatArr.chatCon, chatArr.chatDate, 'left');
				                        }
				                        
				                        $('#chatMain').scrollTop($('#chatMain')[0].scrollHeight);
			                    	}
			                    });
			                    
			                    // 입력중일 때
			                    var oldTextCheck = 0;
					        	var newTextCheck = 0;
					        
						        !function textCheck(){
									setTimeout(function() {
										if($("#inputText").is(":focus")) {
											oldTextCheck = newTextCheck;
											
											if($('#inputText').val() == "") {
												newTextCheck = 0;
											} else {
												newTextCheck = 1;
											}
											
											if(oldTextCheck != newTextCheck) {
												var data = {chatCon: newTextCheck, chatWriter: '${ loginUser.nickName }', chatRefNum: "${ cBoard.boNum }"}
												socket.emit("chatCheck", data);
											}
										}
										
										textCheck();
									}, 500)
								}()
			                    
			                    // 입력중입니다 받을 때
								socket.on('chatCheck', function(data) {
									if('${ loginUser.nickName }' != data.chatWriter) {
										if(data.chatCon == 0) {
											$('#chatCheck').text("");
										} else {
											$('#chatCheck').text(data.chatWriter + "님이 입력중입니다.");
										}
									}
			                    });
			                });
				        </script>
	
						<script> 
							var topWidth = window.innerHeight - 606;
							
							function scroll_follow(id){
					  			$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
					      			var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환
					      			
					      			$(id).stop().animate({top:topWidth+position+"px"}, 300); //해당 오브젝트 위치값 재설정
					   			});
							}
					 		scroll_follow("#registChat");
						</script> 
						
					</div> <br>
					
					<div id="disputeArea">
						<div id="disputeTitle">거래 중재</div>
						<img src="${ contextPath }/resources/images/x-button.png">
						
						<c:forEach var="dp" items="${ dpList }">
							<div style="height:20px;"></div>
							
							<c:choose>
								<c:when test="${ dp.diStatus eq 1 }">에디터의 취소요청 : </c:when>
								<c:when test="${ dp.diStatus eq 2 }">의뢰인의 취소요청 : </c:when>
								<c:when test="${ dp.diStatus eq 3 }">에디터의 문의 : </c:when>
								<c:when test="${ dp.diStatus eq 4 }">의뢰인의 문의 : </c:when>
							</c:choose>
							
							${ dp.diContent }
						</c:forEach>
					</div>
					
					<script>
						if("${dpList}" == "[]") {
							$('#disputeArea').remove();
						}
					
						if("${sessionScope.loginUser.nickName}" == '운영자') {
			        		$('#disputeArea').show();
			        		scroll_follow("#disputeArea");
			        	}
						
						$('#disputeArea img').click(function(){
							$('#disputeArea').remove();
						})
					</script>
					
					<div id="btnList">
						<c:set var="btnCheck1" value="0" />
						<c:set var="btnCheck2" value="0" />
					
						<c:forEach var="dp" items="${ dpList }">
							<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName and dp.diStatus eq 4 }">
								<div class="red-button" onclick="cancleDispute(4);">문의취소</div>
								<c:set var="btnCheck1" value="1" />
							</c:if>
							
							<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName and dp.diStatus eq 2 }">
								<div class="red-button" onclick="cancleDispute(2);">취소요청</div>
								<c:set var="btnCheck2" value="1" />
							</c:if>
							
							<c:if test="${ cBoard.reId eq sessionScope.loginUser.nickName and dp.diStatus eq 3 }">
								<div class="red-button" onclick="cancleDispute(3);">문의취소</div>
								<c:set var="btnCheck1" value="1" />
							</c:if>
							
							<c:if test="${ cBoard.reId eq sessionScope.loginUser.nickName and dp.diStatus eq 1 }">
								<div class="red-button" onclick="cancleDispute(1);">취소요청</div>
								<c:set var="btnCheck2" value="1" />
							</c:if>
						</c:forEach>
						
						<c:if test="${ btnCheck1 eq 0 }">
							<div class="red-button" onclick="goDispute(0);">문의하기</div>
						</c:if>
						
						<c:if test="${ btnCheck2 eq 0 }">
							<div class="red-button" onclick="goDispute(1);">취소요청</div>
						</c:if>
						
						<div id="submit" class="button">수락하기</div>
						<div id="cancle" class="button" onclick="location.href='actionList.ch'">목록으로</div>
					</div>
					
					<c:if test="${ cBoard.reId ne sessionScope.loginUser.nickName }">
						<c:if test="${ empty reqB }">
							<script>
								$('#submit').hide();
							</script>
						</c:if>
					</c:if>
					
					<c:if test="${ cBoard.reId eq sessionScope.loginUser.nickName }">
						<c:if test="${ empty reqB }">
							<script>
								$('#submit').text('작성하기');
								$('#submit').attr('onclick', 'registWrite();')
								$('#submit').attr('id', 'registWrite');
							</script>
						</c:if>
						
						<c:if test="${ !empty reqB }">
							<script>
								$('#submit').text('수정하기');
								$('#submit').attr('onclick', 'registUpdate();');
								$('#submit').attr('id', 'registUpdate');
							</script>
						</c:if>
					</c:if>
					
					<script>
						$('.button').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						});
						
						$('.red-button').hover(function(){
							$(this).css({'background-color':'#FF8A65', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'#FFCCBC', 'color':'black'})
						});
						
						function goDispute(buttonFloat) {
							var diStatus = 0;
							
							if("${cBoard.boWriter}" == "${sessionScope.loginUser.nickName}") {
								if(buttonFloat == 0) {
									diStatus = 4;
								} else {
									diStatus = 2;
								}
							} else {
								if(buttonFloat == 0) {
									diStatus = 3;
								} else {
									diStatus = 1;
								}
							}
							
							swal({
								title: "사유를 입력해주세요.",
								icon: "info",
								content: {
									element: "input",
									attributes: {type: "text"},
								}
							}).then((input) => {
								swal({
									title: "처리되었습니다.",
									icon: "success",
								}).then(() => {
									location.href='goDispute.ch?diRef=${cBoard.boNum}&diStatus=' + diStatus + '&diContent=' + input;
								})
							});
						}
						
						function cancleDispute(diStatus) {
							swal({
								title: "진행중인 문의를 취소하시겠습니까?",
								icon: "info",
								buttons : {
									cancle : {
										text : '취소',
										value : false,
									},
									confirm : {
										text : '확인',
										value : true
									}
								}
							}).then((result) => {
								if(result) {
									location.href="cancleDispute.ch?diRef=${ cBoard.boNum }&diStatus=" + diStatus
								}
							});
						}
						
						$('#submit').click(function(){
							swal({
								title: "해당 작업물을 채택하시겠습니까?",
								icon: "info",
								buttons : {
									cancle : {
										text : '취소',
										value : false,
									},
									confirm : {
										text : '작성하기',
										value : true
									}
								}
							}).then((result) => {
								if(result) {
									location.href="go3stage.ch?boNum=${ cBoard.boNum }"
								}
							});
						});
						
 						function registWrite(){
 							editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
					
 							swal({
								title: "글을 등록하시겠습니까?",
								icon: "info",
								buttons : {
									cancle : {
										text : '취소',
										value : false,
									},
									confirm : {
										text : '작성하기',
										value : true
									}
								}
							}).then((result) => {
								if(result) {
									$('#registWriteForm').submit();	
								}
							});
 						}
						
						function registUpdate(){
							$('#registViewWrap').empty();
							$('.watermark_free').remove();
							
							var $form = $('<form action="registWrite.ch" method="post" id="registWriteForm">');
							var $div = $('<div id="contentWrap">');
							var $input1 = $('<input type="hidden" value="${ reqB.boNum }" name="boNum">');
							var $input2 = $('<input type="hidden" value="${ cBoard.boNum }" name="boardNum">');
							var $input3 = $('<input type="hidden" value=1 name="updateCheck">');
							var $textarea = $('<textarea name="boContent" id="content">');
							var $div2 = $('<div id="fileList">');
							
							$div.append($input1);
							$div.append($input2);
							$div.append($input3);
							$div.append($textarea);
							$div.append($div2);
							$form.append($div);
							$('#registViewWrap').append($form);
							
							editorLoad();
							
							setTimeout(function() {
								editor_object.getById["content"].exec("SET_IR", [""]); //내용초기화

								var reqContent = '${ reqB.boContent }'.replace(/\"/gi, "'");
								editor_object.getById["content"].exec("PASTE_HTML", [reqContent]);
								
								!function imgCheck(){
									setTimeout(function() {
										editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
										
										contentValue = $('#content').val();
										imgTempCount = (contentValue.match(/<img src=/g) || []).length;
										
										if(imgTempCount != imgCount) {
											$('#fileList').empty();
											imgCount = imgTempCount;
											imgSrc = new Array;
											imgName = new Array;
											
											for(var i = 0; i < imgCount; i++) {
												imgIndexStart = contentValue.indexOf('<img src=', imgIndexEnd) + 10;
												imgIndexEnd = contentValue.indexOf('"', imgIndexStart);
												
												imgSrc.push(contentValue.substring(imgIndexStart, imgIndexEnd));
												
												imgIndexStart = contentValue.indexOf('title=', imgIndexEnd) + 7;
												imgIndexEnd = contentValue.indexOf('"', imgIndexStart);
												
												imgName.push(contentValue.substring(imgIndexStart, imgIndexEnd));
												
												changeFile(imgSrc[i], imgName[i]);
											}
											
											imgIndexStart = 0;
											imgIndexEnd = 0;
										}
										
										imgCheck();
									}, 500)
								}()
							}, 500);
							
							$('#registUpdate').attr('id', 'registWrite').attr('onclick', 'registWrite();');
						}
					</script>
				</div>
			</div>
		</div>
		
		<!-- 공용영역 -->
		<div id="right-side"></div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>
