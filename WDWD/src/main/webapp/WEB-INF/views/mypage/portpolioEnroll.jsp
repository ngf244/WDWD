<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.portpolioEnroll{
		border: 1px solid lightgray;
		width: 80%;
		margin: auto;
		background-color: rgba(224, 224, 224, 0.16);
	}

	.portpolioEnrollTopArea{height: 60px; background: #4374D9; color: white; font-size: 18pt; box-shadow: 2px 2px 5px black;}
	
	#portpolioEnrollText{font-weight: bolder; margin-top: 12px; padding-left: 40px; padding-right: 30px; display:inline-block;}
	
	#porThumbnail{
		width: 25%;
		height: 250px;
		border: 1px solid lightgray;
		margin: 40px;
		padding: 20px;
		float: left;
		text-align: center;
		font-weight: bolder;
		background-color: white;
		cursor: pointer;
	}
	
	#porFormArea{
		width: 50%;
		min-height: 320px;
		margin: 40px;
		border: 1px solid lightgray;
		padding: 20px;
		float: left;
		font-size: 12pt;
		font-weight: bold;
	}
	
	#portEnrollTable{
		line-height: 60px;
	}
	
	.inputText{
		width: 80%;
		height: 40px;
		font-size: 12pt;
		line-height: 40px;
	}
	
	.btnArea{
		text-align: center;
		font-weight: bold;		
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
	
	/* 파일첨부 */
	
	.fileArea {
		position: relative;
		display: inline-table;
		width: 150px;
		margin: 5px;
		font-size: 11pt;
		line-height: 25px;
		color: white;
		background: rgba(44, 62, 80, 0.5);
		text-align: center;
		font-weight: bold;
		margin-bottom: 15px;
		border-radius: 5px;
	}
	.fileArea p {
		overflow: hidden;
		text-overflow: ellipsis;
		white-space: nowrap;
		width: 140px;
		height: 25px;
	}
	.fileAreaImg {
		width: 140px;
		height: 140px;
		margin: 3px;
	}
	.fileAreaRemove {
		width: 20px;
		height: 20px;
		float: right;
		position: absolute;
		top: 10px;
		right: 10px;
		z-index: 1;
		cursor: pointer;
	}	

	#fileAdd {
		display: inline-table;
		padding: 8px;
		background-color: rgb(44, 62, 80);
		cursor: pointer;
		height: 30px;
		font-size: 12pt;
		color: white;
		line-height: 30px;
	}
	#fileAdd img {
		position: absolute;
		width: 30px;
		height: 30px;
	}
	#fileAdd span {
		margin-left: 40px;
	}
	
	
</style>
<title>포트폴리오</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
			
		</div>
		<div id="main">
			<div class="portpolioEnroll">
				<div class="portpolioEnrollTopArea">
					<div id="portpolioEnrollText">포트폴리오 등록</div>
				</div>
				<div id="portpolioEnrollContent">
					<form action="" method="post" encType="multipart/form-data">
						<div id="porThumbnail">
							<img id="portThumbnailImage" width="100%" height="100%" style="display: none;">
							<div id="thumbnailEnrollArea">
								<br><br>썸네일 이미지 등록<br><br>
								<img id="thumbnailImage" src="${ contextPath }/resources/images/Add_File_icon.png" width="50" height="50">
							</div>
							
						</div>
						<div id="porFormArea">
							<table id="portEnrollTable">
								<tr>
									<td style="width: 30%;">포트폴리오 제목</td>
									<td style="width: 40%;"><input type="text" name="portpolioName" class="inputText" style="width: 94%;"></td>
								</tr>
								<tr>
									<td>포트폴리오 유형</td>
									<td>
										<select class="inputText">
											<option>이미지 편집</option>
											<option>이미지 제작</option>
											<option>동영상 편집</option>
											<option>동영상 제작</option>											
										</select>
									</td>
								</tr>
								<tr>
									<td>본 사이트 이용 여부</td>
									<td>
										<input type="radio" id="usingSiteY" name="usingSite" value="Y"><label for="usingSiteY">Yes</label>
										<input type="radio" id="usingSiteN" name="usingSite" value="N"><label for="usingSiteN">No</label>
									</td>
								</tr>
								<tr>
									<td>포트폴리오 설명</td>
									<td>
										<textarea name="portDesc" id="portDesc" rows="10" cols="45" style="resize: none;"></textarea>
									</td>
								</tr>
								<tr>
									<td>파일 첨부</td>
									<td>
										<div id="fileList"></div>
										<div id="fileAdd">
											<img src="${ contextPath }/resources/images/add.png">
											<span>파일 추가</span>
										</div>
									</td>
								</tr>
							</table>
						</div>
						<div style="clear: both;"></div>
						
						<div id="thumbnailFileArea" class="thumbnailFileArea">
							<input type="file" hidden="" id="thumbnailImg1" class="thumbnailImg1" multiple="multiple" name="thumbnailImg1" onchange="LoadImg(this)">
						</div>						
						
					</form>
				</div>
				<div class="btnArea">
					<div id="portCompleteBtn" class="button">완료</div>
					<div id="portCancelBtn" class="button">취소</div>
				</div>
			</div>
		</div>
		<div id="right-side">
				
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
	
	<script>
		$('#portCompleteBtn').hover(function(){
			$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
		}, function(){
			$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
		});
		$('#portCancelBtn').hover(function(){
			$(this).css({'background-color':'rgb(52, 152, 219)', 'color':'white'})
		}, function(){
			$(this).css({'background-color':'rgba(161, 206, 244, 0.55)', 'color':'black'})
		})
		
	</script>
	
	<script>
		$(function(){
			$('#thumbnailFileArea').hide();
			
			$('#porThumbnail').click(function(){
    			$('#thumbnailImg1').click();
    		});
		});
		
		var titleImgChecked = false;
		function LoadImg(value){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){								
    				$('#portThumbnailImage').attr("src", e.target.result).css("display", "block");
    				$('#thumbnailEnrollArea').css("display", "none");
				}
				
				titleImgChecked = true;
    			reader.readAsDataURL(value.files[0]);
			}
		}		
	</script>
	
	
	<script>
		var fileNum = 0;
		$('#fileAdd').click(function(){
			$('#fileList').append("<input type='file' hidden='' onchange='changeFile(this)' id='fileNum" + fileNum + "' name='fileNum" + fileNum + "'>");
			$('#fileNum' + fileNum).click();
			fileNum++;
		});
		
		function changeFile(file) {
			var fileValue = file.value;
			var fileUrl = fileValue.lastIndexOf("\\") + 1;
			var fileName = fileValue.substring(fileUrl);
			
			if(fileValue != "") {
				var $div = $('<div class="fileArea">');
				var $img1 = $('<img class="fileAreaRemove">');
				var $img2 = $('<img class="fileAreaImg">');
				var $p = $('<p>')
				
				$p.text(fileName);
				
				$img1.attr("src", "${ contextPath }/resources/images/x-button.png");
				
				var reader = new FileReader();
				
				reader.onload = function(e){
					$img2.attr("src", e.target.result);
				}
				
				reader.readAsDataURL(file.files[0]);
				
				$div.append($img1);
				$div.append($img2);
				$div.append($p)
				
				$('#fileList').append($div);
			}
		}
		
		$(document).on("click", ".fileAreaRemove", function(){
			this.parentNode.remove();
		});
	</script>	
		
</body>
</html>