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
	.span1 {
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
		margin-left: 200px; 
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
	
	/* 마이페이지 비공개 여부 */
	/* The switch - the box around the slider */
	.switch {
	  position: relative;
	  display: inline-block;
	  width: 60px;
	  height: 34px;
	  vertical-align:middle;
	  margin-left: 55%;
	  
	}
	
	/* Hide default HTML checkbox */
	.switch input {display:none;}
	
	/* The slider */
	.slider {
	  position: absolute;
	  cursor: pointer;
	  top: 0;
	  left: 0;
	  right: 0;
	  bottom: 0;
	  background-color: #ccc;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	.slider:before {
	  position: absolute;
	  content: "";
	  height: 26px;
	  width: 26px;
	  left: 4px;
	  bottom: 4px;
	  background-color: white;
	  -webkit-transition: .4s;
	  transition: .4s;
	}
	
	input:checked + .slider {
	  background-color: #2196F3;
	}
	
	input:focus + .slider {
	  box-shadow: 0 0 1px #2196F3;
	}
	
	input:checked + .slider:before {
	  -webkit-transform: translateX(26px);
	  -ms-transform: translateX(26px);
	  transform: translateX(26px);
	}
	
	/* Rounded sliders */
	.slider.round {
	  border-radius: 34px;
	}
	
	.slider.round:before {
	  border-radius: 50%;
	}
	
	.secretOption {
		margin:0px;
		display:inline-block;
		font-size:15px;
		font-weight:bold;
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
		width: 50%;
		height: 1240px;
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
		 margin-left: 360px;
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
	
	.basicInfo>table{margin: 50px; margin-left: 120px; font-size: 14pt; line-height: 30px;}
	.addInfo>table{margin: 50px; margin-left: 120px; font-size: 14pt; line-height: 30px;}
	
	input{border-radius: 5px; height: 25px; font-size: 12pt;}
	textarea{border-radius: 5px; resize: none; margin-top: 30px; font-size: 12pt;}
	.nickBtn{
		color: white;
		background: gray;
		padding: 2px;
		font-family:Arial;
		box-shadow: 1px 1px 2px black;
		font-size: 12pt;
		text-align: center;
		cursor: pointer;
		width: 40%; 
	}
	
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
	#mypostManagement{height: 730px; margin-top: 25px;}
	.mypostText{text-indent: 10px; height: 70px; font-size: 18pt; font-weight: bolder; line-height: 65px; background: #EAEAEA;}
	.mypostArea{height: 700px; margin-top: 30px;}
	.mypostArea>div>span{font-size: 14pt; margin-left: 20px; font-weight: bold;}
	#replyText{font-size: 14pt; margin-left: 20px; font-weight: bold;}
	#ScrapText{font-size: 14pt; margin-left: 20px; font-weight: bold;}
	.pointArea{
		float: left;
		width: 47%;
		height: 300px;
		border: 1px solid lightgray;
		display: inline-block;
		border-radius: 10px;
	}
	.cashArea{
		float: right;
		width: 47%;
		height: 300px;
		border: 1px solid lightgray;
		display: inline-block;
		border-radius: 10px;		
	}
	.replyAreaList{
		float: left;
		width: 47%;
		height: 300px;
		border: 1px solid lightgray;
		margin-top: 25px;
		border-radius: 10px;
	}
	.scrapArea{
		float: right;
		width: 47%;
		height: 300px;
		border: 1px solid lightgray;
		margin-top: 25px;
		display: inline-block;
		border-radius: 10px;
	}
	
	.postList{width: 90%; line-height: 45px; padding: 15px; padding-left: 22px;}
	.replayList{width: 90%; line-height: 45px; padding: 15px; padding-left: 22px; float: left; margin-right: 30px;}
	.scrapList{width: 90%; line-height: 45px; padding: 15px; padding-left: 22px; float: left;}
	
	.pList{overflow: hidden; width: 100%;}
	.cList{overflow: hidden; width: 100%;}
	.rList{overflow: hidden; width: 100%;}
	.sList{overflow: hidden; width: 100%;}
	
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
	.stepSpan{display: block;}
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
	#portpolio{margin-top: 30px;}
	.portpolioText{text-indent: 10px; height: 70px; font-size: 18pt; font-weight: bolder; line-height: 65px; background: lightgray;}
	.portpolioArea{border: 1px solid lightgray; margin-top: 30px; border-radius: 10px; height: 650px;}
	
	.portArea{
		width: 18%;
		height: 180px;
		border: 1px solid gray;
		float: left;
		margin: 2%;
		margin-left: 2.5%;
		padding: 10px;
	}
	
	.portpolioThumb{
		width: 100%;
		height: 150px;
		border: 1px solid lightgrey;
		float: left;
		display: line-block;
		cursor: pointer;
	}
	
	.portDate{
		margin-top: 10px;
		float: left;
		font-size: 9pt;
	}
	
	.portCount{
		margin-top: 10px;
		float: right;
		font-size: 9pt;
	}
	
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
	
	.modalCloseBtn{
		width: 4%;
		height: 40px;
		float: right;
		margin-top: 8px;
		cursor: pointer;
	}
	
	.portpolioNameContents{
		width: 70%;
		border: 5px solid lightgray;
		float: left;
		margin-left: 2%;
		margin-right: 4%;
	}
	
	.portpolioName{
		width: 100%;
		height: 120px;
		font-size: 20pt;
		line-height: 110px;
		font-weight: bolder;
		border-bottom: 5px solid lightgray;
	}
	
	.portpolioDesc{
		width: 21%;
		height: 620px;
		border: 5px solid lightgray;
		float: left;
		border-radius: 5px;
	}
	
	.userId{
		height: 50px;
		background: rgb(52, 152, 219);
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
	
	.updateBtn{
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
	
	.updateBtn:hover{
		background: #4374D9;
	}
	
	
	.deleteBtn{
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
	
	.deleteBtn:hover{
		background: #4374D9;
	}

	.replyArea{
		width: 95.1%;
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
		overflow: hidden;
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
		width: 70%;
	}
	
	.repEnrollBtn{
		width: 13%;
		height: 40px;
		background: rgb(52, 152, 219);
		color: white;
		display: inline-block;
		cursor: pointer;
		text-align: center;
		line-height: 40px;
		border-radius: 10px;			
	}
	
	.repEnrollBtn:hover{
		background: #4374D9;
	}	
	
	/* 포트폴리오 디테일 뷰 사이드 메뉴 */
	.portScroll{
		font-size: 15pt;
		color: white;
		font-weight: bolder;
		border-radius: 5px;
	}
	
	.backToTop{
		margin-left: 25%;
		cursor: pointer;
	}	
		
	/* 캐쉬변동 */
	#cashChange{height: 700px; margin-top: 30px;}
	.cashChangeText{text-indent: 10px; height: 70px; border: 1px solid lightgray; font-size: 18pt; font-weight: bolder; line-height: 60px; background: #D5D5D5;}
	.cashChangeArea{height: 600px; border: 1px solid lightgray; margin-top: 30px; border-radius: 10px;}
	.monthArea{width: 18%; height: 65px; border: 1px solid lightgray; border-radius: 100px; margin: 15px; margin-left: 430px; text-align: center; line-height: 62px;}
	.changeList{width: 90%; height: 125px; margin-left: 60px; margin-top: 20px; border-bottom: 1px solid silver; font-size: 11pt;}
	.changeClass1{height: 65%; width: 11%; border: 1px solid red; margin: 8px; border-radius: 100px; line-height: 80px; color: red; float: left;}
	.changeClass2{height: 65%; width: 11%; border: 1px solid green; margin: 8px; border-radius: 100px; line-height: 80px; color: green; float: left;}
	.changeClass3{height: 65%; width: 11%; border: 1px solid rgb(41, 128, 185); margin: 8px; border-radius: 100px; line-height: 80px; color: rgb(41, 128, 185); float: left;}
	.chageDesc{float: right; padding: 50px;}
	
	/* 공통 플러스 아이콘 */
	.plusIcon{cursor: pointer; padding-top: 5px;}
	
	/* sweetAlert */
	.swal-button{
		width: 90px;
		font-weight: normal;
		text-align: center;
		font-family: 'Malgun Gothic';
	}
	
	/* a태그 관련 css 초기화*/
	a:link { color: black; text-decoration: none;}
	a:visited { color: black; text-decoration: none;}
 	a:hover { color: black; text-decoration: underline;}
	
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
					<button id="reqGifBtn">
					  <span class="shadow span1">
					    <span class="vert span1">
					      <span class="floating span1">
					        <span class="front span1">Request</span>
					        <span class="back span1">Request</span>
					      </span>
					    </span>
					  </span>
					</button>
					<div style="clear: both;"></div>		
				</div>
				<div class="myprofileArea">
					<div class="normalInfo">
						<div class="profileImage" id="profileImage">
	 						<c:if test="${ member.profileImg eq null }">
								<img id="profile" class="profile" src="${ contextPath }/resources/images/default_profile.png">
							</c:if>
							<c:if test="${ member.profileImg ne null }">
								<img id="profile" class="profile" src="${ contextPath }/resources/profile_Image/${ member.profileImg }"/>
							</c:if>
							
						</div>
						<div id="profileImgFileArea">
							<form method="post" encType="multipart/form-data" id="profileImgForm">
								<input type="file" hidden="" name="profileImg" id="profileImg" multiple="multiple" onchange="LoadImg(this)">
							</form>
						</div>
						<c:if test="${ member.userId eq loginUser.userId }"><button id="profileEditBtn" style="width: 120px; margin-left: 180px;">프로필 수정</button></c:if>
						<span id="userId" class="smallOption">${ member.nickName }</span><span style="display: inline-block;">님</span>
						<c:if test="${ member.userId eq loginUser.userId }">
								<c:choose>
									<c:when test="${ member.easy eq 'N'}">
										<label class="switch">
											<input type="checkbox">
											<span class="slider round"></span>
										</label>
										<p class="secretOption">공개</p><p class="secretOption" style="display:none;">비공개</p>
									</c:when>
									<c:otherwise>
										<label class="switch">
											<input type="checkbox" checked>
											<span class="slider round"></span>
										</label>
										<p class="secretOption" style="display:none;">공개</p><p class="secretOption">비공개</p>
									</c:otherwise>
								</c:choose>
						</c:if>
						<div id="normalInfoArea">
							<table id="userInfoTable">
								<tr>
									<td>>이메일 : </td>
									<td>
										<c:choose>
											<c:when test="${ member.easy eq 'N' }">
												${ member.email }
											</c:when>
											<c:otherwise>
												(비공개)
											</c:otherwise>
										</c:choose>
									</td>
									<td>>이름 : </td>
									<td>
										<c:choose>
											<c:when test="${ member.easy eq 'N' }">
												${ member.userName }
											</c:when>
											<c:otherwise>
												(비공개)
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								<tr>
									<td>>전화번호 : </td>
									<td>
										<c:choose>
											<c:when test="${ member.easy eq 'N' }">
												${ member.phone }
											</c:when>
											<c:otherwise>
												(비공개)
											</c:otherwise>
										</c:choose>
									</td>
									<td>>은행명 : </td>
									<td>
										<c:choose>
											<c:when test="${ member.easy eq 'N' }">
												<c:if test="${ member.bank eq null }">
													내용 없음
												</c:if>
												<c:if test="${ member.bank ne null }">
													${ member.bank }
												</c:if>
											</c:when>
											<c:otherwise>
												(비공개)
											</c:otherwise>
										</c:choose>
									</td>
									
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
									<td>
										<c:choose>
											<c:when test="${ member.easy eq 'N' }">
												<c:if test="${ member.account eq null }">
													내용 없음
												</c:if>
												<c:if test="${ member.account ne null }">
													${ member.account }
												</c:if>
											</c:when>
											<c:otherwise>
												(비공개)
											</c:otherwise>
										</c:choose>
									</td>
								</tr>								
							</table>
						</div>					
					</div>
					<div class="introduceInfo">
						<h3>>자기소개</h3>
						<p>
							<c:if test="${ member.intro eq null }">
								내용 없음
							</c:if>
							<c:if test="${ member.intro ne null }">
								${ member.intro }
							</c:if>
						</p>
					</div>
				</div>
				
				<c:if test="${ member.userId eq loginUser.userId }">
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
				</c:if>
				
				<!-- 내 글 관리 -->
				<div id="mypostManagement">
					<div class="mypostText">
						내 글 관리
					</div>
					
					<div class="mypostArea">
						<div class="pointArea">
							<span style="display: inline-block;">자유 게시판</span>
							<c:url var="fbl" value="actionList.ch">
								<c:param name="searchWord" value="${ member.nickName }"/>
							</c:url>
							<a href="${ fbl }"><img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" style="display: inline-block;"/></a>
							<div class="postList">
								<c:if test="${ !empty pList}">
									<c:forEach var="p" items="${ pList }">
										<c:url var="bd" value="detail.bo">
											<c:param name="boNum" value="${ p.boNum }"/>
										</c:url>
										<div class="pList"><a href="${ bd }"> - ${ p.boTitle }</a></div>
									</c:forEach>
								</c:if>
								<c:if test="${ empty pList }">
									<div class="pList">- 작성한 게시물이 없습니다.</div>
								</c:if>
							</div>
						</div>
						<div class="cashArea">
							<span style="display: inline-block;">캐쉬 게시판</span>
							<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" style="display: inline-block;"/>
							<div class="postList">
								<c:if test="${ !empty cList}">
									<c:forEach var="cList" items="${ cList }">
										<div class="cList">- ${ cList.boTitle }</div>
									</c:forEach>
								</c:if>
								<c:if test="${ empty cList }">
									<div class="cList">- 작성한 게시물이 없습니다.</div>
								</c:if>
							</div>
						</div>
						<div style="clear:both;"></div>
						<div class="replyAreaList">
							<div id="replyText">댓글&nbsp;<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" onclick="goToMyReply();"/></div>
							<div class="replayList">
								<c:if test="${ !empty rList}">
									<c:forEach var="r" items="${ rList }">
										<c:url var="bdr" value="detail.bo">
											<c:param name="boNum" value="${ r.refNum }"/>
										</c:url>
										<div class="rList"><a href="${ bdr }">- ${ r.rpContent }</a></div>
									</c:forEach>
								</c:if>
								<c:if test="${ empty rList }">
									<div class="rList">- 작성한 댓글이 없습니다.</div>
								</c:if>
							</div>
						</div>
						<div class="scrapArea">
							<div id="ScrapText">스크랩&nbsp;<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" onclick="goToMyScrap();"/></div>
							<div class="scrapList">
								<c:if test="${ !empty scList}">
									<c:forEach var="scl" items="${ scList }">
										<c:url var="sclb" value="detail.bo">
											<c:param name="boNum" value="${ scl.boNum }"/>
										</c:url>
										<div class="sList"><a href="${ sclb }">- ${ scl.boTitle }</a></div>
									</c:forEach>
								</c:if>
								<c:if test="${ empty scList }">
									<div class="sList">- 스크랩 목록이 없습니다.</div>
								</c:if>
							</div>
						</div>
						<div style="clear: both;"></div>					
					</div>
				</div>
				
				<c:if test="${ member.userId eq loginUser.userId }">
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
									<span class="stepText stepSpan">STEP 1. 지원자 모집 중</span>
									<div class="innerArea" onclick="goToMyReqList(1);">
										<div class="innerAreaText">${ rwCount[0] } </div>건
									</div>
									<span class="stepSpan">캐쉬 게시판에 올린 글 중 지원자를 모집하고 있는 글 개수를 나타냅니다.</span>
								</div>
								<div id="arrow_icon_area">
									<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
								</div>
								<div class="working1">
									<span class="stepText stepSpan">STEP 2. 작업 진행 중</span>
									<div class="innerArea" onclick="goToMyReqList(2);">
										<div class="innerAreaText">${ rwCount[1] } </div>건
									</div>
									<span class="stepSpan">캐쉬 게시판에 올린 글 중 매칭이 되어 작업이 진행 중인 글 개수를 나타냅니다.</span>
								</div>
								<div id="arrow_icon_area">
									<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
								</div>
								<div class="complete1">
									<span class="stepText stepSpan">STEP 3. 거래 완료</span>
									<div class="innerArea" onclick="goToMyReqList(3);">
										<div class="innerAreaText">${ rwCount[2] } </div>건
									</div>
									<span class="stepSpan">캐쉬 게시판에 올린 글 중 거래가 완료 된글 개수를 나타냅니다.</span>
								</div>						
							</div>
							<div class="myWorkState">
								<div id="myWorkStateText">작업 현황</div>
								<div class="participate">
									<span class="stepText stepSpan">STEP 1. 참가 지원 중</span>
									<div class="innerArea" onclick="goToMyWorkList(1)">
										<div class="innerAreaText">${ rwCount[3] } </div>건
									</div>
									<span class="stepSpan">캐쉬 게시판에 올린 글 중 참여 신청한 글 개수를 나타냅니다.</span>
								</div>
								<div id="arrow_icon_area">
									<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
								</div>
								<div class="working2">
									<span class="stepText stepSpan">STEP 2. 작업 진행 중</span>
									<div class="innerArea" onclick="goToMyWorkList(2)">
										<div class="innerAreaText">${ rwCount[4] } </div>건
									</div>
									<span class="stepSpan">캐쉬 게시판에 올린 글 중 매칭이 되어 작업이 진행 중인 글 개수를 나타냅니다.</span>
								</div>
								<div id="arrow_icon_area">
									<img class="arrow" src="${ contextPath }/resources/images/arrow_icon3.png" width="100" height="100"/>
								</div>
								<div class="complete2">
									<span class="stepText stepSpan">STEP 3. 거래 완료</span>
									<div class="innerArea" onclick="goToMyWorkList(3)">
										<div class="innerAreaText">${ rwCount[5] } </div>건
									</div>
									<span class="stepSpan">캐쉬 게시판에 올린 글 중 작업이 끝나 거래가 완료 된 글 개수를 나타냅니다.</span>
								</div>
								<div style="clear: both;"></div>					
							</div>
						</div>
					</div>
				</c:if>

				<!-- 포트폴리오 -->
				<div id="portpolio">
					<div class="portpolioText">
						포트폴리오
						<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" onclick="goToMyPortpolioList();"/>
						<div id="smallReqBtn" class="secretReq">의뢰 요청</div>
					</div>
					<div class="portpolioArea">
						<c:if test="${ empty pcList }">
							<div style="color: red; text-align: center; text-weight: bold; margin: 50px;">※ 등록한 포트폴리오가 없습니다.</div>
						</c:if>
						<c:if test="${ !empty pcList }">
							<c:forEach var="port" items="${ pcList }">
							<div class="portArea">
								<div class="portpolioThumb" onclick="detailView(this);"><img class="portImgTag" src="${ contextPath }/${ port.pocPath }/${ port.pocModify }" width="100%" height="100%"></div>
								<div class="portDate">등록일 : ${ port.poEnrollDate }</div>
								<div class="portCount">조회수 : ${ port.poCount }</div>
								<div style="display: none;">${ port.poNum }</div>
							</div>
							
							<!-- 모달 디테일 영역 -->
							<div class="portDetailModalArea">
								<div class="portDetailModalContent">
									<div class="modalCloseBtn" onclick="closeDetail(this);"><img src="${ contextPath }/resources/images/x_icon.png" width="30" height="30"></div>
									<div style="clear: both;"></div>
									
									<div class="portpolioNameContents">
										<div class="portpolioName" style="text-indent: 20px;">
											${ port.poTitle }
										</div>
										<div class="portpolioContents">
											<img style="width: 100%;" src="${ contextPath }/${ port.pocPath }/${ port.pocModify }">
										</div>
										
										<c:if test="${ port.poCategory eq '이미지 제작' or port.poCategory eq '이미지 편집' }">
											<c:forEach var="attach" items="${ port.portContents }">
												<div class="portpolioContents">
													<img style="width: 100%;" name="portImage" src="${ contextPath }/${ attach.pocPath }/${ attach.pocModify }">
												</div>										
											</c:forEach>											
										</c:if>
										
										<c:if test="${ port.poCategory eq '동영상 제작' or port.poCategory eq '동영상 편집' }">
											<c:forEach var="attach" items="${ port.portContents }">
												<div class="portpolioContents">
													<video class="portVideo" src="${ contextPath }/${ attach.pocPath }/${ attach.pocModify }" controls width="100%" height="100%"></video>
												</div>										
											</c:forEach>											
										</c:if>
										
									</div>
									<div class="portpolioDesc">
										<div class="userId">${ port.poWriter }</div>
										<div class="portClass">${ port.poCategory }</div>
										<c:if test="${ port.poUseYn eq 'Y' }">
											<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인입니다.</div>
										</c:if>
										<c:if test="${ port.poUseYn ne 'Y' }">
											<div class="usingSite" style="font-size: 10pt; line-height: 30px;">※ 본 사이트에서 의뢰를 받아<br>&nbsp;&nbsp;&nbsp;작업한 디자인은 아닙니다.</div>
										</c:if>
										<div class="portDescription">
											<span style="font-weight: bold;">디자인 설명</span><br>
											<span>${ port.poDesc }<!-- 인테리어 디자인 및 용품 판매 업체인 "끄끄흐"만의 재미있고 독창성을 보여주며, 이용하는 고객들이 직관적으로 이해할 수 있는 텍스트형 로고로 제작하였습니다. 색상변경 가능합니다. 감사합니다:) --></span>
										</div>						
									</div>
									<div class="BtnArea">
										<form action="deletePort.my" name="deletePortForm" method="post">
											<input type="hidden" name="poNum" value="${ port.poNum }">
											<input type="hidden" name="poWriter" value="${ port.poStatus }">
										</form>
										<div class="updateBtn">수정</div>
										<div class="deleteBtn">삭제</div>
									</div>					
									<div style="clear: both;"></div>
									<div class="replyArea">
										<div class="replayText">댓글(<span style="color: rgb(52, 152, 219)" class="replyCount">${ port.poFee }</span>건)</div>
										<div class="replyBoard">
											<c:forEach var="ppr" items="${ port.portReply }">
													<div class="repWriterImg">
														<img src="${ contextPath }/${ ppr.conUrl }/${ ppr.conCop }" width="100%" height="100%">
													</div>
													<div class="repIdDateCon">
														<div class="idDate">
															<span class="smallOption">${ ppr.porWriter }</span>
															<span>20${ ppr.porEnrollDate }</span>
														</div>
														<div class="repContents">
															${ ppr.porContent } 
														</div>
													</div>
													<div style="clear: both;"></div>
											</c:forEach>
											
										</div>
										
										<div class="repEnrollArea">
											<form name="repEnrollForm" method="post" action="enrollPoReply.my" class="repEnrollForm">
												<input type="hidden" name="porRef" value="${ port.poNum }">
												<input type="hidden" name="porWriter" value="${ loginUser.userId }">
												<textarea class="porContent" name="porContent" rows="5" cols="97" style="resize: none; margin: 1%;"></textarea><br>
												<div class="repEnrollBtn" style="float: right;">등록</div>
												<div style="clear: both;"></div>								
											</form>
										</div>
									</div>
								</div>
				
								<div class="portScroll" style="position:absolute; top: 1100px; left: 1200px;"> 
									<img class="backToTop" onclick="backToTop(this);" src="${ contextPath }/resources/images/btn_backtotop.png" width="15%" height="15%">								
								</div>
							</div>							
							
							</c:forEach>
						</c:if>
						<div style="clear: both;"></div>
					
					<!-- 페이징 처리 -->
					
					<div class="pagingCenter">
						<div class="pagination">
					<!-- 페이지 -->	
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<a href='javascript:void(0);' onclick="pageMove(this,${ p });"> ${ p } </a>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<a href='javascript:void(0);' onclick="pageMove(this,${ p });"> ${ p } </a> &nbsp;
						</c:if>
					</c:forEach>	
					
						
						</div>
					</div>
						<c:if test="${ member.userId eq loginUser.userId }"><div id="portpolioEnrollBtn" onclick="location.href='portEnrollView.my'">등록하기</div></c:if>
						<div style="clear: both;"></div>						
					</div>
				</div>
				
				<c:if test="${ member.userId eq loginUser.userId }">
					<!-- 캐쉬 변동 내역 -->
					<div id="cashChange">
						<div class="cashChangeText">
							Cash 변동내역
							<img class="plusIcon" width="40" height="40" src="${ contextPath }/resources/images/plus_icon3.png" onclick="goToMyCashChangeList();"/>
						</div>
						<div class="cashChangeArea">
							<div class="dateArea">
								<div class="monthArea">${ nowDay }</div>
								<c:if test="${ !empty ccList}">
										<c:forEach var="cc" items="${ ccList }">
											<c:if test="${ cc.pcContent eq '캐쉬 충전' }">
												<div class="changeList">
												<div class="changeClass3">&nbsp;&nbsp;&nbsp;&nbsp;캐쉬 충전</div>
												<div class="chageDesc">
													20${ cc.pcDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<fmt:formatNumber value="${ cc.pcAmount }"/>충전
												</div>
											</div>
											</c:if>
											<c:if test="${ cc.pcContent eq '의뢰 비용' }">
												<div class="changeList">
												<div class="changeClass1">&nbsp;&nbsp;&nbsp;&nbsp;의뢰 비용</div>
												<div class="chageDesc">
													20${ cc.pcDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<fmt:formatNumber value="${ cc.pcAmount }"/>지출
												</div>
											</div>
											</c:if>
											<c:if test="${ cc.pcContent eq '의뢰 수주' }">
												<div class="changeList">
												<div class="changeClass2">&nbsp;&nbsp;&nbsp;&nbsp;의뢰 수주</div>
												<div class="chageDesc">
													20${ cc.pcDate }&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<fmt:formatNumber value="${ cc.pcAmount }"/>입금
												</div>
											</div>
											</c:if>
										</c:forEach>
									</c:if>
									<c:if test="${ empty ccList }">
										<div class="ccList" style="text-align: center; color: red;">※ 캐쉬 변동 내역이 없습니다.</div>
									</c:if>
							</div>
						</div>
					</div>
				</c:if>

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
									<form action="uMember.my" name="basicInfoForm" id="basicInfoForm" method="post">
										<div class="basicInfo">
											<div id="basicInfoText">기본 정보</div>
											<div style="color: red; font-size: 12pt; margin-left: 100px;">※ 아래 입력란은 필수 기입 사항입니다.</div>
											<input type="hidden" name="userId" value="${ loginUser.userId }">
											<table>
												<tr>
													<td style="width: 25%; height: 50px;">이름</td>
													<td style="width: 35%; height: 50px;"><input type="text" name="userName" id="userName" class="userName" value="${ loginUser.userName }"></td>
													<td style="width: 40%;"></td>
												</tr>
												<tr>
													<td style="height: 50px;">비밀번호</td>
													<td style="height: 50px;"><input type="password" name="userPwd" id="userPwd" class="userPwd" id="userPwd"></td>
													<td style="font-size: 12pt;"><label id="pwd1Result"></label></td>
												</tr>
												<tr>
													<td style="height: 50px;">비밀번호 재확인</td>
													<td style="height: 50px;"><input type="password" name="userPwd2" id="userPwd2" class="userPwd2" id="userPwd2"></td>
													<td style="font-size: 12pt;"><label id="pwd2Result"></label></td>
												</tr>
												<tr>
													<td style="height: 50px;">닉네임</td>
													<td colspan="2" style="height: 50px;"><input type="text" name="nickName" id="nickName" class="nickName" value="${ loginUser.nickName }"></td>
													<td><input type="hidden" name="nickFlag" id="nickFlag"></td>
												</tr>
												<tr>
													<td></td>
													<td><div class="nickBtn">중복 확인</div></td>
													<td style="font-size: 12pt;"><label id="nickResult"></label></td>
												</tr>
												<tr>
													<td style="height: 50px;">연락처</td>
													<td colspan="2" style="height: 50px;"><input type="text" name="phone" id="phone" class="phone" value="${ loginUser.phone }"></td>
												</tr>
												<tr>
													<td style="height: 50px;">이메일</td>
													<td colspan="2" style="height: 50px;"><input type="email" name="email" id="email" class="email" value="${ loginUser.email }"></td>
												</tr>
												<tr>
													<td style="height: 50px;">자기소개</td>
													<td colspan="2" style="height: 50px;"><textarea name="intro" id="intro" class="intro" rows="8" cols="60">${ loginUser.intro }</textarea></td>
												</tr>																																																
											</table>
										
										
										</div>
										<div class="addInfo">
											<div id="addInfoText">추가 정보</div>
											<div style="color: red; font-size: 12pt; margin-left: 100px;">※ 아래 입력란은 선택 사항입니다.</div>
												<table>
													<tr>
														<td style="width: 300px; height: 50px;">은행명</td>
														<td style="height: 50px;"><input type="text" name="bank" id="bank" class="bank" value="${ loginUser.bank }"></td>
													</tr>
													<tr>
														<td style="height: 50px;">계좌번호</td>
														<td style="height: 50px;"><input type="text" name="account" id="account" class="account" value="${ loginUser.account }"></td>
													</tr>													
												</table>
										</div>
									</form>									
								</div>
							</div>
						</div>
					</div>
					<hr>
					<div id="editCompleteBtn">완료</div>
					<div id="editCancelBtn" onclick="closeModal();">취소</div>
					<div style="clear: both;"></div>
				</div>
			</div>
			
<%-- 			<!-- 포트폴리오 디테일 모달창 -->
			<div id="portDetailModal" class="portDetailModalArea">
				<div class="portDetailModalContent">
					<div id="modalCloseBtn" onclick="closeDetail();"><img src="${ contextPath }/resources/images/x_icon.png" width="30" height="30"></div>
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
					<div class="replyArea">
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
								<input id="repEnrollBtn" type="submit" style="float: right;" value="등록">								
							</form>
						</div>
					</div>
				</div>
				
				<div id="portScroll" style="position:absolute; top: 1100px; left: 1200px;"> 
					<a href="#modalCloseBtn"><img id="backToTop" src="${ contextPath }/resources/images/btn_backtotop.png" width="15%" height="15%"></a>									
				</div>
			</div> --%>			
							
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
		
		//썸네일 클릭시 해당 포트폴리오 모달창 열기
		function detailView(e){
			console.log(e);
			console.log($(e).parent().next()[0]);
			$(e).parent().next().show();
			
			// 포트폴리오 조회수 업데이트 기능
			var poNum = $(e).nextAll().eq(2).text();
			console.log("poNum : " + poNum);
			
			$.ajax({
				type	: "POST",
				url	    : 'uPortCount.my',
				data	: {'poNum':poNum},
				dataType: 'JSON',
				success : function(data) {
					console.log("ajax 조회수 업데이트 성공!");
				},
				error : function(e) {
					console.log("안되네...");
				}
			});			
			
			//스크롤이 움직일때마다 이벤트 발생
			$(e).parent().next().scroll(function(){  
	      			var position = $(e).parent().next().scrollTop(); // 현재 스크롤바의 위치값을 반환
	      			$(e).parent().next().children().last().stop().animate({top:800+position+"px"}, 200); //해당 오브젝트 위치값 재설정
			});
		};
		
		// top이미지 클릭시 상단으로 이동
		function backToTop(b){
			$(b).parent().parent().animate({
				scrollTop: 250
			}, 100);
		
		};
		
		/* $('.portpolioThumb').click(function(){
			$('#portDetailModal').show();
		}); */
		
		function closeDetail(c){
			$(c).parent().parent().hide();
		}	
				
	</script>
	
	<script>
		var userId = '${ member.userId }';
		
		function goToMyReply(){
			location.href="myReplyList.my?userId=" + userId;
		}
		
		function goToMyScrap(){
			location.href="scrapList.my?userId=" + userId;
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
		
		function goToMyPortpolioList(){
			var poWriter = userId;
			location.href="portpolioList.my?poWriter=" + poWriter;
		}
		
	</script>
	<script>
		// 내용 작성 부분의 공간을 클릭할 때 파일 첨부 창이 뜨도록 설정하는 함수
		$('#profileImage').on('click', function(){
			var mypageHost = '${ member.userId }';
			var mypageVisitor = '${ loginUser.userId }';
			console.log(mypageHost);
			console.log(mypageVisitor);
			if(mypageHost==mypageVisitor){
				$('#profileImg').click();
			}
		});
		
		// 파일을 첨부 했을 경우 미리 보기가 가능하도록 하는 함수
		function LoadImg(value){
			if(value.files && value.files[0]){
				var reader = new FileReader();
				
				reader.onload = function(e){								
					$("#profile").attr("src", e.target.result);
				}
				
				reader.readAsDataURL(value.files[0]);
			}
			
			// 파일 업로드
			swal({
                title: "프로필 사진을 등록하시겠습니까?",
                icon: "info",
                buttons : {
                   cancle : {
                      text : '취소',
                      value : false
                   },
                   confirm : {
                      text : '등록',
                      value : true
                   }
                }
             }).then((result) => {
                if(result) {
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
        					swal({
        					    title: "프로필 사진",
        					    text: "등록 성공!",
        					    icon: "info" //"info,success,warning,error" 중 택1
        					});
        				}, 
        				error: function(e){ 
        					swal({
        					    title: "프로필 사진",
        					    text: "등록 실패!",
        					    icon: "error" //"info,success,warning,error" 중 택1
        					});
        				} 
        			});
                } else {
                	swal({
					    title: "프로필 사진",
					    text: "등록 실패!",
					    icon: "error" //"info,success,warning,error" 중 택1
					});
                }
             });
		}
		
		// x버튼 클릭시 새로고침
		function closeDetail(c){
			location.reload();
		};
		
		
		// 포트폴리오 리스트 페이징 ajax로 구현
		function pageMove(active, page){
			var userId = '${ member.userId }';
			
			console.log("page : " + page);
			console.log("userId : " + userId);
			
			$.ajax({
				type	: "POST",
				url	    : 'mainPortPaging.my',
				data	: {'page':page, 'userId': userId},
				dataType: 'JSON',
				success : function(data) {
					console.log("페이지 이동 성공!");
					
					$('.portArea').remove();
					
					var portpolioArea = $('.portpolioArea');
					
					for(var i = data.pcList.length - 1; i >= 0; i--) {
						/* console.log("data[i].pocModify : " + data.pcList[i].pocModify);
						var test = $('.portImgTag').eq(i);
						console.log(test);
						var contextPath = "<c:out value='${ contextPath }' />";
						console.log(contextPath);
						var src = contextPath + '/' + data.pcList[i].pocPath + '/' + data.pcList[i].pocModify;
						console.log(src);
						test.attr("src", src); */
						console.log(i);
						var $portArea = $('<div class="portArea" style="width: 18%;	height: 180px; border: 1px solid gray; float: left;	margin: 2%;	margin-left: 2.5%;	padding: 10px;">');
						var $portpolioThumb = $('<div class="portpolioThumb" onclick="detailView(this);" style="width: 100%; height: 150px; border: 1px solid lightgrey; float: left; display: line-block;">');
						var $portImgTag = $('<img class="portImgTag" src="${ contextPath }/' + data.pcList[i].pocPath + '/' + data.pcList[i].pocModify + '" width="100%" height="100%">');
						var $portDate = $('<div class="portDate" style="margin-top: 10px; float: left; font-size: 9pt;">등록일 : ' + data.pcList[i].poEnrollDate + '</div>');
						var $portCount = $('<div class="portCount" style="margin-top: 10px; float: right; font-size: 9pt;">조회수 : ' + data.pcList[i].poCount + '</div>');
						var $poNum = $('<div style="display: none;">' + data.pcList[i].poNum + '</div>');
						
						$portpolioThumb.append($portImgTag);
						
						$portArea.append($portpolioThumb);
						$portArea.append($portDate);
						$portArea.append($portCount);
						$portArea.append($poNum);
						
						portpolioArea.prepend($portArea);
					
					}
				},
				error : function(e) {
					console.log("안되네...");
				}
			});
		};
		
		// 댓글 입력 기능
		$('.repEnrollBtn').on('click', function(){
			var porContent = $(this).prevAll().eq(1).val();
			var porWriter = $(this).prevAll().eq(2).val();
			var porRef = $(this).prevAll().eq(3).val();
			
			$.ajax({
				type	: "POST",
				url	    : 'enrollPoReply.my',
				data	: {'porRef':porRef, 'porWriter': porWriter, 'porContent': porContent},
				dataType: 'JSON',
				success : function(data) {
					console.log("ajax댓글입력 성공!");
					$('.replyCount').text(data.length);
					var replyBoard = $('.replyBoard')
					
					replyBoard.children().remove();
					
					for(var i = 0; i < data.length; i++) {
						var $repWriterImg = $('<div class="repWriterImg" style="width: 6%; border: 1px solid black; height: 65px; border-radius: 50px; float: left; overflow: hidden; margin: 10px;">');
						var $writerImgTag = $('<img src="${ contextPath }/' + data[i].conUrl + "/" + data[i].conCop + '" width="100%" height="100%">');
						var $repIdDateCon = $('<div class="repIdDateCon" style="float: left;">');
						var $idDate = $('<div class="idDate" style="margin: 10px;">');
						var $spanId = $('<span style="margin-right: 6px;">'+ data[i].porWriter + '</span>&nbsp;');
						var $spanDate = $('<span>20' +  data[i].porEnrollDate + '</span>');
						var $repContents = $('<div style="margin: 10px;">' + data[i].porContent + '</div>');
						var $clear = $('<div style="clear: both;">');
						
						$idDate.append($spanId);
						$idDate.append($spanDate);
						
						$repIdDateCon.append($idDate);
						$repIdDateCon.append($repContents);
						
						$repWriterImg.append($writerImgTag);
						
						replyBoard.append($repWriterImg);
						replyBoard.append($repIdDateCon);
						replyBoard.append($clear);
						
						
					}
					
					$('.porContent').val("");
				},
				error : function(e) {
					console.log("안되네...");
				}
			});
			
		});		
		
		// 포트폴리오 삭제 기능
		$('.deleteBtn').on('click', function(){
			swal({
                title: "포트폴리오를 삭제 하시겠습니까?",
                icon: "info",
                buttons : {
                   cancle : {
                      text : '취소',
                      value : false
                   },
                   confirm : {
                      text : '삭제',
                      value : true
                   }
                }
             }).then((result) => {
                if(result) {
                	$(this).prevAll().eq(1).submit();
                } else {
                	swal({
    				    title: "포트폴리오",
    				    text: "포트폴리오 삭제에 실패하였습니다.",
    				    icon: "error" //"info,success,warning,error" 중 택1
    				});
                }
             });
		});
		
		// 포트폴리오 수정 기능 연결
		$('.updateBtn').on('click', function(){
			console.log($(this).prev());
			$(this).prev().attr('action', 'uPortView.my');
			$(this).prev().submit();
		});
		
		$('#userPwd').blur(function(){
			var regExp3 = /^[a-zA-Z](?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!*&]).{7,11}$/;

			if(!regExp3.test($(this).val())){
				$('#pwd1Result').html("알맞은 비밀번호를 입력하세요").css('color', 'red');
				$(this).focus().css('background', 'red');
			} else{
				$('#pwd1Result').html("정상입력").css({'color':'green'},{'text-align':'center'});
				$(this).css('background', 'white');
			}
		});

		$('#userPwd2').keyup(function(){
			if($('#userPwd').val() == $(this).val()){
				$('#pwd2Result').html("정상입력").css({'color':'green'},{'text-align':'center'});
				$(this).css('background', 'white');
			} else{
				$('#pwd2Result').html("비밀번호가 일치하지 않습니다.").css('color', 'red');
				$(this).focus().css('background', 'red');
			}
		});
		
		$('.nickBtn').on('click', function(){
			var nickName = $('.nickName').val();
			console.log(nickName);
			$.ajax({
				type	: "POST",
				url	    : 'nickCheck.my',
				data	: {'nickName':nickName},
				dataType: 'JSON',
				success : function(data) {
					console.log("닉체크 성공!")
					console.log(data);
					if(data){
						$('#nickResult').text("이미 닉네임이 존재합니다.").css('color','red');
						$('#nickName').focus();
						$('#nickFlag').val("true");
					} else{
						$('#nickResult').text("사용 가능한 닉네임입니다.").css('color','green');
						$('#nickFlag').val("false");
					}
					
					
				}
			});
		});

		
		$('#editCompleteBtn').click(function(){
			
			if($('#userName').val() == "") {
				swal({
				    title: "프로필",
				    text: "이름을 입력해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else if($('#userPwd').val() == "") {
				swal({
				    title: "프로필",
				    text: "비밀번호를 입력해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else if($('#nickName').val() == "") {
				swal({
				    title: "프로필",
				    text: "닉네임을 입력해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else if($('#nickFlag').val() == "") {
				swal({
				    title: "프로필",
				    text: "닉네임 중복체크를 해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else if($('#nickFlag').val() != "false") {
				swal({
				    title: "프로필",
				    text: "다른 닉네임을 입력해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else if($('#phone').val() == "") {
				swal({
				    title: "프로필",
				    text: "전화번호를 입력해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else if($('#email').val() == "") {
				swal({
				    title: "프로필",
				    text: "이메일를 입력해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else if($('#intro').val() == "") {
				swal({
				    title: "프로필",
				    text: "자기소개를 입력해주세요.",
				    icon: "warning" //"info,success,warning,error" 중 택1
				});
			} else {
				
				swal({
                    title: "프로필 정보 수정을 마치시겠습니까?",
                    icon: "info",
                    buttons : {
                       cancle : {
                          text : '취소',
                          value : false
                       },
                       confirm : {
                          text : '완료',
                          value : true
                       }
                    }
                 }).then((result) => {
                    if(result) {
        				$('#basicInfoForm').submit();
                    } else {
                    	swal({
        				    title: "프로필",
        				    text: "프로필 정보 수정에 실패하였습니다.",
        				    icon: "error" //"info,success,warning,error" 중 택1
        				});
                    }
                 });
					
			};
		});	
		
		$('#reqGifBtn').on('click',function(){
			swal({
                title: "에디터가 요청 거절 시 공개요청으로 전환됩니다.",
                icon: "info",
                buttons : {
                   cancle : {
                      text : '취소',
                      value : false
                   },
                   confirm : {
                      text : '요청',
                      value : true
                   }
                }
             }).then((result) => {
                if(result) {
    				var editorId = "<c:out value = '${ member.userId }' />";
                	location.href = "writeView.ch?boardType=7&reqId=" + editorId;
                } else {
                	swal({
    				    title: "비공개 의뢰",
    				    text: "비공개 의뢰 요청을 취소하셨습니다.",
    				    icon: "error" //"info,success,warning,error" 중 택1
    				});
                }
             });
		});
		
		$('.secretReq').on('click',function(){
			swal({
                title: "에디터가 요청 거절 시 공개요청으로 전환됩니다.",
                icon: "info",
                buttons : {
                   cancle : {
                      text : '취소',
                      value : false
                   },
                   confirm : {
                      text : '요청',
                      value : true
                   }
                }
             }).then((result) => {
                if(result) {
    				var editorId = "<c:out value = '${ member.userId }' />";
                	location.href = "writeView.ch?boardType=7&reqId=" + editorId;
                } else {
                	swal({
    				    title: "비공개 의뢰",
    				    text: "비공개 의뢰 요청을 취소하셨습니다.",
    				    icon: "error" //"info,success,warning,error" 중 택1
    				});
                }
             });
		});
		
		var check = $("input[type='checkbox']");
		check.click(function(){
			$('.secretOption').toggle();
			
			$.ajax({
				type	: "POST",
				url	    : 'secretToggle.my',
				data	: {'userId':userId},
				success : function(data) {
					console.log("마이페이지 비공개 여부 토글 성공!")
				}
			});
		});
	</script>
	<jsp:include page="mypageSideMenubar.jsp"/>
</body>
</html>