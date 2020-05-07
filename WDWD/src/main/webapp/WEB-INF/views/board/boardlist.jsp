<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유갤러리</title>
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
<style>
   .freeBackground {
      background-color: rgba(224, 224, 224, 0.16);
      border-bottom: 1px solid rgba(200, 200, 200, 0.7);
      padding-top: 20px;
      padding-bottom: 20px;
   }
   
   .freeHeaderBar {
      display: inline-table;
      margin-top: 50px;
      margin-left: 100px;	
      text-align: left;
      font-size: 33px;
      font-weight: bolder;
      height: 90px;
   }
   #freeBar {
      display: inline-table;
      margin-top: 0px;
      margin-left: 30px;
      font-size: 20px;
      line-height: 200%;
      height: 100px;
   }
   #freeMenuBar{
      position: relative;
   }
   
   
   #freeDropCategory {
	position: relative;
	z-index : 99;
	display: inline-block;
	text-align: center;
	
}
   
   #freebuttonselect {
      width: 134px;
      line-height: 34px;
      height: 34px;
      background-color: rgba(161, 206, 244, 0.55);
      padding: 8px;
      font-size: 15px;
      border: none;
      font-weight: bolder;
   }
   
   .freedropdown-category {
      display: none;
      position: absolute;
      background-color: rgba(161, 206, 244, 0.55);
      min-width: 75px;
      padding: 8px;
      text-align: center;
   }
   
   .freedropdown-category a {
      color: black;
      text-decoration: none;
      text-align: center;
      display: block;
   }
   
   .freedropdown-category a:hover {
      background-color: rgb(52, 152, 219);
   }
   
   #freeDropCategory:hover .freedropdown-category {
      display: block;
   }
   
   #freeDropCategory:hover #freebuttonselect {
      background-color: rgb(52, 152, 219);
   }
   .freedropdown-category > a {   
      width: 134px;
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
   
   
   #searchArea{
      width: 430px;
      position: absolute;
      right: 0%;
      top: 0%;
      vertical-align: top;
      display: inline-block;
   }
   select[name="searchCate"]{
      display: inline-block;
      height: 48px;
      width: 120px;
      background-color: rgba(161, 206, 244, 0.55);
      border: 0.5px solid lightgray;
      font-size: 15px;
   }
   select[name="searchOption"]:hover{
      background-color: rgb(52, 152, 219);
      font-weight: bold;
   }
   input[name="searchWord"]{
      height: 45px;
      width: 230px;
      background-color: rgba(161, 206, 244, 0.55);
      margin-left: 5px;
      border: 0.5px solid lightgray;
      text-align: center;
      font-size: 15px;
   }
   input[name="searchWord"]+div{
      width: 45px;
      height: 45px;
      position: absolute;
      right: 3%;
      top: 5%;
      border: 0px solid black;
   }
   
   #freeBoardTitle{
      width: 98.5%;
      height: 45px;
      border: 3px solid rgba(204,204,204, 0.55);
      margin: auto;
      margin-top: 10px;
   }
   .input{
      /* position: absolute; */
      display: inline-block;
      line-height: 44px;
      height: 45px;
      font-weight: bolder;
      text-align: center;
      margin-left: 1.5%;
      margin-right: 1.5%;
   }
   .box1{
      width: 12%;
   }
   .box2{
      width: 30%;
   }
   .box3{
      width: 14%;
   }
   .box4{
      width: 5%;
   }
   .box5{
      width: 8%;
   }
   .box6{
      width: 8%;
   }
   .freeBoardList{
      width: 98.5%;
      height: 50px;
      margin: auto;
      margin-top: 3px;
      border-top: 1px solid rgba(204,204,204, 0.55);
      cursor: pointer;
   }
   .freeBoardList div[class~=box1]{
      color: orange;
   }
   .freeBoardList div[class~=box2] ~ div{
      font-weight: normal;
   }
   #freeBoardEnd{
      display: inline-block;
      width: 98.5%;
      margin: auto;
      height: 0;
      border-bottom: 1px solid black;
   }
   .pagingCenter{
      position: relative;
      text-align: center;
   }
   
   .pagination{
   	margin: 0 auto;
      min-width: 0px;
      display: inline-block;
      text-align: center;
       
   }
   .pagination a {
     display: inline-block;
     color: black;
     padding: 8px 16px;
     text-decoration: none;
     transition: background-color .3s;
     border: 1px solid #ddd;
   }
   
   .pagination a:hover:not(.currentP) {background-color: #ddd;}
   
   .writingBtnArea{
      position: absolute;
      width: 10%;
      height: 40px;
      right: 3%;
      top: 2%;
   }
   
     .pagination .currentP{
  	 background-color: red;
  	 color:white;
   	 
   }

   .writingBtn{
      display: block;
      width: 100%;
      height: 100%;
   }
   .sideMenu{
      position: absolute;
      left: 4%;
      top: 40%;
      width: 120px;
      height: 200px;
      background-color: white;
      display: table;
   }
   #sideTop{
      background-color: rgba(161, 206, 244, 0.55);
      width: 100%;
      height: 90px;
      border-radius: 90px 90px 0 0;
      border: 2px solid white;
      box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
       -webkit-transition: 0.5s ease;
      text-align: center;
      line-height: 100px;
   }
   #sideBottom{
      background-color: rgba(161, 206, 244, 0.55);
      width: 100%;
      height: 90px;
      border-radius: 0 0 90px 90px;
      margin-top: 20px;
      border: 2px solid white;
      box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.1);
       -webkit-transition: 0.5s ease;
      text-align: center;
      line-height: 80px;
   }
   #sideTop.open, #sideBottom.open{
      background-color: rgb(52, 152, 219);
        box-shadow: 0px 15px 20px rgba(116, 148, 197, 0.4);
        color: #fff;
        transform: perspective(100px) translateZ(10px);
      border: outset;
   }
   
   .boReNum{
   		color: orange;
   		font-size: small;
   }
   

      @import url(https://fonts.googleapis.com/css?family=Open+Sans:400);

</style>
</head>
<body>
   <jsp:include page="../common/mainHeader.jsp"/>
   <section>
      <div id="left-side">
         <div class="sideMenu">
            <div id="sideTop">자유</div>
            <div id="sideBottom">매칭</div>
         </div>
      </div>
      
      <script>
      $('#sideTop').hover(function(){
          $('#sideTop').css('-webkit-transition', 'none')
          $("#sideTop").removeClass("open");
          $('#sideTop').css('-webkit-transition', '0.5s ease')
          $("#sideTop").addClass("open");
       }, function(){
          $("#sideTop").removeClass("open");
       })
       $('#sideBottom').hover(function(){
          $('#sideBottom').css('-webkit-transition', 'none')
          $("#sideBottom").removeClass("open");
          $('#sideBottom').css('-webkit-transition', '0.5s ease')
          $("#sideBottom").addClass("open");
       }, function(){
          $("#sideBottom").removeClass("open");
       })
      </script>
      
      <div id="main" style="background: white">
         <div class="freeBackground">
              <div id="oneHeader">
               <div class="freeHeaderBar">자유 게시판</div>
               <div id="freeBar"></div>
            </div>
         </div>
         <br>
         <form>
         <div id="freeMenuBar">
            <div id="freeDropCategory">
					<div id="freebuttonselect">
						<c:if test="${boCategory == null or boCategory == ''}">
							전체
						</c:if>
						<c:if test="${boCategory != null}">
							${boCategory}
						</c:if>
					</div>
					<div class="freedropdown-category">
	                <a href="actionList.ch?boCategory=">전체</a> 
	                <a href="actionList.ch?boCategory=공통">공통</a> 
					<a href="actionList.ch?boCategory=짤방">짤방</a> 
					<a href="actionList.ch?boCategory=아무말">아무말</a> 
					<a href="actionList.ch?boCategory=요청">요청</a> 
					<a href="actionList.ch?boCategory=질문">질문</a>
					</div>
				</div>
            
               <div id="searchArea">
                  <select name="searchCate">
                     <option value="title">제목</option>
                     <option value="content">내용</option>
                     <option value="writer">작성자</option>
                     <option value="All">제목+내용</option>
                  </select>
                  <input name="searchWord" type="text" placeholder="검색어 입력">
                  <div><button type="submit"><img id="imgSearch" src="${ contextPath }/resources/images/imgSearch3.png" alt="go"></div>
                  </button></div>
               <script>
                  
               </script>
            </form>
         </div>

         <div id="freeBoardTitle">
            <div class="input box1">카테고리</div><!-- 카테고리 -->
            <div class="input box2">제목</div><!-- 제목 -->
            <div class="input box3">작성자</span></div><!-- 작성자 -->
            <div class="input box4">파일</div>  <!-- 파일 -->
            <div class="input box5">조회수</div> <!-- 조회수 -->
            <div class="input box6">추천수</div> <!-- 추천수 -->
         </div>


         
   		<c:forEach var="b" items="${ list }">
            <div class="freeBoardList">
               <input type="hidden" value="${ b.boNum }">
            
               <div class="input box1">${ b.boCategory }</div><!-- 카테고리 -->
               <div class="input box2">${ b.boTitle }<span class="boReNum">(${ b.boReNum })</span></div><!-- 제목 -->
               <div class="input box3"><span class="smallOption"><c:set var="rsgId" value="${ b.boWriter }" scope="session"/><c:set var="rsgNick" value="${ b.boWriterNick }" scope="session"/> ${ b.boWriterNick } </span></div><!-- 작성자 -->
               <div class="input box4"> ${ b.boFileExist } </div>  <!-- 파일 --> 
               <div class="input box5"> ${ b.boView  }</div> <!-- 조회수 -->
               <div class="input box6"> ${ b.boGood }</div> <!-- 추천수 -->
            </div>
         </c:forEach>
         
         <script>
                /* 쪽지 보내기 실행 */
               $('.smallOption').on('click', function(){
          	   	rsgId = '${ rsgId }';
                  rsgNick = '${ rsgNick }';
						console.log("rsgId", rsgId);
						console.log("rsgNick", rsgNick);
               });
         </script>
         


         <div id="freeBoardEnd"></div>
         <br>
         <!-- 페이징 처리 -->
         <div class="pagingCenter">
            <div class="pagination">
					
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
                     <c:if test="${ boCategory eq null || searchWord eq null }">
                         <!-- 카테고리나 검색값 없으면 기본 리스트 띄우기 -->
      						<c:set var="loc" value="actionList.ch" scope="page"/>  
                     </c:if>
                     
                     <c:if test="${ boCategory ne null || searchWord ne null }">
                        <c:set var="loc" value="actionList.ch" scope="page"/>  
                     </c:if>
                  </c:if>
                  <c:if test="${ pi.currentPage > 1 }">
                     <c:url var="blistBack" value="${ loc }">
                        <c:if test="${ boCategory ne null || searchWord ne null }">
                           <c:param name="boCategory" value="${ boCategory }"/>
                           <c:param name="searchCate" value="${ searchCate }"/>
                           <c:param name="searchWord" value="${ searchWord }"/>
                        </c:if>

                        <c:param name="page" value="${ pi.currentPage - 1}"/>
                     </c:url>
                     <a href="${ blistBack }">&lt;</a> &nbsp;
                  </c:if>
					<!-- 페이지 -->
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                  <c:if test="${ p eq pi.currentPage }">
                     <a class="currentP">${ p }</a>
						</c:if>
                  
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="blistCheck" value="${ loc }">
                        <c:if test="${ boCategory ne null || searchWord ne null }">
                           <c:param name="boCategory" value="${ boCategory }"/>
                           <c:param name="searchCate" value="${ searchCate }"/>
                           <c:param name="searchWord" value="${ searchWord }"/>
                        </c:if>     
                        <c:param name="page" value="${ p }"/>
							</c:url>
							<a href="${ blistCheck }">${ p }</a> &nbsp;
							</c:if>
               </c:forEach>
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="blistEnd" value="${ loc }">
                     <c:if test="${ boCategory ne null || searchWord ne null }">
                           <c:param name="boCategory" value="${ boCategory }"/>
                           <c:param name="searchCate" value="${ searchCate }"/>
                           <c:param name="searchWord" value="${ searchWord }"/>
                        </c:if>    
                         
							<c:param name="page" value="${ pi.currentPage + 1 }" />
						</c:url>
						<a href="${ blistEnd }">&gt;</a>
					</c:if>
               <!-- 쪽 번호 끝 -->


					<div class="sectionafter" style="display: inline-block"></div>
				</div>
				<div class="writingBtnArea" style="background-color: red;">
					<button class="writingBtn">글쓰기</button>
				</div>
         </div>
         
         <!-- 캐시게시판 시작 -->

			<div style="height: 100px;"></div>
			
			<jsp:include page="../cashboard/cBoardList.jsp" />
		</div>
      <div id="right-side"></div>
	</section>
   <jsp:include page="../common/footer.jsp" />
   

   <script>
      $('.writingBtn').click(function () {
         var userId = "${loginUser.userId}";
         if(userId==""){
            swal("You need Login", "로그인 후 사용 가능합니다.", "error");
            return false;
         }
         location.href = "writing.bo";
      });
   </script>
   
	<script>
		var menuPosition = $('.sideMenu').offset();
		$(window).scroll(function() {
			var scrollTop = $(window).scrollTop();
			$('.sideMenu').stop().animate({
				top : menuPosition.top + scrollTop
			}, 200);
		})
		$('#sideTop').click(function() {
			var freeBoardPosition = $('#menuHeaderWrap').offset();
			$('html').stop().animate({
				scrollTop : freeBoardPosition.top
			}, 300);
		})
		$('#sideBottom').click(
				function() {
					var cashCategorySelectAreaPosition = $('#cashCategorySelectArea').offset();
					$('html').stop().animate({
						scrollTop : cashCategorySelectAreaPosition.top
					}, 300);
				})
	</script>

	<script>
		/* 리스트로 글 넘기기 */
		$('.input.box2').on('click', function() {
			var boNum = $(this).prev().prev().val();
			console.log(boNum);
			location.href = "detail.bo?boNum=" + boNum;
		});
   </script>
   
   <!-- 1:1 검색 카테고리 -->
   <script>
      function searchCate(searchCate){
         $('#searchSelect').text(searchCate);
         
         /* display none되는 경우 안돌아오는 문제  */
         //$('.searchDropdown-category').css('display','none');
         // setTimeout(function() {
         //    $('.searchDropdown-category').css('display','block');
         // }, 1000);

      }
      </script>

   <!-- 1:1 검색 -->
   <script>
      $(".buttonSearch").keyup(function(e){if(e.keyCode == 13)  
         searchGo(); 
      });

      function searchGo(){
         searchText = $('.buttonSearch').val();
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
            url : "actionCateList.ch",
					type : "GET",
					data : {
						"boCategory" : boCategory,
						"boGroup" : boGroup,
						"cbStep" : cbStep
					},
					success : function(data) {
                  $('#searchSelect').text("검색 ▼");
                  if(data == 0){
                     swal("검색 결과가 없습니다.");
                     $('.buttonSearch').val("");
						return false;
                  }



                  $('#attachFromHere').empty();
						//console.log("3 : ",$boardList);
						for ( var i in data) {

							//console.log("검색한 i가 몇개? ", data.length);

							//console.log("검색한 data는?", data);

							var $newboardList = boardList.clone();
							$('#attachFromHere').append($newboardList);

							$('.boardBoNum').eq(i).val(data[i].boNum);
							$('.boardTitles').eq(i).html(data[i].boTitle);
							$('.boardReqs').eq(i).html(data[i].boWriter);
							$('.boardContents').eq(i).html(data[i].boContent);
							$('.rightBtns').eq(i).html(data[i].boReNum);
							$('.cbDate').eq(i).html(data[i].cbDate);
							$('.cbCash').eq(i).html(data[i].cbCash);
                  }
                  console.log("검색한 단어 ", $('.buttonSearch').val());
                  $('.buttonSearch').val("");
               }, 
               error : function() {
                  alert("검색 실패");
                  $('.buttonSearch').val("");
               }
         });   
      }


   </script>
	<script>
	   var swal;
	   var flag;
	      $('.writingBtn').off('click').on('click', function () {
	         var userId = "${loginUser.userId}";
						if(userId==""){
							swal({
	                     title: "로그인 후 사용 가능합니다.",
	                     text: "YES를 누르면 로그인 페이지로 이동합니다.",
	                     icon: "info",
	                     buttons: ["NO", "YES"]
	                      }).then((YES) => {
	                     if (YES) {
	                        flag = true;
	                        console.log("flag", flag);
	                        location.href='gologin.me'; 
                           //response.sendRedirect(request.getHeader("referer"));    
	                     }else{
	                        flag = false;
	                     }
	                  });
	                  Promise.all([swal]).then(function(){
	                     console.log(flag);
	                  });
						} else {
	                  location.href="writing.bo";
	
	               }
	      });
   </script>    

   <script>
      function premiumList(boGroup){
         console.log("어떤 그룹?", boGroup);
         $.ajax({
            url : "actionPremiumList.ch",
					type : "GET",
					data : {
						"boGroup" : boGroup,
					},
					success : function(data) {

                  $tableBody = $('.premium_list');
                  $tableBody.html('');

                  for ( var i in data) {
                     var $newboardList = boardList.clone();
							$('.premium_list').append($newboardList);

							$('.boardBoNum').eq(i).val(data[i].boNum);
							$('.boardTitles').eq(i).html(data[i].boTitle);
							$('.boardReqs').eq(i).html(data[i].boWriter);
							$('.boardContents').eq(i).html(data[i].boContent);
							$('.rightBtns').eq(i).html(data[i].boReNum);
							$('.cbDate').eq(i).html(data[i].cbDate);
							$('.cbCash').eq(i).html(data[i].cbCash);
                  }
                  console.log(data);
               }, 
               error : function() {
                  console.log("리스트 조회 실패");
               }
         });   

      }

   </script>

   <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
   <script>
      $('.premium_list').slick({
         slide: 'div',
         autoplay : true,
         dots: true,
         speed : 300,
         infinite: true,
         autoplaySpeed: 2000,
         arrows: true,
         slidesToShow: 4,
         slidesToScroll: 1,
         fade: false
      });
   </script>
</body>
</html>