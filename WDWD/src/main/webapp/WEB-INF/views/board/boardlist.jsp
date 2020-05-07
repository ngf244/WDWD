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
   
         /* 전체,진행,마감 */
         #dropProgress {
         width: 37%;
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
         margin-right: 2px;
         cursor: pointer;
         border-bottom: 1.5px solid rgb(235, 239, 241);
         border-top: 1.5px solid rgb(235, 239, 241);

      }

      .buttonDrop:hover {
         background: pink;
      }

      .buttonDrop:nth-child(1) {
         margin-right: 3px;
         background: white;
         color: black;
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
         margin-left: 11%;
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

      #dropCategory:checked{
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

      #mainBar {
         display: inline-table;
         margin-top: 0px;
         margin-left: 30px;

         font-size: 20px;
         line-height: 200%;
         height: 100px;
      }

      #manyProjectForm {
         margin-left: 30px;
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


      .imgSearchBtn {
         display: inline-block;
         width: 45px;
         height: 70px;
      }


      /* .requestBtn {
         margin-left: 200px;
         height: 100px;
         min-height: 80px;
         display: inline-block;
      }

      .requestBtn>a {
         width: 120px;
         height: 100px;
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

      .requestBtn>a:hover {
         background-color: pink;
      }
 */




      @import url(https://fonts.googleapis.com/css?family=Open+Sans:400);

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
	 background:  rgba(161, 206, 244, 0.9);
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
 
 .premium_list{
    width:100%;

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
			<br> <br> <br> <br> <br> <br> <br>

			<hr>
			<div id="cashCategorySelectArea">
				<div class="categories" name="categories" value="2">
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
			
			<!-- 공용영역 -->
			<div style="background: white;">
				<div class="mainBackground">

					<!-- 게시판 리스트 상단 -->
					<div id="oneHeader">
						<div class="mainHeaderBar">1:1 매칭</div>
                  <div id="mainBar">
                        한 명의 디자이너에게 의뢰하고 싶을 때는 1:1 프로젝트를 이용하세요.<br>프로젝트 내용을 등록하면 관심있는 디자이너가 지원합니다.<br>
                  </div>
                  <div class="mainHeaderBar">입찰</div>
                  <div id="mainBar">
                         저렴한 가격으로 디자인을 이용해보세요.<br> 프로젝트 내용을 등록하면 관심있는 디자이너가 지원합니다.
                  </div>
                  <div class="mainHeaderBar">콘테스트 프로젝트</div>
                  <div id="mainBar">
                                굉장히 쉽고 빠르게 의뢰하면서 <br> 다양한 에디터들에게 수많은 디자인을 받아보세요.
                  </div>
                  <div class="requestBtn"> 
                     <input type="hidden" name="requestVal" value="2">
                     의뢰하기
                  </div>
					</div>
				</div>
            <!-- 프리미엄 게시판 -->
            <div><h2>프리미엄 게시판</h2></div>
            <div class="premium_list">
            


            </div>
            <div class="listlist">                
               <div>1</div>
               <div>2</div>
               <div>3</div>
               <div>4</div>
               <div>5</div>
               <div>6</div>
               <div>7</div>
               <div>8</div>
               <div>9</div>
               <div>10</div>
            </div>


         </div>
         <br>
         <br>
         <!-- 일반 게시판 -->   
         <div id="buttonSelectNSerch">
					<div id="dropCategory">
						<div id="buttonSelect">&nbsp;전체 카테고리</div>
						<div class="dropdown-category" >
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
					<!-- <div id="guideBtn">이용 가이드</div> -->
					
               <div id="searchCategory">
                  <div id="searchSelect" >검색 ▼</div>
                  <div class="searchDropdown-category">
                     <span name="제목" onclick="searchCate('제목');">제목</span>
                     <span name="내용" onclick="searchCate('내용');">내용</span>
                     <span name="의뢰인" onclick="searchCate('의뢰인');">의뢰인</span>
                  </div>
               </div>
               <div id=searchBtn>
                  <input type="text" class="buttonSearch" placeholder="&nbsp;게시글 검색"> 
               
                  <div class="imgSearchBtn">
                     <img id="imgSearch" src="${ contextPath }/resources/images/imgSearch3.png" alt="go" onclick="searchGo();">
                  </div>
               </div>
            </div>   
			

			<div class="onBoarListView"><jsp:include page="../cashboard/oneBoardList.jsp" /></div>
			<div class="auctionListView" style="display: none;">
				<%-- <jsp:include page="../cashboard/auctionBoardList.jsp"/> --%>
			</div>
			<div class="contestListView" style="display: none;">
				<%-- <jsp:include page="../cashboard/contestBoardList.jsp"/> --%>
			</div>
			
			
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
		$(function() {
            $('.mainHeaderBar:nth-of-type(1)').show();
            $('.mainHeaderBar:nth-of-type(3)').hide();
            $('.mainHeaderBar:nth-of-type(5)').hide();

            $('#mainBar:nth-of-type(2)').show();
            $('#mainBar:nth-of-type(4)').hide();
            $('#mainBar:nth-of-type(6)').hide();
         boGroup = "2";
			var boCategory = "";

			var cbStep = 0;
         premiumList(boGroup);
			/* $.ajax({
				url : "actionOneList.ch",
				type : "get",
				dataType : 'html',
				data : {
					"boGroup" : boGroup
				},
				success : function(data) {
					$(".onBoarListView").html(data);
				}
			}); */

			$('.categories:nth-of-type(1)').click(function() {
				boGroup = "2";
            $('.mainHeaderBar:nth-of-type(1)').show();
            $('.mainHeaderBar:nth-of-type(3)').hide();
            $('.mainHeaderBar:nth-of-type(5)').hide();

            $('#mainBar:nth-of-type(2)').show();
            $('#mainBar:nth-of-type(4)').hide();
            $('#mainBar:nth-of-type(6)').hide();

            $('input[name=requestVal]').val('2');

				//$('.onBoarListView').show();
				//$('.auctionListView').hide();
				//$('.contestListView').hide(); 

				//$('.onBoarListView').css('display', 'block');
				//$('.auctionListView').css('display', 'none');
				//$('.contestListView').css('display', 'none');

				$.ajax({

					url : "actionCateList.ch",
					type : "get",
               dataType : "json",
					data : {
						"boCategory" : boCategory,
						"boGroup" : boGroup,
						"cbStep" : cbStep                  
					},
					success : function(data) {

						$('#attachFromHere').empty();
						//console.log("3 : ",$boardList);
						for ( var i in data) {
							var $newboardList = boardList.clone();
							$('#attachFromHere').append($newboardList);
							$('.boardBoNum').eq(i).val(data[i].boNum);
							$('.boardTitles').eq(i).html(data[i].boTitle);
							$('.boardReqs').eq(i).html(data[i].boWriter);
							$('.boardContents').eq(i).html(data[i].boContent);
							$('.rightBtns').eq(i).html(data[i].boReNum);
							$('.cbDate').eq(i).html(data[i].cbDate);
                     $('.cbCash').eq(i).html(data[i].cbCash);
                     
                     console.log("test11", data.list2);
                     console.log("test11", data.piCash);

                     premiumList(boGroup);
						}

					},
					error : function() {
						alert("1:1 카테고리 실패");
					}
				});
				
			});
		});


		$(function() {
			$('.categories:nth-of-type(3)').click(function() {
            $('.mainHeaderBar:nth-of-type(1)').hide();
            $('.mainHeaderBar:nth-of-type(3)').show();
            $('.mainHeaderBar:nth-of-type(5)').hide();

            $('#mainBar:nth-of-type(2)').hide();
            $('#mainBar:nth-of-type(4)').show();
            $('#mainBar:nth-of-type(6)').hide();

            $('input[name=requestVal]').val('3');

				boGroup = "3";

				$.ajax({

					url : "actionCateList.ch",
					type : "GET",
					data : {
						"boCategory" : boCategory,
						"boGroup" : boGroup,
						"cbStep" : cbStep
					},
					success : function(data) {

						console.log("boGourp3?????", boGroup);

						$('#attachFromHere').empty();
						//console.log("3 : ",$boardList);
						for ( var i in data) {
							console.log("i가 몇개? ", data.length);

							console.log("data?", data);

							var $newboardList = boardList.clone();
							$('#attachFromHere').append($newboardList);

							$('.boardBoNum').eq(i).val(data[i].boNum);
							$('.boardTitles').eq(i).html(data[i].boTitle);
							$('.boardReqs').eq(i).html(data[i].boWriter);
							$('.boardContents').eq(i).html(data[i].boContent);
							$('.rightBtns').eq(i).html(data[i].boReNum);
							$('.cbDate').eq(i).html(data[i].cbDate);
							$('.cbCash').eq(i).html(data[i].cbCash);
                     premiumList(boGroup);
						}

					},
					error : function() {
						alert("1:1 카테고리 실패");
					}
				});
			});
		});

		$(function() {
			$('.categories:nth-of-type(5)').click(function() {
            $('.mainHeaderBar:nth-of-type(1)').hide();
            $('.mainHeaderBar:nth-of-type(3)').hide();
            $('.mainHeaderBar:nth-of-type(5)').show();

            $('#mainBar:nth-of-type(2)').hide();
            $('#mainBar:nth-of-type(4)').hide();
            $('#mainBar:nth-of-type(6)').show();

            $('input[name=requestVal]').val('4');
				boGroup = "4";

				$.ajax({

					url : "actionCateList.ch",
					type : "GET",
					data : {
						"boCategory" : boCategory,
						"boGroup" : boGroup,
						"cbStep" : cbStep
					},
					success : function(data) {
						console.log("boGourp4?????", boGroup);

						$('#attachFromHere').empty();
						//console.log("3 : ",$boardList);
						for ( var i in data) {
							console.log("i가 몇개? ", data.length);

							console.log("data?", data);

							var $newboardList = boardList.clone();
							$('#attachFromHere').append($newboardList);

							$('.boardBoNum').eq(i).val(data[i].boNum);
							$('.boardTitles').eq(i).html(data[i].boTitle);
							$('.boardReqs').eq(i).html(data[i].boWriter);
							$('.boardContents').eq(i).html(data[i].boContent);
							$('.rightBtns').eq(i).html(data[i].boReNum);
							$('.cbDate').eq(i).html(data[i].cbDate);
							$('.cbCash').eq(i).html(data[i].cbCash);
                     premiumList(boGroup);
						}

					},
					error : function() {
						alert("1:1 카테고리 실패");
					}
				});
			});

		});

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
	   var swal;
	   var flag;
	      $('.requestBtn').off('click').on('click', function () {
            var requestVal = $('input[name=requestVal]').val();
            console.log("requestVal", requestVal);
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
	                  location.href="writeView.ch?boardType=" + requestVal;
	
	               }
	      });
   </script> 

   <script>

            /* * 카테고리 선택 시 글보기 * */
      function selectCate(num1) {
         console.log("selectCate 실행");
         console.log("num1 : ", num1)
         boCategory = num1;
         page = 1;

         getList(boCategory, cbStep, boGroup, page);

         /* display none시 안돌아옴. */
         //$('.dropdown-category').css("display", "none");
         
         // setTimeout(function() {
         //    $('.dropdown-category').css('display','block');
         // }, 1000);


      }

      function buttonDrop(num2) {
         console.log("buttonDrop 실행");
         console.log("num2 : ", num2);

         cbStep = num2;
         getList(boCategory, cbStep, boGroup);
      }

      var boardList = $('.boardList').eq(0);

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