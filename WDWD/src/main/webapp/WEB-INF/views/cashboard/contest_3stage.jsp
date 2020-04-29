<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#editorDetail {
		background-color: rgba(255, 245, 230, 0.8); 
	}
	#contest_winner {
		position: absolute;
	}
	.editorView {
		width: 20%;
		height: 200px;
		display: inline-table;
		margin: 2%;
	}
	.editorPhoto {
		width: 100%;
		height: 180px;
	}
	.editorId {
		text-align: center;
		height: 20px;
		font-size: 12pt;
	}
	.modal {
		display: none; /* Hidden by default */
		position: fixed; /* Stay in place */
		z-index: 2; /* Sit on top */
		left: 0;
		top: 0;
		width: 100%; /* Full width */
		height: 100%; /* Full height */
		overflow: auto; /* Enable scroll if needed */
		background-color: rgb(0,0,0); /* Fallback color */
		background-color: rgba(0,0,0,0.7); /* Black w/ opacity */
	}
	.modal-content {
		background-color: #fefefe;
		margin: 5% auto; /* 15% from the top and centered */
		padding: 20px;
		width: 65%; /* Could be more or less, depending on screen size */                          
	}
	.modal-left {
		width: 75%;
		display: inline-table;
		margin-right: 3%;
	}
	.modal-right {
		width: 20%;
		display: inline-table;
		text-align: center;
	}
	.modal-title {
		text-align: center;
		font-size: 16pt;
		font-weight: bold;
		margin-bottom: 30px;
	}
	.modal-text {
		min-height: 400px;
		border: 1px solid black;
	}
	.modal-text img {
		max-width: 100%;
	}
	.profile_img {
		width: 80px;
		height: 80px;
		display: inline-table;
		border-radius: 50%;
		margin-right: 20px;
		overflow: hidden;
		
		border: 1px solid black;
	}
	#btnList {
		text-align: center;
		margin-top: 30px;
	}
	.button {
		display: inline-table;
		width: 150px;
		height: 50px;
		margin: 10px;
		line-height: 50px;
		font-size: 14pt;
		text-align: center;
		background-color: rgba(161, 206, 244, 0.55);
		border-radius: 5px;
		cursor: pointer;
		font-weight: bold;
	}
	.button:hover {
		background-color: rgb(52, 152, 219);
		color: white;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side"></div>

		<div id="main">
			<div id="mainWrap">
				<jsp:include page="cBoardDetail.jsp"/>
				
				<div id="editorDetail">
					<div id="logoImg">
						<img src='${ contextPath }/resources/images/writeIcon.jpg'>1
					</div>
					<div id="mainTitle">
						참여 에디터
					</div>
					
					<br><br>
					
					<div id="editorListWrap">
						<c:if test="${ cBoard.boReNum eq 0 }">
							<p style="font-size: 14pt; text-align: center;">참여중인 에디터가 없습니다.</p>
						</c:if>
						
						<!-- 당선작 -->
						<c:if test="${ cBoard.boReNum ne 0 }">
							<c:forEach var="r" items="${ reqMList }">
								<c:forEach var="b" items="${ reqBList }">
									<c:if test="${r.reId eq b.boWriter and r.rePlz eq 'Y'}">
										<div class="editorView" style="border: 5px double yellow;" onclick="createModal(this);">
											<c:if test="${ !empty b.thumbnail }">
												<img class="editorPhoto" src="${ contextPath }/resources/real_photo/${ b.thumbnail }">
											</c:if>
											
											<c:if test="${ empty b.thumbnail }">
												<img class="editorPhoto" src="${ contextPath }/resources/images/emptyImage.png">
											</c:if>
											
											<div class="editorId">
												${ r.reId }
											</div>
											
											<div class="modal">
										    	<div class="modal-content">
										    		<div class="modal-left">
										    			<div class="modal-title">
										    				${ cBoard.boTitle }
										    			</div>
										    			<div class="modal-text">
										    				${ b.boContent }
										    			</div>
										    			
										    			<div class="leftLine">
															<span class="redColor">＞ </span>첨부파일
														</div>
														<div class="rightLine">
															<c:if test="${ empty reqFileList}">
																첨부된 파일이 없습니다.
															</c:if>
															
															<c:if test="${ !empty reqFileList }">
																<c:forEach var="file" items="${ reqFileList }">
																	<span class="downloadName">${ file.conOri }</span> <a class="downloadBtn" href="${ file.conUrl }/${ file.conCop }" download="${ file.conOri }">download</a><br>
																</c:forEach>
															</c:if>
														</div>
										    			
										    		</div>
										    		<div class="modal-right">
										    			<div id="profile_wrap">
										    				<div class="profile_img"><img src=''></div>
										    				<b id="contestWinnerNick">${ b.boWriter }</b>
										    			</div>	
														<p>마이페이지</p>
														<p>작성 글 보기</p>
														<p>작성 댓글 보기</p>
										    		</div>
										    	</div>
										    </div>
										    
										    <img id="contest_winner" src='${ contextPath }/resources/images/contest_winner.png'>
										</div>
									</c:if>
								</c:forEach>
								<script>
									var winnerDiv = $(".editorPhoto");
									var winnerImg = $("#contest_winner");
									
									winnerImg.css("left", winnerDiv.offset().left + "px");
									winnerImg.css("top", winnerDiv.offset().top + "px");
									winnerImg.css("width", winnerDiv.innerWidth() / 5);
									winnerImg.css("height", winnerDiv.innerHeight() / 5);
								</script>
							</c:forEach>
						
							<!-- 등록된 작품 우선 -->
							<c:forEach var="r" items="${ reqMList }">
								<c:forEach var="b" items="${ reqBList }">
									<c:if test="${r.reId eq b.boWriter and r.rePlz eq 'N'}">
										<div class="editorView" onclick="createModal(this);">
											<c:if test="${ !empty b.thumbnail }">
												<img class="editorPhoto" src="${ contextPath }/resources/real_photo/${ b.thumbnail }">
											</c:if>
											
											<c:if test="${ empty b.thumbnail }">
												<img class="editorPhoto" src="${ contextPath }/resources/images/emptyImage.png">
											</c:if>
											
											<div class="editorId">
												${ r.reId }
											</div>
											
											<div class="modal">
										    	<div class="modal-content">
										    		<div class="modal-left">
										    			<div class="modal-title">
										    				${ cBoard.boTitle }
										    			</div>
										    			<div class="modal-text">
										    				${ b.boContent }
										    			</div>
										    		</div>
										    		<div class="modal-right">
										    			<div id="profile_wrap">
										    				<div class="profile_img"><img src=''></div>
										    				<b>${ b.boWriter }</b>
										    			</div>	
														<p>마이페이지</p>
														<p>작성 글 보기</p>
														<p>작성 댓글 보기</p>
										    		</div>
										    	</div>
										    </div>
										</div>
									</c:if>
								</c:forEach>
							</c:forEach>
							
							<!-- 미등록 작품 -->
							<c:forEach var="r" items="${ reqMList }">
								<c:set var="bCheck" value="false" />
								<c:forEach var="b" items="${ reqBList }">
									<c:if test="${r.reId eq b.boWriter}">
										<c:set var="bCheck" value="true" />
									</c:if>
								</c:forEach>
								<c:if test="${ bCheck eq false }">
									<div class="editorView" onclick="waitAlert();">
										<img class="editorPhoto" src="${ contextPath }/resources/images/drawing.jpg">
										<div class="editorId">
											${ r.reId }
										</div>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</div>
					
					<script>
						$('.downloadBtn').click(function(e){
							if($('#contestWinnerNick').text() != "${sessionScope.loginUser.nickName}" && "${cBoard.boWriter}" != "${sessionScope.loginUser.nickName}") {
								e.preventDefault();
								swal({
									title: "원본 파일은 작성자와 에디터만 다운로드할 수 있습니다.",
									icon: "error"
								});
							}
						})
					
					
						function waitAlert() {
							swal({
								title: "에디터가 아직 글을 등록하지 않았습니다.",
								icon: "info"
							});
						} 
					
						$(document).on("contextmenu dragstart selectstart", '.modal-text img', function(e){
				            swal({
								title: "불법 이미지 다운을 막고 있습니다.",
								icon: "error"
							});
							return false;
				        });
						
						function createModal(e) {
				    		$('.editorView').attr('onclick', '')
				    		$(e).children().eq(2).show();
				    		$(e).children().eq(2).scrollTop(0);
				    		
				    		var modalImg = $(e).children().eq(2).children().children().children().eq(1).find('img');
				    		
			    			for(var i = 0; i < modalImg.length; i++) {
								var $watermark = $('<img>');
								$watermark.attr('class', 'watermark_contest');
								$watermark.attr('src', '${ contextPath }/resources/images/watermark_free.png');
								
								$(e).children().eq(2).children().children().children().eq(1).append($watermark);
								setWaterMarkContest(modalImg.eq(i), $watermark);
							}
				    	}
				    	
				    	function setWaterMarkContest(img, watermark) {
							var image_box = $("#mainIcon");
							var water_mark = $(".water_mark");
							
							watermark.css("left", img.position().left + "px");
							watermark.css("top", img.position().top + "px");
							watermark.css("width", img.innerWidth());
							watermark.css("height", img.innerHeight());
						}
				    	
						window.onclick = function(event) {
				    		for(var i = 0; i < $(".modal").length; i++) {
				    			if (event.target == $(".modal")[i]) {
									$('.modal').hide();
									$('.watermark_contest').remove();
									$('.editorView').attr('onclick', 'createModal(this);')
								}
				    		}
						}
					</script>
					
					<br><br>
					
					<div id="btnList">
						<div id="cancle" class="button">돌아가기</div>
					</div>
				</div>
			</div>
		</div>
		
		<div id="right-side"></div>		
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>