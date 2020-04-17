<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	#slideBar {
		margin-top: 70px;
		width: 100%;
		height: 200px;
		
		border: 1px solid black;
	}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="WEB-INF/views/common/mainHeader.jsp"/>
	<section>
		<div id="left-side" style="background-color: yellow;">
		</div>
			<div id="main">
			<button onclick="goToBoardList();">자유게시판&1:1</button>
			
			
			<button onclick="javascript:location.href='writeView.ch?boardType=2';">1:1 글쓰기</button>
			<button onclick="javascript:location.href='writeView.ch?boardType=3';">경매 글쓰기</button>
			<button onclick="javascript:location.href='writeView.ch?boardType=4';">콘테스트 글쓰기</button>
			<button onclick="javascript:location.href='stage1.ch';">stage1</button>
			<button onclick="javascript:location.href='stage2.ch';">stage2</button>
			<button onclick="javascript:location.href='stage3.ch';">stage3</button>
			
			
			<button onclick="javascript:location.href='list.bo';">boardlist</button>
			<button onclick="javascript:location.href='detail.bo';">boardDetail</button>
			<button onclick="javascript:location.href='writing.bo';">boardwriting</button>
			<button onclick="javascript:location.href='revis.bo';">boardrevis</button>
			<button onclick="javascript:location.href='ban.au';">authorBan</button>
			<button onclick="javascript:location.href='trade.au';">authorTrade</button>
			<button onclick="javascript:location.href='unban.au';">authorUnban</button>
			
		</div>
        <div id="right-side" style="background: blue">
            
		</div>
	</section>
	<jsp:include page="WEB-INF/views/common/footer.jsp"/>
	
	<script>
		
		function goToBoardList(){
			/* var boGroup1 = 1;
			var boGroup2 = 2;
			var boGroup3 = 3;
			var boGroup4 = 4; */
			location.href="actionList.ch";
			
		}
	
	</script>
</body>
</html>