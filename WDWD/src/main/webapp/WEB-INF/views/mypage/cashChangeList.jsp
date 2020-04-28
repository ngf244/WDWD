<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.cashChangeList{
		border: 1px solid lightgray;
		height: 940px;
		width: 80%;
		margin: auto;
	}

	.cashChangeListTopArea{height: 60px; background: #3DB7CC; color: white; font-size: 18pt; box-shadow: 2px 2px 5px black;}
	
	#cashChangeListText{font-weight: bolder; margin-top: 12px; padding-left: 40px; padding-right: 30px; display:inline-block;}

	#cashChangeListContent{
		height: 810px;
		margin-top: 30px;
	}
	
	/* 현재 캐쉬 현황 */
	#nowCash{
		margin: 30px;
		margin-left: 340px;
		margin-top: 40px;
		border: 1px solid black;
		width: 35%;
		height: 120px;
		box-shadow: 2px 2px 5px black;
		border-radius: 5px;
	}
	
	#nowCashText{
		font-size: 30pt;
		display: inline-block;
		margin: 35px;
		font-weight: bold;
	}

	#nowCashAmount{
		font-size: 30pt;
		display: inline-block;
		float: right;
		margin: 35px;
		margin-right: 50px;
		color: rgb(231, 76, 60);
		font-weight: bold;
	}	
	
	/* 캐쉬 변동 내역 게시판 */
	.cashChangeBoard{
		/* height: 850px;
		border: 1px solid black;
		margin: 30px;
		margin-top: 30px; */
		min-height:50px; padding-bottom: 50px;
		margin-left:auto; margin:auto; margin-top:50px;			
	}
	
/* 	.cashChangeListPaging{
		width: 500px;
		height: 120px;
		border: 1px solid black;
		margin: 20px;
	} */
	
	/* 게시판 테이블 css */
	#boardTable{text-align:center; margin: auto; width: 80%;}
	#boardTable th{border-bottom: 3px solid lightgray; background: #ececec; height: 50px; font-size: 13pt; border-bottom: 3px solid #036;}
	#boardTable td{border-bottom: 1px solid lightgray; height: 40px; font-size: 11pt;}	
	#boardTable tr:hover{
		background: rgba(161, 206, 244, 0.55);
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
<title>Cash 내역</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
			
		</div>
		<div id="main">
			<div class="cashChangeList">
				<div class="cashChangeListTopArea">
					<div id="cashChangeListText">Cash 변동내역</div>	
				</div>
				<div id="cashChangeListContent">
					<div id="nowCash">
						<div id="nowCashText">Cash</div>
						<div id="nowCashAmount">5,000</div>
					</div>
					<div class="cashChangeBoard">
						<table id="boardTable">
							<tr>
								<th style="width: 40%;">변동 유형</th>
								<th style="width: 25%">금액</th>
								<th style="width: 30%">날짜</th>
							</tr>
	
							<c:forEach var="pc" items="${ pcList }">
							<c:if test="${ pc.pcDiv == 'C' }">
							<tr>
								<td>${ pc.pcContent }</td>
								<td><span class="amount">${ pc.pcAmount }</span></td>
								<td>${ pc.pcDate }</td>							
							</tr>
							</c:if>									
							</c:forEach>							
							
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
							<c:url var="before" value="cashChange.my">
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
							<c:url var="pagination" value="cashChange.my">
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
						<c:url var="after" value="cashChange.my">
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
</body>
</html>