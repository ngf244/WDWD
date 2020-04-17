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
		
		border: 1px solid black;
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
		bottom: 100px;
		right: 50px;
		width: 300px;
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
		
		border: 1px solid black;
	}
	.leftChat {
		float: left;
		width: 70%;
		background-color: rgb(224, 224, 224);
		padding: 10px;
		margin: 10px;
		border-radius: 20px;
		font-size: 11pt;
		word-break: break-all;
	}
	.rightChat {
		float: right;
		width: 70%;
		background-color: rgba(243, 156, 18, 0.32);
		text-align: right;
		padding: 10px;
		margin: 10px;
		border-radius: 20px;
		font-size: 11pt;
		word-break: break-all;
	}
	#chatBottom {
		border: 1px solid black;
	}
	#chatBottom textarea {
		width: 240px;
		min-height: 50px;
		resize: none;
		font-size: 11pt;
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
		border: 1px solid black;
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
						참여 에디터 : <span>user01</span>
					</div>
					
					
					<div id="registWrap">
						<div id="buyerInfo">
							<div class="leftLine">
								의뢰인 정보
							</div>
							<div class="rightLine">
								정문종 하나 284-891239-76707 <br>
								010-5217-5324
							</div>
						</div>
						
						<div id="registViewWrap">
							<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
								<c:if test="${ empty reqB }">
									에디터가 작업중입니다.
								</c:if>
								
								<c:if test="${ !empty reqB }">
									<div id="boardcontent">
										${ reqB.boContent }
									</div>
									
									<div class="leftLine">
										<span class="redColor">＞ </span>첨부파일
									</div>
									<div class="rightLine">
										<c:if test="${ empty fileList }">
											첨부된 파일이 없습니다.
										</c:if>
										
										<c:if test="${ !empty fileList }">
											<c:forEach var="file" items="${ fileList }">
												<span class="downloadName">${ file.conOri }</span> <div class="downloadBtn">download</div><br>
											</c:forEach>
										</c:if>
									</div>
								</c:if>
							</c:if>
							
							<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
								<c:if test="${ empty reqB }">
									<form action="registWrite.ch" method="post" id="registWriteForm">
										<div id="contentWrap">
											<input type="hidden" value="${ cBoard.boNum }" name="boNum">
											<textarea name="boContent" id="content"></textarea>
											<div id="fileList"></div>
										</div>
									</form>
									
									<script>
										var editor_object = [];
										
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
								</c:if>
								
								<c:if test="${ !empty reqB }">
									<div id="boardcontent">
										${ reqB.boContent }
									</div>
									
									<div class="leftLine">
										<span class="redColor">＞ </span>첨부파일
									</div>
									<div class="rightLine">
										<c:if test="${ empty fileList }">
											첨부된 파일이 없습니다.
										</c:if>
										
										<c:if test="${ !empty fileList }">
											<c:forEach var="file" items="${ fileList }">
												<span class="downloadName">${ file.conOri }</span> <div class="downloadBtn">download</div><br>
											</c:forEach>
										</c:if>
									</div>
								</c:if>
							</c:if>
						</div>
						
						<div id="registChat">
							<div id="chatTitle">1:1 채팅방</div>
							<div id="chatMain">
								<div class="leftChat">받은 채팅222222222222222222222222222222222222222222222222222222</div>
								<div class="rightChat">보낸 채팅</div>
								<div class="rightChat">보낸 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
								<div class="leftChat">받은 채팅</div>
							</div>
							<div id="chatBottom">
								<textarea id="inputText">123</textarea>
								<div id="sendText">전송</div>
							</div>
						</div>
						
						<script>
						    $("#inputText").scroll(function(){
						    	$("#inputText").height($("#inputText").height() + 13 + 'px')
						    });
						</script>
						
						<script src="http://localhost:82/socket.io/socket.io.js"></script>
				        <script>
				            $(document).ready(function(){
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
				                            	$('#sendText').click();	
				                            }
				                        }
				                    });
				                    
				                    //msg_process를 클릭할 때
				                    $("#sendText").click(function(){
				                        //소켓에 send_msg라는 이벤트로 input에 #msg의 벨류를 담고 보내준다.
				                        var arr = [$("#inputText").val(), 'a'];
				                        
				                        /* ajax로 채팅db에 등록할 것 */
				                        
				                        socket.emit("send_msg", arr);
				                        //#msg에 벨류값을 비워준다.
				                        $("#inputText").val('');
				                        $("#inputText").height(50 + 'px');
				                    });
				                    
				                    //소켓 서버로 부터 send_msg를 통해 이벤트를 받을 경우 
				                    socket.on('send_msg', function(msg) {
				                        //div 태그를 만들어 텍스트를 msg로 지정을 한뒤 #chat_box에 추가를 시켜준다.
				                        
				                        /* msg[1] 이랑 세션에 loginUser랑 비교해서 left에 담을지 right에 담을 지 */
				                        
				                        console.log(msg);
				                        $('<div></div>').text(msg[0]).appendTo("#chatMain");
				                        
				                        console.log($('#chatMain'));
				                        console.log($('#chatMain')[0]);
				                        
				                        $('#chatMain').scrollTop($('#chatMain')[0].scrollHeight);
				                    });
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
					
					<div id="btnList">
						<div id="submit" class="button">수락하기</div>
						<div id="cancle" class="button">돌아가기</div>
					</div>
					
					<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
						<script>
							$('#submit').text('작성하기');
							$('#submit').attr('id', 'registWrite');
						</script>
					</c:if>
					
					<script>
						$('.button').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						});
						
						$('#registWrite').click(function(){
							editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
							
							if(confirm("글을 등록하시겠습니까?")) {
								$('#registWriteForm').submit();	
							}
						})
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
