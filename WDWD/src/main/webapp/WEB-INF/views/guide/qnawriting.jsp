<%@ page language="java" contentType="text/html; charset=UTF-8"
       pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
   #boardInsertTable{margin: auto; border-collapse: collapse; border-left: hidden; border-right: hidden;}
   #boardInsertTable tr td{padding: 5px;}
</style>
</head>
<body>

   <h1 align="center">게시글 등록</h1>

   <br><br>

   <!-- 첨부파일 등록을 위해 Multipart/form-data encType 지정 -->
   <form action="binsert.bo" method="post" enctype="Multipart/form-data">
      <table id="boardInsertTable" border="1">
         <tr>
            <th>제목</th>
            <td>
               <input type="text" size="80" name="bTitle">
            </td>
         </tr>
         <tr>
            <th>작성자</th>
            <td>
               <input type="text" name="bWriter" readonly value="${ loginUser.id }" style="background: lightgrey;">
            </td>
         </tr>
         <tr>
            <th>내용</th>
            <td><textarea rows="10" cols="80" name="bContent" style="resize: none;"></textarea></td>
         </tr>
         <tr>
            <td colspan="2" align="center">
               <input type="submit" value="등록 하기"> &nbsp;
               <button onclick="location.href='qlist.bo'">목록으로</button>
            </td>
         </tr>
      </table>
   </form>
</body>
</html> 