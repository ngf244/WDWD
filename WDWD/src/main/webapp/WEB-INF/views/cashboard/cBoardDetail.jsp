<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#mainWrap {
		width: 80%;
		margin: 0 auto;
	}
	#boardDetail {
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
	.br {
		border-top: 2px solid gray;
		margin-top: 20px;
		margin-bottom: 20px;
	}
	.redColor {
		color: rgb(224, 63, 58);
	}
	.dateImg {
		margin-top: 5px;
		width: 20px;
		height: 40px;
		position: absolute;
	}
	.dateImg.next1 {margin-left: 20px;}
	.dateImg.next2 {width: 40px; height: 20px; margin-left: 40px; margin-top: 20px;}
	.dateImg.next3 {margin-left: 100px;}
	.dateImg.next4 {margin-left: 120px;}
	.dateImg.next5 {margin-left: 140px;}
	.dateImg.next6 {margin-left: 160px;}
	.dateImg.next7 {margin-left: 180px;}
	.dateImg.next8 {margin-left: 200px;}
	.dateImg.next9 {margin-left: 220px;}
	.dateImg.next10 {margin-left: 240px;}
	#boardcontent {
		width: 80%;
		height: 500px;
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
	.downloadName {
		height: 30px;
		margin: 10px;
		line-height: 30px;
		font-size: 14pt;
	}
	.downloadBtn {
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
	<div id="boardDetail">
		<div id="logoImg">
			<img src='${ contextPath }/resources/images/listIcon.jpg'>1
		</div>
		<div id="mainTitle">
			디자인 요청 상세 내용
		</div>
		
		<div class="br"></div>
		
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
		
		<div class="leftLine">
			<span class="redColor">＞ </span>마감일
		</div>
		<div class="rightLine">
			<!-- 기한 : <span id="month">1</span>월 <span id="day">1</span>일 <span id="hour">12</span>시 -->
			<img id="dateDay1" class="dateImg" src="${ contextPath }/resources/images/num0.PNG">
			<img id="dateDay2" class="dateImg next1" src="${ contextPath }/resources/images/num0.PNG">
			<img class="dateImg next2" src="${ contextPath }/resources/images/numday.PNG">
			<img id="dateHour1" class="dateImg next3" src="${ contextPath }/resources/images/num0.PNG">
			<img id="dateHour2" class="dateImg next4" src="${ contextPath }/resources/images/num0.PNG">
			<img class="dateImg next5" src="${ contextPath }/resources/images/numdash.PNG">
			<img id="dateMin1" class="dateImg next6" src="${ contextPath }/resources/images/num0.PNG">
			<img id="dateMin2" class="dateImg next7" src="${ contextPath }/resources/images/num0.PNG">
			<img class="dateImg next8" src="${ contextPath }/resources/images/numdash.PNG">
			<img id="dateSec1" class="dateImg next9" src="${ contextPath }/resources/images/num0.PNG">
			<img id="dateSec2" class="dateImg next10" src="${ contextPath }/resources/images/num0.PNG">
			1<!-- div 위치깨짐 방지용 -->
			
			<script>
				/* db에서 받아올 마감시간 */
				var dateDay = 1;
				var dateHour = 0;
				var dateMin = 0;
				var dateSec = 10;
				
				!function timer(){
					setTimeout(function() {
						if(dateDay == 0 && dateHour == 0 && dateMin == 0 && dateSec == 0) {
							/* 마감일 때 */
						} else {
							dateSec--;
							
							if(dateSec == -1){
								dateSec = 59;
								dateMin--;
							}
							if(dateMin == -1){
								dateMin = 59;
								dateHour--;
							}
							if(dateHour == -1){
								dateHour = 23;
								dateDay--;
							}
							
							$('#dateDay1').attr('src', "${ contextPath }/resources/images/num" + parseInt(dateDay / 10) + ".PNG");
							$('#dateDay2').attr('src', "${ contextPath }/resources/images/num" + dateDay % 10 + ".PNG");
							$('#dateHour1').attr('src', "${ contextPath }/resources/images/num" + parseInt(dateHour / 10) + ".PNG");
							$('#dateHour2').attr('src', "${ contextPath }/resources/images/num" + dateHour % 10 + ".PNG");
							$('#dateMin1').attr('src', "${ contextPath }/resources/images/num" + parseInt(dateMin / 10) + ".PNG");
							$('#dateMin2').attr('src', "${ contextPath }/resources/images/num" + dateMin % 10 + ".PNG");
							$('#dateSec1').attr('src', "${ contextPath }/resources/images/num" + parseInt(dateSec / 10) + ".PNG");
							$('#dateSec2').attr('src', "${ contextPath }/resources/images/num" + dateSec % 10 + ".PNG");
						}
						
						timer();
					}, 1000)
				}()
			</script>
		</div>
		
		<div class="leftLine">
			<span class="redColor">＞ </span>의뢰비
		</div>
		<div class="rightLine">
			10,000 원
		</div>
		
		<div class="leftLine" style="width: auto">
			<span class="redColor">＞ </span>무엇을 디자인해드릴까요?
		</div>
		
		<br>
		
		<div id="boardcontent">
			글 내용을 불러올 부분
		</div>
		
		<div class="leftLine">
			<span class="redColor">＞ </span>첨부파일
		</div>
		<div class="rightLine">
			<span class="downloadName">logo.jpg</span> <div class="downloadBtn">download</div><br>
			<span class="downloadName">logo.jpg</span> <div class="downloadBtn">download</div><br>
			<span class="downloadName">logo.jpg</span> <div class="downloadBtn">download</div><br>
			<span class="downloadName">logo.jpg</span> <div class="downloadBtn">download</div><br>
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
		</div>
		
		<div class="br"></div>
	</div>
</body>
</html>