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
									<c:if test="${ cBoard.boGroup eq 3 }">
										<fmt:formatNumber value="${ r.reCash }" type="number" groupingUsed="true"/> 원
									</c:if>
									<c:if test="${ cBoard.boGroup ne 3 }">
										${ r.reDate }
									</c:if>
								</div>
								<div class="editorCheck">
									<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
										<input type="radio" name="editor" value="">
									</c:if>
								</div>
							</div>
							</c:forEach>
						</c:if>
					</div>
					
					<br><br>
					
					<script>
						
						$("input:radio[name=editor]").click(function(){
							$("input[name=editor]").parent().parent().css('background', '');
							$("input[name=editor]:checked").parent().parent().css('background', 'rgba(161, 206, 244, 0.55)');
						});
					</script>
					
					<div id="btnList">
						<c:if test="${ !empty sessionScope.loginUser }">
							<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
								<form action="go2stage.ch" method="post" id="selectForm" style="display:inline-block;" >
									<div id="selectEdit" class="button">에디터 선택</div>
									<input type="hidden" id="reNum" name="reNum" value="">
									<input type="hidden" id="reId" name="reId" value="">
								</form>
							</c:if>
							
							<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
								<div id="doIt" class="button">신청하기</div>
								<div id="cancleIt" class="button" style="display: none;">취소하기</div>
								
								<c:set var="loop_flag" value="false" />
								<c:forEach var="list" items="${ list }" varStatus="status">
								    <c:if test="${not loop_flag }">
								        <c:if test="${ sessionScope.loginUser.nickName eq list.reId }">
								            <c:set var="loop_flag" value="true" />
								            <script>
								            	$('#doIt').hide();
								            	$('#cancleIt').show();
								            </script>
								        </c:if>
								    </c:if>
								</c:forEach>
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
										listReq($('#boNum').val());
										$('#doIt').hide();
										$('#cancleIt').show();
										alert('신청되었습니다.');
									}
								}
							});
						}
						
						$('#cancleIt').click(function(){
							if(confirm("에디터 등록을 취소하시겠습니까?")) {
								var userId = '${ sessionScope.loginUser.userId }';
								cancleReq(userId);
							}
						})
						
						function cancleReq(userId) {
							$.ajax({
								url: 'cancleRequest.ch',
								data: {reNum: $('#boNum').val(), reId: userId},
								type: 'post',
								success: function(data){
									if(data == 'ok') {
										listReq($('#boNum').val());
										$('#cancleIt').hide();
										$('#doIt').show();
										alert('신청 취소되었습니다.');
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

									if(data.list.length == 0) {
										var $p = $('<p style="font-size: 14pt; text-align: center;">');
										$p.text('참여중인 에디터가 없습니다.');
										$('#editorListWrap').append($p);
									} else {
										for(var i in data.list) {
											var $div = $('<div class="editorList">');
											var $subDiv1 = $('<div class="editorId">');
											var $subDiv2 = $('<div class="editorDate">');
											var $subDiv3 = $('<div class="editorCheck">');
											/* var $radio = $('<input type="radio" name="editor" value="">'); */
											
											$subDiv1.text(data.list[i].reId);
											
											if('${ cBoard.boGroup }' == 3) {
												var cashNum = data.list[i].reCash;
												$subDiv2.text(cashNum.toLocaleString() + " 원");
											} else {
												$subDiv2.text(data.list[i].reDate);
											}
											
											/* $subDiv3.append($radio); */
											$div.append($subDiv1);
											$div.append($subDiv2);
											$div.append($subDiv3);
											
											$('#editorListWrap').append($div);
										}
									}
								}
							});
						}
						
						$('#selectEdit').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						});
						$('#selectEdit').click(function(){
							if(confirm("선택한 에디터에게 작업을 맡기시겠습니까?")) {
								$('#reNum').val($('#boNum').val());
								$('#reId').val($("input[name=editor]:checked").parent().parent().children().first()[0].innerText);
								
								$('#selectForm').submit();	
							}
						})
						$('#cancle').hover(function(){
							$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
						}, function(){
							$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
						})
						
						$('.downloadBtn').click(function(e){
							if("${cBoard.boWriter}" != "${sessionScope.loginUser.nickName}") {
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