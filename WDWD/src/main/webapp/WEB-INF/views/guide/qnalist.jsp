<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAlist</title>
</head>
<style>
  

</style>
<body>

	<h1 align="center">QnA 리스트</h1>


	<table id="tb" align="center">
		<tr style="background: skyblue">
			<th width="100">No.</th>
			<th width="500">제목</th>
			<th width="100">작성자</th>
			<th width="100">날짜</th>
			<th width="100">조회수</th>
		</tr>
		<c:forEach var="b" items="${ list }">
		<tr class="contentTR">
			<td align="center">${ b.bno }</td>

			<td align="left">
				<c:if test="${ !empty loginUser }">
					<c:url var="bdetail" value="bdetail.bo">
						<c:param name="bId" value="${ b.boNum }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ gdetail }">${ g.bTitle }</a>
				</c:if>
				<c:if test="${ empty loginUser }">
					${ q.bTitle }		
				</c:if>
			</td>

			<td align="center">${ b.boWriter }</td>
			<td align="center">${ b.bCreateDate }</td>
			<td align="center">${ b.bView }</td>
		</tr>
		</c:forEach>

		<tr>
			<td colspan="6" align="right" id="buttonTab">
				<c:if test="${ !empty loginUser }">
					&nbsp; &nbsp; &nbsp;
					<button onclick="location.href='ginsertView.bo';">글쓰기</button>
				</c:if>
			</td>
		</tr>

		<!-- 페이징 처리 -->
		<tr align="center" height="20" id="buttonTab">
			<td colspan="6">

				<!-- [이전] -->
				<c:if test="${ pi.currentPage <= 1 }">
					<a>[이전]</a>
				</c:if>
				
				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<a class="currentP">${ p }</a>
					</c:if>
					
					<c:if test="${ p ne pi.currentPage }">
					 	<c:url var="pageination" value=actionList.ch">
					 		<c:param name="page" value="${ p  }"/>
					 	</c:url>
					 	</c:if>
				</c:forEach>

				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					<a>[다음]</a>
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="actionlist.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
					<div class="writingBtnArea" style="background-color: skyblue;">
					<button class="writingBtn">글쓰기</button>
				</div>
				
			</td>
		</tr>
	</table>
	<script>
		$(function(){
			$('.contentTR').mouseenter(function(){
				$(this).css({'color':'yellowgreen', 'font-weight':'bold', 'cursor':'pointer'});
			}).mouseout(function(){
				$(this).css({'color':'black','font-weight':'normal'});
			}).click(function(){
				var bId = $(this).children('td').eq(0).text();
			
				location.href="bdetail.bo?bId="+bId+"&page="+${pi.currentPage};
													///└그대로 보내서 그대로 받아오는 역할
			});
		});	
	</script>
</body>
</html> 