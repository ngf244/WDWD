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
		width: 78%;
		margin-left: 10%;
		padding: 1%;
		box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
		background-color: #F3F3F3;
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
	#editorRank {
		position: relative;
		width: 80%;
		margin-left: 10%;
		height: 250px;
		text-align: center;
		background-color: #F3E5F5;
		font-weight: bold;
		box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
	}
	#rankStart {
		position: absolute;
		width: 45%;
		left: 2%;
		top: 15px;
		text-align: center;
		font-size: 18pt;
		font-weight: bold;
	}
	#rankNo1 {
		position: absolute;
		width: 45%;
		height: 160px;
		left: 2%;
		bottom: 25px;
		background-color: #D6ADDC;
		color: white;
	}
	#rank1Profile {
		position: absolute;
		height: 120px;
		width: 120px;
		top: 20px;
		left: 20px;
	}
	#number1 {
		position: absolute;
		height: 80px;
		top: 40px;
		left: 150px;
	}
	#rankNo1 div {
		position: absolute;
		height: 80px;
		left: 50%;
		top: 40px;
		font-size: 20pt;
		line-height: 40px;
	}
	#rankNo2 {
		position: absolute;
		width: 20%;
		height: 200px;
		left: 52.5%;
		bottom: 25px;
		background-color: #D6ADDC;
		color: white;
	}
	#rank2Profile {
		position: absolute;
		height: 100px;
		width: 50%;
		top: 10px;
		left: 25%;
	}
	#number2 {
		position: absolute;
		height: 50px;
		top: 130px;
		left: 20%;
	}
	#rankNo2 div {
		position: absolute;
		height: 50px;
		left: 45%;
		top: 130px;
		font-size: 14pt;
		line-height: 25px;
	}
	#rankNo3 {
		position: absolute;
		width: 20%;
		height: 60px;
		right: 2%;
		top: 25px;
		background-color: #D6ADDC;
		color: white;
	}
	
	#rankNo4 {
		position: absolute;
		width: 20%;
		height: 60px;
		right: 2%;
		top: 95px;
		background-color: #D6ADDC;
		color: white;
	}
	#rankNo5 {
		position: absolute;
		width: 20%;
		height: 60px;
		right: 2%;
		bottom: 25px;
		background-color: #D6ADDC;
		color: white;
	}
	#rank3Profile, #rank4Profile, #rank5Profile {
		position: absolute;
		height: 50px;
		width: 50px;
		top: 5px;
		left: 5px;
	}
	#rankNo3 div, #rankNo4 div, #rankNo5 div {
		position: absolute;
		height: 50px;
		left: 55%;
		top: 5px;
		font-size: 12pt;
		line-height: 25px;
	}
	#number3, #number4, #number5 {
		position: absolute;
		height: 40px;
		top: 10px;
		left: 30%;
	}
	#pointBoardView {
		width: 78%;
		height: 200px;
		padding: 1%;
		margin-left: 10%;
		box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
		background-color: #EDFAF7;
	}
	#pointBoardLeft {
		float: left;
		width: 35%;
		text-align: center;
		padding: 10px;
		background-color: #B9E9DE;
	}
	#pointBoardBoldText {
		font-size: 18pt;
		font-weight: bold;
	}
	#pointViewMore {
		width: 80px;
		margin: 0 auto;
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
	#pointBoardRight {
		float: right;
		width: 60%;
	}
	.pointItem {
		width: 150px;
		height: 190px;
		border: 1px solid black;
		margin-right: 40px;
		text-align: center;
	}
	.pointItem img {
		width: 130px;
		height: 120px;
		border: 1px solid black;
		margin-left: 10px;
		margin-top: 10px;
	}
	.itemName {
		line-height: 25px;
		font-size: 15px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 130px;
	}
	.itemPrice {
		line-height: 25px;
		color: rgb(255, 68, 127);
		font-size: 17px;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
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
						<img id="thumbnailArea" src='${ contextPath }/resources/images/emptyImage.png'>
						
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
				
				<div id="editorRank">
					<div id="rankStart">에디터 랭킹</div>
					<div id="rankNo1" class="rankMove">
						<img id="rank1Profile">
						<img id="number1" src="${ contextPath }/resources/images/number-1.jpg">
						<div></div>
						<input type="hidden" value="">
					</div>
					<div id="rankNo2" class="rankMove">
						<img id="rank2Profile">
						<img id="number2" src="${ contextPath }/resources/images/number-2.jpg">
						<div></div>
						<input type="hidden" value="">
					</div>
					<div id="rankNo3" class="rankMove">
						<img id="rank3Profile">
						<img id="number3" src="${ contextPath }/resources/images/number-3.png">
						<div></div>
						<input type="hidden" value="">
					</div>
					<div id="rankNo4" class="rankMove">
						<img id="rank4Profile">
						<img id="number4" src="${ contextPath }/resources/images/number-4.png">
						<div></div>
						<input type="hidden" value="">
					</div>
					<div id="rankNo5" class="rankMove">
						<img id="rank5Profile">
						<img id="number5" src="${ contextPath }/resources/images/number-5.png">
						<div></div>
						<input type="hidden" value="">
					</div>
					
					<c:forEach var="member" items="${ memberList }" varStatus="status">
						<script>
							if('${member.profileImg}' == "") {
								$('#rank${status.count}Profile').attr('src', '${ contextPath }/resources/images/default_profile.png');
							} else {
								$('#rank${status.count}Profile').attr('src', '${ contextPath }/resources/profile_Image/${member.profileImg}');
							}
							$('#rankNo${status.count} div').html('${member.nickName}<br>☆ ${member.grade}');
							$('#rankNo${status.count} input').val('${member.userId}');
						</script>
					</c:forEach>
				</div>
				
				<script>
					$('.rankMove').click(function(){
						location.href="main.my?userId=" + $(this).children('input').val();
					});
				</script>
				
				<div style="height:100px;"></div>
				
				<div id="pointBoardView">
					<div id="pointBoardLeft">
						<div id="pointBoardBoldText">포인트 SHOP</div>
						<div style="height:30px;"></div>
						회원 활동으로 모은 포인트<br>
						사용할 수 있는 공간입니다.
						<div style="height:30px;"></div>
						<div id="pointViewMore" onclick="location.href='pointShop.ps'">더보기 ></div>
					</div>
					<div id="pointBoardRight">
						<div class="pointItem">
							<img>
							<div class="itemName">문화상품권 5천원권</div>
							<div class="itemPrice">500 POINT</div>
						</div>
						
						<div class="pointItem">
							<img>
							<div class="itemName">문화상품권 5천원권</div>
							<div class="itemPrice">500 POINT</div>
						</div>
						<div class="pointItem">
							<img>
							<div class="itemName">문화상품권 5천원권</div>
							<div class="itemPrice">500 POINT</div>
						</div>
						<div class="pointItem">
							<img>
							<div class="itemName">문화상품권 5천원권</div>
							<div class="itemPrice">500 POINT</div>
						</div>
						<div class="pointItem">
							<img>
							<div class="itemName">문화상품권 5천원권</div>
							<div class="itemPrice">500 POINT</div>
						</div>
					</div>
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
				
				<div class="sectionafter"></div>
				<div style="height:100px;"></div>
			</div>
        <div id="right-side">
            
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