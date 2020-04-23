<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${ contextPath }/resources/naver_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<style>
	#mainWrap {
		width: 80%;
		margin: 0 auto;
		background-color: rgba(227, 242, 253, 0.8);
	}
	#logoImg {
		display: inline-table;
		width: 50px; 
		height: 50px; 
		margin: 10px;
		line-height: 50px;
	}
	#logoImg img {
		position: absolute;	
		width: 50px;
		height: 50px;
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
		width: 35%;
		height: 100%;
		min-height: 50px;
		font-size: 15pt;
		text-align: center;
		line-height: 50px;
		margin: 10px;
		font-weight: bold;
	}
	.rightLine {
		display: inline-table;
		width: 60%;
		min-height: 50px;
		font-size: 14pt;
		line-height: 50px;
		margin: 10px;
		
		float: right;
	}
	.fullLine {}
	.br {
		margin-top: 20px;
	}
	
	.inputText {
		width: 80%;
		height: 40px;
		font-size: 12pt;
		line-height: 40px;
	}
	input[type="number"]::-webkit-outer-spin-button,
	input[type="number"]::-webkit-inner-spin-button {
		-webkit-appearance: none;
		margin: 0;
	}
	.selectDate {
		width: 20%;
		height: 40px;
		font-size: 14pt;
		line-height: 40px;
		margin-right: 20px;
	}
	#contentWrap {
		width: 80%;
		margin: 0 auto;
	}
	#content {
		width: 98%;
		height: 500px;
	}
	.concept {
		width: 20%;
		font-size: 13pt;
		text-align: center;
		display: inline-table;
	}
	.slider-wrap {
		width: 55%;
		margin-left: 10px;
		margin-right: 10px;
		display: inline-table;
	}
	.slider {
		width: 100%;
		display: inline-table;
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
	.detailWrap {
		display: inline-table;
		width: 130px;
		margin-right: 80px;
	}
	.miniInfo{
		border : 3px solid rgba(161, 206, 244, 0.55);
		position : absolute;
		background-color : white;
		z-index : 5;
		font-size: 10pt;
		line-height: 20px;
		text-align: center;
		padding: 5px;
		border-radius: 15px;
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
	
	/* The switch - the box around the slider */
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	  vertical-align:middle;
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	
	p {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
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
				<div id="logoImg">
					<img src='${ contextPath }/resources/images/listIcon.jpg'>1
				</div>
				<div id="mainTitle">
					디자인 요청 상세 내용
				</div>
				
				<form action="insert.ch" method="post" id="insertForm">
					<input type="hidden" value="${ boardType }" name="boGroup">
					<div class="leftLine">
						1. 어떤 작품을 원하시나요?
					</div>
					<div class="rightLine">
						<b>제목</b><br>
						<input class="inputText" type="text" name="boTitle" id="boTitle"><br>
						<div class="br"></div>
						
						<b>카테고리</b><br>
						<select class="inputText" id="category" name="boCategory">
							<option value="1">컨텐츠 제작</option>
							<option value="2">컨텐츠 수정</option>
							<option value="3">기타</option>
						</select><br>
						<div class="br"></div>
						
						<c:if test="${ boardType ne 2 }">
							<input type="hidden" name="cbDate" id="cbDate" value="">
							<b>마감일</b><br>
							
							<select id="optionDay" class="selectDate" onchange="selectDate()">
								<option value="0">마감일</option>
								<option value="1">1일</option>
								<option value="2">2일</option>
								<option value="3">3일</option>
								<option value="4">4일</option>
								<option value="5">5일</option>
								<option value="6">6일</option>
								<option value="7">7일</option>
								<option value="8">8일</option>
								<option value="9">9일</option>
								<option value="10">10일</option>
							</select>
							<select id="optionHour" class="selectDate" onchange="selectDate()">
								<option value="0">마감시간</option>
								<option value="1">1시간</option>
								<option value="2">2시간</option>
								<option value="3">3시간</option>
								<option value="4">4시간</option>
								<option value="5">5시간</option>
								<option value="6">6시간</option>
								<option value="7">7시간</option>
								<option value="8">8시간</option>
								<option value="9">9시간</option>
								<option value="10">10시간</option>
								<option value="11">11시간</option>
								<option value="12">12시간</option>
							</select>
							
							기한 : <span id="month"></span>월 <span id="day"></span>일 <span id="hour"></span>시
							<div class="br"></div>
							
						
							<script>
								var dt = new Date();
								$('#month').text(dt.getMonth() + 1)
								$('#day').text(dt.getDate())
								$('#hour').text(dt.getHours())
								
								function selectDate() {
									dt = new Date();
									
									dt.setDate(dt.getDate() + Number($('#optionDay option:selected').val()));
									dt.setHours(dt.getHours() + Number($('#optionHour option:selected').val()));
									dt.setMinutes(0);
									dt.setSeconds(0);
									
									$('#month').text(dt.getMonth() + 1);
									$('#day').text(dt.getDate());
									$('#hour').text(dt.getHours());
									
									$('#cbDate').val(dt);
								}
							</script>
						</c:if>
						
						<c:if test="${ boardType ne 3 }">
							<b>의뢰비</b><br>
							<input class="inputText" type="number" value="" name="cbCash" id="cbCash"><br>
							<div class="br"></div>
						</c:if>
						
					</div>
					<div class="sectionafter"></div>
					
					<div class="leftLine">
						2. 무엇을 디자인해드릴까요?
					</div>
					<div id="contentWrap">
						<textarea name="boContent" id="content"></textarea>
						<div id="fileList"></div>
					</div>
					<div class="br"></div>
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
					
					<div class="br" style="border-bottom: 2px solid gray"></div>
					<div class="br"></div>
					
					<div class="fullLine">
						<div class="leftLine">
							3. 작품의 컨셉을 정해주세요.
						</div>
						<div class="rightLine">
							<div class="concept">우아하게</div>
							<div class="slider-wrap">
								<input id="concept1" name="cbStep1" class="range-slider__range" type="range" value="0" min="-50" max="50">
							</div>
							<div class="concept">터프하게</div>
							
							<div class="concept">재미있게</div>
							<div class="slider-wrap">
								<input id="concept2" name="cbStep2" class="range-slider__range" type="range" value="0" min="-50" max="50">
							</div>
							<div class="concept">진지하게</div>
							
							<div class="concept">화려하게</div>
							<div class="slider-wrap">
								<input id="concept3" name="cbStep3" class="range-slider__range" type="range" value="0" min="-50" max="50">
							</div>
							<div class="concept">수수하게</div>
							
							<div class="concept">대중적으로</div>
							<div class="slider-wrap">
								<input id="concept4" name="cbStep4" class="range-slider__range" type="range" value="0" min="-50" max="50">
							</div>
							<div class="concept">고급스럽게</div>
							
							<div class="concept">복고적으로</div>
							<div class="slider-wrap">
								<input id="concept5" name="cbStep5" class="range-slider__range" type="range" value="0" min="-50" max="50">
							</div>
							<div class="concept">현대적으로</div>
						</div>
						<div class="sectionafter"></div>
					</div>
					
					<div class="br" style="border-bottom: 2px solid gray"></div>
					<div class="br"></div>
					
					<div class="fullLine">
						<div class="leftLine">
							4. 세부사항을 선택해주세요.
						</div>
						<div class="rightLine">
							
							<div class='detailWrap'>
								<input type="hidden" value="Y" name="cbSecret" id="cbSecret">
								<b>공개여부</b><br>
								<label class="switch">
								<input id="detailOpen" type="checkbox">
								<span class="slider round"></span>
								</label>
								<p class="detailOpenSwitch">&nbsp;공개</p><p style="display:none;" class="detailOpenSwitch">&nbsp;비공개</p>
								
								<div id="detailOpenText" class="miniInfo" hidden="">
									비공개로 글을 등록할 시<br>
									첨부된 사진은 의뢰인만<br>
									확인할 수 있습니다.
								</div>
								
								<script>
									var check = $("#detailOpen");
									check.click(function(){
										$(".detailOpenSwitch").toggle();
										
										if($('#cbSecret').val() == "Y") {
											$('#cbSecret').val('N');
										} else {
											$('#cbSecret').val('Y');
										}
									});
									
									$(document).mousemove(function(e){
										if($('#detailOpen').is(":hover")) {
											$('#detailOpenText').show();
											$('#detailOpenText').css("top", e.pageY - 80);
											$('#detailOpenText').css("cursor", "pointer");
											$('#detailOpenText').css("left", e.pageX - $('#detailOpenText').width() / 2);
										} else {
											$('#detailOpenText').hide();
										}
									});
								</script>
							</div>
							
							<div class='detailWrap'>
								<input type="hidden" value="N" name="cbPrimium" id="cbPrimium">
								<b>프리미엄여부</b><br>
								<label class="switch">
								<input id="detailPremium" type="checkbox">
								<span class="slider round"></span>
								</label>
								<p class="detailPremiumSwitch">&nbsp;일반</p><p style="display:none;" class="detailPremiumSwitch">&nbsp;프리미엄</p>
								
								<div id="detailPremiumText" class="miniInfo" hidden="">
									프리미엄 글로 등록할 시<br>
									3,000 캐시를 추가로 차감해<br>
									게시판 상단에 노출시켜 드립니다.
								</div>
								
								<script>
									var check = $("#detailPremium");
									check.click(function(){
										$(".detailPremiumSwitch").toggle();
										
										if($('#cbPrimium').val() == "Y") {
											$('#cbPrimium').val('N');
										} else {
											$('#cbPrimium').val('Y');
										}
									});
									
									$(document).mousemove(function(e){
										if($('#detailPremium').is(":hover")) {
											$('#detailPremiumText').show();
											$('#detailPremiumText').css("top", e.pageY - 80);
											$('#detailPremiumText').css("cursor", "pointer");
											$('#detailPremiumText').css("left", e.pageX - $('#detailPremiumText').width() / 2);
										} else {
											$('#detailPremiumText').hide();
										}
									});
								</script>
							</div>
						</div>
						<div class="sectionafter"></div>
					</div>
					
					<div class="br" style="border-bottom: 2px solid gray"></div>
					<div class="br"></div>
					
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
						
						$('#submit').click(function(){
							editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);

							if($('#boTitle').val() == "") {
								swal({
									title: "제목을 입력해주세요.",
									icon: "error"
								});
							} else if($('#cbDate').val() == "") {
								swal({
									title: "마감일을 입력해주세요.",
									icon: "error"
								});
							} else if($('#cbCash').val() == "") {
								swal({
									title: "의뢰비를 입력해주세요.",
									icon: "error"
								});
							} else if($('#content').val() == "") {
								// 현재 미작동
								swal({
									title: "내용을 입력해주세요.",
									icon: "error"
								});
							} else {
								swal({
									title: "글을 작성하시겠습니까?",
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
										$('#insertForm').submit();
									}
								});
							}
						})
					</script>
				</form>
			</div>
		</div>
		
		<!-- 공용영역 -->
		<div id="right-side"></div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>