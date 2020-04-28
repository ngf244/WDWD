<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>콘테스트</title>
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

						<div class="mainHeaderBar">콘테스트 프로젝트</div>
							<div id="mainBar">
								굉장히 쉽고 빠르게 의뢰하면서 <br> 다양한 에디터들에게 수많은 디자인을 받아보세요.
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
						<a href="writeView.ch?boardType=4">의뢰하기</a>
					</div>
				</div>

				<div id="attachFromHere">
				
					 <c:forEach var="con" items="${ list2 }">
						<div class="boardList">
							<input type="hidden" name="boNum" class="boardBoNum" value="${ con.boNum }">
							<div class="boardImg">
								<img src="${ contextPath }/resources/images/rose1.jpg" alt="기본이미지">
							</div>
							<div class="boardCon">
								<div class="leftCon">
									<div class="boardCate">
										<b class="boardCategory" name="boardCategory">
										
											<c:if test="${ con.boCategory == 1}"> 
													제작 디자인 &nbsp; |
												</c:if>
												<c:if test="${ con.boCategory == 2}"> 
													편집 디자인 &nbsp; |
												</c:if>
												<c:if test="${ con.boCategory == 3}"> 
													기타 디자인 &nbsp; |
												</c:if>
										</b>
										
									</div>
									&nbsp;
									<div class="boardTitle">
										<b class="boardTitles">${ con.boTitle }</b>
									</div>
									<div class="boardReq">의뢰인 : <span class="boardReqs">${ con.boWriter }</span> </div> 
										<div class="boardContents">
											${ con.boContent }
										</div>
										
								</div>
								<div class="rightCon">
									<div class="rightBtn">참여자 :  <span class="rightBtns"> ${ con.boReNum }</span>명</div>
									<div class="rightBtn" id="timer"><span class="cbDate">${ con.cbDate }</span></div>
									<div class="rightBtn">상금 :  <span class="cbCash"> ${ con.cbCash }</span>만원</div>
								</div>
							</div>
						</div>
					</c:forEach> 
				</div>
				
				

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
		var boCategory = "";
		var boGroup = "4";
		var cbStep =0;
	
	    /* 리스트로 글 넘기기 */
		$(document).on('click', '.boardList', function(){
			var boNum = $(this).find("input[name=boNum]").val();
			location.href= "detailView.ch?boNum=" + boNum; 
		});
		
	
		/* 카테고리 선택 시 글보기 */
		function selectCate(num1){
			//console.log("selectCate 실행");
			//console.log("num1 : ", num1)
			boCategory = num1;
			
			getList(boCategory, boGroup, cbStep);
			
		}	
			
		function buttonDrop(num2){
			//console.log("buttonDrop 실행");
			//console.log("num2 : ", num2);
			
			cbStep = num2;
			getList(boCategory, boGroup, cbStep);
		}
	
		var boardList = $('.boardList').eq(0);
		
		function getList(num1, num2, num3) {
			//console.log('getList실행');
			//console.log("num1 : ", num1)
			//console.log("num2 : ", num2)
			//console.log("num3 : ", num3)	
			 boCategory = num1;
			 boGroup = num2;
			 cbStep = num3;
			
				//console.log("전역 카테1 :", boCategory);
				//console.log("전역 진행1 :", cbStep);


			$.ajax({
				   url: "actionCateList.ch",	
		            type: "GET",
		            data: {"boCategory" : boCategory, "boGroup" : boGroup, "cbStep" : cbStep },
		            success: function(data){


						$('#attachFromHere').empty();
						//console.log("3 : ",$boardList);
		                for(var i in data) {
							//console.log("i가 몇개? ",  data.length);

							//console.log("data?" , data);
							
							var $newboardList = boardList.clone();
							$('#attachFromHere').append($newboardList);

							$('.boardBoNum').eq(i).val(data[i].boNum);
							$('.boardTitles').eq(i).html(data[i].boTitle);
							$('.boardReqs').eq(i).html(data[i].boWriter);
							$('.boardContents').eq(i).html(data[i].boContent);
							$('.rightBtns').eq(i).html(data[i].boReNum);
							$('.cbDate').eq(i).html(data[i].cbDate);
							$('.cbCash').eq(i).html(data[i].cbCash);
							$('.boardCategory').eq(i).val(data[i].boCategory);
							
						}

		            },
		            error: function(){
		                alert("1:1 카테고리 실패");
		            }
			});
		}
		
	</script>

</body>
</html>