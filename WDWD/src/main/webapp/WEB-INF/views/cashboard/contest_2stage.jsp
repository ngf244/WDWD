<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="${ contextPath }/resources/naver_editor/js/HuskyEZCreator.js" charset="utf-8"></script>
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
		border-style: double;
	}
	.buyerInfoOption {
		display: inline-table;
		text-align: center;
		border-radius: 15px;
		background-color: rgba(161, 206, 244, 0.55);
		cursor: pointer;
		font-weight: bold;
		font-size: 11pt;
		margin-left: 30px;
		padding-left: 10px;
		padding-right: 10px;
	}
	#contentWrap {
		width: 80%;
		margin: 0 auto;
	}
	#content {
		width: 98%;
		height: 300px;
	}
	.fileArea {
		position: relative;
		display: inline-table;
		width: 150px;
		margin: 5px;
		font-size: 11pt;
		line-height: 25px;
		color: white;
		background: rgba(44, 62, 80, 0.5);
		text-align: center;
		font-weight: bold;
		margin-bottom: 15px;
		border-radius: 5px;
	}
	.fileArea p {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 140px;
		height: 25px;
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
	}
	.fileAreaImg {
		width: 140px;
		height: 140px;
		margin: 3px;
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
								<span class="smallOption">${ cBoard.boWriter }</span>
								<div class="buyerInfoOption">마이페이지</div>
								<div class="buyerInfoOption">작성 글 보기</div>
								<div class="buyerInfoOption">작성 댓글 보기</div>
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
							function showWaterMark() {
								for(var i = 0; i < $('#boardcontent img').length; i++) {
									var $watermark = $('<img>');
									$watermark.attr('class', 'watermark_free');
									$watermark.attr('src', '${ contextPath }/resources/images/watermark_free.png');
									
									$('header').append($watermark);
									setWaterMark($('#boardcontent img').eq(i), $watermark);
								}
							}
							showWaterMark();
						</script>
					</div> <br>
					
					<div id="btnList">
						<div id="submit" class="button" onclick="registWrite();">작성하기</div>
						<div id="cancle" class="button" onclick="window.history.back();">돌아가기</div>
					</div>
					
					<c:if test="${ !empty reqB }">
						<script>
							$('#submit').text('수정하기');
							$('#submit').attr('onclick', 'registUpdate();');
							$('#submit').attr('id', 'registUpdate');
						</script>
					</c:if>
					
					<script>
						$('.buyerInfoOption').click(function(){
							var whatIndex = $(this).index();
							
							$.ajax({
								url: 'callmeId.ch',
								data: {nickName: $(this).parent().find('span').text()},
								type: 'post',
								success: function(data){
									console.log(whatIndex)
									if(whatIndex == '1') {
										location.href = "main.my?userId=" + data
									} else if(whatIndex == '2') {
										// 수정예정
										location.href = "main.my?userId=" + data
									} else if(whatIndex == '3') {
										// 수정예정
										location.href = "main.my?userId=" + data
									}
								}
							});
						});
					
						function registWrite(){
							editor_object.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);
				
							swal({
								title: "글을 등록하시겠습니까?",
								icon: "info",
								buttons : {
									cancle : {
										text : '취소',
										value : false,
									},
									confirm : {
										text : '작성하기',
										value : true
									}
								}
							}).then((result) => {
								if(result) {
									$('#registWriteForm').submit();	
								}
							});
						}
						
						function registUpdate(){
							$('#registViewWrap').empty();
							$('.watermark_free').remove();
							
							var $form = $('<form action="registWrite.ch" method="post" id="registWriteForm">');
							var $div = $('<div id="contentWrap">');
							var $input1 = $('<input type="hidden" value="${ reqB.boNum }" name="boNum">');
							var $input2 = $('<input type="hidden" value="${ cBoard.boNum }" name="boardNum">');
							var $input3 = $('<input type="hidden" value=1 name="updateCheck">');
							var $textarea = $('<textarea name="boContent" id="content">');
							var $div2 = $('<div id="fileList">');
							
							$div.append($input1);
							$div.append($input2);
							$div.append($input3);
							$div.append($textarea);
							$div.append($div2);
							$form.append($div);
							$('#registViewWrap').append($form);
							
							editorLoad();
							
							setTimeout(function() {
								editor_object.getById["content"].exec("SET_IR", [""]); //내용초기화

								var reqContent = '${ reqB.boContent }'.replace(/\"/gi, "'");
								editor_object.getById["content"].exec("PASTE_HTML", [reqContent]);
								
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
							}, 500);
							
							$('#registUpdate').attr('id', 'registWrite').attr('onclick', 'registWrite();');
						}
					</script>
					
				</div>
			</div>
		</div>
		
		<div id="right-side"></div>		
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>