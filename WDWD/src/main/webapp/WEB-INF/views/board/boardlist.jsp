<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유갤러리</title>
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
   select[name="searchOption"]{
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
      border: 1px solid black;
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
      vertical-align: middle;
   }
   
   .pagination{
   	  margin-left:33%;
      /* display: inline-block; */
       
   }
   .pagination a {
     display: inline-block;
     color: black;
     float: left;
     padding: 8px 16px;
     text-decoration: none;
     transition: background-color .3s;
     border: 1px solid #ddd;
   }
   
   

   
   .pagination a:hover:not(.currentP) {background-color: #ddd;}
   .writingBtnArea{
      display: inline-block;
      width: 10%;
      height: 40px;
      margin-left: 5%;
   }
   
     .pagination .currentP{
  	 background-color: red;
  	 color:white;
   	 
   }

   .writingBtn{
      display: inline-block;
      width: 100%;
      height: 100%;
   }
   #cashCategorySelectArea{
      width: 100%;
      height: 50px;
      margin: auto;
      background-color: rgba(224, 224, 224, 0.16);
      min-height: 50px;
      display: flex;
      justify-content: space-evenly;
      
   }
   
   .categories{
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
   .categories:hover{
      background-color: rgba(204,204,204, 0.55);
      cursor: pointer;
   }
   .categories span{
      display: table-cell;
      vertical-align: middle;
   }
   .forLine{
      width: 0;
      height: 45px;
      border: outset;
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
       transition: 0.5s ease;
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
       transition: 0.5s ease;
      text-align: center;
      line-height: 80px;
   }
   #sideTop:hover, #sideBottom:hover{
      background-color: rgb(52, 152, 219);
        box-shadow: 0px 15px 20px rgba(116, 148, 197, 0.4);
        color: #fff;
        transform: perspective(100px) translateZ(10px);
      border: outset;
   }
   
   
   
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
      <div id="main" style="background: white">
         <div class="freeBackground">
              <div id="oneHeader">
               <div class="freeHeaderBar">자유 게시판</div>
               <div id="freeBar"></div>
            </div>
         </div>
         <br>
         <div id="freeMenuBar">
            <div id="freeDropCategory">
               <div id="freebuttonselect">&nbsp;전체 카테고리</div>
               <div class="freedropdown-category">
                  <a href="#">제작 디자인</a> 
                  <a href="#">편집 디자인</a> 
                  <a href="#">기타 디자인</a>
               </div>
            </div>
            <form>
               <div id="searchArea">
                  <select name="searchOption">
                     <option value="title">제목</option>
                     <option value="content">내용</option>
                     <option value="writer">작성자</option>
                     <option value="All">제목+내용</option>
                  </select>
                  <input name="searchWord" type="text" placeholder="검색어 입력">
                  <div>돋보기 submit</div>
               </div>
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
 			<c:url var="bdetail" value="bdetail.bo">
				<c:param name="bId" value="${ b.boNum }"/>
				<c:param name="page" value="${ pi.currentPage }"/>
			</c:url>
         <div class="freeBoardList">
         	<input type="hidden" value="${ b.boNum }">
         
            <div class="input box1">${ b.boCategory }</div><!-- 카테고리 -->
            <div class="input box2">${ b.boTitle }</div><!-- 제목 -->
            <div class="input box3"><span class="smallOption"> ${ b.boWriter } </span></div><!-- 작성자 -->
            <div class="input box4"> ${ b.boReNum } </div>  <!-- 파일 -->
            <div class="input box5"> ${ b.boView  }</div> <!-- 조회수 -->
            <div class="input box6"> ${ b.boGood }</div> <!-- 추천수 -->
         </div>
        </c:forEach>


         
         <div id="freeBoardEnd"></div>
         <br>
         <div class="pagingCenter">
            <div class="pagination">
               		<!-- 페이징 처리 -->
					
						<!-- [이전] -->
						<c:if test="${ pi.currentPage <= 1 }">
							<a>[이전]</a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="actionList.ch">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
							</c:url>
							<a href="${ before }">[이전]</a> &nbsp;
						</c:if>
						
						<!-- 페이지 -->
						<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
							<c:if test="${ p eq pi.currentPage }">
								<a class="currentP">${ p }</a>
							</c:if>	
							
							<c:if test="${ p ne pi.currentPage }">
								<c:url var="pagination" value="actionList.ch">
									<c:param name="boGroup" value="${ pi.boGroup }"/>
									<c:param name="page" value="${ p }"/>
								</c:url>
								<a href="${ pagination }">${ p }</a> &nbsp;
							</c:if>
						</c:forEach>
						
						<!-- [다음] -->
						<c:if test="${ pi.currentPage >= pi.maxPage }">
							<a>[다음]</a>
						</c:if>
						<c:if test="${ pi.currentPage < pi.maxPage }">
							<c:url var="after" value="actionList.ch">
								<c:param name="page" value="${ pi.currentPage + 1 }"/>
							</c:url> 
							<a href="${ after }">[다음]</a>
						</c:if>
               
               
               
               <div class="sectionafter" style="display: inline-block"></div>
            </div>
            <div class="writingBtnArea" style="background-color: red;">
               <button class="writingBtn">글쓰기</button>
            </div>
         </div>
         <br><br><br><br><br><br><br>

         <hr>
         <div id="cashCategorySelectArea">
            <div class="categories" name="categories" value="2"><span>1:1매칭</span></div>
            <div class="forLine"></div>
            <div class="categories"><span>입찰</span></div>
            <div class="forLine"></div>
            <div class="categories"><span>콘테스트</span></div>
         </div>
         <hr>

         <div class="onBoarListView"><jsp:include page="../cashboard/oneBoardList.jsp"/></div>
         <div class="auctionListView" style="display: none;"><%-- <jsp:include page="../cashboard/auctionBoardList.jsp"/> --%></div>
         <div class="contestListView" style="display: none;"><%-- <jsp:include page="../cashboard/contestBoardList.jsp"/> --%></div>
      </div>
      <div id="right-side">
      </div>
   </section>
   <jsp:include page="../common/footer.jsp"/>
   <script>
      var menuPosition = $('.sideMenu').offset(); 
      $(window).scroll(function () {
         var scrollTop = $(window).scrollTop();
         $('.sideMenu').stop().animate({top:menuPosition.top+scrollTop},200);
      })
      $('#sideTop').click(function () {
         var freeBoardPosition = $('#menuHeaderWrap').offset();
         $('html').stop().animate({scrollTop:freeBoardPosition.top},300);
      })
      $('#sideBottom').click(function () {
         var cashCategorySelectAreaPosition = $('#cashCategorySelectArea').offset();
         $('html').stop().animate({scrollTop:cashCategorySelectAreaPosition.top},300);
      })
   </script>
      
   <script>
   
   	   //자유게시판과 함께 1:1게시판 열림
	   /* 
	   $(function(){
		   $(".onBoarListView").load("cashboard/oneBoardList.jsp");

		   
		   var boGroup2 = {boGroup2 : 2};
		   $.ajax({
			   url: "../cashboard/oneBoardList.jsp",
	            type: "POST",
	            dataType: text,
	            success: function(data){
	                $('.onBoarListView').html(data);
	            },
	            error: function(){
	                alert("1:1 불러오기 안돼");
	            }
			   
		   });
		    
		   
	   }); 
    */
    
   </script>
   
   
   <script>
	   $(function(){
  		   var boGroup = "2";
 		   $.ajax({
 			   url:"actionOneList.ch",
 			   type:"get",
 			   dataType: 'html',
 			   data: {"boGroup" : boGroup},
 			   success: 
 				   function(data){ 
 					   $(".onBoarListView").html(data);
 					   console.log(data);
 				   }
 		   });
		   
	   		$('.categories:nth-of-type(1)').click(function() {
	   			$('.onBoarListView').show();
	   			$('.auctionListView').hide();
	   			$('.contestListView').hide();

	 		   
 		   $.ajax({
 			   url:"actionOneList.ch",
 			   type:"get",
 			   dataType: 'html',
 			   data: {"boGroup" : boGroup},
 			   success: 
 				   function(data){ 
 					   $(".onBoarListView").html(data);
 					   console.log(data);
 				   }
 		   });
	 	   });
   		});
		   

	   
	   
	   $(function(){
	  		$('.categories:nth-of-type(3)').click(function() {
	   			$('.onBoarListView').hide();
	   			$('.auctionListView').show();
	   			$('.contestListView').hide();

	   			var boGroup = "3";
		   
		   $.ajax({
			   url:"actionOneList.ch",
			   type:"get",
			   dataType: 'html',
			   data: {"boGroup" : boGroup},
			   success: 
				   function(data){ 
					   $(".auctionListView").html(data);
				   }
		   	});
			});
	   });
	   
	   
	   
	   $(function(){
			$('.categories:nth-of-type(5)').click(function() {
	   			$('.onBoarListView').hide();
	   			$('.auctionListView').hide();
	   			$('.contestListView').show();
		   var boGroup = "4";
		   
		   $.ajax({
			   url:"actionOneList.ch",
			   type:"get",
			   dataType: 'html',
			   data: {"boGroup" : boGroup},
			   success: 
				   function(data){ 
					   $(".contestListView").html(data);
				   }
		   });
 		   });
		   
		  	 
	   });
	   
	   /* 리스트로 글 넘기기 */
	   $('.input.box2').on('click', function(){
	      var boNum = $(this).prev().prev().val();
	      console.log(boNum);
	      location.href= "detail.bo?boNum=" + boNum; 
	   });
   
   </script>
  
   
</body>
</html>