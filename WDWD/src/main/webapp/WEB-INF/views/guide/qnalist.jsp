<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnAlist</title>
</head>
<body>

	<h1 align="center">게시글 목록</h1>

	<h3 align="center">총 게시글 갯수 : ${ pi.listCount }</h3>

	<table border="1" id="tb">
		<tr style="background: yellowgreen;">
			<th>번호</th>
			<th width="300">제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="g" items="${ list }">
		<tr class="contentTR">
			<td align="center">${ g.bId }</td>

			<td align="left">
				<c:if test="${ !empty loginUser }">
					<c:url var="bdetail" value="bdetail.bo">
						<c:param name="bId" value="${ g.bId }"/>
						<c:param name="page" value="${ pi.currentPage }"/>
					</c:url>
					<a href="${ gdetail }">${ g.bTitle }</a>
				</c:if>
				<c:if test="${ empty loginUser }">
					${ g.bTitle }		
				</c:if>
			</td>

			<td align="center">${ g.bWriter }</td>
			<td align="center">${ g.bCreateDate }</td>
			<td align="center">${ g.bCount }</td>
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
					[이전] &nbsp;
				</c:if>
				<c:if test="${ pi.currentPage > 1 }">
					<c:url var="before" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage - 1 }"/>
					</c:url>
					<a href="${ before }">[이전]</a> &nbsp;
				</c:if>

				<!-- 페이지 -->
				<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
					<c:if test="${ p eq pi.currentPage }">
						<font color="red" size="4"><b>[${ p }]</b></font>
					</c:if>

					<c:if test="${ p ne pi.currentPage }">
						<c:url var="pagination" value="blist.bo">
							<c:param name="page" value="${ p }"/>
						</c:url>
						<a href="${ pagination }">${ p }</a> &nbsp;
					</c:if>
				</c:forEach>

				<!-- [다음] -->
				<c:if test="${ pi.currentPage >= pi.maxPage }">
					[다음]
				</c:if>
				<c:if test="${ pi.currentPage < pi.maxPage }">
					<c:url var="after" value="blist.bo">
						<c:param name="page" value="${ pi.currentPage + 1 }"/>
					</c:url> 
					<a href="${ after }">[다음]</a>
				</c:if>
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