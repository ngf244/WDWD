<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
		width: 70%;
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
		width: 380px;
		font-size: 13pt;
		padding: 5px;
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		cursor: pointer;
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
				
				
				<c:if test="${ loginUser != null }">
					<button class = "messageList">쪽지</button>
				</c:if>
				<button onclick="javascript:location.href='writeView.ch?boardType=2';">1:1 글쓰기</button>
				<button onclick="javascript:location.href='writeView.ch?boardType=3';">경매 글쓰기</button>
				<button onclick="javascript:location.href='writeView.ch?boardType=4';">콘테스트 글쓰기</button>
				
				
				<button onclick="javascript:location.href='list.bo';">boardlist</button>
				<button onclick="javascript:location.href='freeDetail.bo';">boardDetail</button>
				<button onclick="javascript:location.href='writing.bo';">boardwriting</button>
				<button onclick="javascript:location.href='revis.bo';">boardrevis</button>
				<button onclick="javascript:location.href='aban.au';">authorBan</button>
				<button onclick="javascript:location.href='trade.au';">authorTrade</button>
				<button onclick="javascript:location.href='aunban.au';">authorUnban</button>
			
				
				
				
				
				<div style="height:100px;"></div>
				
				<div id="slide-img">슬라이드 이미지 영역</div>
				
				<div style="height:50px;"></div>
				
				<div id="boardTopView">
					<div id="boardViewLeft">
						인기 게시글<br>
						<div style="height:40px;"></div>
						<img src="">
						
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
							<c:forEach var="board" items="${ boardList }" varStatus="status">
								<div class="boardTitle">${ board.boTitle } (${ board.boReNum })</div><input type="hidden" value="${ board.boNum }">
							</c:forEach>
						</div>
						
						<%-- <c:forEach var="board" items="${ boardList }" varStatus="status">
							<input type="hidden" value="${ board.boNum }">
							<div class="boardViewList">
								<div class="leftLine">${ status.count }</div>
								<div class="rightLine">${ board.boTitle } ( ${ board.boReNum } )</div>
							</div>
							<script>
								$('.boardTitle').eq('${status.index}').text('${board.boTitle}');
							</script>
							
						</c:forEach> --%>
					</div>
					<div id="boardViewRight">
						<div style="height:150px;">.</div>
						<div id="boardViewMore">더보기 ></div>
					</div>
				</div>
				
				<script>
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
							
							console.log($(this).index());
							
							$.ajax({
								url: 'topList.home',
								data: {number: $(this).index()},
								type: 'post',
								success: function(data){
									console.log(data);
								}
							});
						}
					});	
				</script>
				
				<div style="height:100px;"></div>
				<div style="text-align: center; border: 1px solid black;">포인트 게시판 나오는거 봐서 연결시켜줄 부분</div>
				
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
			window.open("messageList.ms", "_blank", "toolbar=no, menubar=no, width=500, height=600");	
		});
	
	</script>
</body>
</html>