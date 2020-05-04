<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
	<!-- include libraries(jQuery, bootstrap) -->
	<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

	<!-- include summernote css/js -->
	<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
	<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<meta charset="UTF-8">
	<title>쪽지 보내기</title>
	<style>
		body{
			margin-left: 5px;
			margin-right: 5px;
		}	
		textarea:focus {
			outline: none;
		}

		.messageTitle {
			width: 99.5%;
			border-top: solid 1px;
			border-bottom: solid 1px;
			height: 30px;
			background-color: #fff;
			font-weight: bold;
			text-align: left;
			padding-left: 5px;
		}

		.titleHere{
			width: 99.5%;
			height: 28px;
		}

		.messageDetailBoard {
			height: 350px;
			margin-top: 10px;
			margin-bottom: 10px;
		}

		.messageReceiver{
			margin-top: 10px;
		}

		.footer{
			position: absolute;
		    left: 0;
  			bottom: 0;
		    width: 100%;
			padding: 15px 0;
		}

		#sendButton{
			margin-right: 10px;
		}
		#closeMessage{
			margin-left: 10px;
		}
	</style>

</head>

<body>
	<div id="messageHeader">
		<h1>쪽지 보내기</h1>
	</div>

	<br>
	<!-- 쪽지 상세보기 -->
	<form method="post" action="messageSend.ms">
		<div class="messageTitle">
			<input type="text" class="titleHere" name="msTitle" placeholder="제목 입력" style="border:none;">
		</div>
		<div class="messageReceiver">수신자 : <input type="hidden" name="msRsgId" value="${rsgId}"><input type="hidden" name="msRsgNick" value="${rsgNick}"> <span class="messageReceiver">${rsgNick}</span></div>
		<div class="messageDetailBoard">
			<textarea id="summernote" name="msContent"></textarea>
		</div>
		<div class="footer">
			<input id="sendButton" type="button" value="쪽지 보내기" style="float: right;" onclick="goWrite(this.form)"/>
			<button id="closeMessage" role="button" aria-disabled="false" onclick="window.close();"><span class="ui-button-text">닫기</span></button>
		</div>
	</form>



	<!-- <div style="width: 60%; margin: auto;">
		<form method="post" action="/write">
			<input type="text" name="writer" style="width: 20%;" placeholder="작성자"/><br>
			<input type="text" name="title" style="width: 40%;" placeholder="제목"/>
			<br><br> 
			<textarea id="summernote" name="content"></textarea>
			<input id="subBtn" type="button" value="글 작성" style="float: right;" onclick="goWrite1(this.form)"/>
		</form>
	</div> -->



	<div>
		<div style="width:99%; display: inline-table; text-align:center;">
			<span style="width:100% ; clear:both ; padding:10px 0 0 0 ;">
				
			</span>
		</div>
	</div>

	<!-- 썸머노트 -->
	<!-- $('#summernote').summernote({
		height : 350,
		toolbar: [
		    ['style', ['style']],
		    ['font', ['bold', 'italic', 'underline', 'clear']],
		    ['fontname', ['fontname']],
		    ['color', ['color']],
		    ['para', ['ul', 'ol', 'paragraph']],
		    ['height', ['height']],
		    ['table', ['table']],
		    ['insert', ['link', 'picture', 'hr']],
		    ['view', ['fullscreen', 'codeview']],
		    ['help', ['help']]
		  ]
	}); -->

	<script>
		$(document).ready(function () {
			$('#summernote').summernote({
				height: 260,                 // set editor height
				minHeight: null,             // set minimum height of editor
				maxHeight: null,             // set maximum height of editor
				focus: true,
				airMode: false,                // set focus to editable area after initializing summe
				lang : 'ko-KR',
				popover: {         //팝오버 설정

				image: [], //이미지 삭제

				link: [],  //링크 삭제

				air: []

				}
			});
		});

		$(function () {
			$('#summernote').summernote({
				height: 600,
				focus: true,
				callbacks: {
					onImageUpload: function (files, editor, welEditable) {
						for (var i = files.length - 1; i >= 0; i--) {
							sendFile(files[i], this);
						}
					}
				}
			});
		})

		function sendFile(file, el) {
			var form_data = new FormData();
			form_data.append('file', file);
			$.ajax({
				data: form_data,
				type: "POST",
				url: './profileImage.mpf',
				cache: false,
				contentType: false,
				enctype: 'multipart/form-data',
				processData: false,
				success: function (img_name) {
					$(el).summernote('editor.insertImage', img_name);
				}
			});
		}
	</script>


	<!-- <script>
		function goWrite(frm) {
			var title = frm.msTitle.value;
			var msRsgId = frm.msRsgId.value;
			var msRsgNick = frm.msRsgNick.value;
			var content = frm.msContent.value;
			
			console.log("title",title);
			console.log("content",content);

			if (title.trim() == ''){
				alert("제목을 입력해주세요");
				return false;
			}
			if (content.trim() == ''){
				alert("내용을 입력해주세요");
				return false;
			}

			var userId = "${loginUser.userId}";
			if(userId==""){
				swal("You need Login", "로그인 후 사용 가능합니다.", "error");
				return false;
			}
			frm.submit();
			}
	</script>	 -->

	

<!-- // <form id="form2" name="form2" method="post" enctype="multipart/form-data">
//     <input type="file" id="files" name="files" multiple/>
//     <input type="button" value="확인" onclick="test2(); return false;">
// </form> -->


	<script>
		function goWrite(){
			var form = $("form")[0];        
			var formData = new FormData(form);

			$.ajax({
				cache : false,
				url : "messageSend.ms", 
				processData: false,
				contentType: false,
				type : 'POST', 
				data : formData, 
				success : function(data) {
					alert("쪽지를 보냈습니다!");
						window.close();
				}, // success 
		
				error : function(error) {
					alert("에러");
				}
			}); // $.ajax */    }
		}
	</script>

</body>

</html>