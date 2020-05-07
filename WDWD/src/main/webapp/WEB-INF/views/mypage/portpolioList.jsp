<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	
	.portpolioList{
		border: 1px solid lightgray;
		height: 1340px;
		width: 80%;
		margin: auto;
	}

	.portpolioListTopArea{height: 60px; background: #4374D9; color: white; box-shadow: 2px 2px 5px black;}
	
	#portpolioListText{font-size: 18pt; font-weight: bolder; margin-top: 12px; padding-left: 40px; padding-right: 30px; display:inline-block; float: left;}
	
	#portpolioEnrollBtn{
		display: inline-table;
		width: 20%;
		height: 60px;
		margin: 20px;
		line-height: 60px;
		text-align: center;
		background-color: rgb(39, 174, 96, 0.8);
		color: white;
		border-radius: 5px;
		cursor: pointer;
		float: right; 
	}
	
	#portpolioEnrollBtn:hover{
		background-color: rgb(39, 174, 96);
	}
	
	
	#portpolioListContent{
		height: 1240px;
		margin-top: 30px;
	}
	
	.editCate{
		text-align: center;
	}
	
/* 	.imageEditTap{
		width: 25%;
		height: 70px;
		display: inline-block;
		margin-left: 150px;
		margin-top: 30px;
		cursor: pointer;
		background: rgb(52, 73, 94, 0.8);
		color: white;
		font-size: 15pt;
		font-weight: bold;
		line-height: 70px;
		padding-left: 30px;
		border-radius: 10px;
	}
	
	.imageEditTap:hover{
		background: rgb(52, 73, 94);
	}
	
	.videoEditTap{
		width: 25%;
		height: 70px;
		display: inline-block;
		margin-left: 150px;
		margin-top: 30px;		
		cursor: pointer;
		background:  rgb(52, 73, 94, 0.8);
		color: white;
		font-size: 15pt;
		font-weight: bold;
		line-height: 70px;
		padding-left: 30px;
		border-radius: 10px;
	}
	
	.videoEditTap:hover{
		background: rgb(52, 73, 94);	
	} */
	
	.portpolioBoard{
		height: 990px;
		margin: 30px;
		margin-top: 30px;
		border-top: 1px solid lightgray;
		border-bottom: 1px solid lightgray;		 
	}
	
	.portArea{
		width: 18%;
		height: 180px;
		border: 1px solid gray;
		float: left;
		margin: 2%;
		margin-left: 2.5%;
		padding: 10px;
	}
	
	.portpolioThumb{
		width: 100%;
		height: 150px;
		border: 1px solid lightgrey;
		float: left;
		display: line-block;
		cursor: pointer;
	}
	
	.portDate{
		margin-top: 10px;
		float: left;
		font-size: 9pt;
	}
	
	.portCount{
		margin-top: 10px;
		float: right;
		font-size: 9pt;
	}
	
	/* 페이징 처리 css */
	.pagingCenter{
		text-align: center;
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
	
	/* 포트폴리오 디테일 모달창 */
	.portDetailModalArea{
		display: none;
		position: fixed;
		z-index: 10;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.5);
	}
	
	.portDetailModalContent{
		background-color: #fefefe;
		margin: 15% auto;
		border: 1px solid #888;
		width: 60%;
	}
	
	.modalCloseBtn{
		width: 4%;
		height: 40px;
		float: right;
		margin-top: 8px;
		cursor: pointer;
	}
	
	.portpolioNameContents{
		width: 70%;
		border: 5px solid lightgray;
		float: left;
		margin-left: 2%;
		margin-right: 4%;
	}
	
	.portpolioName{
		width: 100%;
		height: 120px;
		font-size: 20pt;
		line-height: 110px;
		font-weight: bolder;
		border-bottom: 5px solid lightgray;
	}
	
	.portpolioDesc{
		width: 21%;
		height: 620px;
		border: 5px solid lightgray;
		float: left;
		border-radius: 5px;
	}
	
	.userId{
		height: 50px;
		background: rgb(52, 152, 219);
		color: white;
		font-size: 15pt;
		font-weight: bolder;
		text-align: center;
		line-height: 48px;
		border-radius: 5px;
	}
	
	.portClass{
		height: 40px;
		font-size: 12pt;
		text-align: center;
		line-height: 48px;
	}
	
	.usingSite{
		height: 80px;
		font-size: 12pt;
		text-align: left;
		line-height: 48px;
		border-bottom: 1px solid lightgray;
		margin: 10px;
	}
	
	.portDescription{
		height: 400px;
		font-size: 12pt;
		text-align: left;
		line-height: 38px;
		margin: 10px;
	}
	
	.updateBtn{
		margin: 10px;
		width: 9%;
		height: 40px;
		background: rgb(52, 152, 219);
		color: white;
		display: inline-block;
		cursor: pointer;
		text-align: center;
		line-height: 40px;
		border-radius: 10px;
	}
	
	.updateBtn:hover{
		background: #4374D9;
	}
	
	
	.deleteBtn{
		margin: 8px;
		width: 9%;
		height: 40px;
		background: rgb(52, 152, 219);
		color: white;
		display: inline-block;
		cursor: pointer;
		text-align: center;
		line-height: 40px;
		border-radius: 10px;		
	}
	
	.deleteBtn:hover{
		background: #4374D9;
	}	
	
	.replyArea{
		width: 95.1%;
		margin: 22px;
	}
	
	.replayText{
		font-size: 12pt;
		text-indent: 30px;
		border-bottom: 1px solid lightgray;
		height: 30px;
		line-height: 30px;
	}	
	
	.repWriterImg{
		width: 6%;
		border: 1px solid black;
		height: 65px;
		border-radius: 50px;
		margin: 10px;
		float: left;
		overflow: hidden;
	}
	
	.repIdDateCon{
		float: left;
	}
	
	.idDate{
		margin: 10px;
	}
	
	.repContents{
		margin: 10px;
	}
	
	.repEnrollArea{
		width: 70%;
	}
	
	.repEnrollBtn{
		width: 13%;
		height: 40px;
		background: rgb(52, 152, 219);
		color: white;
		display: inline-block;
		cursor: pointer;
		text-align: center;
		line-height: 40px;
		border-radius: 10px;			
	}
	
	.repEnrollBtn:hover{
		background: #4374D9;
	}		
	
	/* 포트폴리오 디테일 뷰 사이드 메뉴 */
	.portScroll{
		font-size: 15pt;
		color: white;
		font-weight: bolder;
		border-radius: 5px;
	}
	
	.backToTop{
		margin-left: 25%;
		cursor: pointer;
	}
	
	/* 버튼 css 가져온 것*/
	.tap{
	  background:rgba(52, 152, 219);
	  color:#fff;
	  border:none;
	  position:relative;
	  height:60px;
	  font-size:1.3em;
	  padding:0 2em;
	  cursor:pointer;
	  transition:800ms ease all;
	  outline:none;
	  font-weight: bold;
	}
	.tap:hover{
	  background:#fff;
	  color:rgba(52, 152, 219);
	}
	.tap:before,.tap:after{
	  content:'';
	  position:absolute;
	  top:0;
	  right:0;
	  height:2px;
	  width:0;
	  background: rgba(52, 152, 219);
	  transition:400ms ease all;
	}
	.tap:after{
	  right:inherit;
	  top:inherit;
	  left:0;
	  bottom:0;
	}
	.tap:hover:before,.tap:hover:after{
	  width:100%;
	  transition:800ms ease all;
	}
	
		
</style>
<title>포트폴리오</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
			
		</div>
		<div id="main">
			<div class="portpolioList">
				<div class="portpolioListTopArea">
					<div id="portpolioListText">포트폴리오</div>
				</div>
				<div id="portpolioListContent">
					<div class="editCate">
						<button class="totalEditTap tap" onclick="goToTotal();">T O T A L</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="imageEditTap tap" onclick="goToImage();">I M A G E</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button class="videoEditTap tap" onclick="goToVideo();">V I D E O</button>
					</div>
					<div class="portpolioBoard">
						<c:if test="${ empty list }">
							<div style="color: red; text-align: center; text-weight: bold; margin: 50px;">※ 등록한 포트폴리오가 없습니다.</div>
						</c:if>
						<c:if test="${ !empty list }">
							<c:forEach var="port" items="${ list }">
							<div class="portArea">
								<div class="portpolioThumb" onclick="detailView(this);"><img src="${ contextPath }/${ port.pocPath }/${ port.pocModify }" width="100%" height="100%"></div>
								<div class="portDate">등록일 : ${ port.poEnrollDate }</div>
								<div class="portCount">조회수 : ${ port.poCount }</div>
								<div style="display: none;">${ port.poNum }</div>
							</div>
							
							<!-- 모달 디테일 영역 -->
							<div class="portDetailModalArea">
								<div class="portDetailModalContent">
									<div class="modalCloseBtn" onclick="closeDetail(this);"><img src="${ contextPath }/resources/images/x_icon.png" width="30" height="30"></div>
									<div style="clear: both;"></div>
									
									<div class="portpolioNameContents">
										<div class="portpolioName" style="text-indent: 20px;">
											${ port.poTitle }
										</div>
										<div class="portpolioContents">
											<img style="width: 100%;" src="${ contextPath }/${ port.pocPath }/${ port.pocModify }">
										</div>
										
										<c:if test="${ port.poCategory eq '이미지 제작' or port.poCategory eq '이미지 편집' }">
											<c:forEach var="attach" items="${ port.portContents }">
												<div class="portpolioContents">
													<img style="width: 100%;" name="portImage" src="${ contextPath }/${ attach.pocPath }/${ attach.pocModify }">
												</div>										
											</c:forEach>											
										</c:if>
										
										<c:if test="${ port.poCategory eq '동영상 제작' or port.poCategory eq '동영상 편집' }">
											<c:forEach var="attach" items="${ port.portContents }">
												<div class="portpolioContents">
													<video class="portVideo" src="${ contextPath }/${ attach.pocPath }/${ attach.pocModify }" controls width="100%" height="100%"></video>
												</div>										
											</c:forEach>											
										</c:if>
										
									</div>
									<div class="portpolioDesc">
										<div class="userId">${ port.poWriter }</div>
										<div class="portClass">${ port.poCategory }</div>
										<c:if test="${ port.poUseYn eq 'Y' }">
											<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인입니다.</div>
										</c:if>
										<c:if test="${ port.poUseYn ne 'Y' }">
											<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인은 아닙니다.</div>
										</c:if>
										<div class="portDescription">
											<span style="font-weight: bold;">디자인 설명</span><br>
											<span>${ port.poDesc }<!-- 인테리어 디자인 및 용품 판매 업체인 "끄끄흐"만의 재미있고 독창성을 보여주며, 이용하는 고객들이 직관적으로 이해할 수 있는 텍스트형 로고로 제작하였습니다. 색상변경 가능합니다. 감사합니다:) --></span>
										</div>						
									</div>
									<div class="BtnArea">
										<form action="deletePort.my" name="deletePortForm" method="post">
											<input type="hidden" name="poNum" value="${ port.poNum }">
											<input type="hidden" name="poWriter" value="${ port.poStatus }">
										</form>
										<div class="updateBtn">수정</div>
										<div class="deleteBtn">삭제</div>
									</div>					
									<div style="clear: both;"></div>
									<div class="replyArea">
										<div class="replayText">댓글(<span style="color: rgb(52, 152, 219)" class="replyCount">${ port.poFee }</span>건)</div>
										<div class="replyBoard">
											<c:if test="${ port.portReply ne '[null]'}">
												<c:forEach var="ppr" items="${ port.portReply }">
														<div class="repWriterImg">
															<c:if test="${ ppr.conCop eq null }">
																<img src="${ contextPath }/resources/images/default_profile.png" width="100%" height="100%">
															</c:if>
															<c:if test="${ ppr.conCop ne null }">
																<img src="${ contextPath }/${ ppr.conUrl }/${ ppr.conCop }" width="100%" height="100%">
															</c:if>
														</div>
														<div class="repIdDateCon">
															<div class="idDate">
																<span class="smallOption">${ ppr.porWriter }</span>
																<span>20${ ppr.porEnrollDate }</span>
															</div>
															<div class="repContents">
																${ ppr.porContent } 
															</div>
														</div>
														<div style="clear: both;"></div>
												</c:forEach>
											</c:if>
											
										</div>
										<div class="repEnrollArea">
											<form name="repEnrollForm" method="post" action="enrollPoReply.my" class="repEnrollForm">
												<input type="hidden" name="porRef" value="${ port.poNum }">
												<input type="hidden" name="porWriter" value="${ loginUser.userId }">
												<textarea class="porContent" name="porContent" rows="5" cols="110" style="resize: none; margin: 1%;"></textarea><br>
												<div class="repEnrollBtn" style="float: right;">등록</div>
												<div style="clear: both;"></div>								
											</form>
										</div>
									</div>
								</div>
				
								<div class="portScroll" style="position:absolute; top: 1100px; left: 1200px;"> 
									<img class="backToTop" onclick="backToTop(this);" src="${ contextPath }/resources/images/btn_backtotop.png" width="15%" height="15%">								
								</div>
							</div>
							
						</c:forEach>
						</c:if>
					</div>
					<!-- 페이징 처리 -->
					
					<!-- [이전] -->
					<div class="pagingCenter">
						<div class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<a href=""> &laquo; </a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="portpolioList.my">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="poWriter" value="${ portpolio.poWriter }"/>
								<c:if test="${ portpolio.poCategory ne null }">
									<c:param name="poCategory" value="${ portpolio.poCategory }"/>
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
							<c:url var="pagination" value="portpolioList.my">
								<c:param name="page" value="${ p }"/>
								<c:param name="poWriter" value="${ portpolio.poWriter }"/>
								<c:if test="${ portpolio.poCategory ne null }">
									<c:param name="poCategory" value="${ portpolio.poCategory }"/>
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
						<c:url var="after" value="portpolioList.my">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
							<c:param name="poWriter" value="${ portpolio.poWriter }"/>
								<c:if test="${ portpolio.poCategory ne null }">
									<c:param name="poCategory" value="${ portpolio.poCategory }"/>
								</c:if>
						</c:url> 
						<a href="${ after }"> &raquo; </a>
					</c:if>		
						
						</div>
					</div>
					<div id="portpolioEnrollBtn" onclick="location.href='portEnrollView.my'">등록하기</div>
				</div>
			</div>
			
			<%-- <!-- 포트폴리오 디테일 모달창 -->
			<c:if test="${ !empty list }">
				<c:forEach var="moPort" items="${ list }">
					<div id="portDetailModal" class="portDetailModalArea">
						<div class="portDetailModalContent">
							<div id="modalCloseBtn" onclick="closeDetail();"><img src="${ contextPath }/resources/images/x_icon.png" width="30" height="30"></div>
							<div style="clear: both;"></div>
							
							<div class="portpolioNameContents">
								<div class="portpolioName" style="text-indent: 20px;">
									${ moPort.poTitle }
								</div>
								<div class="portpolioContents">
									<img style="width: 100%;" name="portImage" src="${ contextPath }/${ moPort.pocPath }/${ moPort.pocModify }">
								</div>
							</div>
							<div class="portpolioDesc">
								<div class="userId">${ moPort.poWriter }</div>
								<div class="portClass">${ moPort.poCategory }</div>
								<c:if test="${ moPort.poUseYn eq 'Y' }">
									<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인입니다.</div>
								</c:if>
								<c:if test="${ moPort.poUseYn ne 'Y' }">
									<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인은 아닙니다.</div>
								</c:if>
								<div class="portDescription">
									<span style="font-weight: bold;">디자인 설명</span><br>
									<span>${ moPort.poDesc }<!-- 인테리어 디자인 및 용품 판매 업체인 "끄끄흐"만의 재미있고 독창성을 보여주며, 이용하는 고객들이 직관적으로 이해할 수 있는 텍스트형 로고로 제작하였습니다. 색상변경 가능합니다. 감사합니다:) --></span>
								</div>						
							</div>
							<div class="BtnArea">
								<div id="updateBtn">수정</div>
								<div id="deleteBtn">삭제</div>
							</div>					
							<div style="clear: both;"></div>
							<div class="replyArea">
								<div class="replayText">댓글(0건)</div>
								<div class="repWriterImg">
									<img src="">
								</div>
								<div class="repIdDateCon">
									<div class="idDate">
										<span>user02</span>
										<span>2020.03.28.</span>
									</div>
									<div class="repContents">
										와 정말 감탄이 절로 나오네요.. 
									</div>
								</div>
								<div style="clear: both;"></div>
								<div class="repEnrollArea">
									<div class="repMeImg">
										<img src="">
									</div>
									<form>
										<textarea id="repEnrollCon" name="repEnrollCon" rows="5" cols="95" style="resize: none;"></textarea><br>
										<input id="repEnrollBtn" type="submit" style="float: right;" value="등록">								
									</form>
								</div>
							</div>
						</div>
				
						<div id="portScroll" style="position:absolute; top: 1100px; left: 1200px;"> 
							<a href="#modalCloseBtn"><img id="backToTop" src="${ contextPath }/resources/images/btn_backtotop.png" width="15%" height="15%"></a>									
						</div>
					</div>
				</c:forEach>
			</c:if> --%>
			
			<%-- <!-- 포트폴리오 모달 영역 -->
			<div id="portDetailModal" class="portDetailModalArea">
				<div class="portDetailModalContent">
					<div id="modalCloseBtn" onclick="closeDetail();"><img src="${ contextPath }/resources/images/x_icon.png" width="30" height="30"></div>
					<div style="clear: both;"></div>
					
					<div class="portpolioNameContents">
						<div class="portpolioName" style="text-indent: 20px;">
							끄끄흐 디자인 (인테리어 디자인 및 용품 판매업) 로고 제작
						</div>
						<div class="portpolioContents">
							<img style="width: 100%;" name="portImage" src="${ contextPath }/resources/images/portimage_ex1.jpg">
						</div>
					</div>
					<div class="portpolioDesc">
						<div class="userId">user01</div>
						<div class="portClass">이미지 편집</div>
						<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인입니다.</div>
						<div class="portDescription">
							<span style="font-weight: bold;">디자인 설명</span><br>
							<span>인테리어 디자인 및 용품 판매 업체인 "끄끄흐"만의 재미있고 독창성을 보여주며, 이용하는 고객들이 직관적으로 이해할 수 있는 텍스트형 로고로 제작하였습니다. 색상변경 가능합니다. 감사합니다:)</span>
						</div>						
					</div>
					<div class="BtnArea">
						<div id="updateBtn">수정</div>
						<div id="deleteBtn">삭제</div>
					</div>					
					<div style="clear: both;"></div>
					<div class="replyArea">
						<div class="replayText">댓글(0건)</div>
						<div class="repWriterImg">
							<img src="">
						</div>
						<div class="repIdDateCon">
							<div class="idDate">
								<span>user02</span>
								<span>2020.03.28.</span>
							</div>
							<div class="repContents">
								와 정말 감탄이 절로 나오네요.. 
							</div>
						</div>
						<div style="clear: both;"></div>
						<div class="repEnrollArea">
							<div class="repMeImg">
								<img src="">
							</div>
							<form>
								<textarea id="repEnrollCon" name="repEnrollCon" rows="5" cols="95" style="resize: none;"></textarea><br>
								<input id="repEnrollBtn" type="submit" style="float: right;" value="등록">								
							</form>
						</div>
					</div>
				</div>
				
				<div id="portScroll" style="position:absolute; top: 1100px; left: 1200px;"> 
					<a href="#modalCloseBtn"><img id="backToTop" src="${ contextPath }/resources/images/btn_backtotop.png" width="15%" height="15%"></a>									
				</div>
			</div> --%>			
			
		</div>
		<div id="right-side">
			
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
	
		//썸네일 클릭시 해당 포트폴리오 모달창 열기
		function detailView(e){
			console.log(e);
			console.log($(e).parent().next()[0]);
			$(e).parent().next().show();
			
			// 포트폴리오 조회수 업데이트 기능
			var poNum = $(e).nextAll().eq(2).text();
			
			$.ajax({
				type	: "POST",
				url	    : 'uPortCount.my',
				data	: {'poNum':poNum},
				dataType: 'JSON',
				success : function(data) {
					console.log("ajax 조회수 업데이트 성공!");
				},
				error : function(e) {
					console.log("안되네...");
				}
			});			
			
			//스크롤이 움직일때마다 이벤트 발생
			$(e).parent().next().scroll(function(){  
	      			var position = $(e).parent().next().scrollTop(); // 현재 스크롤바의 위치값을 반환
	      			$(e).parent().next().children().last().stop().animate({top:800+position+"px"}, 200); //해당 오브젝트 위치값 재설정
			});
		};
		
		// top이미지 클릭시 상단으로 이동
		function backToTop(b){
			$(b).parent().parent().animate({
				scrollTop: 250
			}, 100);
		
		};
		
		/* $('.portpolioThumb').click(function(){
			$('#portDetailModal').show();
		}); */
		
		// x버튼 클릭시 새로고침
		function closeDetail(c){
			location.reload();
		};
		
		/* 포트폴리오 카테고리(전체, 이미지, 동영상) */
		var poWriter = '${ portpolio.poWriter }';
		
		function goToTotal(){
			location.href="portpolioList.my?poWriter=" + poWriter;
		}
		
		function goToImage(){
			var poCategory = "image";
			location.href="portpolioList.my?poWriter=" + poWriter + "&poCategory=" + poCategory;
		}
		
		function goToVideo(){
			var poCategory = "video";
			location.href="portpolioList.my?poWriter=" + poWriter + "&poCategory=" + poCategory;
		}	
		
	</script>

	<script> 
		/* function scroll_follow(id){
  			$(window).scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
      			var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환
      			$(id).stop().animate({top:900+position+"px"}, 200); //해당 오브젝트 위치값 재설정
   			});
		}
 			scroll_follow("#portScroll"); */
 			
	</script> 	
	
	<script>
		// 댓글 입력 기능
		$('.repEnrollBtn').on('click', function(){
			var porContent = $(this).prevAll().eq(1).val();
			var porWriter = $(this).prevAll().eq(2).val();
			var porRef = $(this).prevAll().eq(3).val();
			
			$.ajax({
				type	: "POST",
				url	    : 'enrollPoReply.my',
				data	: {'porRef':porRef, 'porWriter': porWriter, 'porContent': porContent},
				dataType: 'JSON',
				success : function(data) {
					console.log("ajax댓글입력 성공!");
					$('.replyCount').text(data.length);
					var replyBoard = $('.replyBoard')
					
					replyBoard.children().remove();
					
					for(var i = 0; i < data.length; i++) {
						var $repWriterImg = $('<div class="repWriterImg" style="width: 6%; border: 1px solid black; height: 65px; border-radius: 50px; float: left; overflow: hidden; margin: 10px;">');
						if(data[i].conUrl == null){
							var $writerImgTag = $('<img src="${ contextPath }/resources/images/default_profile.png" width="100%" height="100%">');
						} else {
							var $writerImgTag = $('<img src="${ contextPath }/' + data[i].conUrl + "/" + data[i].conCop + '" width="100%" height="100%">');
						}
						var $repIdDateCon = $('<div class="repIdDateCon" style="float: left;">');
						var $idDate = $('<div class="idDate" style="margin: 10px;">');
						var $spanId = $('<span style="margin-right: 6px;">'+ data[i].porWriter + '</span>&nbsp;');
						var $spanDate = $('<span>20' +  data[i].porEnrollDate + '</span>');
						var $repContents = $('<div style="margin: 10px;">' + data[i].porContent + '</div>');
						var $clear = $('<div style="clear: both;">');
						
						$idDate.append($spanId);
						$idDate.append($spanDate);
						
						$repIdDateCon.append($idDate);
						$repIdDateCon.append($repContents);
						
						$repWriterImg.append($writerImgTag);
						
						replyBoard.append($repWriterImg);
						replyBoard.append($repIdDateCon);
						replyBoard.append($clear);
						
						
					}
					
					$('.porContent').val("");
				},
				error : function(e) {
					console.log("안되네...");
				}
			});
			
		});
		
		// 포트폴리오 삭제 기능
		$('.deleteBtn').on('click', function(){
			swal({
                title: "포트폴리오를 삭제 하시겠습니까?",
                icon: "info",
                buttons : {
                   cancle : {
                      text : '취소',
                      value : false
                   },
                   confirm : {
                      text : '삭제',
                      value : true
                   }
                }
             }).then((result) => {
                if(result) {
                	$(this).prevAll().eq(1).submit();
                } else {
                	swal({
    				    title: "포트폴리오",
    				    text: "포트폴리오 삭제에 실패하였습니다.",
    				    icon: "error" //"info,success,warning,error" 중 택1
    				});
                }
             });
		});
		
		$('.updateBtn').on('click', function(){
			console.log($(this).prev());
			$(this).prev().attr('action', 'uPortView.my');
			$(this).prev().submit();
		});
		
	</script>
	
</body>
</html>