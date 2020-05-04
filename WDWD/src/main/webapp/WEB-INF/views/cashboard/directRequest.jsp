<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#editorDetail {
		background-color: rgba(255, 245, 230, 0.8); 
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
					
					<div id="editorListWrap" style="text-align: center; font-size: 16pt;">
						요청을 기다리고 있습니다.
					</div>
					
					<br><br>
					
					<div id="btnList">
						<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
							<div id="cancle" class="button" onclick="window.history.back();">돌아가기</div>
						</c:if>
						
						<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
							<div id="accept" class="button">수락하기</div>
							<div id="decline" class="button">거절하기</div>
						</c:if>
					</div>
					
					<script>
						$('#accept').click(function(){
							swal({
								title: "해당 의뢰를 수락하시겠습니까?",
								icon: "info",
								buttons : {
									cancle : {
										text : '취소',
										value : false,
									},
									confirm : {
										text : '확인',
										value : true
									}
								}
							}).then((result) => {
								if(result) {
									location.href="change2stage.ch?boNum=${cBoard.boNum}"
								}
							});
						})
						
						$('#decline').click(function(){
							swal({
								title: "해당 의뢰를 거절하시겠습니까?",
								icon: "info",
								buttons : {
									cancle : {
										text : '취소',
										value : false,
									},
									confirm : {
										text : '확인',
										value : true
									}
								}
							}).then((result) => {
								if(result) {
									location.href="directFalse.ch?boNum=${cBoard.boNum}"
								}
							});
						})
						
						$('.downloadBtn').click(function(e){
							if("${cBoard.boWriter}" != "${sessionScope.loginUser.nickName}") {
								e.preventDefault();
								swal({
									title: "원본 파일은 작성자와 에디터만 다운로드할 수 있습니다.",
									icon: "error"
								});
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