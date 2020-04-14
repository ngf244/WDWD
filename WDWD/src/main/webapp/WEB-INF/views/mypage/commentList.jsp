<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.commentList{
		height: 990px;
		width: 80%;
		border: 1px solid lightgray;
		margin: auto;
	}

	.commentListTopArea{height: 60px; background: #4374D9; color: white; font-size: 18pt; box-shadow: 2px 2px 5px black;}
	
	#commentListText{font-weight: bolder; padding-left: 40px; margin-top: 12px; padding-right: 30px; display:inline-block;}

	.commentListCount{
		width: 88%;
		text-align: right;
	}

	.commentListCount>b{
		color: #050099;
		font-size: 15pt;
	}


	#commentListContent{
		height: 900px;
		margin-top: 30px;
	}
	
	.cashBoardText{
		margin-left: 480px;
		margin-top: 30px;
		width: 30%;
		height: 80px;
	}
	
	.commentBoard{
/* 		height: 850px;
		border: 1px solid black;
		margin: 30px;
		margin-top: 30px; */
		min-height:50px; padding-bottom: 50px;
		margin-left:auto; margin:auto; margin-top:10px;		 
	}
	
	/* 전체 댓글 게시판 테이블 */
	#boardTable{text-align:center; margin: auto;}
	#boardTable th{border-bottom: 3px solid lightgray; background: #ececec; height: 50px; font-size: 13pt; border-bottom: 3px solid #036;}
	#boardTable td{border-bottom: 1px solid lightgray; height: 40px; font-size: 11pt;}	
	#boardTable tr:hover{background: rgba(161, 206, 244, 0.55);}
	
	.orgBtn{
		width: 120px;
		height: 30px;
		text-align: center;
		background-color: rgb(39, 174, 96);
		color: white;
		border-radius: 5px;
		cursor: pointer;		
	}
	
	/* 페이징 처리 css */
	.pagingCenter{
		text-align: center;
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
</style>
<title>전체 댓글</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
			
		</div>
		<div id="main">
			<div class="commentList">
				<div class="commentListTopArea">
					<div id="commentListText">전체 댓글 보기</div>	
				</div>
				<div id="commentListContent">
					<div class="commentListCount">
						작성 댓글 수 : <b>${ pi.listCount }</b>
					</div>
					<div class="commentBoard">
						<table id="boardTable">
							<thead>
								<tr>
									<th style="width: 60%;">댓글</th>
									<th style="width: 15%">원문보기</th>
									<th style="width: 20%">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="r" items="${ rList }">
								<tr>
									<td>${ r.rpContent }</td>
									<td><button class="orgBtn" onclick="goToOrgBoard(${ r.refNum });">원문보기</button></td>
									<td>${ r.rpDate }</td>							
								</tr>									
								</c:forEach>
							</tbody>
						</table>
					</div>
					
					<!-- 페이징 처리 -->
					
					<!-- [이전] -->
					<div class="pagingCenter">
						<div class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<a href=""> &laquo; </a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="myReplyList.my">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="userId" value="${ userId }"/>
							</c:url>
						<a href="${ before }"> &laquo; </a>
						</c:if>
					
					<!-- 페이지 -->	
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<a href="" class="active"> ${ p } </a>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="myReplyList.my">
								<c:param name="page" value="${ p }"/>
								<c:param name="userId" value="${ userId }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>	
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<a href=""> &raquo; </a>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="myReplyList.my">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
							<c:param name="userId" value="${ userId }"/>
						</c:url> 
						<a href="${ after }"> &raquo; </a>
					</c:if>		
						
						</div>
					</div>
					
				</div>
			</div>
		</div>
		<div id="right-side">
				
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
	<script>
		function goToOrgBoard(refNum){
			var refNum = refNum;
			console.log(refNum);
		}
	</script>
</body>
</html>