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
	#registWrap {
		margin-top: 50px;
		width: auto;
		min-height: 100px;
		height: auto;
	}
	#buyerInfo {
		width: 80%;
		margin: 0 auto;
		margin-bottom: 30px;
		
		border: 1px solid black;
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
					
					<div id="registWrap">
						<div id="buyerInfo">
							<div class="leftLine">
								의뢰인 정보
							</div>
							<div class="rightLine">
								정문종 하나 284-891239-76707 <br>
								010-5217-5324
							</div>
						</div>
						
						<div id="registViewWrap">
							<c:if test="${ empty reqB }">
								<form action="registWrite.ch" method="post" id="registWriteForm">
									<div id="contentWrap">
										<input type="hidden" value="${ cBoard.boNum }" name="boardNum">
										<input type="hidden" value=0 name="updateCheck">
										<textarea name="boContent" id="content"></textarea>
										<div id="fileList"></div>
									</div>
								</form>
							</c:if>
							
							<script>
								var editor_object = [];
								
								function editorLoad() {
									nhn.husky.EZCreator.createInIFrame({
										oAppRef: editor_object,
										elPlaceHolder: "content",
										sSkinURI: "${ contextPath }/resources/naver_editor/SmartEditor2Skin.html",
										htParams : {
											bUseToolbar : true,
											bUseVerticalResizer : true,
											bUseModeChanger : true,
										}
									});
								}
								editorLoad();
								
								var contentValue = "";
								var imgCount = 0;
								var imgTempCount = 0;
								var imgIndexStart = 0;
								var imgIndexEnd = 0;
								var imgSrc = new Array;
								var imgName = new Array;
								
								!function imgCheck(){
									setTimeout(function() {
										editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
										
										contentValue = $('#content').val();
										imgTempCount = (contentValue.match(/<img src=/g) || []).length;
										
										if(imgTempCount != imgCount) {
											$('#fileList').empty();
											imgCount = imgTempCount;
											imgSrc = new Array;
											imgName = new Array;
											
											for(var i = 0; i < imgCount; i++) {
												imgIndexStart = contentValue.indexOf('<img src=', imgIndexEnd) + 10;
												imgIndexEnd = contentValue.indexOf('"', imgIndexStart);
												
												imgSrc.push(contentValue.substring(imgIndexStart, imgIndexEnd));
												
												imgIndexStart = contentValue.indexOf('title=', imgIndexEnd) + 7;
												imgIndexEnd = contentValue.indexOf('"', imgIndexStart);
												
												imgName.push(contentValue.substring(imgIndexStart, imgIndexEnd));
												
												changeFile(imgSrc[i], imgName[i]);
											}
											
											imgIndexStart = 0;
											imgIndexEnd = 0;
										}
										
										imgCheck();
									}, 500)
								}()
								
								function changeFile(fileUrl, fileName) {
									var $div = $('<div class="fileArea">');
									var $img = $('<img class="fileAreaImg" name="imgFile">');
									var $input1 = $('<input type="hidden" name="conUrl" value=' + fileUrl.substring(0, fileUrl.lastIndexOf('/')) + '>');
									var $input2 = $('<input type="hidden" name="conCop" value=' + fileUrl.substring(fileUrl.lastIndexOf('/') + 1) + '>');
									var $input3 = $('<input type="hidden" name="conOri" value=' + fileName + '>');
									var $p = $('<p>')
									
									$p.text(fileName);
									
									$img.attr("src", fileUrl);
									
									$div.append($img);
									$div.append($input1);
									$div.append($input2);
									$div.append($input3);
									$div.append($p);
									
									$('#fileList').append($div);
								}
							</script>
							
							<c:if test="${ !empty reqB }">
								<div id="boardcontent">
									${ reqB.boContent }
								</div>
								
								<div class="leftLine">
									<span class="redColor">＞ </span>첨부파일
								</div>
								<div class="rightLine">
									<c:if test="${ empty reqFileList }">
										첨부된 파일이 없습니다.
									</c:if>
									
									<c:if test="${ !empty reqFileList }">
										<c:forEach var="file" items="${ reqFileList }">
											<span class="downloadName">${ file.conOri }</span> <a class="downloadBtn" href="${ file.conUrl }/${ file.conCop }" download="${ file.conOri }">download</a><br>
										</c:forEach>
									</c:if>
								</div>
							</c:if>
						</div>
						
						<script>
							for(var i = 0; i < $('#boardcontent img').length; i++) {
								var $watermark = $('<img>');
								$watermark.attr('class', 'watermark_free');
								$watermark.attr('src', '${ contextPath }/resources/images/watermark_free.png');
								
								$('header').append($watermark);
								setWaterMark($('#boardcontent img').eq(i), $watermark);
							}
						</script>
					</div> <br>
					
					<div id="btnList">
						<div id="submit" class="button">수락하기</div>
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