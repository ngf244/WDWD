<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://fonts.googleapis.com/css?family=Chewy" rel="stylesheet">
<style>
	/* 마이페이지 메인 상단 프로필 부분 */
	#mypageArea{width: 80%; margin: auto; text-align: left;}
	.mypageTopArea{z-index: 1; height: 80px; background: #4374D9; color: white; font-size: 22pt; box-shadow: 2px 2px 5px black; position: relative;}
	#mypageText{font-weight: bolder; margin-top: 20px; padding-left: 40px; padding-right: 30px; display:inline-block; float: left;}
/* 	.requestBtn{
		width: 100px; 
		height: 30px; 
		margin-top: 20px; 
		margin-right: 40px; 
		float: right; 
		border: 1px solid black; 
		font-size: 15pt; 
		padding: 10px; 
		padding-left: 25px;
		background: #003399;
		color: white;
		border-radius: 10px;
		box-shadow: 2px 2px 5px black;
		cursor: pointer;
	} */
	
	/* 의뢰 요청 버튼 */
	button {
	  position: relative;
	  background: none;
	  cursor: pointer;
	  border: 0;
	  padding: 0;
	  outline: 0;
	  font-family: 'Chewy', cursive;
	  color: crimson;
	  width: 250px;
	}
	span {
	  display: block;
	}
	.shadow:before,
	.shadow:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  border-radius: 100px;
	  background: red;
	  z-index: -2;
	  background: linear-gradient(to right, rgba(0,0,0,1) 0%,rgba(0,0,0,0) 100%);
	  opacity: .4;
	  transform: rotateX(0);
	  transform-origin: center 30px;
	  filter: blur(1px);
	  animation: shadowLeft 2s ease-in-out alternate infinite;
	  transition: all 1s cubic-bezier(0.875, -0.555, 0.190, 1.640);
	}
	@keyframes shadowLeft {
	  to {
	    opacity: .1;
	    filter: blur(5px);
	  }
	}
	.shadow:after {
	  background: linear-gradient(to left, rgba(0,0,0,1) 0%,rgba(0,0,0,0) 100%);
	  opacity: .1;
	  filter: blur(5px);
	  animation: shadowRight 2s ease-in-out alternate infinite;
	}
	@keyframes shadowRight {
	  to {
	    opacity: .4;
	    filter: blur(1px);
	  }
	}
	#reqGifBtn:focus .shadow:before,
	#reqGifBtn:focus .shadow:after {
	  transform: rotateX(180deg);
	}
	
	
	.vert {
	  transform: translateY(-20px);
	  animation: vert 1s ease-in-out alternate infinite;
	}
	@keyframes vert {
	  to {
	    transform: translateY(-25px);
	  }
	}
	.floating {
	  background-color: transparent;
	  -webkit-perspective: 800;
	  -webkit-transform-style: preserve-3d;
	  transform: rotateY(-3deg) skewY(-3deg);
	  animation: swing 2s cubic-bezier(0.420, 0.000, 0.580, 1.000) alternate infinite;
	}
	@keyframes swing {
	  to {
	    transform: rotateY(3deg) skewY(3deg);
	  }
	}
	.floating span {
	  display: block;
	  padding: 10px 0;
	  border-radius: 100px;
	  font-size: 25px;
	  background: #fff;
	  transition: all 1s cubic-bezier(0.875, -0.555, 0.190, 1.640);
	  transform: translateY(-3px) translateZ(5px) rotateX(0);
	  width: 100%;
	}
	span.back {
	  position: absolute;
	  top: 0;
	  left: 0;
	  background: #aaa;
	  transform: translateY(3px) translateZ(-5px) rotateX(-180deg);
	}
	#reqGifBtn:focus .front {
	  transform: translateY(3px) translateZ(-5px) rotateX(180deg);
	  background: #aaa;
	}
	
	#reqGifBtn:focus .back {
	  transform: translateY(-3px) translateZ(5px) rotateX(0);
	  background: #fff;
	}	
	#reqGifBtn{width: 200px; margin-left: 600px; margin-top: 35px;}	
	
	
	/* 회원 정보 영역 */
	.myprofileArea{height: 400px; border: 1px solid lightgray; margin-top: 30px; border-radius: 10px;}
	.normalInfo{border-bottom: 1px solid silver; height: 220px;}
	#userId{color: rgb(52, 152, 219); display: inline-block; font-size: 20pt; font-weight: bold; margin-top: 10px; margin-left: 10px;}
	#userId + span{font-size: 15pt; font-weight: bold; padding-left: 5px;}
	#userInfoTable{width: 80%; height:120px; margin-top: 20px;}
		
	/* 프로필 이미지 */
	.profileImage{width: 160px; height: 160px; border: 1px solid lightgray; margin: 20px; display:inline-block; border-radius: 10px; overflow: hidden; float: left;}
	.profile {
        width: 100%;
        height: 100%;
        object-fit: cover;
        cursor: pointer;
    }	
	
	/* 회원정보수정버튼 */
	#profileEditBtn{
		margin-left: 150px; 
		position: absolute; 
		margin-top: 10px;
		background: rgb(243, 156, 18);
		color: white;
		border-radius: 10px;
		cursor: pointer;
		padding: 10px;
		font-family:Arial;
		font-size:15px;
		font-weight: bold;			 
	}
	
	/* 자기소개 영역 */
	.introduceInfo{height: 180px; padding-left: 20px; line-height: 30px;}
		
	/* 회원정보 수정 모달영역설정 */
	.editModalArea{
		display: none;
		position: fixed;
		z-index: 10;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.4);
	}
	
	.page-header{border-bottom: 1px solid #888;}
	
	.user-edit-content{
		background-color: #fefefe;
		margin: 15% auto;
		padding: 20px;
		border: 1px solid #888;
		width: 45%;
		height: 1120px;
		border-radius: 10px;
	}
	
	#editCompleteBtn{
		 cursor:pointer;
		 background-color:#DDDDDD;
		 text-align: center;
		 padding-bottom: 10px;
		 padding-top: 10px;
		 width: 100px;
		 border-radius: 10px;
		 margin-left: 300px;
		 margin-top: 15px;
		 font-size: 13pt; 
		 font-weight: bold;
		 float: left;
	}
	#editCompleteBtn:hover{
		background: black;
		color: white;
	}
	
	#editCancelBtn{
		 cursor:pointer;
		 background-color:#DDDDDD;
		 text-align: center;
		 padding-bottom: 10px;
		 padding-top: 10px;
		 width: 100px;
		 border-radius: 10px;
		 margin-left: 20px;
		 margin-top: 15px;
		 font-size: 13pt; 
		 font-weight: bold;
		 float: left;
	}
	#editCancelBtn:hover{
		background: black;
		color: white;
	}	
		
	/* 회원정보 수정창 내용 */
	#basicInfoText{width: 80%; height: 60px; background: rgb(102, 102, 102); color: white; margin: 20px; margin-left: 90px; font-size: 18pt; font-weight: bold; text-align: center; line-height: 55px; border-radius: 10px;}
	
	#addInfoText{width: 80%; height: 60px; background: rgb(102, 102, 102); color: white; margin: 20px; margin-left: 90px; font-size: 18pt; font-weight: bold; text-align: center; line-height: 55px; border-radius: 10px;}	
	
	.basicInfo>table{margin: 50px; margin-left: 150px; font-size: 14pt; line-height: 30px;}
	.addInfo>table{margin: 50px; margin-left: 150px; font-size: 14pt; line-height: 30px;}
	
	input{border-radius: 5px; height: 25px; font-size: 12pt;}
	textarea{border-radius: 5px; resize: none; margin-top: 30px; font-size: 12pt;}
	
	/* 현재 포인트&캐쉬 */
	.point-cash-area{height: 110px; margin-top: 25px;}
	.point{width: 47%; height: 110px; border: 1px solid lightgray; display: inline-block; border-radius: 5px;}
	.cash{width: 47%; height: 110px; border: 1px solid lightgray; display: inline-block; margin-left: 30px; border-radius: 5px;}
	.point>table{
		width: 85%;
		height: 80%;
		text-align: left;
		font-size: 25pt;
		margin-left: 42px;
		font-weight: bolder;
	}
	
	.cash>table{
		width: 85%;
		height: 80%;
		text-align: left;
		font-size: 25pt;
		margin-left: 42px;
		font-weight: bolder;
	}
	
	/* 내 글 관리 부분 */
	#mypostManagement{height: 830px; margin-top: 25px;}
	.mypostText{text-indent: 10px; height: 70px; font-size: 18pt; font-weight: bolder; line-height: 65px; background: #EAEAEA;}
	.mypostArea{height: 700px; margin-top: 30px;}
	.mypostArea>div>span{font-size: 14pt; margin-left: 20px; font-weight: bold;}
	#replyText{font-size: 14pt; margin-left: 20px; font-weight: bold;}
	.pointArea{
		float: left;
		width: 47%;
		height: 400px;
		border: 1px solid lightgray;
		display: inline-block;
		border-radius: 10px;
	}
	.cashArea{
		float: right;
		width: 47%;
		height: 400px;
		border: 1px solid lightgray;
		display: inline-block;
		border-radius: 10px;		
	}
	.replyArea{
		width: 100%;
		height: 300px;
		border: 1px solid lightgray;
		margin-top: 25px;
		border-radius: 10px;
	}
	.postList{line-height: 45px; padding: 15px; padding-left: 30px;}
	.replayList1{width: 45%; line-height: 45px; padding: 15px; padding-left: 22px; float: left; margin-right: 30px;}
	.replayList2{width: 45%; line-height: 45px; padding: 15px; padding-left: 22px; float: left;}
	
	/* 나의 의뢰/작업 현황 */
	#myReqWorkState{height: 810px; margin-top: 25px;}
	.myReqWorkStateText{text-indent: 10px; height: 70px; font-size: 18pt; font-weight: bolder; line-height: 65px; background: #EAEAEA;}
/* 	#allReqListBtn{
		float: right; 
		background: rgb(39, 174, 96); 
		font-size: 12pt; 
		color: white; 
		margin-right: 30px; 
		margin-top: 10px;
		padding-left: 50px;
		width: 250px; 
		height: 50px; 
		border-radius: 10px;
		line-height: 50px;
		cursor: pointer;
	} */
	.myReqWorkStateArea{height: 700px; margin-top: 25px;}
	#myReqStateText{font-size: 15pt; color: white; font-weight: bolder; padding-left: 30px; margin-top: 15px; padding-top: 10px;}
	#myWorkStateText{font-size: 15pt; color: white; font-weight: bolder; padding-left: 30px; margin-top: 15px; padding-top: 10px;}
	.myReqState{height: 340px; border-radius: 15px; margin: 10px; background: rgb(52, 152, 219);}
	.myWorkState{height: 340px; margin-top:15px; border-radius: 15px; margin: 10px; background: rgb(241, 179, 80);}
	.recruit{width: 24%; height: 260px; margin: 10px; float: left; background: black; color: white; font-size: 14pt; border-radius: 10px;}
	.working1{width: 24%; height: 260px; margin: 10px; float: left; background: black; color: white; font-size: 14pt; border-radius: 10px;}
	.complete1{width: 24%; height: 260px; margin: 10px; float: left; background: black; color: white; font-size: 14pt; border-radius: 10px;}
	#arrow_icon_area{width: 8%; height: 260px; margin: 10px; float: left; margin-right: 18px;}
	.arrow{margin-top: 90px; margin-left: 2px;}
	.participate{width: 24%; height: 260px; margin: 10px; float: left; background: black; color: white; font-size: 14pt; border-radius: 10px;}
	.working2{width: 24%; height: 260px; margin: 10px; float: left; background: black; color: white; font-size: 14pt; border-radius: 10px;}
	.complete2{width: 24%; height: 260px; margin: 10px; float: left; background: black; color: white; font-size: 14pt; border-radius: 10px;}
	.innerArea{width: 100%; height: 140px; background: silver; margin-top: 20px; margin-bottom: 10px; z-index: 2; text-align: center; cursor: pointer;}
	.innerArea + span{font-size: 10pt; margin-left: 5px;}
	.stepText{margin: 15px;}
	/* innerText */
	.innerAreaText{
		font-size: 30pt;
		color: #4374D9;
		font-weight: bolder;
		line-height: 100px;
		display: inline-block;
		text-align: center;
		margin-top: 20px;
	}

	
	/* 포트폴리오 */
	#portpolio{height: 725px; margin-top: 30px;}
	.portpolioText{text-indent: 10px; height: 70px; font-size: 18pt; font-weight: bolder; line-height: 65px; background: lightgray;}
	.portpolioArea{height: 625px; border: 1px solid lightgray; margin-top: 30px; border-radius: 10px;}
	#smallReqBtn{
		font-size: 12pt; 
		color: white; 
		background: rgb(231, 76, 60); 
		display: inline; 
		margin-left: 50px; 
		padding: 15px;
		padding-left: 40px;
		padding-right: 40px;
		border-radius: 10px; 
		height: 45px; 
		cursor: pointer;
	}
	
	.portpolioList{width: 20%; height: 200px; border: 1px solid lightgray; float: left; margin-left: 40px; margin-top: 30px;}
	
	/* 페이징 처리 css */
	.pagingCenter{
		text-align: center;
		margin-top: 30px;
	}
	
	.pagination{
		display: inline-block;
	}

	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	  border: 1px solid #ddd;
	}
	
	.pagination a.active {
	  background-color: rgb(52, 152, 219);
	  color: white;
	  border: 1px solid rgb(52, 152, 219);
	}
	
	.pagination a:hover:not(.active) {background-color: #ddd;}
	
	/* 포트폴리오 등록 버튼 */
	#portpolioEnrollBtn{
		display: inline-table;
		width: 20%;
		height: 60px;
		margin: 20px;
		margin-top: 10px;
		line-height: 60px;
		text-align: center;
		background-color: rgb(39, 174, 96);
		color: white;
		border-radius: 5px;
		cursor: pointer;
		float: right;
	}

	/* 포트폴리오 디테일 모달창 */	
	.portDetailModalArea{
		display: none;
		position: fixed;
		z-index: 10;
		left: 0;
		top: 0;
		width: 100%;
		height: 100%;
		overflow: auto;
		background-color: rgb(0,0,0);
		background-color: rgba(0,0,0,0.5);
	}	

	.portDetailModalContent{
		background-color: #fefefe;
		margin: 15% auto;
		border: 1px solid #888;
		width: 60%;
	}

	#modalCloseBtn{
		width: 4%;
		height: 40px;
		float: right;
		margin-top: 8px;
	}
	
	.portpolioNameContents{
		width: 70%;
		border: 1px solid lightgray;
		float: left;
		margin-left: 2%;
		margin-right: 4%;
	}
	
	.portpolioName{
		width: 100%;
		height: 120px;
		font-size: 20pt;
		line-height: 110px;
	}

	.portpolioDesc{
		width: 21%;
		height: 620px;
		border: 1px solid lightgray;
		float: left;
	}						

	.userId{
		height: 50px;
		background: #003399;
		color: white;
		font-size: 15pt;
		font-weight: bolder;
		text-align: center;
		line-height: 48px;
		border-radius: 5px;
	}
	
	.portClass{
		height: 40px;
		font-size: 12pt;
		text-align: center;
		line-height: 48px;
	}
	
	.usingSite{
		height: 80px;
		font-size: 12pt;
		text-align: left;
		line-height: 48px;
		border-bottom: 1px solid lightgray;
		margin: 10px;
	}

	.portDescription{
		height: 400px;
		font-size: 12pt;
		text-align: left;
		line-height: 38px;
		margin: 10px;
	}			

	#updateBtn{
		margin: 10px;
		width: 9%;
		height: 40px;
		background: rgb(52, 152, 219);
		color: white;
		display: inline-block;
		cursor: pointer;
		text-align: center;
		line-height: 40px;
		border-radius: 10px;
	}

	#deleteBtn{
		margin: 8px;
		width: 9%;
		height: 40px;
		background: rgb(52, 152, 219);
		color: white;
		display: inline-block;
		cursor: pointer;
		text-align: center;
		line-height: 40px;
		border-radius: 10px;		
	}

	.ModalReplyArea{
		width: 95.1%;
		height: 300px;
		margin: 22px;
	}

	.replayText{
		font-size: 12pt;
		text-indent: 30px;
		border-bottom: 1px solid lightgray;
		height: 30px;
		line-height: 30px;
	}	
	
	.repWriterImg{
		width: 6%;
		border: 1px solid black;
		height: 65px;
		border-radius: 50px;
		margin: 10px;
		float: left;
	}
	
	.repIdDateCon{
		float: left;
	}
	
	.idDate{
		margin: 10px;
	}
	
	.repContents{
		margin: 10px;
	}
	
	.repEnrollArea{
		width: 777px;
	}
	
	.repMeImg{
		width: 65px;
		border: 1px solid black;
		height: 65px;
		border-radius: 50px;
		margin: 10px;
		float: left;
	}	
	
	#repEnrollBtn{
		margin: 8px;
		width: 9%;
		height: 40px;
		background: rgb(52, 152, 219);
		color: white;
		display: inline-block;
		cursor: pointer;
		text-align: center;
		line-height: 40px;
		border-radius: 10px;			
	}
	
	/* 포트폴리오 디테일 뷰 사이드 메뉴 */
	#portScroll{
		font-size: 15pt;
		color: white;
		font-weight: bolder;
		border-radius: 5px;
	}
	
	#backToTop{
		margin-left: 25%;
	}		
		
		
	/* 캐쉬변동 */
	#cashChange{height: 700px; margin-top: 30px;}
	.cashChangeText{text-indent: 10px; height: 70px; border: 1px solid lightgray; font-size: 18pt; font-weight: bolder; line-height: 60px; background: #D5D5D5;}
	.cashChangeArea{height: 600px; border: 1px solid lightgray; margin-top: 30px; border-radius: 10px;}
	.monthArea{width: 18%; height: 65px; border: 1px solid lightgray; border-radius: 100px; margin: 15px; margin-left: 440px; text-align: center; line-height: 62px;}
	.changeList{width: 90%; height: 125px; margin-left: 60px; margin-top: 20px; border-bottom: 1px solid silver; font-size: 11pt;}
	.changeClass1{height: 65%; width: 11%; border: 1px solid red; margin: 8px; border-radius: 100px; line-height: 80px; color: red; float: left;}
	.changeClass2{height: 65%; width: 11%; border: 1px solid green; margin: 8px; border-radius: 100px; line-height: 80px; color: green; float: left;}
	.changeClass3{height: 65%; width: 11%; border: 1px solid rgb(41, 128, 185); margin: 8px; border-radius: 100px; line-height: 80px; color: rgb(41, 128, 185); float: left;}
	.chageDesc{float: right; padding: 50px;}
	
	/* 공통 플러스 아이콘 */
	.plusIcon{cursor: pointer; padding-top: 5px;}
	

</style>
<title>마이 페이지</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
		</div>
		<div id="main">
			<div id="mypageArea">
				<div class="mypageTopArea">
					<div id="mypageText">마이페이지</div>
					<!-- <div class="requestBtn"><b>의뢰 요청</b></div> -->
					<button id="reqGifBtn" onclick="location.href='directReq.my'">
					  <span class="shadow">
					    <span class="vert">
					      <span class="floating">
					        <span class="front">Request</span>
					        <span class="back">Request</span>
					      </span>
					    </span>
					  </span>
					</button>
					<div style="clear: both;"></div>		
				</div>
				
				<div class="myprofileArea">
					<div class="normalInfo">
						<div class="profileImage" id="profileImage">
<%-- 							<c:if test="${ member.profileImg eq 0 }">
								<img class="profile" src="${ contextPath }/resources/images/default_profile.png">
							</c:if>
							<c:if test="${ member.profileImg ne 0 }">
								<img class="profile" src="${ contextPath }/resources/images/profileImage/point.png">
							</c:if> --%>
							<img id="profile" class="profile">
						</div>
						<div id="profileImgFileArea">
							<form method="post" encType="multipart/form-data" id="profileImgForm">
								<input type="file" hidden="" name="profileImg" id="profileImg" multiple="multiple" onchange="LoadImg(this)">
							</form>
						</div>
						<button id="profileEditBtn" style="width: 120px; margin-left: 180px;">프로필 수정</button>
						<button id="profileEditBtn" class="profileImgUploadBtn" style="width: 150px; margin-left: 320px;">이미지 저장 완료</button>
						<span id="userId" class="smallOption">${ member.nickName }</span><span style="display: inline-block;">님</span>
						<div id="normalInfoArea">
							<table id="userInfoTable">
								<tr>
									<td>>이메일 : </td>
									<td>${ member.email }</td>
									<td>>예금주 : </td>
									<td>${ member.userName }</td>
								</tr>
								<tr>
									<td>>전화번호 : </td>
									<td>${ member.phone }</td>
									<td>>은행명 : </td>
									<td>${ member.bank }</td>
									
								</tr>
								<tr>
									<td>>평점 : </td>
									<td style="color: gold; font-weight: bolder;">
									<c:if test="${ member.grade eq 0 }">
										☆☆☆☆☆
									</c:if>									
									<c:if test="${ member.grade eq 1 }">
										★☆☆☆☆
									</c:if>
									<c:if test="${ member.grade eq 2 }">
										★★☆☆☆
									</c:if>
									<c:if test="${ member.grade eq 3 }">
										★★★☆☆
									</c:if>
									<c:if test="${ member.grade eq 4 }">
										★★★★☆
									</c:if>
									<c:if test="${ member.grade eq 5 }">
										★★★★★
									</c:if>																																				
									</td>
									<td>>계좌번호 : </td>
									<td>${ member.account }</td>
								</tr>								
							</table>
						</div>					
					</div>
					<div class="introduceInfo">
						<h3>>자기소개</h3>
						<p>${ member.intro }
						</p>
					</div>
				</div>
				
				<div class="point-cash-area">
					<div class="point">
						<table id="pointStatusTable">
							<tr>
								<td>Point</td>
								<td style="text-align: right; color: rgb(52, 152, 219);"><fmt:formatNumber value="${ member.point }"/></td>
							</tr>
						</table>
						<span id="pointShopMoveLink" style="float: right; margin-right: 40px;"><a href="">- 포인트샵으로 이동</a></span>
						<div style="clear: both;"></div>
					</div>
					<div class="cash" style="float: right;">
						<table id="cashStatusTable">
							<tr>
								<td>Cash</td>
								<td style="text-align: right; color: rgb(231, 76, 60);"><fmt:formatNumber value="${ member.cash }"/></td>
							</tr>
						</table>
						<span id="pointShopMoveLink" style="float: right; margin-right: 40px;"><a href="">- 캐쉬 충전 페이지로 이동</a></span>
						<div style="clear: both;"></div>					
					</div>
					<div style="clear:both;"></div>
				</div>
				
				<!-- 내 글 관리 -->
				<div id="mypostManagement">
					<div class="mypostText">
						내 글 관리
					</div>
					
					<div class="mypostArea">
						<div class="pointArea">
							<span style="display: inline-block;">포인트 게시글</span>
							<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" style="display: inline-block;"/>
							<div class="postList">
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
							</div>
						</div>
						<div class="cashArea">
							<span style="display: inline-block;">캐쉬 게시글</span>
							<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" style="display: inline-block;"/>
							<div class="postList">
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
								<div>- 게시글 제목</div>
							</div>
						</div>
						<div style="clear:both;"></div>
						<div class="replyArea">
							<div id="replyText">댓글&nbsp;<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" onclick="goToMyReply();"/></div>
							<div class="replayList1">
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
							</div>
							<div class="replayList2">
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
								<div>- 댓글 내용</div>
							</div>
							<div style="clear: both;"></div>							
						</div>
											
					</div>
				</div>
				<!-- 내 의뢰/작업 현황 -->
				<div id="myReqWorkState">
					<div class="myReqWorkStateText">
						나의 의뢰/작업 현황
						<!-- <div id="allReqListBtn">전체 의뢰 요청 리스트 보기</div> -->
						<div style="clear: both;"></div>						
					</div>
					<div class="myReqWorkStateArea">
						<div class="myReqState">
							<div id="myReqStateText">의뢰 현황</div>
							<div class="recruit">
								<span class="stepText">STEP 1. 지원자 모집 중</span>
								<div class="innerArea" onclick="goToMyReqList(1);">
									<div class="innerAreaText">5 </div>건
								</div>
								<span>캐쉬 게시판에 올린 글 중 지원자를 모집하고 있는 글 개수를 나타냅니다.</span>
							</div>
							<div id="arrow_icon_area">
								<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
							</div>
							<div class="working1">
								<span class="stepText">STEP 2. 작업 진행 중</span>
								<div class="innerArea" onclick="goToMyReqList(2);">
									<div class="innerAreaText">2 </div>건
								</div>
								<span>캐쉬 게시판에 올린 글 중 매칭이 되어 작업이 진행 중인 글 개수를 나타냅니다.</span>
							</div>
							<div id="arrow_icon_area">
								<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
							</div>
							<div class="complete1">
								<span class="stepText">STEP 3. 거래 완료</span>
								<div class="innerArea" onclick="goToMyReqList(3);">
									<div class="innerAreaText">3 </div>건
								</div>
								<span>캐쉬 게시판에 올린 글 중 거래가 완료 된글 개수를 나타냅니다.</span>
							</div>						
						</div>
						<div class="myWorkState">
							<div id="myWorkStateText">작업 현황</div>
							<div class="participate">
								<span class="stepText">STEP 1. 참가 지원 중</span>
								<div class="innerArea" onclick="goToMyWorkList(1)">
									<div class="innerAreaText">7 </div>건
								</div>
								<span>캐쉬 게시판에 올린 글 중 참여 신청한 글 개수를 나타냅니다.</span>
							</div>
							<div id="arrow_icon_area">
								<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
							</div>
							<div class="working2">
								<span class="stepText">STEP 2. 작업 진행 중</span>
								<div class="innerArea" onclick="goToMyWorkList(2)">
									<div class="innerAreaText">2 </div>건
								</div>
								<span>캐쉬 게시판에 올린 글 중 매칭이 되어 작업이 진행 중인 글 개수를 나타냅니다.</span>
							</div>
							<div id="arrow_icon_area">
								<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
							</div>
							<div class="complete2">
								<span class="stepText">STEP 3. 거래 완료</span>
								<div class="innerArea" onclick="goToMyWorkList(3)">
									<div class="innerAreaText">4 </div>건
								</div>
								<span>캐쉬 게시판에 올린 글 중 작업이 끝나 거래가 완료 된 글 개수를 나타냅니다.</span>
							</div>
							<div style="clear: both;"></div>					
						</div>
					</div>
				</div>
				<!-- 포트폴리오 -->
				<div id="portpolio">
					<div class="portpolioText">
						포트폴리오
						<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" onclick="location.href='portpolioList.my'"/>
						<div id="smallReqBtn">의뢰 요청</div>
					</div>
					<div class="portpolioArea">
						<div class="portpolioList"></div>
						<div class="portpolioList"></div>
						<div class="portpolioList"></div>
						<div class="portpolioList"></div>
						<div class="portpolioList"></div>
						<div class="portpolioList"></div>
						<div class="portpolioList"></div>
						<div class="portpolioList"></div>
						<div style="clear: both;"></div>
						<div class="pagingCenter">
							<div class="pagination">
							<a href=""> &laquo; </a>
							<a href="" class="active"> 1 </a>
							<a href=""> 2 </a>
							<a href=""> 3 </a>
							<a href=""> 4 </a>
							<a href=""> 5 </a>
							<a href=""> 6 </a>
							<a href=""> 7 </a>
							<a href=""> 8 </a>
							<a href=""> &raquo; </a>
							</div>
						</div>
						<div id="portpolioEnrollBtn" onclick="location.href='porEnroll.my'">등록하기</div>
						<div style="clear: both;"></div>						
					</div>
				</div>
				<!-- 캐쉬 변동 내역 -->
				<div id="cashChange">
					<div class="cashChangeText">
						Cash 변동내역
						<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" onclick="goToMyCashChangeList();"/>
					</div>
					<div class="cashChangeArea">
						<div class="dateArea">
							<div class="monthArea">2020.03.</div>
							<div class="changeList">
								<div class="changeClass1">&nbsp;&nbsp;&nbsp;&nbsp;의뢰 비용</div>
								<div class="chageDesc">2020. 03.10&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;2,000 지출 </div>
							</div>
							<div class="changeList">
								<div class="changeClass2">&nbsp;&nbsp;&nbsp;&nbsp;의뢰 수주</div>
								<div class="chageDesc">2020. 03.05&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;3,000 입금 </div>
							</div>
							<div class="changeList">
								<div class="changeClass3">&nbsp;&nbsp;&nbsp;&nbsp;캐쉬 충전</div>
								<div class="chageDesc">2020. 03.02&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;4,000 충전 </div>
							</div>														
						</div>
					</div>
				</div>
			</div>
			
			<!-- 회원 정보 수정 모달창 -->
			<div id="editModal" class="editModalArea">
				<div class="user-edit-content">
					<div class="page-header">
						<h1 style="font-size: 20pt; text-indent: 10px;">회원 정보 수정</h1>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<div class="row">
								<div class="col-sm-12">
									<form action="uMember.my" name="basicInfoForm" method="post">
										<div class="basicInfo">
											<div id="basicInfoText">기본 정보</div>
											<table>
												<tr>
													<td style="width: 300px; height: 50px;">이름</td>
													<td style="height: 50px;"><input type="text" name="userName" class="userName" value="${ loginUser.userName }"></td>
												</tr>
												<tr>
													<td style="height: 50px;">비밀번호</td>
													<td style="height: 50px;"><input type="password" name="userPwd" class="userPwd"></td>
												</tr>
												<tr>
													<td style="height: 50px;">비밀번호 재확인</td>
													<td style="height: 50px;"><input type="password" name="userPwd2" class="userPwd2"></td>
												</tr>
												<tr>
													<td style="height: 50px;">닉네임</td>
													<td style="height: 50px;"><input type="text" name="nickName" class="nickName" value="${ loginUser.nickName }"></td>
												</tr>
												<tr>
													<td style="height: 50px;">연락처</td>
													<td style="height: 50px;"><input type="text" name="phone" class="phone" value="${ loginUser.phone }"></td>
												</tr>
												<tr>
													<td style="height: 50px;">이메일</td>
													<td style="height: 50px;"><input type="email" name="email" class="email" value="${ loginUser.email }"></td>
												</tr>
												<tr>
													<td style="height: 50px;">자기소개</td>
													<td style="height: 50px;"><textarea rows="8" cols="50">${ loginUser.intro }</textarea></td>
												</tr>																																																
											</table>
										
										
										</div>
										<div class="addInfo">
											<div id="addInfoText">추가 정보</div>
												<table>
													<tr>
														<td style="width: 300px; height: 50px;">은행명</td>
														<td style="height: 50px;"><input type="text" name="bank" class="bank" value="${ loginUser.bank }"></td>
													</tr>
													<tr>
														<td style="height: 50px;">계좌번호</td>
														<td style="height: 50px;"><input type="text" name="accountNumber" class="accountNumber" value="${ loginUser.account }"></td>
													</tr>													
												</table>
										</div>
									</form>									
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div id="editCompleteBtn" onClick="closeModal();">완료</div>
					<div id="editCancelBtn" onClick="closeModal();">취소</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			
			<!-- 포트폴리오 디테일 모달창 -->
			<div id="portDetailModal" class="portDetailModalArea">
				<div class="portDetailModalContent">
					<div id="modalCloseBtn" onclick="closeDetail();"><img src="${ contextPath }/resources/images/x_icon2.png" width="30" height="30"></div>
					<div style="clear: both;"></div>
					
					<div class="portpolioNameContents">
						<div class="portpolioName" style="text-indent: 20px;">
							끄끄흐 디자인 (인테리어 디자인 및 용품 판매업) 로고 제작
						</div>
						<div class="portpolioContents">
							<img style="width: 100%;" name="portImage" src="${ contextPath }/resources/images/portimage_ex1.jpg">
						</div>
					</div>
					<div class="portpolioDesc">
						<div class="userId">user01</div>
						<div class="portClass">이미지 편집</div>
						<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인입니다.</div>
						<div class="portDescription">
							<span style="font-weight: bold;">디자인 설명</span><br>
							<span>인테리어 디자인 및 용품 판매 업체인 "끄끄흐"만의 재미있고 독창성을 보여주며, 이용하는 고객들이 직관적으로 이해할 수 있는 텍스트형 로고로 제작하였습니다. 색상변경 가능합니다. 감사합니다:)</span>
						</div>						
					</div>
					<div class="BtnArea">
						<div id="updateBtn">수정</div>
						<div id="deleteBtn">삭제</div>
					</div>					
					<div style="clear: both;"></div>
					<div class="ModalReplyArea">
						<div class="replayText">댓글(0건)</div>
						<div class="repWriterImg">
							<img src="">
						</div>
						<div class="repIdDateCon">
							<div class="idDate">
								<span>user02</span>
								<span>2020.03.28.</span>
							</div>
							<div class="repContents">
								와 정말 감탄이 절로 나오네요.. 
							</div>
						</div>
						<div style="clear: both;"></div>
						<div class="repEnrollArea">
							<div class="repMeImg">
								<img src="">
							</div>
							<form>
								<textarea id="repEnrollCon" name="repEnrollCon" rows="5" cols="95" style="resize: none;"></textarea><br>
								<div id="repEnrollBtn" style="float: right;">등록</div>								
							</form>
						</div>
					</div>
				</div>
				<div id="portScroll" style="position:absolute; top: 1100px; left: 1200px;"> 
					<a href="#modalCloseBtn"><img id="backToTop" src="${ contextPath }/resources/images/btn_backtotop.png" width="15%" height="15%"></a>									
				</div>				
			</div>			
							
		</div>
		<div id="right-side">
			<div></div>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
	<!-- 회원정보 수정 모달 -->
	<script>
		$('#profileEditBtn').click(function(){
			$("#editModal").show();		
		});
		function closeModal(){
			$('.editModalArea').hide();
		};
		
		$('.portpolioList').click(function(){
			$('#portDetailModal').show();
		});
		
		function closeDetail(){
			$('#portDetailModal').hide();
		}
		
		$('#portDetailModal').scroll(function(){  //스크롤이 움직일때마다 이벤트 발생
      		var position = $('#portDetailModal').scrollTop(); // 현재 스크롤바의 위치값을 반환
      		$('#portScroll').stop().animate({top:800+position+"px"}, 200); //해당 오브젝트 위치값 재설정
   		});		
				
	</script>
	
	<script>
		var userId = '${ loginUser.userId }';
		
		function goToMyReply(){
			location.href="myReplyList.my?userId=" + userId;
		}
		
		function goToMyCashChangeList(){
			location.href="cashChange.my?userId=" + userId;
		}
		
		function goToMyReqList(e){
			var cbStep = e;
			location.href="reqList.my?boWriter=" + userId + "&cbStep=" + cbStep;
		}
		
		function goToMyWorkList(e){
			var cbStep = e;
			location.href="workList.my?reId=" + userId + "&cbStep=" + cbStep;
		}
	</script>
	<script>
		// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$('#profileImage').on('click', function(){
			$('#profileImg').click();
		});
		
		// 각각의 영역에 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){								
					$("#profile").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(value.files[0]);
			}
		}
		
		// 파일 업로드
			
		
		$('.profileImgUploadBtn').on('click', function(){
			var formData = new FormData($('#profileImgForm')[0]);
			$.ajax({ 
				type: "POST", 
				enctype: 'multipart/form-data', // 필수 
				url: 'uProfileImg.my', 
				data: formData, // 필수 
				processData: false, // 필수 
				contentType: false, // 필수 
				cache: false, 
				success: function(data){ 
					alert("프로필 이미지가 저장되었습니다.");
				}, 
				error: function(e){ 
					alert("프로필 이미지 저장에 실패하였습니다.");
				} 
			});
		});
		
		
	</script>
	<jsp:include page="mypageSideMenubar.jsp"/>
</body>
</html>