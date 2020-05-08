<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유갤러리</title>
<style>
	
	.forbackcolor{
		background-color: rgba(215, 220, 223, 0.151);
	}

	.freeboard{
		border-bottom: 3px solid #A9BCF5;
	
	}
	
	.nickname{
	
	}

	.writinglist{
		border-top: 3px solid #A9BCF5;
		min-height: 200px;
	}

	.wrtingCommendArea{
		width: 100%;
		height: 100px;
		border-bottom: 3px solid #A9BCF5;
		padding-bottom: 10px;
		display: inline-block;
	}

	.recommendArea{
		width: 8%;
		height: 100%;
		margin-left: 46%;
		border: outset;
		background-color: white;
		cursor: pointer;
		float: left;
	}

	.recommendArea img{
		width: 70%;
		height: 50%;
		margin-left: 15%;

	}

	.recommendArea>div{
		border-top: 2px groove rgba(185, 185, 185, 0.541);
		display: table;
		width: 100%;
		text-align: center;
		vertical-align: middle;
		color: blue;
		font-weight: bolder;
		font-size: large;
	}

	.recommendArea>div>div:nth-of-type(1){
		display: table-cell;
		vertical-align: middle;
		line-height: 40px;
		width: 60%;
	}

	.recommendArea>div>div:nth-of-type(2){
		display: table-cell;
		vertical-align: middle;
	}

	.scrapBtnArea{
		width: 8%;
		height: 100%;
		margin-left: 26%;
		border: outset;
		background-color: white;
		cursor: pointer;
		float: left;
	}

	.scrapBtnArea>img{
		width: 70%;
		height: 70%;
		display: block;
		margin-left: 15%;
	}

	.scrapBtnArea>div{
		text-align: center;
		font-weight: bold;
		line-height: 30px;
	}

	.reportBtnArea{
		width: 8%;
		height: 100%;
		margin-left: 2%;
		border: outset;
		background-color: white;
		cursor: pointer;
		float: left;
	}

	.reportBtnArea>img{
		width: 70%;
		height: 70%;
		display: block;
		margin-left: 15%;
	}


	.reportBtnArea>div{
		color: red;
		font-weight: bolder;
		vertical-align: middle;
		text-align: center;
	}


	
	.replyline{
		min-height: 100px;
		margin: auto;
		width: 90%;
	}
	
	.replycommand{
		background-color: aliceblue;
		height: 30px;
		border-bottom: 1px solid gray;
	}
	
	.replycommand span{
		vertical-align: middle;
		font-weight: bold;
	}

	.replycommand span:nth-of-type(1){
		margin-left: 20px;
	}
	.replycommand span:nth-of-type(2){
		color: red;
	}
	.replycommand span:nth-of-type(3){
		margin-left: 50px;
	}
	.replycommand span:nth-of-type(4){
		margin-left: 10px;
	}
	.replycommand span:nth-of-type(5){
		margin-left: 10px;
	}
	.replycommand span:nth-of-type(3):hover, .replycommand span:nth-of-type(5):hover{
		text-decoration: underline;
		cursor: pointer;
	}

	.replyinput{
		margin-top: 20px;
		background-color: rgba(215, 220, 223, 0.151);
		display: flex;
		padding-top: 20px;
		padding-bottom: 20px;
	}
	.replyer{
		order: 1;
		width: 12%;
		text-align: center;
		align-items: center;
		position: relative;
	}
	.replyer span{
		position: absolute;
		top: 40%;
		left: 35%;
	}

	.replycontent{
		order: 2;
		min-height: 100px;
		width: 80%;
		margin-left: 2%;
	}

	.replyimgArea{
		min-height: 0px;
		position: relative;
	}

	.inputimg{
		/* min-height: 0px; */
		max-height: 300px;
		/* width: 100%; */
		width: auto;
	}

	.replyLetter{
		width: 100%;
	}

	.replyLetter textarea{
		width: 99%;
		margin-top: 3px;
		font-size: 25px;
	}

	.replyBtns{
		order: 3;
		margin-left: 1%;
		width: 10%;
		position: relative;
		text-align: center;
	}

	.replyBtn2{
		position: absolute;

		bottom: 0%;
		width: 100%;
		height: 120px;
	}

	.inputfileBtn{
		width: 90%;
		height: 18%;
		border: outset;
		background-color: white;
		cursor: pointer;
	}

	.addReplyBtn{
		margin-top: 2%;
		width: 90%;
		height: 70%;
		border: outset;
		background-color: white;
		cursor: pointer;
		font-weight: bold;
		font-size: larger;
		line-height: 80px;
	}
	
	.inputForm{
	margin-top: 10px;
	width: 20%;
	height: 108px;

	}
	
	.inputtext{
	
	margin-top: 10px;
	width: 78.4%;
	height: 108px;
	
	}
	
	.replybutton{
	
	margin-top: 10px;
	width:20%;
	height: 40px;
	background: darkblue;
	color: white;
	
	}

	
	.slide {
		margin-bottom: 10px;
		width: calc(100.0%-20px);
	}

	ul,li {
		list-style: none;
		width: 100%;
		height: 100%;
	}

	.slide {
		height: 100px;
		overflow: hidden;
	}

	.slide ul {
		position: relative;
		height: 100%;
		display: block;
	}

	.slide li {
		position: absolute;
		left: 0;
		right: 0;
		top: 0;
		bottom: 0;
		opacity: 0;
		animation: fade 10s infinite;
		display: block;
		width: 100%;
		height: 100%;
	}

	.slide li img{
		height: 100%;
		width: 100%;
	}

	.slide li:nth-child(1) {
		animation-delay: 0s
	}

	.slide li:nth-child(2) {
		animation-delay: 2s
	}

	.slide li:nth-child(3) {
		animation-delay: 4s
	}

	.slide li:nth-child(4) {
		animation-delay: 6s
	}
	
	.slide li:nth-child(5) {
		animation-delay: 8s
	}
	/* 100 / 8 = 12.5 */

	@keyframes fade {
		0% {
			opacity: 0;
		}

		5% {
			opacity: 1;
		}

		25% {
			opacity: 1;
		}

		30% {
			opacity: 0;
		}

		100% {
			opacity: 0;
		}
	}
	
	input[name="attachFile"]{
		display: none;
	}

	.mouseDown{
		border: inset;
	}

	.inputimgX{
		width: 20px;
		height: 20px; 
		position: absolute;
		cursor: pointer;
		display: none;
	}

	.replies{
		border-top: 1px solid rgba(182, 180, 180, 0.39);
		display: flex;
		flex-wrap: wrap;
		position: relative;
		background-color: white;
		padding-bottom: 20px;
		padding-top: 20px;
	}

	.replies>div:nth-of-type(1){
		margin-left: 2%;
		padding-top: 5px;
		padding-bottom: 10px;
		width: 60%;
	}

	.replies>div:nth-of-type(2){
		position: absolute;
		padding-top: 5px;
		right: 2%;
		width: 8%;
		height: 20px;
		text-align: right;
	}

	.writingDate{
		color: coral;
		font-size: small;
	}

	.deleteReply{
		color: rgba(255, 57, 57, 0.959);
		font-size: small;
		cursor: pointer;
		font-weight: bold;
	}

	.reportReply{
		border: 1px solid black;
		transition: 1s ease;
	}

	.reportReply:hover{
		background-color: red;
		color: white;
		cursor: pointer;
	}

	.replyWriting{
		margin-left: 4%;
		width: 96%;
	}

	.replyPicture{
		min-height: 0px;
	}

	.replyPicture img{
		max-height: 150px;
		width: auto;
		margin-top: 10px;
	}

	.replyWriteArea{
		padding-top: 10px;
		padding-left: 3px;
		display: inline-block;
		width: 85%;
		min-height: 10px;
	}

	.reply2Btn{
		display: inline-block;
		position: absolute;
		bottom: 20px;
		right: 2%;
		width: 8%;
		height: 20px;
		text-align: right;
	}

	.reply2Btn span{
		cursor: pointer;
		transition: 1s ease;
		width: 5%;
		color: gray;
	}

	.reply2Btn span:hover{
		background-color: gray;
		color: white;
	}

	.replies2{
		border-top: 1px solid rgba(182, 180, 180, 0.39);
		display: flex;
		flex-wrap: wrap;
		position: relative;
		background-color: white;
		padding-bottom: 20px;
		padding-left: 5%;
		padding-top: 20px;
	}

	.replies2>img{
		position: absolute;
		left: 3%;
		top: 20%;
		width: 2%;
		height: auto;
	}

	.replies2>div:nth-of-type(1){
		margin-left: 2%;
		padding-top: 5px;
		padding-bottom: 10px;
		width: 60%;
	}

	.replies2>div:nth-of-type(2){
		position: absolute;
		padding-top: 5px;
		right: 2%;
		width: 8%;
		height: 20px;
		text-align: right;
	}

	.writeReplyAgain{
		width: 95%;
		margin: auto;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 50px;
		background-color: rgba(56, 79, 209, 0.534);
		border: outset;
		display: none;
		cursor: pointer;
	}

	.WelcomeLogin{
		width: 95%;
		margin: auto;
		display: flex;
		justify-content: center;
		align-items: center;
		height: 50px;
		background-color: rgba(56, 79, 209, 0.534);
		border: outset;
		cursor: pointer;
	}

	.rewrite, .delete {
		display: inline-block;
		border-radius: 4px;
		background-color: #f4511e;
		border: none;
		color: #FFFFFF;
		text-align: center;
		font-size: 14px;
		padding: 10px;
		width: 100px;
		transition: all 0.5s;
		cursor: pointer;
		margin-right: 5px;
		vertical-align: middle;
		}

	.rewrite span, .delete span {
		cursor: pointer;
		display: inline-block;
		position: relative;
		transition: 0.5s;
	}

	.rewrite span:after, .delete span:after {
		content: '\00bb';
		position: absolute;
		opacity: 0;
		top: 0;
		right: -20px;
		transition: 0.5s;
	}

	.rewrite:hover span, .delete:hover span {
		padding-right: 25px;
	}

	.rewrite:hover span:after, .delete:hover span:after {
		opacity: 1;
		right: 0;
	}

	.writingtitle{
		position: relative;
	}

	#writerMenu{
		position: absolute;
		display: inline-block;
		right: 3%;
		top: 65%;
	}
	
	.replyProfileImg{
		width: 9%;
		height: 60px;
		border-radius: 50%;
		vertical-align: middle;
		margin-right: 2%;
	}
</style>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
		</div>
		<div id="main" style="background: white">
			
			<div class="forbackcolor">
				<div class="freeboard">${ b.boCategory }
				</div>
				
				<div class="writingtitle">
					<h3 style="display: inline-block; vertical-align: middle;">${ b.boTitle }</h3>
					<c:if test="${ loginUser.userId == b.boWriter or loginUser.userId == 'admin'}">
						<div id="writerMenu">
							<button class="rewrite"><span>수정 </span></button><button class="delete"><span>삭제 </span></button>
						</div>
					</c:if>
					<input type="hidden" name="boardNum" value="${ b.boNum }">
				</div>
				
				<div class="nickname">
					<h4><span class="smallOption">${ b.boWriterNick }</span></h4>
				</div>
				
				<div class="writinglist">
					${ b.boContent }
					
					
				</div>
				<c:forEach var="arr" items="${entirDir}" varStatus="i">
					<script>
						var dir = '${arr}';
						$('.writinglist img').eq(${ i.count }-1).attr('src','${ contextPath }/resources/free_photo_upload/'+dir);
					</script>
				</c:forEach>

				<div class="wrtingCommendArea">
					<div class = "recommendArea">
						<img src="${ contextPath }/resources/images/추천버튼.png">
						<div>
							<div>추천</div>
							<div id="recommendCount">${b.boGood}</div>
						</div>
					</div>
					<div class="scrapBtnArea">
						<img src="${ contextPath }/resources/images/스크랩버튼.png">
						<div id="scrapCondition">${ scrapCondition }</div>
					</div>
					<div class="reportBtnArea">
						<img src="${ contextPath }/resources/images/신고버튼.PNG">
						<div>신고하기</div>
					</div>
				</div>
				
				<c:url var="deleteBoardUrl" value="delete.bo">
					<c:param name="boNum" value="${ b.boNum }"/>
				</c:url>
				<c:url var="reviseBoardUrl" value="revise.bo">
					<c:param name="boNum" value="${ b.boNum }"/>
				</c:url>

				<script>
					$('.recommendArea').click(function () {
						var boNum = $('input[name=boardNum]').val();
						var userId = "${loginUser.userId}";

						if(userId == ""){
							swal("You need Login", "로그인 후 사용 가능합니다.", "error");
						} else {
							$.ajax({
								url : "addRecommend.bo",
								data : {boNum : boNum, userId : userId},
								type : "get",
								success : function (data) {
									if(data.trim() == "already"){
										swal("can't recommend twice", "게시물은 한번만 추천 가능합니다.", "error");
									} else {
										var count = Number($('#recommendCount').text());
										// count *= 1;
										// console.log(typeof(count));
										$('#recommendCount').text(count+1);
										console.log("추천 재대로 됨");
									}
								}
							})
						}
					})
						
					$('.scrapBtnArea').click(function () {
						var boNum = $('input[name=boardNum]').val();
						var userId = "${loginUser.userId}";
						// var condition = $('#scrapCondition').text();
						if(userId == ""){
							swal("You need Login", "로그인 후 사용 가능합니다.", "error");
						} else {
							$.ajax({
								url : "scrapToggle.bo",
								data : {boNum : boNum, userId : userId},
								type : "get",
								success : function (data) {
									if(data.trim() == "insert"){
										$('#scrapCondition').text('스크랩 해제');
									} else {
										$('#scrapCondition').text('게시물 스크랩');
									}
								}
							})
						}
					})

					$('.delete').click(function () {
						swal({
							title: "Are you sure?",
							text: "삭제 후 복구하실 수 없습니다",
							icon: "warning",
							buttons: true,
							dangerMode: true,
						})
						.then((willDelete) => {
							if (willDelete) {
								location.href = "${deleteBoardUrl}";
							} else {
								return false;
							}
							});
					})

					$('.rewrite').click(function () {
						swal({
                           title: "글을 수정하시겠습니까?",
                           icon: "info",
                           buttons : {
                              	cancle : {
                                 	text : '취소',
                                 	value : false
                             	},
                              	confirm : {
                                 	text : '수정하기',
                                 	value : true
                              	}
                           	}
                        }).then((result) => {
                           if(result) {
								location.href = "${reviseBoardUrl}";
                           	} else {
                           	}
                        });
					})
				</script>
			</div>

			<div class="slide">
				<ul>
					<li><a href="#"><img></a></li>
					<li><a href="#"><img></a></li>
					<li><a href="#"><img></a></li>
					<li><a href="#"><img></a></li>
					<li><a href="#"><img></a></li>
				</ul>
			</div>
			
			<!-- 글쓰기 경계선 -->
			<div class="replyline">
				<div class="replycommand">
					<span>댓글</span><span>(${b.boReNum})</span><span onclick="changeReplyOrder('asc')">등록순</span><span>|</span><span onclick="changeReplyOrder('desc')">최신순</span>
				</div>
				<!-- 댓글 리스트 뿌리기 -->
				<c:forEach var="reply" items="${ ReplyArr }" varStatus="i">
					<div class="re num${i.count}">
						<div class = replies>
							<input type="hidden" value="${ reply.rpNum }">
							<c:if test="${ reply.rpStatus == 'N' }">
								<div>
								<c:if test="${ reply.profileImg ne null }">
									<img class="replyProfileImg" src="${contextPath}/resources/profile_Image/${reply.profileImg}">
								</c:if>
								<c:if test="${ reply.profileImg eq null }">
									<img class="replyProfileImg" src="${contextPath}/resources/images/default_profile.png">
								</c:if>
									<span class="smallOption">${ reply.rpWriterNick }</span><span class="writingDate">(${ reply.rpDate })</span>
									<c:if test="${ reply.rpWriter == loginUser.userId or loginUser.userId == 'admin'}">
										<span class="deleteReply">[삭 제]</span>
									</c:if>
								</div>
								<div>
									<span class="reportReply">신고하기</span>
								</div>
								<div class="replyWriting">
									<div class="replyPicture">
									<c:forEach var="reCon" items="${ ReplyContents }">
										<c:if test="${ reply.rpConNum == reCon.conNum }">
											<img src="${contextPath}/resources/free_photo_upload/${ reCon.conUrl }">
										</c:if>
									</c:forEach>
									</div>
									<div class="replyWriteArea">${ reply.rpContent }
									</div>
								</div>
							</c:if>
							<c:if test="${ reply.rpStatus == 'Y' }">
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.
							</c:if>
							<div class="reply2Btn">
								<span> [ 댓 글 ] </span>
							</div>
						</div>
					
					<!-- 대댓글 리스트 뿌리기 -->
						<c:forEach var="reply2" items="${ ReplyArr2 }">
							<c:if test="${ reply2.rpRp == reply.rpNum }">
								<div class = replies2>
									<input type="hidden" value="${ reply2.rpNum }">
									<img src="${ contextPath }/resources/images/대댓글화살표.PNG">
									<c:if test="${reply2.rpStatus == 'N' }">
										<div>
										<c:if test="${ reply2.profileImg ne null }">
											<img class="replyProfileImg" src="${contextPath}/resources/profile_Image/${reply2.profileImg}">
										</c:if>
										<c:if test="${ reply2.profileImg eq null }">
											<img class="replyProfileImg" src="${contextPath}/resources/images/default_profile.png">
										</c:if>
											<span class="smallOption">${ reply2.rpWriterNick }</span><span class="writingDate">(${ reply2.rpDate })</span>
											<c:if test="${ reply2.rpWriter == loginUser.userId or loginUser.userId == 'admin'}">
												<span class="deleteReply">[삭 제]</span>
											</c:if>
										</div>
										<div>
											<span class="reportReply">신고하기</span>
										</div>
										<div class="replyWriting">
											<div class="replyPicture">
											<c:forEach var="re2Con" items="${ Reply2Contents }">
												<c:if test="${ reply2.rpConNum == re2Con.conNum }">
													<img src="${contextPath}/resources/free_photo_upload/${ re2Con.conUrl }">
												</c:if>
											</c:forEach>
											</div>
											<div class="replyWriteArea">${ reply2.rpContent }
											</div>
										</div>
									</c:if>
									<c:if test="${ reply2.rpStatus == 'Y' }">
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;삭제된 댓글입니다.
									</c:if>
								</div>
							</c:if>
						</c:forEach>
					</div>
				</c:forEach>

				<!-- <div class = replies>
					<input type="hidden" value="1">
					<div>
						<span class="smallOption">아이디1</span><span class="writingDate">(2020-04-13 12:10:50)</span>
					</div>
					<div>
						<span class="reportReply">신고하기</span>
					</div>
					<div class="replyWriting">
						<div class="replyPicture">
							<img>
						</div>
						<div class="replyWriteArea">asfdsasdfsadfafdfadsfsaafd<br>dafadsfsaf<br>많이 구려보이냐<br>응
						</div>
						<div class="reply2Btn">
							<span> 댓글 </span>
						</div>
					</div>
				</div>

				<div class = replies2>
					<input type="hidden" value="1-1">
					<img src="${ contextPath }/resources/images/대댓글화살표.PNG">
					<div>
						<span class="smallOption">아이디1</span><span class="writingDate">(2020-04-13 12:10:50)</span>
					</div>
					<div>
						<span class="reportReply">신고하기</span>
					</div>
					<div class="replyWriting">
						<div class="replyPicture">
							<img src="${ contextPath }/resources/images/search.png">
						</div>
						<div class="replyWriteArea">asfdsaf<br>dafadsfsaf<br>많이 구려보이냐<br>응
						</div>
						<div class="reply2Btn">
							<span> 댓글 </span>
						</div>
					</div>
				</div>

				<!-- --------------------------------------------------- -->
				<c:if test="${not empty loginUser}">
					<div class="replyinput">
						<input type="hidden" name="replyPosition" value="0">
						<div class="replyer"><span>${loginUser.nickName}</span></div>
						<div class="replycontent">
							<div class="replyimgArea">
								<img class="inputimg">
								<img class="inputimgX" src="${ contextPath }/resources/images/x-button.png">
								<input type="file" name="attachFile">
							</div>
							<div class="replyLetter">
								<textarea cols="110" rows="3"></textarea>
							</div>
						</div>
						<div class="replyBtns">
							<div class="replyBtn2">
								<div class="inputfileBtn">파일 올리기</div>
								<div class="addReplyBtn"> 등록 </div>
							</div>
						</div>
					</div>
	
					<div class="writeReplyAgain">
						다시 돌아와(추후 게시글에 댓글달기로 변경)
					</div>
				</c:if>
				<c:if test="${empty loginUser}">
					<div class="WelcomeLogin" onclick="$('#loginView').click()">
						댓글 입력은 로그인 후 가능합니다. 클릭하여 로그인하셍
					</div>
				</c:if>
				
				<!-- --------------------------------------------------- -->
			</div>
  																				
			<script>
				$('.recommendArea, .scrapBtnArea, .reportBtnArea, .inputfileBtn, .addReplyBtn').on({'mousedown':function(){
					$(this).toggleClass('mouseDown');
				},'mouseup':function(){
					$(this).toggleClass('mouseDown');
				}})

				$('.inputfileBtn').click(function() {
					$('input[name=attachFile]').click();
				})

				$(document).on("change", ":file", function () {
					var fileValue = $(this).val();
					var fileName = fileValue.substring(fileValue.lastIndexOf("\\") + 1);
					if (fileValue != "") {
						var reader = new FileReader();
						reader.onload = function (e) {
							$('.inputimg').attr('src', e.target.result);
						}
						reader.readAsDataURL(this.files[0]);
					}
				})
				$('.inputimg').on('load', function () {
					var w = $(this).width()-30;
					var h = $(this).height();
					$('.inputimgX').css({'left' : w, 'top': 15, 'display':'block'})
				})

				$('.inputimgX').click(function () {
					swal({
						title: "Are you sure?",
						text: "삭제 후 복구하실 수 없습니다",
						icon: "warning",
						buttons: true,
						dangerMode: true,
					})
					.then((willDelete) => {
						if (willDelete) {
							$('input[name=attachFile]').val('');
							$('.inputimg').attr('src', '');
							$('.inputimgX').css("display", "none");
						} else {
							return false;
						}
						});
						
					// if(confirm('첨부 파일 삭제하시겠습니까?')){
					// 	$('input[name=attachFile]').val('');
					// 	$('.inputimg').attr('src', '');
					// 	$('.inputimgX').css("display", "none");
					// }
				})

				$('.reply2Btn').click(function () {
					$('.replyinput').css({"margin-left":"5%","width":"95%","height":"auto"});
   					$(this).parent().after($('.replyinput'));
					$('.writeReplyAgain').css({"display":"flex"});
					var replyNum = $(this).parent().children('input').val();
					console.log(replyNum);
					$('input[name=replyPosition]').val(replyNum);
				})

				$('.writeReplyAgain').click(function () {
					$(this).before($('.replyinput'));
					$('.replyinput').css({"margin-left":"0%","width":"100%","height":"auto"});
					$(this).css('display','none');
					$('input[name=replyPosition]').val(0);
				})

				$('.reportReply').click(function () {
					var userId = "${loginUser.userId}";
					if(userId==""){
						swal("You need Login", "로그인 후 사용 가능합니다.", "error");
						return false;
					}

					var boardNo = $('input[name=boardNum]').val();
					var reported = $(this).parent().prev().children()[1].innerText;
					var category = 9;

					reportForm(boardNo, reported, 2);
				})
				$('.reportBtnArea').click(function () {
					var userId = "${loginUser.userId}";
					if(userId==""){
						swal("You need Login", "로그인 후 사용 가능합니다.", "error");
						return false;
					}

					var boardNo = $('input[name=boardNum]').val();
					var reported = $(this).closest('.forbackcolor').find('.smallOption').text();

					reportForm(boardNo, reported, 1);
				})

				function changeReplyOrder(option) {
					var divNum = $('.re').length;
					if(option == "desc"){
						for(var i = 1; i <= divNum; i++){
							$('.replycommand').after($('.num'+i));
						}
					} else {
						for(var i = 0; i < divNum; i++){
							$('.replycommand').after($('.num'+(divNum-i)));
						}
					}
				}

				$('.addReplyBtn').click(function () {

					var userId = '${loginUser.userId}';
					var replyContentbefore = $('.replyLetter textarea').val();
					//textarea 내 줄바꿈 값을 <br>로 치환해줌
					var replyContent = replyContentbefore.replace(/(?:\r\n|\r|\n)/g, '<br />');
					
					var file = $('input[name=attachFile]')[0].files[0];
					var fileValue = $('input[name=attachFile]').val();
					var fileName = fileValue.substring(fileValue.lastIndexOf("\\") + 1);
					var boNum = $('input[name=boardNum]').val();
					var rprp = $('input[name=replyPosition]').val();

					var formData = new FormData();
					formData.append("userId", userId);
					formData.append("replyContent", replyContent);
					formData.append("file", file);
					formData.append("boNum", boNum);
					formData.append("rprp", rprp);

					// console.log(userId);
					console.log(fileName);
					console.log(replyContent);
					// console.log(rprp);

					if(fileName == "" && replyContent == ""){
						
						return false;
					}

					$.ajax({
						type: 'POST',
						url: 'insertReply.bo', 
						processData: false, // 필수 
						contentType: false, // 필수 
						data: formData, 
						success: function(data) {
							console.log(data.trim() == "성공");
							if(data.trim() == "성공"){
								location.reload();
							}
						}
					})
				})

				$('.deleteReply').click(function () {
					swal({
						title: "Are you sure?",
						text: "삭제 후 복구하실 수 없습니다",
						icon: "warning",
						buttons: true,
						dangerMode: true,
					})
					.then((willDelete) => {
						if (willDelete) {
							var reNum = $(this).parent().parent().children('input').val()
							var src = $(this).parent().parent().find('.replyWriting').find('img').attr('src');
							var conCop = "";

							if(typeof src != "undefined"){
								conCop = src.substring(src.lastIndexOf("/")+1);
							}
							
							$.ajax({
								type: 'POST',
								url: 'deleteReply.bo', 
								data: {reNum : reNum, conCop : conCop},
								success: function(data) {
									if(data.trim() == "성공"){
										location.reload();
									}
								}
							})

						} else {
							return false;
						}
						});



					// if(!confirm('정말 삭제하겠슴??')){
					// 	return false;
					// }
					
					// var reNum = $(this).parent().parent().children('input').val()
					// var src = $(this).parent().parent().find('.replyWriting').find('img').attr('src');
					// var conCop = "";

					// if(typeof src != "undefined"){
					// 	conCop = src.substring(src.lastIndexOf("/")+1);
					// }
					
					// $.ajax({
					// 	type: 'POST',
					// 	url: 'deleteReply.bo', 
					// 	data: {reNum : reNum, conCop : conCop},
					// 	success: function(data) {
					// 		if(data.trim() == "성공"){
					// 			location.reload();
					// 		}
					// 	}
					// })
				})
				
			</script>
  																				
		</div>					
		<div id="right-side">
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>