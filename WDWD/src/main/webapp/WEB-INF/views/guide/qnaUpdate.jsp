<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #boardUpdateTable{margin: auto; border-collapse: collapse; border-left: hidden; border-right: hidden;}
   #boardUpdateTable tr td{padding: 5px;}
</style>
</head>
<body>
   
   <h1 align="center">게시글 수정</h1>
   
   <!-- 첨부파일도 수정 할 수도 있으니 Multipart/form-data encType 지정 -->
   <form action="bupdate.bo" method="post">
      <input type="hidden" name="page" value="${ page }">
      <input type="hidden" name="bId" value="${ board.bId }">
      <input type="hidden" name="renameFileName" value="${ board.renameFileName }">
   
      <table id="boardUpdateTable" border="1">
         <tr>
            <th>제목</th>
            <td>
               <input type="text" size="80" name="bTitle" value="${ board.bTitle }">
            </td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>
               <input type="text" name="bWriter" readonly value="${ board.bWriter }" style="background: lightgrey;">
            </td>
         </tr>
         <tr>
            <th>내용</th>
            <td><textarea rows="10" cols="80" name="bContent">${ board.bContent }</textarea></td>
         </tr>
         <tr>
            <th>첨부파일</th>
            <td>
               <input type="file" name="reloadFile">
               <c:if test="${ !empty board.originalFileName }">
                  <br>현재 업로드한 파일 : 
                  <a href="${ contextPath }/resources/buploadFiles/${ board.renameFileName }" download="${ board.originalFileName }">
                     ${ board.originalFileName }
                  </a>
               </c:if>
               <br>
            </td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="수정하기"> &nbsp;
               <c:url var="blist" value="blist.do">
                  <c:param name="page" value="${ page }"/>
               </c:url>
               <button type="button" onclick="location.href='${ blist }'">목록으로</button>
               <button type="button" onclick="location.href='javascript:history.go(-1);'">이전페이지로</button>
            </td>
         </tr>
      </table>
   </form>
</body>
</html>