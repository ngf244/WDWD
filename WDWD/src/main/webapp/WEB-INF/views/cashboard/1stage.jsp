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
					
					<div class="editorList">
						<div class="editorId">
							user01
						</div>
						<div class="editorDate">
							20/03/25
						</div>
						<div class="editorCheck">
							<input type="radio" name="editor" value="">
						</div>
					</div>
					
					<div class="editorList">
						<div class="editorId">
							user01
						</div>
						<div class="editorDate">
							20/03/25
						</div>
						<div class="editorCheck">
							<input type="radio" name="editor" value="">
						</div>
					</div>
					
					<div class="editorList">
						<div class="editorId">
							user01
						</div>
						<div class="editorDate">
							20/03/25
						</div>
						<div class="editorCheck">
							<input type="radio" name="editor" value="">
						</div>
					</div>
					
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
						<div id="submit" class="button">에디터 선택</div>
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