<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.reqCompleteList{
		border: 1px solid lightgray;
		width: 80%;
		margin: auto;		
	}

	.reqCompleteListTopArea{height: 60px; background: #4374D9; color: white; font-size: 18pt; box-shadow: 2px 2px 5px black;}
	
	#reqCompleteListText{font-weight: bolder; margin-top: 12px; padding-left: 40px; padding-right: 30px; display:inline-block;}

	#reqCompleteListContent{
		margin: 30px;
	}
	
	.selectCategoryText {
		display: inline-table;
		height: 30px;
		line-height: 30px;
		padding: 10px;
		padding-left: 30px;
		padding-right: 30px;
		margin: 15px;
		font-size: 14pt;
		border: 1px solid black;
	}
	
	/* 드랍다운 메뉴 */
	#buttonSelectNSerch {
	  	position: relative;
	  	display: inline-block;
	}
	
	.dropdown-content {
	  	display: none;
	  	position: absolute;
	  	background-color: #f1f1f1;
	  	min-width: 160px;
	  	box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
	  	z-index: 1;
	  	margin-left: 15px;
	}
	
	.dropdown-content a {
	  	color: black;
	  	padding: 12px 16px;
	  	text-decoration: none;
	  	display: block;
	}
	
	.dropdown-content a:hover {background-color: #ddd;}
	
	#buttonSelectNSerch:hover .dropdown-content {display: block;}
	
	#CategoryInfo {
		display: inline-block;
		font-size: 20pt;
		color: #050099;
		font-weight: bolder;
	}
		
	/* 리스트 부분 */	
	.boardList {
		height: 199px;
	
		padding: 10px;
		margin: 20px;
		
		border: 1px solid black;
		display: flex;
		
		/* overflow: hidden; */
	}
	
	.boardList:hover {
		background: rgba(161, 206, 244, 0.1)
	}
	
	.boardImg {
		display: inline-block;
		width: 140px;
		height: 140px;
		margin: 5px;
		
		border: 1px solid black;
		
		cursor: pointer;
	}
	.boardCon {
		/* width 값은 script로 별도 지정 */
		display: inline-table;
		height: 140px;
		margin: 5px;
	}
	.leftCon {
		display: inline-table;
		width: 70%;
		height: 140px;
		margin-left: 10px;
		line-height: 30px;
		
		/* border: 1px solid black; */
	}
	.rightCon {
		display: inline-table;
		width: 25%;
		height: 140px;
		float: right;
		
		/* border: 1px solid black; */
	}
	.rightBtn {
		display: inline-table;
		width: 100%;
		height: 35px;
		margin: 5px;
		line-height: 35px;
		font-weight: bold;
		text-align: center;
		border-radius: 5px;
		background-color: rgb(235, 239, 242);
	}
	
	.starRating{
		color: gold;
	}
	
	
	/* 페이징 처리 css */
	.pagingCenter{
		text-align: center;
		margin-top: 40px;
	}
	
	.pagination{
		display: inline-block;
	}

	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	  border: 1px solid #ddd;
	}
	
	.pagination a.active {
	  background-color: rgb(52, 152, 219);
	  color: white;
	  border: 1px solid rgb(52, 152, 219);
	}
	
	.pagination a:hover:not(.active) {background-color: #ddd;}	
	
	/* 평점 매기기 */
	.gradeArea{
		position: absolute;
		display: none;
		width: 15%;
		height: 160px;
		border: 1px solid black;
		padding: 10px;
		text-align: center;
		background: white;
	}
	
	.gradeBtn{
		cursor: pointer;
	}
	
	h3{font-family: 'Noto Sans KR', sans-serif;}
	
	/*제이쿼리 활용 별점 매기기*/
	.starR{
	  background: url('<%= request.getContextPath() %>/resources/images/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 30px;
	  height: 30px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	}
	.starR.on{background-position:0 0;}
	.starRev{margin-left: 10px;}
	/*버튼 css*/
    .btn{
		border-radius: 0.5rem; white-space: nowrap; border: 1px solid transparent; background-color: #7780b7; color: white; 
		line-height: 1.5; padding: 4px 10px; margin: 7px; width: auto;    
    }
	
</style>
<title>거래 완료</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
			
		</div>
		<div id="main">
			<div class="reqCompleteList">
				<div class="reqCompleteListTopArea">
					<div id="reqCompleteListText">거래 완료</div>	
				</div>
				<div id="reqCompleteListContent">
					<div id="buttonSelectNSerch">
						<!-- 부트스트랩으로 아래로 창 열리게 해야 함.  -->
						<div class="selectCategoryText">카테고리 ▼</div>
						<div class="dropdown-content">
							<a href="#"><span onclick="myReqThreeStepList();">전체 보기</span></a>
						    <a href="#"><span onclick="myReqCateList(2);">1:1 의뢰</span></a>
						    <a href="#"><span onclick="myReqCateList(3);">역경매</span></a>
						    <a href="#"><span onclick="myReqCateList(4);">콘테스트</span></a>
						</div>						
					</div>
					<c:if test="${ cboard.boGroup eq null}">
						<div id="CategoryInfo">전체 보기</div>
					</c:if>
					<c:if test="${ cboard.boGroup == '2'}">
						<div id="CategoryInfo">1:1 의뢰</div>
					</c:if>
					<c:if test="${ cboard.boGroup == '3'}">
						<div id="CategoryInfo">역경매</div>
					</c:if>
					<c:if test="${ cboard.boGroup == '4'}">
						<div id="CategoryInfo">콘테스트</div>
					</c:if>
				
					<!-- 리스트 시작 -->
					<c:if test="${ empty list }">
						<div class="boardList">※ 목록이 없습니다.</div>
					</c:if>
					<c:forEach var="rthl" items="${ list }">
						<div class="boardList">
							<div class="boardImg" onclick="goCBD(${ rthl.boNum });">
								<c:if test="${ rthl.thumbnail eq null }">
									<img src="${ contextPath }/resources/images/emptyImage.png" width= "100%" height= "100%">
								</c:if>
								<c:if test="${ rthl.thumbnail ne null }">
									<img src="${ contextPath }/resources/real_photo/${ rthl.thumbnail }" width= "100%" height= "100%">
								</c:if>															
							</div>
							<div class="boardCon">
								<div class="leftCon">
									<b>
									<c:if test="${ rthl.boCategory == '1' }">컨텐츠 제작</c:if>
									<c:if test="${ rthl.boCategory == '2' }">컨텐츠 수정</c:if>
									<c:if test="${ rthl.boCategory == '3' }">기타</c:if>
									  &nbsp; | &nbsp; 제목 : <span style="color: rgb(52, 152, 219);">${ rthl.boTitle }</span> </b><br>
									<b>등록일</b> : 20${ rthl.boDate }<br>
									<c:if test="${ rthl.boGroup == '2' }" >
										<b>의뢰유형</b> : 1:1 의뢰<br>
									</c:if>
									<c:if test="${ rthl.boGroup == '3' }" >
									 	<b>의뢰유형</b> : 역경매<br>
									</c:if>			
									<c:if test="${ rthl.boGroup == '4' }" >
									 	<b>의뢰유형</b> : 콘테스트<br>
									</c:if>									 						 	 
									<div class="contents"><b>내용</b>${ rthl.boContent }</div>
								</div>
								<div class="rightCon">
									<c:if test="${ rthl.boGroup == '2' }">
										<div class="rightBtn">
											에디터 : <span class="smallOption" style="color: black;">${ rthl.reId }</span>
										</div>
										<div class="rightBtn">
											의뢰비 : ${ rthl.cbCash } CASH
										</div>
										<div class="rightBtn gradeBtn">
											<input type="hidden" value="${ rthl.reId }">
											<input type="hidden" value="${ rthl.reNum }">
											<c:choose>
												<c:when test="${ rthl.reGrade == '5' }">
													평점 : <span class="starRating">★★★★★</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '4' }">
													평점 : <span class="starRating">★★★★☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '3' }">
													평점 : <span class="starRating">★★★☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '2' }">
													평점 : <span class="starRating">★★☆☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '1' }">
													평점 : <span class="starRating">★☆☆☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '0' }">
													평점 : <span class="starRating">☆☆☆☆☆</span>
												</c:when>
											</c:choose>
										</div>										
									</c:if>
									<c:if test="${ rthl.boGroup == '3' }">
										<div class="rightBtn">
											에디터 : <span class="smallOption" style="color: black;">${ rthl.reId }</span>
										</div>
										<div class="rightBtn">
											낙찰가 : ${ rthl.cbCash } CASH
										</div>
										<div class="rightBtn gradeBtn">
											<input type="hidden" value="${ rthl.reId }">
											<input type="hidden" value="${ rthl.reNum }">
											<c:choose>
												<c:when test="${ rthl.reGrade == '5' }">
													평점 : <span class="starRating">★★★★★</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '4' }">
													평점 : <span class="starRating">★★★★☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '3' }">
													평점 : <span class="starRating">★★★☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '2' }">
													평점 : <span class="starRating">★★☆☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '1' }">
													평점 : <span class="starRating">★☆☆☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '0' }">
													평점 : <span class="starRating">☆☆☆☆☆</span>
												</c:when>
											</c:choose>
										</div>
									</c:if>
									<c:if test="${ rthl.boGroup == '4' }">
										<div class="rightBtn">
											우승자 : <span class="smallOption" style="color: black;">${ rthl.reId }</span>
										</div>
										<div class="rightBtn">
											상금 : ${ rthl.cbCash } CASH
										</div>
										<div class="rightBtn gradeBtn">
											<input type="hidden" value="${ rthl.reId }">
											<input type="hidden" value="${ rthl.reNum }">
											<c:choose>
												<c:when test="${ rthl.reGrade == '5' }">
													평점 : <span class="starRating">★★★★★</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '4' }">
													평점 : <span class="starRating">★★★★☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '3' }">
													평점 : <span class="starRating">★★★☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '2' }">
													평점 : <span class="starRating">★★☆☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '1' }">
													평점 : <span class="starRating">★☆☆☆☆</span>
												</c:when>
												<c:when test="${ rthl.reGrade == '0' }">
													평점 : <span class="starRating">☆☆☆☆☆</span>
												</c:when>
											</c:choose>
										</div>
									</c:if>																		
								</div>
							</div>
						</div>
					</c:forEach>
										
					<!-- 페이징 처리 -->
					
					<!-- [이전] -->
					<div class="pagingCenter">
						<div class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<a href=""> &laquo; </a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="reqList.my">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="boWriter" value="${ cboard.boWriter }"/>
								<c:if test="${ cboard.cbStep ne 0 }">
									<c:param name="cbStep" value="${ cboard.cbStep }"/>
								</c:if>
								<c:if test="${ cboard.boGroup ne null }">
									<c:param name="boGroup" value="${ cboard.boGroup }"/>
								</c:if>
							</c:url>
							<a href="${ before }"> &laquo; </a>
						</c:if>
					
					<!-- 페이지 -->	
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<a href="" class="active"> ${ p } </a>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="reqList.my">
								<c:param name="page" value="${ p }"/>
								<c:param name="boWriter" value="${ cboard.boWriter }"/>
								<c:if test="${ cboard.cbStep ne 0 }">
									<c:param name="cbStep" value="${ cboard.cbStep }"/>
								</c:if>
								<c:if test="${ cboard.boGroup ne null }">
									<c:param name="boGroup" value="${ cboard.boGroup }"/>
								</c:if>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>	
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<a href=""> &raquo; </a>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="reqList.my">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
							<c:param name="boWriter" value="${ cboard.boWriter }"/>
								<c:if test="${ cboard.cbStep ne 0 }">
									<c:param name="cbStep" value="${ cboard.cbStep }"/>
								</c:if>
								<c:if test="${ cboard.boGroup ne null }">
									<c:param name="boGroup" value="${ cboard.boGroup }"/>
								</c:if>
						</c:url> 
						<a href="${ after }"> &raquo; </a>
					</c:if>		
						
						</div>
					</div>
				</div>
			</div>
			
			<div class="gradeArea" id="gradeArea">
				<h3 style="margin-left: 20px;">평점 매기기</h3>
				<div class="bodyArea">
					<form action="iGrade.my" method="post">
						<div class="starRev">
						    <a class="starR on" value="1">별1</a>
						    <a class="starR" value="2">별2</a>
						    <a class="starR" value="3">별3</a>
						    <a class="starR" value="4">별4</a>
						    <a class="starR" value="5">별5</a>
						</div>
						<div style="clear: both;"></div>
						<br>
						<input type="hidden" id="reId" name="reId" value="">
						<input type="hidden" id="reNum" name="reNum" value="">
						<input type="hidden" name="reGrade" id="reGrade" class="reGrade" value="">
						<input type="hidden" name="page" id="page" value="${ pi.currentPage }">
						<div class="btnArea">
							<button type="submit" name="send" class="btn" style="cursor: pointer;">완료</button>
							<button type="button" name="cancel" class="btn" onclick="closePopUp(this);" style="cursor: pointer;">취소</button>  		
						</div>
					</form>	
				</div>
			</div>
		
		</div>
		
		
		
		<div id="right-side">
				
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$('.boardCon').width($('.boardList').width() - 200)
	</script>
	<script>
		$('.rightBtn').hover(function(){
			$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
		}, function(){
			$(this).css({'background-color':'rgb(235, 239, 242)', 'color':'black'})
		});
	</script>
	<script>
		var boWriter = '${ loginUser.userId }'
			
		function myReqThreeStepList(){
			var cbStep = 3;
			location.href="reqList.my?boWriter=" + boWriter + "&cbStep=" + cbStep;
		}
		
		function myReqCateList(e){
			var cbStep = 3;
			location.href = "reqList.my?boGroup=" + e + "&boWriter=" + boWriter + "&cbStep=" + cbStep;	
		}
		
		$(function(){
			console.log($('.contents').find('img'));
			$('.contents').find('img').remove();
			$('.contents').find('br').remove();
			
			$('.boardList').css('overflow', 'hidden');
		});
		
		function goCBD(boNum){
			location.href = "detailView.ch?boNum=" + boNum;
		}
		
		// 평점 매기기 
		$('.starRev a').click(function(){
			$(this).parent().children('a').removeClass('on');
		    $(this).addClass('on').prevAll('a').addClass('on');
		    console.log($(this).attr("value"));
		  	$('.reGrade').attr("value",$(this).attr("value"));
		    console.log($('.reGrade').attr("value"));
		    return false;
		});
		
		// 평점 영역 클릭 시 평점 매기는 레이어 팝업
		$('.gradeBtn').click(function(e) {
			$('#gradeArea').css({
				"top" : (($(window).height()-$('#gradeArea').outerHeight())/2+$(window).scrollTop())+"px",
				"left" : (($( window ).width()-$('#gradeArea').outerWidth())/2+$(window).scrollLeft())+"px",
				"position" : "absolute"
			}).show();
		
			var reId = $(this).children().eq(0).val();
			var reNum = $(this).children().eq(1).val();
			
			console.log("reId : " + reId);
			console.log("reNum : " + reNum);
			
			$('#reNum').attr('value', reNum);
			$('#reId').attr('value', reId);
		});
		
		// 취소버튼 클릭 시 팝업 창 닫기
		function closePopUp(e){
			$(e).parent().parent().parent().parent().hide();
		}
		
		// 완료버튼 클릭 시 평점 등록
		
		
	</script>			
</body>
</html>