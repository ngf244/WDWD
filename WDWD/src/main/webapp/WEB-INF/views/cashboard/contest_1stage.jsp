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
						
						<c:if test="${ cBoard.boReNum ne 0 }">
							<c:forEach var="r" items="${ reqMList }">
								<div class="editorView">
									
									<!-- 이미지 경로는 추후 수정 -->
									<!-- 글 등록한 사람 우선으로 보이도록 추후 수정 -->
									<img class="editorPhoto" src="${ contextPath }/resources/images/drawing.jpg">
									
									<div class="editorId">
										${ r.reId }
									</div>
								</div>
							</c:forEach>
						</c:if>
					
					</div>
					
					<br><br>
					
					<div id="btnList">
						<c:if test="${ !empty sessionScope.loginUser }">
							<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
								<c:if test="${ cBoard.cbDate ne '마감' }">
									<form action="doReqContest.ch" method="post" id="doRequestForm" style="display:inline-block;" >
										<div id="doIt" class="button">신청하기</div>
										<input type="hidden" name="reNum" value="${ cBoard.boNum }">
										<input type="hidden" name="reId" value='${ sessionScope.loginUser.userId }'>
										<input type="hidden" name="reCash" value="${ cBoard.cbCash }">
									</form>
								</c:if>
							</c:if>
						</c:if>
						
						<div id="cancle" class="button">돌아가기</div>
					</div>
					
					<script>
						$('#doIt').click(function(){
							swal({
								title: "에디터 등록을 하시겠습니까?",
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
								$('#doRequestForm').submit();
							});
						})
					</script>
				</div>
			</div>
		</div>
		
		<div id="right-side"></div>		
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>