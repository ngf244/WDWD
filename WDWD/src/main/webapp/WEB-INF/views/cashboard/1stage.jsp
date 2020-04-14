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
	.editorList {
		display: inline-table;
		width: 45%;
		font-size: 14pt;
	}
	.editorId {
		display: inline-table;
		width: 40%;
		height: 30px;
		text-align: center;
		line-height: 50px;
	}
	.editorDate {
		display: inline-table;
		width: 30%;
		height: 30px;
		text-align: center;
		line-height: 50px;
	}
	.editorCheck {
		display: inline-table;
		width: 20%;
		height: 30px;
		text-align: center;
	}
	.editorCheck input {
		width: 20px;
		height: 20px;
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
					
					<br><br>
					
					<div id="editorListWrap">
						<c:if test="${ cBoard.boReNum eq 0 }">
							<p style="font-size: 14pt; text-align: center;">참여중인 에디터가 없습니다.</p>
						</c:if>
						
						<c:if test="${ cBoard.boReNum ne 0 }">
							<c:forEach var="r" items="${ list }">
							<div class="editorList">
								<div class="editorId">
									${ r.reId }
								</div>
								<div class="editorDate">
									${ r.reDate }
								</div>
								<div class="editorCheck">
									<input type="radio" name="editor" value="">
								</div>
							</div>
							</c:forEach>
						</c:if>
					</div>
					
					<br><br>
					
					<script>
						$("input:radio[name=editor]").click(function(){
							console.log($("input[name=editor]:checked").parent().parent());
							
							$("input[name=editor]").parent().parent().css('background', '');
							$("input[name=editor]:checked").parent().parent().css('background', 'rgba(161, 206, 244, 0.55)');
						});
					</script>
					
					<!-- 작성자가 아닐 경우 라디오버튼 숨기고 에디터 선택 대신에 신청하기 or 취소하기
					1:1일 경우에는 신청날짜, 경매의 경우 금액 -->
					
					<div id="btnList">
						<c:if test="${ !empty sessionScope.loginUser }">
							<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
								<div id="submit" class="button">에디터 선택</div>
							</c:if>
							
							<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
								<div id="doIt" class="button">신청하기</div>
							</c:if>
						</c:if>

						<div id="cancle" class="button">돌아가기</div>
					</div>
					
					<script>
						$('#doIt').click(function(){
							var userId = '${ sessionScope.loginUser.userId }';
							var reCash = 0;
							
							if(confirm("에디터 등록을 하시겠습니까?")) {
								if('${ cBoard.boGroup }' == 3) {
									reCash = prompt("작업할 의뢰비를 입력해주세요.");
									if(isNaN(reCash)) {
										alert('의뢰비는 숫자만 입력하실 수 있습니다.');
									} else {
										doReq(userId, reCash);
									}
								} else {
									doReq(userId, reCash);
								}
							}
						})
						
						function doReq(userId, reCash) {
							$.ajax({
								url: 'doRequest.ch',
								data: {reNum: $('#boNum').val(), reId: userId, reCash: reCash},
								type: 'post',
								success: function(data){
									if(data == 'ok') {
										listReq($('#boNum').val())
									}
								}
							});
						}
						
						function listReq(bId) {
							$.ajax({
								url: 'reqList.ch',
								data: {bId: bId},
								type: 'post',
								success: function(data){
									$("#editorListWrap").empty();
									
									for(var i in data.list) {
										var $div = $('<div class="editorList">');
										var $subDiv1 = $('<div class="editorId">');
										var $subDiv2 = $('<div class="editorDate">');
										var $subDiv3 = $('<div class="editorCheck">');
										var $radio = $('<input type="radio" name="editor" value="">');
										
										$subDiv1.text(data.list[i].reId);
										$subDiv2.text(data.list[i].reDate);
										
										$subDiv3.append($radio);
										$div.append($subDiv1);
										$div.append($subDiv2);
										$div.append($subDiv3);
										
										$('#editorListWrap').append($div);
									}
								}
							});
						}
						
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