<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.reqWorkingList{
		border: 1px solid lightgray;
		width: 80%;
		margin: auto;		
	}

	.reqWorkingListTopArea{height: 60px; background: #4374D9; color: white; font-size: 18pt; box-shadow: 2px 2px 5px black;}
	
	#reqWorkingListText{font-weight: bolder; margin-top: 12px; padding-left: 40px; padding-right: 30px; display:inline-block;}

	#reqWorkingListContent{
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
	
	.contents p {
		margin: 8px 0px 8px 0px;
		line-height: 120%;
	}
</style>
<title>작업 진행 중</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
			
		</div>
		<div id="main">
			<div class="reqWorkingList">
				<div class="reqWorkingListTopArea">
					<div id="reqWorkingListText">작업 진행 중</div>	
				</div>
				<div id="reqWorkingListContent">
					<div id="buttonSelectNSerch">
						<!-- 부트스트랩으로 아래로 창 열리게 해야 함.  -->
						<div class="selectCategoryText">카테고리 ▼</div>
						<div class="dropdown-content">
							<a href="#"><span onclick="myReqTwoStepList();">전체 보기</span></a>
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
					<c:forEach var="rtl" items="${ list }">
						<div class="boardList">
							<div class="boardImg" onclick="goCBD(${ rtl.boNum });">
								<c:if test="${ rtl.thumbnail eq null }">
									<img src="${ contextPath }/resources/images/emptyImage.png" width= "100%" height= "100%">
								</c:if>
								<c:if test="${ rtl.thumbnail ne null }">
									<img src="${ contextPath }/resources/real_photo/${ rtl.thumbnail }" width= "100%" height= "100%">
								</c:if>																
							</div>
							<div class="boardCon">
								<div class="leftCon">
									<b>
									<c:if test="${ rtl.boCategory == '1' }">컨텐츠 제작</c:if>
									<c:if test="${ rtl.boCategory == '2' }">컨텐츠 수정</c:if>
									<c:if test="${ rtl.boCategory == '3' }">기타</c:if>
									  &nbsp; | &nbsp; 제목 : <span style="color: rgb(52, 152, 219);">${ rtl.boTitle }</span> </b><br>
									<b>등록일</b> : 20${ rtl.boDate }<br>
									<c:if test="${ rtl.boGroup == '2' }" >
										<b>의뢰유형</b> : 1:1 의뢰<br>
									</c:if>
									<c:if test="${ rtl.boGroup == '3' }" >
									 	<b>의뢰유형</b> : 역경매<br>
									</c:if>			
									<c:if test="${ rtl.boGroup == '4' }" >
									 	<b>의뢰유형</b> : 콘테스트<br>
									</c:if>									 						 	 
									<div class="contents"><b>내용</b>${ rtl.boContent }</div>
								</div>
								<div class="rightCon">
									<c:if test="${ rtl.boGroup == '2' }">
										<div class="rightBtn">
											에디터 : <span class="smallOption" style="color: black;">${ rtl.reId }</span>
										</div>
										<div class="rightBtn">
											기한 제한 없음
										</div>
										<div class="rightBtn">
											의뢰비 : ${ rtl.cbCash } CASH
										</div>
									</c:if>
									<c:if test="${ rtl.boGroup == '3' }">
										<div class="rightBtn">
											에디터 : <span class="smallOption" style="color: black;">${ rtl.reId }</span>
										</div>
										<div class="rightBtn">
											경매 마감
										</div>
										<div class="rightBtn">
											낙찰가 : ${ rtl.cbCash } CASH
										</div>
									</c:if>
									<c:if test="${ rtl.boGroup == '4' }">
										<div class="rightBtn">
											에디터 : <span class="smallOption" style="color: black;">${ rtl.reId }</span>
										</div>
										<div class="rightBtn">
											콘테스트 마감
										</div>
										<div class="rightBtn">
											상금 : ${ rtl.cbCash } CASH
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
			
		function myReqTwoStepList(){
			var cbStep = 2;
			location.href="reqList.my?boWriter=" + boWriter + "&cbStep=" + cbStep;
		}
		
		function myReqCateList(e){
			var cbStep = 2;
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

	</script>			
</body>
</html>