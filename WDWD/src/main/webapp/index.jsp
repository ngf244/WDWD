<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<style>
	#slide-img {
		width: 70%;
		height: 200px;
		margin: 0 auto;
		
		border: 1px solid black;
	}
	#boardTopView {
		width: 80%;
		margin-left: 10%;
	}
	#boardViewLeft {
		text-align: center;
		font-size: 18pt;
		width: 35%;
		height: 400px;
		display: inline-table;
		margin-right: 5%;
	}
	#boardViewLeft img {
		width: 100%;
		height: 220px;
		margin: 0 auto;
		border: 1px solid black;
	}
	#boardViewCenter {
		width: 45%;
		display: inline-table;
	}
	.boardViewButton {
		width: 30%;
		margin-right: 2%;
		display: inline-table;
		text-align: center;
		font-size: 13pt;
		line-height: 50px;
		background-color: #64636d;
		color: white;
		cursor: pointer;
	}
	.boardViewList {
		font-size: 13pt;
		padding: 5px;
	}
	.leftLine {
		display: inline-table;
		width: 11%;
		font-weight: bold;
		text-align: center;
	}
	.boardCount {
		font-size: 13pt;
		padding: 5px;
	}
	.rightLine {
		display: inline-table;
		width: 83%;
	}
	.boardTitle {
		width: 300px;
		font-size: 13pt;
		padding: 5px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		cursor: pointer;
	}
	.boardTitle:hover {
		color: #f44336;
	}
	#boardViewRight {
		width: 12%;
		display: inline-table;
		height: 300px;
		color: white;
	}
	#boardViewMore {
		margin-left: 30px;
		height: 40px;
		line-height: 40px;
		font-size: 12pt;
		text-align: center;
		border-radius: 5px;
		border: 1px solid black;
		cursor: pointer;
		font-weight: bold;
		color: black;
	}
	#pointBoardView {
		width: 80%;
		margin-left: 10%;
		height: 250px;
	}
	#pointBoardLeft {
		float: left;
		width: 40%;
		text-align: center;
		height: 100%;
		border: 1px solid black;
	}
	#pointBoardBoldText {
		font-size: 18pt;
		font-weight: bold;
	}
	#pointBoardRight {
		float: right;
		width: 55%;
	}
	.pointItem {
		width: 200px;
		height: 150px;
		border: 1px solid black;
		margin-right: 40px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/mainHeader.jsp"/>
	<section>
		<div id="left-side" style="background-color: yellow;">
		</div>
			<div id="main">
				<button onclick="goToBoardList();">자유게시판&1:1</button>
				<button class= "pointShop" onclick="javascript:location.href='pointShop.ps';">포인트샵</button>
        <button onclick="javascript:location.href='writeView.ch?boardType=2';">1:1 글쓰기</button>
				<button onclick="javascript:location.href='writeView.ch?boardType=3';">경매 글쓰기</button>
				<button onclick="javascript:location.href='writeView.ch?boardType=4';">콘테스트 글쓰기</button>
				
				
				<button onclick="javascript:location.href='list.bo';">boardlist</button>
				<button onclick="javascript:location.href='freeDetail.bo';">boardDetail</button>
				<button onclick="javascript:location.href='writing.bo';">boardwriting</button>
				<button onclick="javascript:location.href='revis.bo';">boardrevis</button>
  			<button onclick="javascript:location.href='aban.au';">authorBan</button>
	  		<button onclick="javascript:location.href='atrade.au';">authorTrade</button>
		  	<button onclick="javascript:location.href='aunban.au';">authorUnban</button>
			
				 
		
				
				
				
				
				<div style="height:100px;"></div>
				
				<div id="slide-img">
					<div>111</div>
					<div>222</div>
					<div>333</div>
				</div>
				
				<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
				<script>
					$('#slide-img').slick({
						autoplay : true,
						dots: true,
						speed : 300,
						infinite: true,
						autoplaySpeed: 2000,
						arrows: true,
						slidesToShow: 1,
						slidesToScroll: 1,
						fade: false
					});
				</script>
				
				<div style="height:100px;"></div>
				
				<div id="boardTopView">
					<div id="boardViewLeft">
						<b>인기 게시글</b><br>
						<div style="height:40px;"></div>
						<img id="thumbnailArea" src="">
						
					</div>
					<div id="boardViewCenter">
						<div class="boardViewButton" style="background-color: white; color: black; border-top: 2px solid black;">조회순</div>
						<div class="boardViewButton">추천순</div>
						<div class="boardViewButton">댓글순</div>
						
						<div style="height:10px;"></div>
						
						<div class="leftLine">
							<div class="boardCount">1</div>
							<div class="boardCount">2</div>
							<div class="boardCount">3</div>
							<div class="boardCount">4</div>
							<div class="boardCount">5</div>
							<div class="boardCount">6</div>
							<div class="boardCount">7</div>
							<div class="boardCount">8</div>
							<div class="boardCount">9</div>
							<div class="boardCount">10</div>
						</div>
						<div class="rightLine">
							<!-- boardTitle 은 글자수 overflow 제한을 두기 위해 width를 픽셀로 지정해둠 -->
							<!-- width 노트북용으로 현재는 300이고 나중에 380으로 -->
							<c:forEach var="board" items="${ boardList }" varStatus="status">
								<div class="boardTitle">${ board.boTitle } (${ board.boReNum })</div>
								<input type="hidden" value="${ board.boNum }">
								<input type="hidden" value="${ board.thumbnail }">
								<input type="hidden" value="${ board.thumbnailURL }">
							</c:forEach>
						</div>
					</div>
					<div id="boardViewRight">
						<div style="height:150px;">.</div>
						<div id="boardViewMore" onclick="location.href='actionList.ch'">더보기 ></div>
					</div>
				</div>
				
				<script>
					var isMouseOver = 0;
					var topBoardNum = 0;
					
					$('.boardViewButton').hover(function() {
						if($(this).css('background-color') != 'rgb(255, 255, 255)') {
							$(this).css("background-color", "black")
						}
					}, function(){
						if($(this).css('background-color') != 'rgb(255, 255, 255)') {
							$(this).css("background-color", "#64636d")
						}
					}).click(function(){
						if($(this).css('background-color') != 'rgb(255, 255, 255)') {
							
							$('.boardViewButton').css("background-color", "#64636d")
							$('.boardViewButton').css("color", "white")
							$(this).css('background-color', 'white');
							$(this).css('color', 'black');
							$(this).css('border-top', '2px solid black');
							
							$.ajax({
								url: 'topList.home',
								data: {number: $(this).index()},
								type: 'post',
								success: function(data){
									for(var i = 0; i < data.length; i++) {
										$('.boardTitle').eq(i).text(data[i].boTitle + ' (' + data[i].boReNum + ')');
										$('.boardTitle').eq(i).next().val(data[i].boNum);
										$('.boardTitle').eq(i).next().next().val(data[i].thumbnail);
										$('.boardTitle').eq(i).next().next().next().val(data[i].thumbnailURL);
									}
								}
							});
						}
					});
					
					$('.boardTitle').click(function(){
						location.href='detail.bo?boNum=' + $(this).next().val()
					}).hover(function(){
						isMouseOver = 1;
						$('.boardTitle').css('color', 'black');
						$(this).css('color', '#f44336');
						if($(this).next().next().val() == "") {
							$('#thumbnailArea').attr('src', '${ contextPath }/resources/images/emptyImage.png');
						} else {
							var imgPath = $(this).next().next().next().val();
							$('#thumbnailArea').attr('src', '${ contextPath }/resources/free_photo_upload/' + imgPath.substring(imgPath.length-8) + '/' + $(this).next().next().val());
						}
					}, function(){
						isMouseOver = 0;
						$('.boardTitle').css('color', 'black');
					});
					
					!function topBoard(){
						setTimeout(function() {
							if(isMouseOver == 0) {
								$('.boardTitle').css('color', 'black');
								$('.boardTitle').eq(topBoardNum).css('color', '#f44336');
								
								if($('.boardTitle').eq(topBoardNum).next().next().val() == "") {
									$('#thumbnailArea').attr('src', '${ contextPath }/resources/images/emptyImage.png');
								} else {
									var imgPath = $('.boardTitle').eq(topBoardNum).next().next().next().val();
									$('#thumbnailArea').attr('src', '${ contextPath }/resources/free_photo_upload/' + imgPath.substring(imgPath.length-8) + '/' + $('.boardTitle').eq(topBoardNum).next().next().val());
								}
								
								if(topBoardNum != 9) {
									topBoardNum++;
								} else {
									topBoardNum = 0;
								}
							}
							
							topBoard();
						}, 1500)
					}()
				</script>
				
				<div style="height:100px;"></div>
				
				<div id="pointBoardView">
					<div id="pointBoardLeft">
						<div id="pointBoardBoldText">포인트 게시판</div>
						포인트게시판입니당.<br>
						대충 설명이랑 바로가기 링크
					</div>
					<span id="pointBoardRight">
						<span class="pointItem">1번상품 상품 이미지 정보 링크 추가될 예정</span>
						<span class="pointItem">2번상품</span>
						<span class="pointItem">3번상품</span>
						<span class="pointItem">4번상품</span>
						<span class="pointItem">5번상품</span>
						<span class="pointItem">6번상품</span>
					</span>
				</div>
				
				<script>
					$('#pointBoardRight').slick({
						autoplay : true,
						dots: false,
						infinite: true,
						speed: 300,
						autoplaySpeed: 2000,
						slidesToShow: 1,
						centerMode: true,
						variableWidth: true
					});
				</script>
				
				<div style="height:100px;"></div>
			</div>
        <div id="right-side" style="background: blue">
            
		</div>
	</section>
	<jsp:include page="WEB-INF/views/common/footer.jsp"/>
	
	<script>
		
		function goToBoardList(){
			/* var boGroup1 = 1;
			var boGroup2 = 2;
			var boGroup3 = 3;
			var boGroup4 = 4; */
			location.href="actionList.ch";
			
		}
	
	</script>
	
	
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
	
	</script>
</body>
</html>