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
		min-height: 500px;
		height: auto;
	}
	#buyerInfo {
		width: 80%;
		margin: 0 auto;
		margin-bottom: 30px;
		
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
						참여 에디터 : <span>${ cBoard.reId }</span>
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
						
						<div id="boardcontent">
							${ reqB.boContent }
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
					</div> <br>
					
					<div id="btnList">
						<div id="cancle" class="button">돌아가기</div>
					</div>
					
					<script>
						$('#cancle').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						})
						
						$('.downloadBtn').click(function(e){
							if("${reqB.boWriter}" != "${sessionScope.loginUser.userId}" && "${cBoard.boWriter}" != "${sessionScope.loginUser.nickName}") {
								e.preventDefault();
								alert('원본 파일은 작성자와 에디터만 다운로드할 수 있습니다.');
							}
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