<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
<style>
	.boardtitle {
		margin-top: 20px;
		border-bottom-style: solid;
		border-bottom-color: rgb(52, 152, 219);
		text-align: left;
		height: 20px;
		color: black;
		padding-bottom: 10px;
		}
		
	.nick {
		margin-top: 20px;
		}
		
	.titleform {
		margin-top: 10px;
		width: 88%;
		height: 50px;
		font-size: 15px;
		font-size: large;
		text-align: center;
		}
		
		.cancell {
			width: 8%;
			height: 40.5px;
			margin-left: 73%;
		}
		
		.writingbutton {
			margin-top: 10px;
		}

		.writing {
			width: 8%;
			height: 40.5px;
		}
				
</style>
</head>
<body>	
	<jsp:include page="../common/mainHeader.jsp" />
	<div id ="main">
		<form id="writingForm" action="qnaWriting.guide" method="POST" onsubmit="return TransferToForm();">
		<div class="boardtitle">자유갤러리</div>
			<div class="nick">아이디(닉네임)
				<span class="smallOption" name="userNick">${loginUser.nickName}</span>
					</div>
						<div class="writingtitle">
							<input type="text" class="titleform" placeholder="제목을 입력해주세요" name="freeBoardTitle">
						</div>
						<div class="boardnotcie">
							※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.<br>
a							※ 문의관련 글만 작성만 하시길바랍니다.
						</div>	
						
						<div class="writingbutton">
						<button type="button" class="cancell" onclick="history.back();">취소</button>
						<button type="button" class="writing" onclick="return writeCheck();">등록</button>
						</div>
		
	
 	</form>
 </div>
 	</div>
 	<script>
 	
 		
 	
 	
 	
 	
 	
 	</script>
 	
 	
 	
 	
 		<jsp:include page="../common/footer.jsp" />
</body>
</html> 