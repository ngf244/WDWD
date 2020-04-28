<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<h2>글작성</h2>
	
	<div>
	
	</div>
	
	<div>제목
		<input name="title" id="title" size="80" placeholder="제목을 입력해주세요">	
	</div>
	
	<div>내용
		<textarea name="content" id="content" rows="4" cols="80" placeholder="내용을 입력해주세요"></textarea>
	</div>
	
	<div style="width:650px; text-align: center;">
		<button type="button" id="btnsave">확인</button>
		<button type="reset">취소</button>
	</div>
	


</body>
</html>