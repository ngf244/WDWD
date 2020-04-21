<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
@import url(//fonts.googleapis.com/earlyaccess/notosanskr.css);
<link href ="https: //fonts.googleapis.com /css?family=Noto+Sans+KR&display =swap" rel ="stylesheet ">
	#content {
	width: 100%;
	min-height: 600px;
}
body{font-family: "Noto Sans KR", sans-serif;}
#slideBar {
	margin-top: 50px;
	width: 100%;
	height: 200px;
	border: 1px solid black;
}
.mainBackground {
	background-color: rgba(224, 224, 224, 0.16);
	border-bottom: 1px solid rgba(200, 200, 200, 0.7);
	padding-bottom: 40px;
}
#randomThumbnail {
	width: 200px;
	height: 200px;
	border: 1px solid black;
	display: block;
	position: absolute;
}
#randomThumbnailForm {
	margin-left: 1150px;
	margin-top: 0px;
	width: 200px;
	height: 200px;
	display: inline;
	position: absolute;
	text-align: center;
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
#mainBar {
	display: inline-table;
	margin-top: 0px;
	margin-left: 30px;
	
	font-size: 20px;
	line-height: 200%;
	height: 100px;
}
#manyProjectForm{
	margin-left:30px;
	width: 40%;
}
#manyProject {
	margin-top: 30px;
	margin-left: 0px;
	margin-bottom: 30px;
	width: 7%;
	font-size: 20px;
	border: 0px;
}




.imgSearchBtn{
	display: inline-block;
	width: 45px;	
	height: 70px;
}
#img-thumbnail1 {
	width: 200px;
	height: 200px;
	border: 1px solid black;
}
.boardCate {
	color: #e54e40;
	display: inline-block;
	font-size: 19px;
}
.boardTitle {
	color: black;
	display: inline-block;
	font-size: 19px;
}
.boardContent {
	color: black;
	display: inline-block;
	font-size: 14px;
	overflow: hidden;
	text-overflow: ellipsis;
}
#categoryName {
	display: inline-block;
	height: 40px;
}
#categorySubject {
	display: inline-block;
}
#contentName {
	height: 100px;
}
.boardList {
	cursor:pointer;
	padding: 10px;
	margin: 20px;
	border: 1px solid #d6d6d6;
	border-bottom-color: #b8b8b8;
	border-right-color: #b8b8b8;
	display: flex;
}
.boardList:hover{
	background: rgba(161, 206, 244, 0.1);
}
.boardImg {
	display: inline-block;
	width: 140px;
	height: 140px;
	margin: 5px;
	margin-top:13px;
}
.boardImg img{
width:100%;
height: 100%;
}
.boardReq{
	font-size: 15px;
	margin-top: 10px;
	padding-bottom:5px;
	margin-bottom: 13px; 
	border-bottom:1px solid black;
}
.boardCon {
	/* width 값은 script로 별도 지정 */
	display: inline-table;
	width:auto;
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
.rightCon {
	margin-left: 35px;
	display: inline-table;
	width: 25%;
	height: 140px;
}
.rightBtn {
	display: inline-table;
	width: 100%;
	height: 38px;
	margin: 5px;
	margin-top:8px;
	line-height: 35px;
	font-weight: bold;
	text-align: center;
	border-radius: 5px;
	background-color: rgb(235, 239, 242);
	line-height: 35px;
}
/* 무한 페이징 처리 예정
#pageNum {
	margin-top: 15px;
	margin-left: 17px;
	margin-right: 20px;
	text-align: left;
	border-top: 1px solid black;
	padding-top: 8px;
}
.pageBtn {
	display: inline-table;
	width: 40px;
	height: 40px;
	line-height: 40px;
	margin: 1px;
	cursor: pointer;
	text-align: center;
}
#pageNum :nth-child(1) {
	background-color: #302f3a;
	color: white;
}
#pageNum :nth-child(2) {
	background-color: #ddd;
	color: black;
}
#pageNum :nth-child(3) {
	background-color: #ddd;
	color: black;
}
*/



/* 카테고리, 진행상태 버튼 */
#buttonSelectNSerch {
	margin-left: 20px;
	margin-right: 20px;
	position: relative;
	display: inline-table;
	height: 50px;
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
#buttonSelectNSerch {
	display: block;
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
.dropdown-category > span {	
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


/* 전체,진행,마감 */
#dropProgress {
	width: 30%;
	display: inline-block;
	margin-left:100px;
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
    width:120px;
    background-color: #f8585b;
    border: none;
    outline: none;
    color:#fff;
    padding: 13px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
    margin-right: 2px;
    cursor: pointer;
   	border-bottom: 1.5px solid rgb(235, 239, 241);
   	border-top: 1.5px solid rgb(235, 239, 241);
    
}
.buttonDrop:hover{
	background:pink;
}
.buttonDrop:nth-child(1){
	margin-right: 3px;
	background:white; 
	color:black;
}
/* #guideBtn {
	display: inline-block;
	line-height: 34px;
	height: 34px;
	background-color: rgba(161, 206, 244, 0.55);
	padding: 8px;
	font-size: 15px;
	border: 0px solid rgba(200, 200, 200, 0.6);
	cursor: pointer;
} */


#searchBtn {
	width: 270px;
	height: 50px;
	display: inline-block;
	margin-left: 120px;
	margin-right: 10px;
}
.buttonSerch {
	display: inline-block;
	line-height: 34px;
	height: 34px;
	background-color: white;
	padding: 2px;
	font-size: 15px;
	border: 1px solid #b8b8b8x;
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
.requestBtn {
	display: inline-block;
}
.requestBtn > a {	
    width: 120px;
    background-color: #f8585b;
    border: none;
    outline: none;
    color: #fff;
    padding: 13px 0;
    text-align: center;
    text-decoration: none;
    display: inline-block;
    font-size: 15px;
	font-weight: bold;
	margin-left: 15px;
    margin-right: 2px;
    cursor: pointer;
} 
.requestBtn > a:hover{
	background-color: pink;
	}


#searchSelect {
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
#searchCategory {
	position: relative;
	display: inline-block;
	text-align: center;
	
}
.searchDropdown-category {
	display: none;
	position: absolute;
	background-color: rgba(161, 206, 244, 0.55);
	min-width: 120%;
	padding: 8px;
	text-align: center;
}
.searchDropdown-category a {
	color: black;
		text-decoration: none;
		text-align: center;
	display: block;
}
.searchDropdown-category a:hover {
	background-color: rgb(52, 152, 219);
}
#searchCategory:hover .searchDropdown-category {
	display: block;
}
#searchCategory:hover #searchSelect {
	background-color: rgb(52, 152, 219);
}
.searchDropdown-category > a {	
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
	
}

</style>
<title>입찰</title>
</head>
<body>

	<%-- <jsp:include page="../../common/mainHeader.jsp" />
	<section> --%>
		<div id="content">
			<!-- <div id="left-side" style="background-color: yellow;">
				<div>왼쪽 영역</div>
			</div> -->

			<!-- 공용영역 -->
			<div style="background: white;">
				<div class="mainBackground">
					<div id="randomThumbnailForm">
						1:1에 참여하세요
						<div id="randomThumbnail">랜덤 사진값</div>
					</div>

					<!-- 게시판 리스트 상단 -->
					<div id="oneHeader">
						<div class="mainHeaderBar">입찰</div>
							<div id="mainBar">
								 저렴한 가격으로 디자인을 이용해보세요.<br> 프로젝트 내용을 등록하면 관심있는 디자이너가 지원합니다.
							</div>

					</div>
				</div>

				<div id="manyProjectForm">총 <input type="text" id="manyProject" name="manyContestProject"
					value="000" readonly="readonly">개의 프로젝트가 선정되었습니다.
				</div>	

				<div id="buttonSelectNSerch">
					<div id="dropCategory">
						<div id="buttonSelect">&nbsp;전체 카테고리</div>
						<div class="dropdown-category" >
							<span onclick="selectCate();">전체 보기</span> 
							<span onclick="selectCate(1);">제작 디자인</span> 
							<span onclick="selectCate(2);">편집 디자인</span> 
							<span onclick="selectCate(3);">기타 디자인</span>
						</div>
					</div>
					<div id="dropProgress">
						<button class="buttonDrop" onclick="buttonDrop(1)">전체</button>
						<button class="buttonDrop" onclick="buttonDrop(2)">진행</button>
						<button class="buttonDrop" onclick="buttonDrop(3)">마감</button>
					</div>
					<!-- <div id="guideBtn">이용 가이드</div> -->
					
					
						<div id="searchCategory">
							<div id="searchSelect">&nbsp;검색</div>
							<div class="searchDropdown-category">
								<a href="#">제목</a> 
								<a href="#">내용</a> 
								<a href="#">의뢰인</a>
							</div>
						</div>
					<div id=searchBtn>
						<input type="text" class="buttonSerch" placeholder="&nbsp;게시글 검색"> 
						<div class="imgSearchBtn">
							<img id="imgSearch" src="${ contextPath }/resources/images/imgSearch1.png" alt="go">
						</div>
					</div>
					<div class="requestBtn">
						<a href="writeView.ch?boardType=3">의뢰하기</a>
					</div>
				</div>


				<!-- 리스트 시작 -->
			    <c:forEach var="oneImg" items="${ list2 }">
					<div class="boardList">
						<input type="hidden" name="boNum" value="${ oneImg.boNum }">
						
						<div class="boardImg">
								<img src="${ contextPath }/resources/images/rose1.jpg" alt="기본이미지">
						</div>
						<div class="boardCon">
								<div class="leftCon">
								<div class="boardCate">
									<b class="boardCategory">
											<c:if test="${ oneImg.boCategory == 1}"> 
												제작 디자인 &nbsp; |
											</c:if>
											<c:if test="${ oneImg.boCategory == 2}"> 
												편집 디자인 &nbsp; |
											</c:if>
											<c:if test="${ oneImg.boCategory == 3}"> 
												기타 디자인 &nbsp; |
											</c:if>
								    </b>
									
								</div>
								&nbsp;
								<div class="boardTitle">
									<b>${ oneImg.boTitle }</b>
								</div>
								<div class="boardReq">의뢰인 : ${ oneImg.boWriter }   </div> 
									<div class="boardContent">
										${ oneImg.boContent }
									</div>
									
							</div>
							<div class="rightCon">
								<div class="rightBtn">참여자 : ${ oneImg.boReNum }명</div>
								<div class="rightBtn" id="timer">${ oneImg.cbDate }</div>
								<div class="rightBtn">상금 : ${ oneImg.cbCash }만원</div>
							</div>
						</div>
					</div>
				</c:forEach>
				

				<!-- 쪽번호 부분 -->
				<script>
					$('.boardCon').width($('.boardList').width() - 200)
				</script>

				<div id="pageNum">
					<!-- <div class="pageBtn">1</div>
					<div class="pageBtn">2</div>
					<div class="pageBtn">3</div> -->
					<!-- 의뢰  버튼  -->
					
				</div>
			</div>


			<!-- main영역 끝 -->
		</div>

		<!-- 공용영역 -->
		<!-- <div id="right-side" style="background: blue">
			<div>오른쪽 영역</div>
		</div> -->
	<%-- </section>	
	<jsp:include page="../../common/footer.jsp" /> --%>

	<script>
		var clicked = true;
		$(function(){
		     $(".buttonDrop").click(function() {
		    	 $choice = $(this);
		    	 $choice.css({background:"white", color:"black"});
		           
		    	 $(".buttonDrop").not($choice).css({background:"#f8585b", color:"white"});
		          
		       });
		});
		
	
	</script>


	<script>
		var time = 30;
		var min = "";
		var sec = "";
		
		var x = setInterval(function(){
			min = parseInt(time/60);
			sec = time%60;
			
			$('#timer').html(min + "분 " + sec + "초");
			time --;
			if(time < 0){
				clearInterval(x);
				$('#timer').html("마감되었습니다.");
			}
			
		},1000);
		
	
	
	</script>
	
	<!-- 제작, 편집, 기타 카테고리 버튼  -->
	<script>
	
		$('.boardList').on('click', function(){
			var boNum = $(this).children("input[name=boNum]").val();
			location.href= "detailView.ch?boNum=" + boNum; 
		});
		
	
	
		function selectCate(e){
			var boCategory = e;
		    var	boGroup2 = "3";
			
			
			$.ajax({
				   url: "actionCateList.ch",	
		            type: "GET",
		            data: {"boCategory" : boCategory, "boGroup2" : boGroup2 },
		            success: function(data){
		                $('.auctionListView').html(data);
		            },
		            error: function(){
		                alert("1:1 카테고리 실패");
		            }
				   
			   });
			
			
			/* var boGroup1 = "1";
			console.log(e);
			var e = e;
			location.replace('actionList.ch?boGroup2='+ 2 + '&selectCate=' + e +'&boGroup1=' + boGroup1); */
			//location.href="actionList.ch?boGroup="
			/* 이부분 다시 고치자 */
		}	
	</script>

</body>
</html>