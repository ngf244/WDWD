<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<title>자유갤러리</title>
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
			width: 60%;
			height: 50px;
			font-size: 15px;
		}

		.catecory {
			margin-top: 15px;
			width: 30%;
			height: 55.5px;
			font-size: 15px;
		}

		.boardnotice {
			margin-top: 10px;
		}

		.writingform {
			margin-top: 10px;
			width: 99%;
			height: 300px;
		}

		.fileupload {
			margin-top: 10px;
			text-align: left;
			height: 30px;
		}

		.filenameform {
			width: 99%;
			height: 20px;
		}


		.writingbutton {
			margin-top: 10px;
		}

		.writing {
			width: 8%;
			height: 40.5px;
		}

		.cancell {
			width: 8%;
			height: 40.5px;
			margin-left: 73%;
		}

		#writingPlace {
			width: 100%;
			min-height: 300px;
			border: 1px solid black;
			border-right: 1px solid black;
			display: inline-block;
			vertical-align: top;
		}

		#writingPlace img{
			max-width: 80%;
			height: auto;
		}

		#imageInputArea {
			width: 100%;
			min-height: 50px;
			margin-top: 10px;
		}

		.eachImage {
			width: calc(20% - 1%);
			height: 250px;
			margin-bottom: 10px;
			display: inline-block;
			margin-left: 0.3%;
			margin-right: 0.3%;
		}

		.insertImage {
			width: 100%;
			height: 200px;
			position: relative;
		}

		.inputImg {
			width: 100%;
			height: 100%;
			display: block;
		}

		.plusBtn{
			width: 100%;
			height: 100%;
			position: absolute;
			top: 0;
		}

		.xBtn {
			top: 3%;
			right: 2%;
			width: 10%;
			height: 25px;
			position: absolute;
			cursor: pointer;
		}

		#uploadFileBtn {
			margin-left: 1%;
			width: 8%;
			height: 40.5px;
		}

		.imageNameArea {
			width: 100%;
			height: 40px;
			margin-top: 10px;
			display: table;
			background-color: rgba(88, 88, 90, 0.5);
			border-radius: 15%;
			color: white;
			font-weight: bold;
		}

		.imageNameArea .origin {
			width: 100%;
			height: 10px;
			margin-top: 10px;
			display: table-cell;
			vertical-align: middle;
			text-align: center;
		}

		.imageNameArea .rename {
			width: 100%;
			height: 10px;
			margin-top: 10px;
			display: table-cell;
			vertical-align: middle;
			text-align: center;
			display: none;
		}

		.fileArea {
			display: none;
		}

		.slide {
			margin-top: 10px;
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
	</style>
</head>

<body>
	<jsp:include page="../common/mainHeader.jsp" />
	<section>
		<div id="left-side">
		</div>
		<div id="main">
			<form id="writingForm" action="freeWriting.bo" method="GET" onsubmit="return TransferToForm();">
				<div class="boardtitle">
					자유갤러리
				</div>
				<div class="nick">
					아이디(닉네임)
					<span class="smallOption" name="userNick">김대호</span>
				</div>
				<div class="writingtitle">
					<select class="catecory" name = "freeBoardCategory">
						<option value="공통">공통</option>
						<option value="짤방">짤방</option>
						<option value="아무말">아무말</option>
						<option value="요청">요청</option>
						<option value="질문">질문</option>
					</select>

					<input type="text" class="titleform" placeholder="제목을 입력해주세요" name="freeBoardTitle">
				</div>
				<div class="boardnotice">
					※ 음란물, 차별, 비하, 혐오 및 초상권, 저작권 침해 게시물은 민, 형사상의 책임을 질 수 있습니다.<br>
					※ 커뮤니티도 하나의 인격입니다. 글 등록전 서로 존중하는 글을 씁시다.
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
				
				<hr>
					<div id="writingPlace" contenteditable="true" name="writingContent"></div>
				<hr>

				<div id=imageInputArea>
					<!-- <div class="eachImage">
						<div class="insertImage">
							<img class="inputImg">
							<img class="plusBtn" src="${ contextPath }/resources/images/add.png">
							<img class="xBtn" src="${ contextPath }/resources/images/x-button.png">
						</div>
						<div class="imageNameArea">
							<span class="origin">ddd</span>
							<span class="rename">ddd</span>
						</div>
						<div class="fileArea">
							<form enctype="multipart/form-data" method="post">
								<input type="file" multiple>
							</form>
						</div>
					</div> -->
				</div>


				<div class="writingbutton">
					<button type="button" id="uploadFileBtn">파일 올리기</button>
					<button type="button" class="cancell" onclick="history.back();">취소</button>
					<button type="submit" class="writing" onclick="return writeCheck();">등록</button>
				</div>

			</form>
			
			<script>
				var countData = 1;
				
				$('#uploadFileBtn').click(function () {
					var filearea = $('#imageInputArea');

					$eachImage = $('<div class=eachImage>');
					$insertImage = $('<div class="insertImage">');
					// $img = $('<img class="inputImg">')
					$imgplus = $('<img class="plusBtn" src="${ contextPath }/resources/images/add.png">')
					$ximg = $('<img class="xBtn" src="${ contextPath }/resources/images/x-button.png">');
					$imageNameArea = $('<div class="imageNameArea">');
					$spanOrigin = $('<span class="origin" name="fileOriginName">');
					$spanRename = $('<span class="rename" name="fileReName">');
					$fileArea=$('<div class=fileArea>');
					$fileForm=$('<form enctype="multipart/form-data" method="post">');
					$inputFile=$('<input type=file multiple name=file>');
					
					// $insertImage.append($img);
					$insertImage.append($imgplus);
					$insertImage.append($ximg);

					$imageNameArea.append($spanOrigin);
					$imageNameArea.append($spanRename);
					
					$fileForm.append($inputFile);
					$fileArea.append($fileForm);

					$eachImage.append($insertImage);
					$eachImage.append($imageNameArea);
					$eachImage.append($fileArea);

					$('#imageInputArea').append($eachImage);

					countData++;
				})


				$(document).on("click", ".xBtn", function () {
					// $('.eachImage img').click(function () {
					$(this).parent().parent().remove();
					deleteimg();
				})

				$(document).on("click", ".plusBtn", function () {
					var fileBtn = $(this).parent().parent().find("input[type=file]");
					fileBtn.click();
				})
				
				function ajaxFileUpload(file) {
					var formData = new FormData(file.parent()[0]);

					var result;
			
					$.ajax({ 
						type: "POST", 
						enctype: 'multipart/form-data', // 필수 
						url: 'imgUpload.bo', 
						data: formData, // 필수
						processData: false, // 필수 
						contentType: false, // 필수 
						success: function (data) {
							file.closest('.eachImage').find('.rename').text(data);
							$img.attr('src', '${ contextPath }/resources/free_photo_upload/${loginUser.userId}/'+data);
							$targetImg.attr('src', '${ contextPath }/resources/free_photo_upload/${loginUser.userId}/'+data);
						}
					})
					return result;
			    }

				$(document).on("change", ":file", function () {
					ajaxFileUpload($(this));
					
					var fileValue = $(this).val();
					var fileName = fileValue.substring(fileValue.lastIndexOf("\\") + 1);

					var targetDiv= $('#writingPlace');

					if (fileValue != "") {
						$insertImage = $(this).parent().parent().parent().find('.insertImage');
						$img = $('<img class="inputImg">')
						$insertImage.append($img);

						$plusBtn = $(this).parent().parent().parent().find('.plusBtn');
						$plusBtn.remove();
						var spanOrigin = $(this).parent().parent().parent().find('.origin');
						spanOrigin.text(fileName);
						var spanRename = $(this).parent().parent().parent().find('.rename');
						$br = $('<br>');
						// $br2 = $('<br>');
						$targetImg = $('<img>');

						targetDiv.append($br);
						targetDiv.append($targetImg);
						// targetDiv.append($br2);
						
					}
				})

 
// ---------------------------------------------------------------------------
				// contenteditable에 텍스트 복붙 텍스트만 넣기
				var ele = document.querySelector('#writingPlace'); 
				ele.addEventListener('paste', function(event) {
				
				event.preventDefault();
				// 클립보드에서 복사된 텍스트 얻기
				var pastedData = event.clipboardData ||  window.clipboardData;
				var textData = pastedData.getData('Text');

				window.document.execCommand('insertHTML', false,  textData);
  				});

// ---------------------------------------------------------------------------------

				$('#writingPlace').keyup(function () {
					var text = $(this).html();
					deleteimg();
				})

				function deleteimg() {
					var targetimg = $("#writingPlace img");
					var targetsrcs = new Array();

					for (var i= 0; i < targetimg.length; i++){
						var string = targetimg[i].src;
						targetsrcs.push(string);
						// var cutString = string.substring(string.length-10, string.length);
						// console.log(cutString);
						// targetsrcs.push(cutString);
					}


					var bottomimg = $('#imageInputArea img.inputImg');
					var bottomsrcs = new Array();

					for (var i= 0; i < bottomimg.length; i++){
						var string = bottomimg[i].src;
						bottomsrcs.push(string);
						// var cutString = string.substring(string.length-10, string.length);
						// bottomsrcs.push(cutString);
					}

					// console.log("target : " + targetsrcs.length);
					// console.log("bottom : " + bottomsrcs.length);



					if(targetsrcs.length != bottomsrcs.length){
						if(targetsrcs.length<bottomsrcs.length){
							// bottom 삭제
							for(var a in bottomsrcs){
								var decision = true;
								for(var b in targetsrcs){
									if(bottomsrcs[a] == targetsrcs[b]){
										decision = false;
									}
								}
								if(decision){
									// console.log(decision);
									// console.log(a);
									// console.log($('#imageInputArea img.inputImg'));
									// console.log($('#imageInputArea img.inputImg')[a].parentNode);
									var deleteTarget = $('#imageInputArea img.inputImg')[a].parentNode.parentNode;
									deleteTarget.remove();
								}
							}

						} else if(targetsrcs.length>bottomsrcs.length) {
							// target삭제
							for(var a in targetsrcs){
								var decision = true;
								for(var b in bottomsrcs){
									if(targetsrcs[a] == bottomsrcs[b]){
										decision = false;
									}
								}
								if(decision){
									// console.log(decision);
									console.log($('#writingPlace img'));
									var deleteTarget = $('#writingPlace img')[a];
									deleteTarget.remove();
								}
							}
						}
					}
				}

				function writeCheck() {
					var title = $('input[name=freeBoardTitle]').val();
					var writingContent = $('#writingPlace').html();

					if(writingContent.length<1 || title.length < 5){
						console.log(title);
						console.log(title.length);
						swal("내용 확인", "5글자 이상의 제목과 1글자 이상의 내용을 입력해야 합니다.", "error");
						return false;
					}

					var check = confirm("이대로 작성하실?");
					return check;
				}

				// function sweetCheck() {
				// 	swal({
				// 		title: "Confirm",
				// 		text: "이대로 작성하시겠습니까?",
				// 		icon: "warning",
				// 		buttons: ["NO", "YES"],
				// 		dangerMode: true,
				// 	}).then((YES) => {
				// 		if (YES) {
				// 			return true;
				// 		}else{
				// 			return false;
				// 		}
				// 	});
				// }

				function TransferToForm() {
					var writingContent = $('#writingPlace').html();
					var originNames = new Array();
					var reNames = new Array();
					

					$('#writingForm').prepend('<input type="hidden" name="writingContent">');
					$('input[name=writingContent]').val(writingContent);
					
					$('.origin').each(function () {
						originNames.push($(this).text());
					})

					for(var i in originNames){
						//띄워쓰기로 구분하기 때문에 큰따음표로 다시감싸야함
						$('#writingForm').append('<input type="hidden" name="fileOriginName" value="'+originNames[i]+'">');
						// $('#writingForm').append('<input type="hidden" name="fileOriginName">');
						// var input = $('input[name=fileOriginName]');
						// input.eq(i).val(originNames[i]);
					}
					
					$('.rename').each(function () {
						reNames.push($(this).text());
					})
					
					for(var i in reNames){
						$('#writingForm').append('<input type="hidden" name="fileRename" value="'+reNames[i]+'">');
					}

				}

			
			</script>
		</div>
		<div id="right-side">

		</div>
	</section>
	<jsp:include page="../common/footer.jsp" />
</body>

</html>