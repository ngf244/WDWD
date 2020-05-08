<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
	body {
	font-family: "Noto Sans KR", sans-serif;
	}
	#cashCategorySelectArea {
		width: 100%;
		height: 50px;
		margin: auto;
		background-color: rgba(224, 224, 224, 0.16);
		min-height: 50px;
		display: flex;
		justify-content: space-evenly;
	}
	
	.categories {
		width: calc(33% - 10px);
		height: 50px;
		text-align: center;
		vertical-align: middle;
		display: table;
		font-weight: bolder;
		font-size: large;
		transition: 0.5s ease;
		border-radius: 5px;
	}
	
	.categories:hover {
		background-color: rgba(204, 204, 204, 0.55);
		cursor: pointer;
	}
	
	.categories span {
		display: table-cell;
		vertical-align: middle;
	}
	
	.forLine {
		width: 0;
		height: 45px;
		border: outset;
	}
	
	.mainBackground {
		background-color: rgba(224, 224, 224, 0.16);
		border-bottom: 1px solid rgba(200, 200, 200, 0.7);
		padding-bottom: 40px;
	}
	
	.mainHeaderBar {
		display: inline-table;
		margin-top: 50px;
		margin-left: 100px;
		text-align: left;
		font-size: 33px;
		font-weight: bolder;
		height: 90px;
	}
	
	.mainBar {
		display: inline-table;
		margin-top: 0px;
		margin-left: 30px;
		font-size: 20px;
		line-height: 200%;
		height: 100px;
	}
	
	/* 카테고리, 진행상태 버튼 */
	#buttonSelectNSerch {
		margin-left: 20px;
		margin-right: 20px;
		position: relative;
		display: inline-table;
		height: 50px;
		display: block;
		margin-top: 20px;
	}
	
	#buttonSelect {
		width: 120%;
		line-height: 34px;
		height: 34px;
		background-color: rgba(161, 206, 244, 0.55);
		padding: 8px;
		margin-right: 20%;
		font-size: 15px;
		border: none;
		font-weight: bolder;
	}
	
	#dropCategory {
		position: relative;
		display: inline-block;
		text-align: center;
	}
	
	.dropdown-category {
		display: none;
		position: absolute;
		background-color: rgba(161, 206, 244, 0.55);
		min-width: 120%;
		padding: 8px;
		text-align: center;
		z-index: 100;
	}
	
	.dropdown-category span {
		color: black;
		text-decoration: none;
		text-align: center;
		display: block;
	}
	
	.dropdown-category span:hover {
		background-color: rgb(52, 152, 219);
	}
	
	#dropCategory:hover .dropdown-category {
		display: block;
	}
	
	#dropCategory:hover #buttonSelect {
		background-color: rgb(52, 152, 219);
	}
	
	#dropCategory:checked {
		display: none;
	}
	
	.dropdown-category>span {
		width: 100%;
		height: 40px;
		line-height: 38px;
		float: center;
		font-size: 15px;
		text-decoration: none;
		text-align: center;
		background-color: rgba(161, 206, 244, 1);
		color: black;
		font-weight: bold;
		cursor: pointer;
	}
	
	.imgSearchBtn {
		display: inline-block;
		height: 70px;
	}
	
	.requestBtn {
		position: relative;
		z-index: 2;
		width: 200px;
		height: 70px;
		left: 650px;
		margin-top: 0px;
		margin-bottom: 10px;
		margin-left: 350px;
		color: #fff;
		font-size: 25px;
		font-weight: 400;
		line-height: 68px;
		letter-spacing: 1px;
		text-transform: uppercase;
		text-align: center;
		transition: all 0.3s ease-in-out;
		cursor: pointer;
	}
	
	.requestBtn:before {
		position: absolute;
		z-index: -1;
		top: 0;
		left: 0;
		content: '';
		display: block;
		width: 200px;
		height: 70px;
		background: #f8585b;
		transform: translate(0, 0);
		transition: all 0.3s ease-in-out;
		box-shadow: 2px 2px 4px 0px rgba(0, 0, 0, 0.1);
	}
	
	.requestBtn:after {
		position: absolute;
		z-index: -2;
		top: 0;
		left: 0;
		content: '';
		display: block;
		width: 200px;
		height: 70px;
		background: rgba(161, 206, 244, 0.9);
		transform: translate(13px, 12px);
		transition: all 0.3s ease-in-out;
		box-shadow: 2px 2px 4px 0px rgba(0, 0, 0, 0.2);
	}
	
	.requestBtn:hover {
		transform: translate(13px, 12px);
		color: #2c3e50;
	}
	
	.requestBtn:hover:before {
		background: rgba(161, 206, 244, 0.9);
		box-shadow: 4px 4px 8px 0px rgba(0, 0, 0, 0.2);
	}
	
	.requestBtn:hover:after {
		transform: translate(-15px, -10px);
		background: #f8585b;
	}
	
	/* 전체,진행,마감 */
	#dropProgress {
		width: 40%;
		display: inline-block;
		margin-left: 100px;
		margin-right: 35px;
	}
	
	.progress {
		display: inline-block;
		margin-left: 40px;
		line-height: 34px;
		height: auto;
		background-color: white;
		padding: 8px;
		font-size: 15px;
		border: 1px solid rgba(200, 200, 200, 0.6);
		cursor: pointer;
	}
	
	.dropProgressActive {
		list-style: none;
		display: inline-block;
		margin: 0;
		padding: 0;
	}
	
	.buttonDrop {
		width: 30%;
		background-color: #FF7043;
		border: none;
		outline: none;
		color: white;
		padding: 13px 0;
		text-align: center;
		text-decoration: none;
		display: inline-block;
		font-size: 15px;
		margin-right: 2px;
		cursor: pointer;
		border-bottom: 1.5px solid rgb(235, 239, 241);
		border-top: 1.5px solid rgb(235, 239, 241);
		font-weight: bold;
	}
	
	#searchBtn {
		width: 270px;
		height: 50px;
		display: inline-block;
		margin-left: 1%;
		margin-right: 1%;
	}
	
	.buttonSearch {
		display: inline-block;
		line-height: 34px;
		height: 34px;
		background-color: white;
		padding: 2px;
		font-size: 15px;
		border: 1px solid #b8b8b8;
	}
	
	#imgSearch {
		vertical-align: middle;
		display: inline-block;
		width: 40px;
		height: 40px;
		padding-bottom: 10px;
		line-height: 42px;
		cursor: pointer;
	}
	
	#searchSelect {
		width: 86px;
		line-height: 34px;
		height: 34px;
		background-color: rgba(161, 206, 244, 0.55);
		padding: 8px;
		margin-right: 30%;
		font-size: 15px;
		border: none;
		font-weight: bolder;
	}
	
	#searchCategory {
		position: relative;
		display: inline-block;
		margin-left: 5%;
		text-align: center;
	}
	
	.searchDropdown-category {
		display: none;
		position: absolute;
		background-color: rgba(161, 206, 244, 0.55);
		min-width: 86px;
		padding: 8px;
		text-align: center;
	}
	
	.searchDropdown-category span {
		color: black;
		text-decoration: none;
		text-align: center;
		display: block;
	}
	
	.searchDropdown-category span:hover {
		cursor: pointer;
		background-color: rgb(52, 152, 219);
	}
	
	#searchCategory:hover .searchDropdown-category {
		display: block;
	}
	
	#searchCategory:hover #searchSelect {
		background-color: rgb(52, 152, 219);
	}
	
	.searchDropdown-category>span {
		width: 86px;
		height: 40px;
		line-height: 38px;
		float: center;
		font-size: 15px;
		text-decoration: none;
		text-align: center;
		background-color: rgba(161, 206, 244, 1);
		color: black;
		font-weight: bold;
	}
	
	#primiumZone {
		box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
		padding-top: 30px;
		padding-bottom: 10px;
		background-color: #fff6d1;
	}
	
	.boardList, .primiumBoardList {
		cursor: pointer;
		padding: 10px;
		margin: 20px;
		border: 1px solid #d6d6d6;
		border-bottom-color: #b8b8b8;
		border-right-color: #b8b8b8;
		display: flex;
		background-color: white;
	}
	
	.boardList:hover {
		background: rgba(161, 206, 244, 0.1);
	}
	
	.boardImg {
		display: inline-block;
		width: 140px;
		height: 140px;
		margin: 5px;
		margin-top: 13px;
	}
	
	.boardImg img {
		width: 100%;
		height: 100%;
	}
	
	.boardCon {
		/* width 값은 script로 별도 지정 */
		display: inline-table;
		width: 87%;
		height: 140px;
		margin: 5px;
		line-height: 100%;
	}
	
	.leftCon {
		display: inline-table;
		width: 70%;
		height: 140px;
		margin-left: 15px;
	}
	
	.boardCate {
		color: #e54e40;
		display: inline-block;
		font-size: 19px;
		font-weight: bold;
		margin-right: 40px;
	}
	
	.boardTitle {
		color: black;
		display: inline-block;
		font-size: 19px;
		font-weight: bold;
	}
	
	.boardReq {
		font-size: 15px;
		margin-top: 10px;
		padding-bottom: 5px;
		margin-bottom: 13px;
		border-bottom: 1px solid black;
	}
	.boardContents, .pBoardContents {
		height: 60px;
		padding: 5px;
		overflow: hidden;
	}
	.boardContents p, .pBoardContents p { 
		margin: 8px 0px 8px 0px;
		line-height: 120%;
	}
	.rightCon {
		margin-left: 2%;
		display: inline-table;
		width: 25%;
		height: 140px;
	}
	
	.rightBtn {
		font-size: 11pt;
		display: inline-table;
		width: 100%;
		height: 38px;
		margin: 5px;
		margin-top: 8px;
		line-height: 35px;
		font-weight: bold;
		text-align: center;
		border-radius: 5px;
		background-color: #E0E0E0;
		line-height: 35px;
	}
	
	#loadingArea {
		height: 200px;
		text-align: center;
		display: none;
	}
	#loadingArea img {
		height: 100%;
	}
	.preZone{
		box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
		width: 100%;
		height: 100px;
		display: inline-block;
		margin-bottom: 20px;
		background-color: #fff6d1;
	}
	.preZoneText{
		margin-left: 20px;
		display: inline-block;
	}
</style>
</head>
<body>
	<div id="cashBoardTop"></div>
	<div id="removeImg" style="display: none;"></div>
	<div class="preZone"><h1>&nbsp;&nbsp;PREMIUM ZONE</h1>
		<div class="preZoneText">
			<span class="preZoneTextBody">
				PREMIUM ZONE을 통해 당신의 재능을 뽐내보세요.
			</span>
			<span class="preZoneTextReple">
				PREMIUM ZONE에서 높은 상금을 획득하세요!
			</span>
		</div>
	</div>
	
	<script>
		$('.preZoneTextReple').hide();
			!function loop(){
				setTimeout(function() {
					if($(".preZoneTextReple").css("display") == "none"){
						$('.preZoneTextBody').hide();
						$('.preZoneTextReple').slideDown();	
					} else {
						$('.preZoneTextReple').hide();
						$('.preZoneTextBody').slideDown();	
					}
					loop();
			}, 2000)
		}()
	</script>

	<div id="primiumZone"></div>
	<c:forEach var="cBoard" items="${ list3 }" varStatus="status">
		<script>
			var result1 = parseInt('${status.index}' / 3);
			var result2 = '${status.index}' % 3;
			
			var $divArea = $('<div class="primiumCheck">');
			if(result2 == 0) {
				$('#primiumZone').append($divArea);
			}
			
			var $div = $('<div class="primiumBoardList">');
			
			var $input = $('<input type="hidden" name="boNum" value="${cBoard.boNum}">');
			
			var $div1 = $('<div class="boardImg">');
			var $img = $('<img src="${ contextPath }/resources/images/emptyImage.png">');
			
			var $div2 = $('<div class="boardCon">');
			
			var $div3 = $('<div class="leftCon">');
			var $div4 = $('<div class="rightCon">');
			
			var $div5 = $('<div class="boardCate">');
			var $div6 = $('<div class="boardTitle">');
			var $div7 = $('<div class="boardReq">');
			var $div8 = $('<div class="pBoardContents">');
			
			var $div9 = $('<div class="rightBtn">');
			var $div10 = $('<div class="rightBtn">');
			var $div11 = $('<div class="rightBtn">');
			

			if('${cBoard.thumbnail}' != '') {
				$img.attr("src", '${ contextPath }/resources/real_photo/${cBoard.thumbnail}')
			} // 확인 필요
			
			if('${cBoard.boCategory}' == 1) {
				$div5.text('컨텐츠 제작');
			} else if('${cBoard.boCategory}' == 2) {
				$div5.text('컨텐츠 수정');
			} else {
				$div5.text('기타');
			}
			
			$div6.text('${cBoard.boTitle}');
			$div7.html('의뢰인 : <span class="smallOption">' + '${cBoard.boWriter}' + '</span>');
			
			$('#removeImg').empty();
			$('#removeImg').html('${cBoard.boContent}');
			$('#removeImg').find('img').remove();
			$('#removeImg').find('br').remove();
			$div8.html($('#removeImg').html());
			
			if('${cBoard.cbStep}' == 1) {
				$div9.text('참여인원 : ${cBoard.boReNum} 명');
			} else {
				$div9.text('참여인원 : 마감');
			}
			
			if('${cBoard.cbDate}' == 0) {
				$div10.text('기간 : 제한 없음');
			} else if('${cBoard.cbDate}' == '마감') {
				$div10.text('기간 : 마감');
			} else {
				var date = new Date('${cBoard.cbDate}');
				$div10.text('기간 : ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ' + date.getHours() + '시 ' + date.getMinutes() + '분');
			}
			
			if('${cBoard.cbCash}' == 0) {
				$div11.text('의뢰비 : 미정');
			} else {
				$div11.text('의뢰비 : ${cBoard.cbCash} CASH');
			}
			
			$div1.append($img);
			
			$div3.append($div5);
			$div3.append($div6);
			$div3.append($div7);
			$div3.append($div8);
			
			$div4.append($div9);
			$div4.append($div10);
			$div4.append($div11);
			
			$div2.append($div3);
			$div2.append($div4);
			
			$div.append($input);
			$div.append($div1);
			$div.append($div2);
			
			$('.primiumCheck').eq(result1).append($div);
		</script>
	</c:forEach>
	
	<script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
	<script>
		$('#primiumZone').slick({
			autoplay : true,
			dots: false,
			speed : 300,
			infinite: true,
			autoplaySpeed: 1500,
			arrows: true,
			slidesToShow: 1,
			slidesToScroll: 1,
			fade: false
		});
	</script>
	
	<div style="height: 50px;"></div>
	<hr>
	<div id="cashCategorySelectArea">
		<div class="categories">
			<span>1:1매칭</span>
		</div>
		<div class="forLine"></div>
		<div class="categories">
			<span>입찰</span>
		</div>
		<div class="forLine"></div>
		<div class="categories">
			<span>콘테스트</span>
		</div>
	</div>
	<hr>

	<div class="mainBackground">
		<!-- 게시판 리스트 상단 -->
		<div id="oneHeader">
			<div class="mainHeaderBar">1:1 매칭</div>
			<div class="mainBar">
				한 명의 디자이너에게 의뢰하고 싶을 때는 1:1 프로젝트를 이용하세요.<br>
				프로젝트 내용을 등록하면 관심있는 디자이너가 지원합니다.
			</div>
			<div class="mainHeaderBar" style="display: none;">입찰</div>
			<div class="mainBar" style="display: none;">
				저렴한 가격으로 디자인을 이용해보세요.<br>
				프로젝트 내용을 등록하면 관심있는 디자이너가 지원합니다.
			</div>
			<div class="mainHeaderBar" style="display: none;">콘테스트 프로젝트</div>
			<div class="mainBar" style="display: none;">
				굉장히 쉽고 빠르게 의뢰하면서<br>
				다양한 에디터들에게 수많은 디자인을 받아보세요.
			</div>
			<div class="requestBtn">의뢰하기</div>
		</div>

		<!-- 프리미엄 게시판은 추후 추가 -->
		
		
		


		<!-- 일반 게시판 -->
		<div id="buttonSelectNSerch">
			<div id="dropCategory">
				<div id="buttonSelect">&nbsp;전체 카테고리</div>
				<div class="dropdown-category">
					<span onclick="selectCate('');">전체 보기</span>
					<span onclick="selectCate(1);">제작 디자인</span>
					<span onclick="selectCate(2);">편집 디자인</span>
					<span onclick="selectCate(3);">기타 디자인</span>
				</div>
			</div>
			<div id="dropProgress">
				<button class="buttonDrop" onclick="buttonDrop(0)">전체</button>
				<button class="buttonDrop" onclick="buttonDrop(1)">진행</button>
				<button class="buttonDrop" onclick="buttonDrop(3)">마감</button>
			</div>
			
			<script>
				function basicSetting(i) {
					$('.buttonDrop').css('background-color', '#FF7043');
					$('.buttonDrop').css('color', 'white');
					$('.buttonDrop').eq(i).css('background-color', '#EFEBE9');
					$('.buttonDrop').eq(i).css('color', 'black');
				}
				basicSetting(0);
				
				$('.buttonDrop').hover(function(){
					if($(this).css('color') == 'rgb(255, 255, 255)') {
						$(this).css('background-color', '#F4511E');
					}
				}, function(){
					if($(this).css('color') == 'rgb(255, 255, 255)') {
						$(this).css('background-color', '#FF7043');
					}
				})
			</script>

			<div id="searchCategory">
				<div id="searchSelect">검색 ▼</div>
				<div class="searchDropdown-category">
					<span onclick="searchCate('제목');">제목</span>
					<span onclick="searchCate('내용');">내용</span>
					<span onclick="searchCate('의뢰인');">의뢰인</span>
				</div>
			</div>
			<div id=searchBtn>
				<input type="text" class="buttonSearch" placeholder="&nbsp;게시글 검색">

				<div class="imgSearchBtn">
					<img id="imgSearch" src="${ contextPath }/resources/images/imgSearch3.png" alt="go" onclick="searchGo();">
				</div>
			</div>
		</div>
		
		<div id="attachFromHere">
			<c:forEach var="cBoard" items="${ list2 }" varStatus="status">
				<div class="boardList">
					<input type="hidden" name="boNum" value="${ cBoard.boNum }">
					<div class="boardImg">
						<c:if test="${ !empty cBoard.thumbnail }">
							<img src="${ contextPath }/resources/real_photo/${ cBoard.thumbnail }">
						</c:if>
						
						<c:if test="${ empty cBoard.thumbnail }">
							<img src="${ contextPath }/resources/images/emptyImage.png">
						</c:if>
					</div>
					<div class="boardCon">
						<div class="leftCon">
							<div class="boardCate">
								<c:if test="${ cBoard.boCategory == 1 }">
									컨텐츠 제작
								</c:if>
								
								<c:if test="${ cBoard.boCategory == 2 }">
									컨텐츠 수정
								</c:if>
								
								<c:if test="${ cBoard.boCategory == 3 }">
									기타
								</c:if>
							</div>
							<div class="boardTitle">${ cBoard.boTitle }</div>
							<div class="boardReq">
								의뢰인 : <span class="smallOption">${ cBoard.boWriter }</span>
							</div>
							<div class="boardContents"></div>
						</div>
						<div class="rightCon">
							<div class="rightBtn">
								<c:if test="${ cBoard.cbStep == 1 }">
									참여인원 : ${ cBoard.boReNum } 명
								</c:if>
								
								<c:if test="${ cBoard.cbStep != 1 }">
									참여인원 : 마감
								</c:if>
							</div>
							<div class="rightBtn inputDate">
								<c:if test="${ cBoard.cbDate eq '0' }">
									기간 : 제한 없음 
								</c:if>
								
								<c:if test="${ cBoard.cbDate eq '마감' }">
									기간 : 마감
								</c:if>
								
								<c:if test="${ cBoard.cbDate ne '0' and cBoard.cbDate ne '마감' }">
									기간 : ${ cBoard.cbDate }
									
									<script>
										var date = new Date("${cBoard.cbDate}");
										$('.inputDate').eq('${status.index}').text('기간 : ' + date.getYear() + '/' + (date.getMonth() + 1) + '/' + date.getDay());
									</script>
								</c:if>
							</div>
							<div class="rightBtn">
								<c:if test="${ cBoard.cbCash == 0 }">
									의뢰비 : 미정
								</c:if>
								
								<c:if test="${ cBoard.cbCash != 0 }">
									의뢰비 : ${ cBoard.cbCash } CASH
								</c:if>
							</div>
						</div>
					</div>
				</div>
				
				<script>
					$('#removeImg').empty();
					$('#removeImg').html('${cBoard.boContent}');
					$('#removeImg').find('img').remove();
					$('#removeImg').find('br').remove();
					$('.boardContents').eq('${status.index}').html($('#removeImg').html());
					
					if('${status.index}' >= 5) {
						$('.boardList').eq('${status.index}').hide();
					}
				</script>
			</c:forEach>
		</div>
		
		<div id="loadingArea">
			<img src="${ contextPath }/resources/images/loading.gif">
		</div>

		<script>
			var boGroup = 2;
			var boCategory = null;
			var cbStep = 0;
			
			var listSize = '${list2Size}';
			var viewNum = 5;
		
			$('.categories').click(function(){
				$('.mainHeaderBar').hide();
				$('.mainBar').hide();
				$('.mainHeaderBar').eq($(this).index() / 2).show();
				$('.mainBar').eq($(this).index() / 2).show();
				
				boGroup = $(this).index() / 2 + 2;
				boCategory = null;
				basicSetting(0);
				cbStep = 0;
				callAjax(boGroup, boCategory, cbStep);
			});
			
			function selectCate(data) {
				$('.dropdown-category').css('display', 'none');
				
				if(data == '') {
					boCategory = null;
				} else {
					boCategory = data;
				}
				callAjax(boGroup, boCategory, cbStep);
				
				setTimeout(function(){
					$('.dropdown-category').css('display', '');
				}, 200);
			}
			
			function buttonDrop(data) {
				if(data == 3) {
					basicSetting(2);
				} else {
					basicSetting(data);
				}
				
				cbStep = data;
				callAjax(boGroup, boCategory, cbStep);
			} 
			
			function makeAppend(data) {
				var $div = $('<div class="boardList">');
				
				var $input = $('<input type="hidden" name="boNum" value="' + data.boNum + '">');
				
				var $div1 = $('<div class="boardImg">');
				var $img = $('<img src="${ contextPath }/resources/images/emptyImage.png">');
				
				var $div2 = $('<div class="boardCon">');
				
				var $div3 = $('<div class="leftCon">');
				var $div4 = $('<div class="rightCon">');
				
				var $div5 = $('<div class="boardCate">');
				var $div6 = $('<div class="boardTitle">');
				var $div7 = $('<div class="boardReq">');
				var $div8 = $('<div class="boardContents">');
				
				var $div9 = $('<div class="rightBtn">');
				var $div10 = $('<div class="rightBtn">');
				var $div11 = $('<div class="rightBtn">');
				

				if(data.thumbnail != undefined) {
					$img.attr("src", '${ contextPath }/resources/real_photo/' + data.thumbnail)
				}
				
				if(data.boCategory == 1) {
					$div5.text('컨텐츠 제작');
				} else if(data.boCategory == 2) {
					$div5.text('컨텐츠 수정');
				} else {
					$div5.text('기타');
				}
				
				$div6.text(data.boTitle);
				$div7.html('의뢰인 : <span class="smallOption">' + data.boWriter + '</span>');
				
				$('#removeImg').html(data.boContent);
				$('#removeImg').find('img').remove();
				$('#removeImg').find('br').remove();
				$div8.html($('#removeImg').html());
				
				if(data.cbStep == 1) {
					$div9.text('참여인원 : ' + data.boReNum + ' 명');
				} else {
					//$('.boardList').css("opacity", "0.4");
					$div9.text('참여인원 : 마감');
				}
				
				if(data.cbDate == 0) {
					$div10.text('기간 : 제한 없음');
				} else if(data.cbDate == '마감') {
					$div10.text('기간 : 마감');
				} else {
					var date = new Date(data.cbDate);
					$div10.text('기간 : ' + (date.getMonth() + 1) + '월 ' + date.getDate() + '일 ' + date.getHours() + '시 ' + date.getMinutes() + '분');
				}
				
				if(data.cbCash == 0) {
					$div11.text('의뢰비 : 미정');
				} else {
					$div11.text('의뢰비 : ' + data.cbCash + ' CASH');
				}
				
				$div1.append($img);
				
				$div3.append($div5);
				$div3.append($div6);
				$div3.append($div7);
				$div3.append($div8);
				
				$div4.append($div9);
				$div4.append($div10);
				$div4.append($div11);
				
				$div2.append($div3);
				$div2.append($div4);

				$div.append($input);
				$div.append($div1);
				$div.append($div2);
				
				return $div;
			}
			
			function callAjax(boGroup, boCategory, cbStep) {
				$.ajax({
					url: 'ajaxCBoard.ch',
					data: {boGroup: boGroup, boCategory: boCategory, cbStep: cbStep},
					type: 'post',
					success: function(list){
						$('#attachFromHere').empty();
						listSize = list.length;
						viewNum = 5;
						
						for(var i in list) {
							var $div = makeAppend(list[i]);
							$('#attachFromHere').append($div);
							
							if(i >= 5) {
								$('.boardList').eq(i).hide();
							}
						}
					}
				});
			}
			
			$('.requestBtn').click(function(){
				if('${loginUser.userId}' == "") {
					swal({
	                  title: "로그인 후 사용 가능합니다.",
	                  text: "YES를 누르면 로그인 페이지로 이동합니다.",
	                  icon: "info",
	                  buttons: ["NO", "YES"]
	                   }).then((YES) => {
	                  if (YES) {
	                     flag = true;
	                     location.href='gologin.me'; 
	                  }else{
	                     flag = false;
	                  }
	               });
	               Promise.all([swal]).then(function(){});
				} else {
					location.href="writeView.ch?boardType=" + boGroup;
				}
			});
			
			$(document).on('click', '.boardList', function(){
				location.href = 'detailView.ch?boNum=' + $(this).find('input').val()
			})
			
			$(document).on('click', '.primiumBoardList', function(){
				location.href = 'detailView.ch?boNum=' + $(this).find('input').val()
			})
			
			$(window).scroll(function() {
				if(Math.round($(window).scrollTop()) == $(document).height() - $(window).height()) {
					if(listSize > viewNum) {
						$('#loadingArea').show();
						
						setTimeout(function(){
							for(var i = 0; i < 5; i++) {
								$('.boardList').eq(viewNum + i).show();
							}
							
							viewNum = viewNum + 5;
							$('#loadingArea').hide();
						}, 1000);
					}
				}
			});

			function searchGo(){
			var searchText = $('.buttonSearch').val();
			console.log("검색한 searchText :", searchText);
			
			var searchCate = $('#searchSelect').text();
			console.log("searchCate : ",searchCate); 
			console.log("searchCate : ",searchCate.length); 
			
			if(searchCate == '검색 ▼') {
				swal("내용 확인", "검색 카테고리를 선택하세요.", "error");
							return false;
				if(searchText.length < 2 || searchCate.length < 2){
						swal("내용 확인", "검색은 두 글자 이상 입력해주세요.", "error");
						$('.buttonSearch').reset();
						return false;
					}
			}
			$.ajax({
				url : "ajaxCBoardSearch.ch",
				type : "post",
				data: {boGroup: boGroup, boCategory: boCategory, cbStep: cbStep, searchCate:searchCate, searchText:searchText },
	
				success : function(list) {
					$('#searchSelect').text("검색 ▼");
					if(list == 0){
						swal("검색 결과가 없습니다.");
						$('.buttonSearch').val("");
							return false;
					}
					/* 검색성공 */
					$('.buttonSearch').val("");
					$('#attachFromHere').empty();
						listSize = list.length;
						viewNum = 5;
						
						for(var i in list) {
							var $div = makeAppend(list[i]);
							$('#attachFromHere').append($div);
							
							if(i >= 5) {
								$('.boardList').eq(i).hide();
							}
						}
				}, error : function(){
					console.log("boGroup", boGroup);
				}			
			});  
			}
		</script>

		<!-- 검색 -->
		<script>

		</script>
		<!-- <script>
			$(function(){
				var closeBoard = '${ cBoard.cbStep != 1 }';
				if(closeBoard) {
					$('.boardList').css("opacity", "0.1");
				} 
			})
		</script> -->
	</div>

</body>
</html>