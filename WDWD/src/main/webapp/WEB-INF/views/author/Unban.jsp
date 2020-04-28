<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #unbanMain{
        width: 100%;
        position: relative;
    }

    /* #unbanMain>div{
        position: absolute;
    } */

    .banListLetter{
        width: 100%;
        height: 40px;
        text-align: center;
        padding-top: 15px;
        margin: 0 auto;
        margin-top: 10px;
        font-size: larger;
        background-color: rgb(52, 152, 219);
    }

    .banList{
        width: 95%;
        min-height: 600px;
        margin-top: 30px;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 30px;
    }
    
    .table {
      border-collapse: collapse;
      border-top: 3px solid #168;
      width: 100%;
    }  
    .table th {
      color: #168;
      background: #f0f6f9;
      text-align: center;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td{
      text-align: center;
      overflow: auto;
    }
    .table tr button{
        width: 100%;
        height: 80%;
    }
    
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
        <h2 style="text-align: center;">관리자 모드</h2>
        <hr>
        <div id="left-side">
            <jsp:include page="menubar/leftmenu.jsp"/>
		</div>
        <div id="main">
            <div id="unbanMain" style="background-color: white;">
                <div class="banListLetter">제재 리스트</div>
                <div class="banList">
                    <table class="table">
                        <tr>
                            <th>유저 아이디<br>(닉네임)</th>
                            <th style="width: 50%;">내용</th>
                            <th>제재 해제일</th>
                            <th>해제</th>
                        </tr>
                        <c:forEach var="list" items="${banList}" varStatus="i">
                        	<tr>
                                <td>${list.banUserId}<br>${list.banUserNick}</td>
                                <input type="hidden" value="${list.banUserId}">
                        		<td>${list.banContent}</td>
                        		<td>${list.banTerm}</td>
                        		<td><button class="unban">해제</button></td>
                        	</tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
		</div>
        <div id="right-side">
            
		</div>
    </section>
    <script>
        $('.unban').click(function () {
            var userId = $(this).closest('tr').find('input').val();
            console.log(userId);
            var button = $(this);

            swal({
                title: "Confirm",
                text: "정말 제재하시겠습니까?",
                icon: "warning",
                buttons: ["NO", "YES"],
                dangerMode: true,
            }).then((YES) => {
                if (YES) {
                    $.ajax({
                        url : "deleteBan.au",
                        data : {userId : userId},
                        type : "GET",
                        success : function (data) {
                            console.log(data);
                            if(data == 1){
                                button.replaceWith('해제됨');
                            }
                        }
                    })
                }else{
                    console.log('헐 실패;;;')
                    return false;
                }
            })

            

        })
    </script>
    <!-- <div class="sectionafter"></div> -->
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>