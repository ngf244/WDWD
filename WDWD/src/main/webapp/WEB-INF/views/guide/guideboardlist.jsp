<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>QnA</title>
</head>
<style>
</style>
<body>
	<h2>QnA list</h2>
		<table border="1" width="600px">
			<tr>
			<th>No.</th>
			<th>제목</th>
			<th>이름</th>
			<th>작성일</th>
			<th>조회수</th>
			<th>답변여부</th>
		</tr>
		<c:forEach var="g" item="${list}">
		<tr>
			<td>${ g.bno }</td>	
			<td>${ g.title }</td>
			<td>${ g.writer }</td>
			<td>${ g.regdate }</td>
			<td>${ g.viewcnt }</td>	
			<td>${ g.answer }</td>
		</tr>
	</c:forEach>
	</table>
	<form action="gwrite.guide" id="wirteaction" method="post">
	<button type="button" id="btnwriter">글쓰기</button>	
	</form>
</form>
</body>
</html>