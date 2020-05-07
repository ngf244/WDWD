<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #banMain{
        width: 100%;
        position: relative;
    }

    /* #unbanMain>div{
        position: absolute;
    } */

    .reportLetter{
        width: 100%;
        height: 40px;
        text-align: center;
        padding-top: 15px;
        margin: 0 auto;
        margin-top: 10px;
        font-size: larger;
        background-color: rgb(52, 152, 219);
    }

    .reportList{
        width: 95%;
        max-height: 600px;
        margin-top: 30px;
        margin-left: auto;
        margin-right: auto;
		margin-bottom: 30px;
		overflow: auto;
    }
    .userListArea{
        float: left;
        width: 48%;
        min-height: 300px;
        margin-left: 10px;
    }
	.userListLetter{
		width: 100%;
		margin-bottom: 30px;
		height: 40px;
        background-color: rgb(52, 152, 219);
        text-align: center;
        font-size: large;
        padding-top: 15px;
	}

	.userList{
		width: 100%;
		margin-bottom: 30px;
		height: 400px;
        overflow: auto;
	}

    .banArea{
        float: left;
        width: 48%;
        min-height: 300px;
        margin-left: 20px;
    }

	.banWord{
		width: 100%;
		margin: auto;
        margin-top: 90px;
        margin-bottom: 10px;
        text-align: center;
        height: 40px;
	}

    .banWrite{
        width: 100%;
        min-height: 100px;
        margin-top: 40px;
        padding-left: 3%;
        display: none;
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

    /* .needCheck{
        background-color: rgb(0, 68, 255);
    }*/

    .delete{
        background-color: rgb(255, 28, 28);
    }

    #searchWord{
        width: 80%;
        height: 100%;
        display: inline-block;
        vertical-align: top;
    }

    #goSearch{
        width: 10%;
        height: 108%;
        display: inline-block;
        margin-left: 3%;
    }
    #goSearch img{
        width: 100%;
        height: 100%;
    }

    .banWrite textarea{
        width: 95%;
        height: 100px;
    }

    .banWrite span{
        font-weight: bold;
        font-size: large;
    }

    .banWrite button{
        width: 10%;
        margin-right: 5%;
    }


</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
        <div id="left-side">
            <jsp:include page="menubar/leftmenu.jsp"/>
		</div>
		<div id="main">
			<div id="banMain" style="background-color: white;">
                <div class="reportLetter">신고 리스트(제재 유저 제외)</div>
                <div class="reportList">
                    <table class="table">
                        <tr>
                            <th>게시판 번호</th>
                            <th>게시판 종류</th>
                            <th>피신고자 아이디<br>(닉네임)</th>
                            <th>신고자 아이디<br>(닉네임)</th>
                            <th style="width: 40%;">신고 내용</th>
                            <th>신고일</th>
                            <th style="width: 8%;">처리</th>
                        </tr>
                        
                        <c:forEach var="report" items="${deArr}" varStatus="i">
                        	<tr>
	                            <td>${report.boNum}
                                    <input type="hidden" value="${report.deNum}" class="deNum">
                                </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${report.boGroup == 1}">
	                            			자유게시판
	                            		</c:when>
	                            		<c:when test="${report.boGroup == 2}">
	                            			1:1
	                            		</c:when>
	                            		<c:when test="${report.boGroup == 3}">
	                            			경매
	                            		</c:when>
	                            		<c:when test="${report.boGroup == 4}">
	                            			콘테스트
	                            		</c:when>
	                            		<c:when test="${report.boGroup == 5}">
	                            			에디터 등록
	                            		</c:when>
	                            		<c:when test="${report.boGroup == 6}">
	                            			가이드
	                            		</c:when>
	                            	</c:choose>
	                            	<c:if test="${report.deCate == 2}"><br>(댓글)</c:if>
	                      			<input type="hidden" name="boGroup" value="${report.boGroup}">
	                            </td>
	                            <td>${report.deReportedId}<br>(${report.deReportedNick})</td>
	                            <td>${report.deReporterId}<br>(${report.deReporterNick})</td>
	                            <td>${report.deContent}</td>
	                            <td>${report.deDate}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${report.deStatus=='N'}">
	                            			<button class="needCheck">미처리</button>
	                            		</c:when>
	                            		<c:when test="${report.deStatus=='C'}">
	                            			<button class="delete">삭제</button>
	                            		</c:when>
	                            	</c:choose>
	                            </td>
                        	</tr>
                        </c:forEach>

                        <!-- <tr>
                            <td>1</td>
                            <td>자유게시판</td>
                            <td>dong<br>(윤동혁)</td>
                            <td>daeho<br>(김대호)</td>
                            <td>동혁이가 리스트를 몇주째 못불러와요동혁이가 리스트를 몇주째 못불러와요동혁이가 리스트를 몇주째 못불러와요동혁이가 리스트를 몇주째 못불러와요
                                동혁이가 리스트를 몇주째 못불러와요동혁이가 리스트를 몇주째 못불러와요동혁이가 리스트를 몇주째 못불러와요동혁이가 리스트를 몇주째 못불러와요
                            </td>
                            <td>2020/04/20 14:28:13</td>
                            <td><button class="needCheck">미처리</button></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td>자유게시판</td>
                            <td>dong<br>(윤동혁)</td>
                            <td>daeho<br>(김대호)</td>
                            <td>못불러와요</td>
                            <td>2020/04/20 18:28:13</td>
                            <td><button class="delete">삭제</button></td>
                        </tr> -->
                    </table>
                </div>
                <div class="userListArea">
                    <div class="userListLetter">유저 리스트(제재 유저 제외)</div>
                    <div class="userList">
                        <table class="table">
                            <tr>
                                <th style="width: 28%;">아이디</th>
                                <th style="width: 28%;">닉네임</th>
                                <th>신고된 횟수</th>
                                <th>활동 보기</th>
                                <!-- 해당 유저의 마이페이지 내 활동 기록 칸으로 이동 -->
                            </tr>
                            <c:forEach var="user" items="${memArr}" varStatus="i">
                            	<tr>
	                                <td>${user.userId}</td>
	                                <td>${user.nickName}</td>
	                                <td>${user.grade}</td>
	                                <td><button class="showInfo">보기</button></td>
                            	</tr>
                            </c:forEach>
                            <!-- <tr>
                                <td>dong</td>
                                <td>윤동혁</td>
                                <td>100</td>
                                <td>보기</td>
                            </tr> -->
                        </table>
                    </div>
                </div>
                <div class="banArea">
                    <div class="banWord">
                        <input type="text" placeholder="검색할 유저를 입력하세요" id="searchWord">
                        <div id="goSearch">
                            <img src = "${contextPath}/resources/images/search.png">
                        </div>
                    </div>
                    <div class="banWrite">
                        <form method="POST" id="banForm2">

                            <span>닉네임 : </span>
                            <input type="text" name="banUserNick" readonly>
                            <br><br>
                            <span>제재 기간 : </span>
                            <br><br>
                            <input type="date" id="banUserToday"> ~ <input type="date" name="banTerm">
                            <br><br><br>
                            <span>제재 사유 : </span>
                            <br><br>
                            <textarea name="banContentBefore" class="banContentBefore2"></textarea>
                            <input type="hidden" name="banContent" class="banContent2">
                            <br><br>
                            <div>
                                <button type="button" class="banUserRegistRes">등록</button>
                                <button type="button" class="banUserCancelRes">취소</button>
                                <div class="sectionafter"></div>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="sectionafter"></div>
            </div>
        </div>
        <script>
            $('#goSearch').click(function () {
                var searchTarget =  $('.banWord input').val();
                targetTd = 
                $('.userList td:first-child').filter(function() {
                    return ($(this).text() == searchTarget);
                }).parent();
                $('.userList tr').css('color','black');
                targetTd.css("color", "red");

                if(targetTd.length < 1){
                    swal("No Target", "일치하는 회원이 없습니다.", "error");
                    $('.banUserCancelRes').trigger('click');
                } else {
                    document.getElementById("banUserToday").valueAsDate = new Date();
                    $('input[name=banUserNick]').val(targetTd.children('td:nth-of-type(2)').text());
                    $('.banWrite').show();
                    var offset = targetTd.offset();
                    $('.userList').stop().animate({
                        scrollTop : offset.top
                    }, 300);
                }
            })

            $('.banUserCancelRes').click(function () {
                $('.banWrite').hide();
                $('.banWrite textarea').val("");
                $('.userList tr').css('color','black');
            })

            $('.banWord input').keyup(function (event) {
                if(event.keyCode === 13){
                    $('#goSearch').trigger('click');
                }
            })

            $(document).on("click", ".reportList tr", function () {
                var deNum = $(this).find('.deNum').val();
                var boGruop = $(this).find('input[name=boGroup]').val();
                var boNum = $(this).children().eq(0).text().trim();
                var target = $(this).find('.needCheck');
                
                var check = $(this).children().eq(6).text().trim();
                if(check == "삭제됨"){
                    return false;
                }
                // var deNum = $(this).closest('tr').find('.deNum').val();
                // var boGruop = $(this).closest('tr').find('input[name=boGroup]').val();
                // var boNum = $(this).closest('tr').children().eq(0).text().trim();
                // var target = $(this);
                
                var a = document.createElement('a');
                a.target="_blank";
                var location = "";
                switch (boGruop) {
                    case '1': location = "detail.bo?boNum="+boNum; break;
                    case '2': location = "detailView.ch?boNum="+boNum; break;
                    case '3': location = "detailView.ch?boNum="+boNum; break;
                    case '4': location = "detailView.ch?boNum="+boNum; break;
                    case '5': location = "detailView.ch?boNum="+boNum; break;
                    case '6': location = "detailView.ch?boNum="+boNum; break;
                    case '7': location = "detailView.ch?boNum="+boNum; break;
                
                    default: break;
                }
                a.href = location;
                a.click();
                
                $.ajax({
                    url : "updateDeclaration.au",
                    data : {deNum : deNum, type : 'N'},
                    type : 'POST',
                    success : function (data) {
                        if(data.trim() == "1"){
                            target.replaceWith('<button class="delete">삭제</button>');
                        }
                    }
                })
            })
            $(document).on("click", ".delete", function (e) {
                var deNum = $(this).closest('tr').find('.deNum').val();
                var boGruop = $(this).closest('tr').find('input[name=boGroup]').val();
                var boNum = $(this).closest('tr').children().eq(0).text().trim();
                var target = $(this);
                
                // var a = document.createElement('a');
                // a.target="_blank";
                // var location = "";
                // switch (boGruop) {
                //     case '1': location = "detail.bo?boNum="+boNum; break;
                //     case '2': location = "detail.bo?boNum="+boNum; break;
                
                //     default: break;
                // }
                // a.href = location;
                // a.click();

                $.ajax({
                    url : "updateDeclaration.au",
                    data : {deNum : deNum, type : 'C'},
                    type : 'POST',
                    success : function (data) {
                        if(data.trim() == 1){
                            target.replaceWith('삭제됨');
                        }
                    }
                })
                e.stopPropagation();
            })

            $('.showInfo').click(function () {
                var userId = $(this).parent().prev().prev().prev().text();
                // var a = document.createElement('a');
                // a.target="_blank";
                // a.href="main.my?userId="+userId;
                // a.click();
                var url = "main.my?userId="+userId;
                // var open = window.open(url, "_blank",'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
                var open = window.open();
                window.setTimeout(function () {
                    // open.window.scrollTo(0,900);
                    open.location.href="main.my?userId="+userId+"#mypostManagement";
                },100);
            })

            $('.banUserRegistRes').click(function () {
                var banContentBefore = $('.banContentBefore2').val();
                console.log($('.banContentBefore2'));
                console.log(banContentBefore);
                console.log(banContentBefore.length);

                if(banContentBefore.length < 5){
                    swal("error", "사유 5자 이상 입력해야함", "error");
                    return false;
                }

                var checkend = $('input[name=banTerm]').eq(1).val();
                var checkstart = $('#banUserToday').val();
                // console.log(checkstart);
                // console.log(checkend);
                if(checkend == ""){
                    swal("error", "해제 예정일 넣어라", "error");
                    return false;
                }

                // 날짜 비교 모듈
                var startDateArr = checkstart.split('-');
                var endDateArr = checkend.split('-');
                        
                var startDateCompare = new Date(startDateArr[0], parseInt(startDateArr[1])-1, startDateArr[2]);
                var endDateCompare = new Date(endDateArr[0], parseInt(endDateArr[1])-1, endDateArr[2]);
                
                // console.log(startDateArr);
                // console.log(endDateArr);
                // console.log(startDateCompare);
                // console.log(startDateCompare.getTime());
                // console.log(endDateCompare);
                // console.log(endDateCompare.getTime());

                if(startDateCompare.getTime() > endDateCompare.getTime()) {
                    swal("error", "어떻게 종료일이 시작일보다 빠르냐 멍청아", "error");
                    return false;
                }

                swal({
                    title: "Confirm",
                    text: "정말 제재하시겠습니까?",
                    icon: "warning",
                    buttons: ["NO", "YES"],
                    dangerMode: true,
                }).then((YES) => {
                    if (YES) {
                        var banContentAfter = banContentBefore.replace(/(?:\r\n|\r|\n)/g, '<br />');
                        $('.banContent2').val(banContentAfter);
                        var formData = $('#banForm2').serialize();

                        $.ajax({
                        cache : false,
                        url : "insertBan.au",
                        type : 'POST', 
                        data : formData, 
                        success : function(data) {
                            if(data.trim() == 1){
                                location.reload();
                            }
                        }
                        });
                    }else{
                        console.log('헐 실패;;;')
                        return false;
                    }
                })
            })

        </script>
        <div id="right-side">
            
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>