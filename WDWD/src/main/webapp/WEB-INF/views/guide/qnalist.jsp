<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAlist</title>
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick.css" />
<link rel="stylesheet" type="text/css" href="http://kenwheeler.github.io/slick/slick/slick-theme.css" />
</head>
<style>
	
	
	.qnaBackground {
      background-color: rgba(224, 224, 224, 0.16);
      border-bottom: 1px solid rgba(200, 200, 200, 0.7);
      padding-top: 20px;
      padding-bottom: 20px;
   }
	
	
	.qnaHeaderBar {
      display: inline-table;
      margin-top: 50px;
      margin-left: 100px;	
      text-align: left;
      font-size: 33px;
      font-weight: bolder;
      height: 90px;
   }	
	
	

	#qnaBoardTitle{
      width: 98.5%;
      height: 45px;
      border: 3px solid rgba(204,204,204, 0.55);
      margin: auto;
      margin-top: 10px;
   }
   
    .writingBtn{
      display: block;
      width: 100%;
      height: 100%;
   }
  

</style>
<body>
	   <jsp:include page="../common/mainHeader.jsp"/>
	 	<div id="main" style="background: white">
	 		<div class="qnabackground">
					<div class="qnaHeaderBar">QnA 게시판</div>	 			
	 		</div>	
	 	</div>
	 	
	 	
	 	<div class="qnaBoardTitle"> 
	 		<div class="input box1">No.</div> <!-- 글번호 -->
			<div class="input box2">제목</div> <!-- 제목 -->
			<div class="input box3">작성자</div> <!-- 작성자 -->
			<div class="input box4">조회수</div><!-- 조회수 -->
	 	</div>
	 	
	 	
	 	<c:forEach var="b" items="${ list }">
	 		<div class="qnaBoardlist">
	 			
	 			<!-- 번호 -->
	 			<div class="input box1">${ b.boNum }</div>
	 			<!-- 제목 -->
	 			<div class="input box2">${ b.boTitle }<span class="boReNum">(${ b.boReNum})</span></div>
	 			<!-- 작성자 -->
	            <div class="input box3"><span class="smallOption"><c:set var="rsgId" value="${ b.boWriter }" scope="session"/><c:set var="rsgNick" value="${ b.boWriterNick }" scope="session"/> ${ b.boWriterNick } </span></div><!-- 작성자 -->
		 		<!-- 조회수 -->
		 		<div class="input box5"> ${ b.boView  }</div> <!-- 조회수 -->
			</div>
	 </c:forEach>
	 
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
</body>
</html> 