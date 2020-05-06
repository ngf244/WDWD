<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	footer{
		width: 100%;
		height: 50px;
		background-color: rgb(52, 152, 219);
		bottom: 0px;
	}
</style>
</head>
<body>
    <footer>
		<div>
            footer 채울 영역

        </div>
	</footer>
	<script>
		function adchoice() {
			var ranNum = 1+Math.floor(Math.random()*6);

			ads = new Array();

			ads[1] = '<a href="#"><img src="${ contextPath }/resources/images/ad/1.png"></a>';
			ads[2] = '<a href="#"><img src="${ contextPath }/resources/images/ad/2.png"></a>';
			ads[3] = '<a href="#"><img src="${ contextPath }/resources/images/ad/3.png"></a>';
			ads[4] = '<a href="#"><img src="${ contextPath }/resources/images/ad/4.png"></a>';
			ads[5] = '<a href="#"><img src="${ contextPath }/resources/images/ad/5.png"></a>';
			ads[6] = '<a href="#"><img src="${ contextPath }/resources/images/ad/6.png"></a>';

			var choiceAd = ads[ranNum];
			return choiceAd;
		}

		$(function () {
			var choiceAd = adchoice();
			$('#right-side').append(choiceAd);
			
			$('#right-side img').css({'width':'80%', 'height':'100%'});
		})

		$('html').click(function(e) {
			if(e.target.className == "smallOption"){
			// if($('.smallOption').is(":hover")) {
			// if($('smallOption:hover')) {
				var id = e.target.innerHTML;
				var pointerX = e.clientX;
				var pointerY = e.clientY;
				
				$('#smallOptionBlock').css({
					"top" : pointerY+10,
					"left" : pointerX,
					"display" : "block"
				})

				$('#smallOptionBlock input').val(id);
			} else {
				$('#smallOptionBlock').css({
					"display" : "none"
				})
			}
		})


		$('#smallOptionBlock div').click(function () {
			if($(this).text()=="마이페이지"){
				// console.log($(this).text());
				location.href = "#";
			} else if($(this).text()=="게시글 보기"){
				// console.log($(this).text());
				location.href = "#";
			} else if($(this).text()=="작성 댓글 보기"){
				// console.log($(this).text());
				location.href = "#";
			} else if($(this).text()=="제재"){
				// console.log($(this).text());
				// location.href = "#";
			}

		})

		$(function () {
			var slideImg = $('.slide img');
			for(var i in slideImg){
				slideImg[i].src = "${ contextPath }/resources/images/ad/li"+i+".PNG";
			}
		})

		function reportForm(boardNo, reported, cate) {
			$('input[name=boNum]').val(boardNo);
			$('input[name=deCate]').val(cate);
			$('input[name=deReportedNick]').val(reported);
			$('input[name=deReporterId]').val('${loginUser.userId}');
			$('input[name=deReporterNick]').val('${loginUser.nickName}');
			$('#reportForm').css('display','block');
		}

		function insertPoint(point, Content) {
			var userId = '${loginUser.userId}';
			if(userId == ""){
				return false;
			}
			$.ajax({
				url : "insertCP.my",
				data : {pcContent : content, pcAmount : point, pcDiv : 'P', pcId : userId},
				type : "POST",
				success : function (data) {
					if(data == 1){
						console.log("point 변동 : ", point)
					} else {
						console.log("ajax insertPoint 실패");
					}
				}
			})
		}

		function insertCash(cash, Content) {
			var userId = '${loginUser.userId}';
			if(userId == ""){
				return false;
			}
			$.ajax({
				url : "insertCP.my",
				data : {pcContent : Content, pcAmount : cash, pcDiv : 'C', pcId : userId},
				type : "POST",
				success : function (data) {
					if(data == 1){
						console.log("cash 변동 : ", cash);
					} else {
						console.log("ajax insertPoint 실패");
					}
				}
			})
		}
	</script>
</body>