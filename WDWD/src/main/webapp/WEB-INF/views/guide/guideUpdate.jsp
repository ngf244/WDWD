<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1 align="left">QnA 글 수정</h1>
	<form action="gupdate.guide" method="post" enctype="Multipart/form-data">
		<input type="hidden" name="page" value="${ page }">
		<input type="hidden" name="bno" value="${ guide.bno }">
	
		<table id="boardUpdateTable" border="1">
			<tr>
				<th>제목</th>
				<td>
					<input type="text" size="80" name="title" value="${ Guide.title }">
				</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>
					<input type="text" name="writer" readonly value="${ Guide.Writer }" style="background: skyblue;">
				</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><textarea rows="10"	 cols="80" name="content">${ board.content }</textarea></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기"> &nbsp;
					<c:url var="glist" value="glist.guide">
						<c:param name="page" value="${ page }"/>
					</c:url>
					<button type="button" onclick="location.href='${ glist }'">목록으로</button>
					<button type="button" onclick="location.href='javascript:history.go(-1);'">이전페이지로</button>	
				</td>
			</tr>	 		
		</table>
	</form>
</body>
</html>