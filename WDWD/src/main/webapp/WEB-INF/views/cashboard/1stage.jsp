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
							<c:forEach var="r" items="${ list }">
								<c:if test="${ r.reId eq sessionScope.loginUser.nickName }">
									<div class="editorList" style="background: rgba(161, 206, 244, 0.55);">
										<div class="editorId">
											<span class="smallOption">${ r.reId }</span>
										</div>
										<div class="editorDate">
											<c:if test="${ cBoard.boGroup eq 3 }">
												<fmt:formatNumber value="${ r.reCash }" type="number" groupingUsed="true"/> CASH
											</c:if>
											<c:if test="${ cBoard.boGroup ne 3 }">
												${ r.reDate }
											</c:if>
										</div>
										<div class="editorCheck">
											<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
												<c:if test="${ cBoard.boGroup eq 2 }">
													<input type="radio" name="editor" value="">
												</c:if>
											</c:if>
										</div>
									</div>
								</c:if>
							</c:forEach>
							
							<c:forEach var="r" items="${ list }">
								<c:if test="${ r.reId ne sessionScope.loginUser.nickName }">
									<div class="editorList">
										<div class="editorId">
											<span class="smallOption">${ r.reId }</span>
										</div>
										<div class="editorDate">
											<c:if test="${ cBoard.boGroup eq 3 }">
												<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
													<fmt:formatNumber value="${ r.reCash }" type="number" groupingUsed="true"/> CASH
												</c:if>
												
												<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
													비공개입니다.
												</c:if>
											</c:if>
											<c:if test="${ cBoard.boGroup ne 3 }">
												${ r.reDate }
											</c:if>
										</div>
										<div class="editorCheck">
											<c:if test="${ cBoard.boWriter eq sessionScope.loginUser.nickName }">
												<c:if test="${ cBoard.boGroup eq 2 }">
													<input type="radio" name="editor" value="">
												</c:if>
											</c:if>
										</div>
									</div>
								</c:if>
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
								<c:if test="${ cBoard.boGroup eq 2 }">
									<form action="go2stage.ch" method="post" id="selectForm" style="display:inline-block;" >
										<div id="selectEdit" class="button">에디터 선택</div>
										<input type="hidden" id="reNum" name="reNum" value="">
										<input type="hidden" id="reId" name="reId" value="">
									</form>
								</c:if>
							</c:if>
							
							<c:if test="${ cBoard.boWriter ne sessionScope.loginUser.nickName }">
								<c:if test="${ cBoard.cbDate ne '마감' }">
									<div id="doIt" class="button">신청하기</div>
								</c:if>
								
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

						<div id="cancle" class="button" onclick="location.href='actionList.ch'">목록으로</div>
					</div>
					
					<script>
						$('#doIt').click(function(){
							var userId = '${ sessionScope.loginUser.userId }';
							var reCash = 0;
							
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
								if(result) {
									if('${ cBoard.boGroup }' == 3) {
										var reCash = 0
										
										swal({
											title: "작업할 의뢰비를 입력해주세요.",
											icon: "info",
											content: {
												element: "input",
												attributes: {type: "number"},
												value: reCash
											}
										}).then((input) => {
											doReq(userId, input);
										});
									} else {
										doReq(userId, reCash);
									}
								}
							});
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
										swal({
											title: "신청되었습니다.",
											icon: "success"
										});
									}
								}
							});
						}
						
						$('#cancleIt').click(function(){
							swal({
								title: "에디터 등록을 취소하시겠습니까?",
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
									var userId = '${ sessionScope.loginUser.userId }';
									cancleReq(userId);
								}
							});
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
										swal({
											title: "신청 취소되었습니다.",
											icon: "success"
										});
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
											if(data.list[i].reId == '${ sessionScope.loginUser.nickName }') {
												var $div = $('<div class="editorList" style="background: rgba(161, 206, 244, 0.55);">');
												var $subDiv1 = $('<div class="editorId">');
												var $subDiv2 = $('<div class="editorDate">');
												var $subDiv3 = $('<div class="editorCheck">');
												var $span = $('<span class="smallOption">');
												
												$span.text(data.list[i].reId);
												$subDiv1.append($span);
												
												if('${ cBoard.boGroup }' == 3) {
													var cashNum = data.list[i].reCash;
													$subDiv2.text(cashNum.toLocaleString() + " CASH");
												} else {
													$subDiv2.text(data.list[i].reDate);
												}
												
												$div.append($subDiv1);
												$div.append($subDiv2);
												$div.append($subDiv3);
												
												$('#editorListWrap').append($div);
											}
										}
										
										for(var i in data.list) {
											if(data.list[i].reId != '${ sessionScope.loginUser.nickName }') {
												var $div = $('<div class="editorList">');
												var $subDiv1 = $('<div class="editorId">');
												var $subDiv2 = $('<div class="editorDate">');
												var $subDiv3 = $('<div class="editorCheck">');
												var $span = $('<span class="smallOption">');
												
												$span.text(data.list[i].reId);
												$subDiv1.append($span);
												
												if('${ cBoard.boGroup }' == 3) {
													var cashNum = data.list[i].reCash;
													$subDiv2.text("비공개입니다.");
												} else {
													$subDiv2.text(data.list[i].reDate);
												}
												
												$div.append($subDiv1);
												$div.append($subDiv2);
												$div.append($subDiv3);
												
												$('#editorListWrap').append($div);
											}
										}
									}
								}
							});
						}
						
						$('#selectEdit').click(function(){
							swal({
								title: "선택한 에디터에게 작업을 맡기시겠습니까?",
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
									$('#reNum').val($('#boNum').val());
									$('#reId').val($("input[name=editor]:checked").parent().parent().children().first()[0].innerText);
									
									$('#selectForm').submit();	
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