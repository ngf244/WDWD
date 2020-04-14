<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%-- <script type="text/javascript" src="${ contextPath }/resources/naver_editor/js/HuskyEZCreator.js" charset="utf-8"></script> --%>
<style>
	#mainWrap {
		width: 80%;
		margin: 0 auto;
		background-color: rgba(224, 224, 224, 0.16);
	}
	#logoImg {
		display: inline-table;
		width: 50px; 
		height: 50px; 
		margin: 10px;
		line-height: 50px;
		
		border: 1px solid black;
	}
	#mainTitle {
		display: inline-table;
		height: 50px;
		font-size: 18pt;
		font-weight: bold;
		line-height: 50px;
		margin: 10px;
	}
	#writeForm {
		margin-top: 30px;
		border-top: 2px solid gray;
		padding: 10px;
	}
	.leftLine {
		display: inline-table;
		width: 20%;
		height: 50px;
		font-size: 14pt;
		text-align: center;
		line-height: 50px;
		margin: 10px;
		font-weight: bold;
	}
	.rightLine {
		display: inline-table;
		width: 70%;
		height: 50px;
		font-size: 13pt;
		line-height: 50px;
		margin: 10px;
	}
	.redColor {
		color: rgb(224, 63, 58);
	}
	#maincontent {
		width: 80%;
		height: 300px;
		margin: 0 auto;
		
		border: 1px solid black;
	}
	#conceptWrap {
		margin-top: 20px;
	}
	.concept {
		width: 20%;
		font-size: 13pt;
		text-align: center;
		display: inline-table;
		
	}
	.slider-wrap {
		width: 50%;
		margin-left: 10px;
		margin-right: 10px;
		display: inline-table;
	}
	.slider {
		width: 100%;
		display: inline-table;
	}
	#downloadWrap {
		margin-top: 30px;
		padding-top: 30px;
		margin-bottom: 30px;
		padding-bottom: 30px;
		border-top: 2px solid gray;
		border-bottom: 2px solid gray;
	}
	.download {
		display: inline-table;
		height: 30px;
		margin: 10px;
		padding-left: 20px;
		padding-right: 20px;
		line-height: 30px;
		font-size: 14pt;
		text-align: center;
		background-color: rgb(66, 66, 66);
		color: white;
		border-radius: 5px;
		cursor: pointer;
		font-weight: bold;
	}
	#registWrap {
		margin-top: 50px;
		width: auto;
		min-height: 500px;
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
	#registChat {
		position: absolute;
		bottom: 100px;
		right: 50px;
		width: 300px;
		box-shadow: 2px 2px 2px;
	}
	#chatTitle {
		height: 40px;
		background-color: rgba(161, 206, 244, 0.55);
		line-height: 40px;
		border: 1px solid black;
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
	
	.range-slider__range {
		-webkit-appearance: none;
		width: calc(100%);
		height: 10px;
		border-radius: 5px;
		background: #d7dcdf;
		outline: none;
		padding: 0;
		margin: 0;
	}
	/* custom thumb */
	.range-slider__range::-webkit-slider-thumb {
		-webkit-appearance: none;
		appearance: none;
		width: 20px;
		height: 20px;
		border-radius: 50%;
		background: #2c3e50;
		cursor: pointer;
		-webkit-transition: background .15s ease-in-out;
		transition: background .15s ease-in-out;
	}
	.range-slider__range::-webkit-slider-thumb:hover {
		background: #1abc9c;
	}
	.range-slider__range:active::-webkit-slider-thumb {
		background: #1abc9c;
	}
	.range-slider__range::-moz-range-thumb {
		width: 20px;
		height: 20px;
		border: 0;
		border-radius: 50%;
		background: #2c3e50;
		cursor: pointer;
		-webkit-transition: background .15s ease-in-out;
		transition: background .15s ease-in-out;
	}
	.range-slider__range::-moz-range-thumb:hover {
		background: #1abc9c;
	}
	.range-slider__range:active::-moz-range-thumb {
		background: #1abc9c;
	}
	.range-slider__range:focus::-webkit-slider-thumb {
		-webkit-box-shadow: 0 0 0 3px #fff, 0 0 0 6px #1abc9c;
		box-shadow: 0 0 0 3px #fff, 0 0 0 6px #1abc9c;
		 
		outline: none; 
	}
	/* custom label */
	.range-slider__value {
		display: inline-block;
		position: relative;
		width: 60px;
		color: #fff;
		line-height: 20px;
		text-align: center;
		border-radius: 3px;
		background: #2c3e50;
		padding: 5px 10px;
		margin-left: 8px;
	}
	.range-slider__value:after {
		position: absolute;
		top: 8px;
		left: -7px;
		width: 0;
		height: 0;
		border-top: 7px solid transparent;
		border-right: 7px solid #2c3e50;
		border-bottom: 7px solid transparent;
		content: '';
	}
	/* custom track */
	::-moz-range-track {
		background: #d7dcdf;
		border: 0;
	}
	/* remove border */
	input::-moz-focus-inner, input::-moz-focus-outer {
		border: 0;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../../common/mainHeader.jsp"/>
	<section>
		<div id="left-side"></div>

		<div id="main" >
			<div id="mainWrap">
				<!-- 로고로 만들어서 제작 -->
				<div id="logoImg">
					<img src=''>
				</div>
				<div id="mainTitle">
					디자인 요청 상세 내용
				</div>
				
				<form id="writeForm">
					<div class="leftLine">
						<span class="redColor">＞ </span>제목
					</div>
					<div class="rightLine">
						어플 로고 이미지 제작
					</div>
					
					<div class="leftLine">
						<span class="redColor">＞ </span>카테고리
					</div>
					<div class="rightLine">
						로고 이미지
					</div>
					
					<div class="leftLine">
						<span class="redColor">＞ </span> 의뢰인
					</div>
					<div class="rightLine">
						홍길동
					</div>
					
					<div class="leftLine" style="width: auto">
						<span class="redColor">＞ </span>무엇을 디자인해드릴까요?
					</div>
					
					<br>
					
					<div id="maincontent">
						글 내용을 불러올 부분
					</div>
					
					<div id="conceptWrap">
						<div class="leftLine">
							<span class="redColor">＞ </span>컨셉
						</div>
						<div class="rightLine">
							<div class="concept">우아하게</div>
							<div class="slider-wrap">
								<input id="concept1" class="range-slider__range" type="range" value="40" min="-50" max="50" disabled>
							</div>
							<div class="concept">터프하게</div>
							<br>
							<div class="concept">재미있게</div>
							<div class="slider-wrap">
								<input id="concept2" class="range-slider__range" type="range" value="-20" min="-50" max="50" disabled>
							</div>
							<div class="concept">진지하게</div>
							<br>
							<div class="concept">화려하게</div>
							<div class="slider-wrap">
								<input id="concept3" class="range-slider__range" type="range" value="30" min="-50" max="50" disabled>
							</div>
							<div class="concept">수수하게</div>
							<br>
							<div class="concept">대중적으로</div>
							<div class="slider-wrap">
								<input id="concept4" class="range-slider__range" type="range" value="0" min="-50" max="50" disabled>
							</div>
							<div class="concept">고급스럽게</div>
							<br>
							<div class="concept">복고적으로</div>
							<div class="slider-wrap">
								<input id="concept5" class="range-slider__range" type="range" value="-50" min="-50" max="50" disabled>
							</div>
							<div class="concept">현대적으로</div>
						</div>
						
						<div class="leftLine">
							<span class="redColor">＞ </span>마감일
						</div>
						<div class="rightLine">
							기한 : <span id="month">1</span>월 <span id="day">1</span>일 <span id="hour">12</span>시
						</div>
						
						<div class="leftLine">
							<span class="redColor">＞ </span>의뢰비
						</div>
						<div class="rightLine">
							10,000 원
						</div>
					</div>
					
					<div id="downloadWrap">
						<!-- 로고로 만들어서 제작 -->
						<div id="logoImg">
							<img src=''>
						</div>
						<div id="mainTitle">
							자료 첨부파일
						</div>
						
						<br>
						
						logo.jpg <div class="download">download</div>
					</div>
					
					<div id="logoImg">
						<img src=''>
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
						
						<div id="contentWrap">
							<textarea name="content" id="content"></textarea>
						</div>
						
						<!-- <script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "content",
							 sSkinURI: "${ contextPath }/resources/naver_editor/SmartEditor2Skin.html",
							 fCreator: "createSEditor2"
							});
						</script> -->
						
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
						<div id="submit" class="button">작성완료</div>
						<div id="cancle" class="button">돌아가기</div>
					</div>
					
					<script>
						$('#submit').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						});
						$('#cancle').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						})
					</script>
					
				</form>
			</div>
		</div>
		
		<!-- 공용영역 -->
		<div id="right-side"></div>
	</section>
	<jsp:include page="../../common/footer.jsp"/>
</body>
</html>