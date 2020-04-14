<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		min-height: 500px;
		height: auto;
	}
	#registContent {
		width: 60%;
		height: 500px;
		float: left;
	}
	#buyerInfo {
		width: 98%;
		height: 150px;
	}
	#content {
		width: 98%;
		height: 300px;
	}
	#downloadArea {
		width: 35%;
		height: 500px;
		float: right;
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

		<div id="main" >
			<div id="mainWrap">
				<jsp:include page="cBoardDetail.jsp"/>
				
				<div id="editorDetail">
					<div id="logoImg">
						<img src='${ contextPath }/resources/images/writeIcon.jpg'>1
					</div>
					
					<div id="mainTitle">
						참여 에디터 : <span>user01</span>
					</div>
					
					<div id="registWrap">
						<div id="registContent">
							<div id="buyerInfo">
								<div class="leftLine">
									의뢰인 정보
								</div>
								<div class="rightLine">
									정문종 하나 284-891239-76707 <br>
									010-5217-5324
								</div>
							</div>
							
							<textarea name="content" id="content"></textarea>
						</div>
						
						<script type="text/javascript">
							var oEditors = [];
							nhn.husky.EZCreator.createInIFrame({
							 oAppRef: oEditors,
							 elPlaceHolder: "content",
							 sSkinURI: "../../se2/SmartEditor2Skin.html",
							 fCreator: "createSEditor2"
							});
						</script>
						
						<div id="downloadArea">
							<div id="mainTitle">
								자료 첨부파일
							</div>
							
							<br>
							
							logo.jpg <div class="download">download</div><br>
							logo.jpg <div class="download">download</div><br>
							logo.jpg <div class="download">download</div><br>
							logo.jpg <div class="download">download</div><br>
						</div>
					</div> <br>
					
					<div id="btnList">
						<div id="submit" class="button">작성완료</div>
						<div id="cancle" class="button">돌아가기</div>
					</div>
					
					<script>
						$('#submit').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						});
						$('#cancle').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						})
					</script>
				</div>	
			</div>
		</div>
		
		<!-- 공용영역 -->
		<div id="right-side"></div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>