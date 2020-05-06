<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guide</title>
<style>

	#menuHeaderWrap {
		background-color: rgb(52, 152, 219);
		height: 40px;
	}
	#menuHeader {
		width: 70%;
		margin: 0 auto;
		text-align: center;
	}
	.menubar {
	
		float: center;
		color: white;
		display: inline-block;
		font-size: 12pt;
		margin: 6px;
		cursor: pointer;
		text-align: center;
		line-height: 10px;
		margin-top: 13px;
	}
	
	
	.guideimeages{
		width: 100%;
		height: 300px;
		color: red;
		background-color:blue;
	}
	
	#guidelist{	
   background-color : rgb(52, 152, 219);
   color : white;
   margin-top: 20px;
   font-weight: bold;
   display: inline-block;
   cursor: pointer;
   width: 37.5%;
   height: 70px;
   text-margin-top: 10px;
   font-size: 20px;
   line-height: 70px;
   border-radius: 5px;
   }
   
   .mainimage{
   	text-align : center;
   }
</style>
</head>
<body>

	<div id="menuHeaderWrap">
		<div id="menuHeader">
				<div class="menubar">공지사항</div>
				<div class="menubar">사진</div>
				<div class="menubar">미디어</div>
				<div class="menubar">HIT 갤러리</div>
				<div class="menubar">문의</div>
				<div class="menubar">충전소</div>
		</div>
	</div>
		<div class="mainimage">
		<img id="guideImage" src="${ contextPath }/resources/images/Guidemain.png" onclick="location.href='qnalist.guide';">
		</div>
</body>			

</html>