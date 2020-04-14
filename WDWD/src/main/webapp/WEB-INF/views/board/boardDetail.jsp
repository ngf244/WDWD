<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		background-color: aliceblue;
		margin: auto;
		width: 90%;
	}
	
	.replycommand{
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
	}

	.replies>div:first-child{
		margin-left: 4%;
		padding-top: 10px;
		padding-bottom: 10px;
	}

	.replies>div:nth-of-type(2){
		padding-top: 10px;
		margin-left: 77%;
		width: 7%;
		height: 20px;
	}

	.writingDate{
		color: coral;
		font-size: small;
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
		margin-left: 5%;
		width: 95%;
	}

	.replyPicture{
		min-height: 0px;
	}

	.replyPicture img{
		max-height: 150px;
		width: auto;
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
		right: 5px;
		width: 5%;
		height: 20px;
	}

	.reply2Btn span{
		border: 1px solid black;
		cursor: pointer;
		transition: 1s ease;
		width: 5%;
	}

	.reply2Btn span:hover{
		background-color: black;
		color: white;
	}

	.replies2{
		border-top: 1px solid rgba(182, 180, 180, 0.39);
		display: flex;
		flex-wrap: wrap;
		position: relative;
		background-color: white;
		padding-bottom: 20px;
		padding-left: 100px;
		padding-top: 20px;
	}

	.replies2>img{
		position: absolute;
		left: 1%;
		top: 30%;
	}

	.replies2>div:first-child{
		margin-left: 4%;
		padding-top: 10px;
		padding-bottom: 10px;
	}

	.replies2>div:nth-of-type(2){
		padding-top: 10px;
		margin-left: 75%;
		width: 7%;
		height: 20px;
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
				<div class="freeboard">자유갤러리			
				</div>
				
				<div class="writingtitle">
					<h3>오늘 카페에서 치킨배달 도전한썰 푼다.</h3>
				</div>
				
				<div class="nickname">
					<h4><span class="smallOption">안양그녀</span></h4>
				</div>
				
				<div class="writinglist">
					<h4>오늘 카페에서 치킨먹은 빌런짓 했는데 다 쳐다보더랑</h4> 
				</div>
				
				<div class="wrtingCommendArea">
					<div class = "recommendArea">
						<img src="${ contextPath }/resources/images/추천버튼.png">
						<div>
							<div>추천</div>
							<div>1</div>
						</div>
					</div>
					<div class="scrapBtnArea">
						<img src="${ contextPath }/resources/images/스크랩버튼.png">
						<div>게시물 스크랩</div>
					</div>
					<div class="reportBtnArea">
						<img src="${ contextPath }/resources/images/신고버튼.PNG">
						<div>신고하기</div>
					</div>
				</div>
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
					<span>댓글</span><span>(n)</span><span>등록순</span><span>|</span><span>최신순</span>
				</div>

				<div class = replies>
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

				<div class = replies>
					<input type="hidden" value="2">
					<div>
						<span class="smallOption">아이디1</span><span class="writingDate">(2020-04-13 12:10:50)</span>
					</div>
					<div>
						<span class="reportReply">신고하기</span>
					</div>
					<div class="replyWriting">
						<div class="replyPicture">
							<img src="${ contextPath }/resources/images/x-button.png">
						</div>
						<div class="replyWriteArea">asfdsaf<br>dafadsfsaf<br>많이 구려보이냐<br>응
						</div>
						<div class="reply2Btn">
							<span> 댓글 </span>
						</div>
					</div>
				</div>

				<div class = replies>
					<input type="hidden" value="3">
					<div>
						<span class="smallOption">아이디1</span><span class="writingDate">(2020-04-13 12:10:50)</span>
					</div>
					<div>
						<span class="reportReply">신고하기</span>
					</div>
					<div class="replyWriting">
						<div class="replyPicture">
							<img src="">
						</div>
						<div class="replyWriteArea">asfdsaf<br>dafadsfsaf<br>많이 구려보이냐<br>응
						</div>
						<div class="reply2Btn">
							<span> 댓글 </span>
						</div>
					</div>
				</div>

				<div class = replies2>
					<input type="hidden" value="3-2">
					<img src="${ contextPath }/resources/images/대댓글화살표.PNG">
					<div>
						<span class="smallOption">아이디1</span><span class="writingDate">(2020-04-13 12:10:50)</span>
					</div>
					<div>
						<span class="reportReply">신고하기</span>
					</div>
					<div class="replyWriting">
						<div class="replyPicture">
							<img src="${ contextPath }/resources/images/x-button.png">
						</div>
						<div class="replyWriteArea">asfdsaf<br>dafadsfsaf<br>많이 구려보이냐<br>응
						</div>
						<div class="reply2Btn">
							<span> 댓글 </span>
						</div>
					</div>
				</div>
				<!-- --------------------------------------------------- -->
				<div class="replyinput">
					<input type="hidden" name="replyPosition">
					<div class="replyer"><span>김대호</span></div>
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
					if(confirm('첨부 파일 삭제하시겠습니까?')){
						$('input[name=attachFile]').val('');
						$('.inputimg').attr('src', '');
						$('.inputimgX').css("display", "none");
					}
				})

				$('.reply2Btn').click(function () {
   					$(this).parent().parent().after($('.replyinput'));
					var replyNum = $(this).parent().parent().children('input').val();
					console.log(replyNum);
					$('input[name=replyPosition]').val(replyNum);
				})

			</script>
  																				
		</div>					
		<div id="right-side">
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>