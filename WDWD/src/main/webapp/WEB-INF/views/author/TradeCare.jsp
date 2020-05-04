<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
    #tradeCareMain{
        width: 100%;
        position: relative;
    }

    /* #unbanMain>div{
        position: absolute;
    } */

    .listLetter{
        width: 100%;
        height: 40px;
        text-align: center;
        padding-top: 15px;
        margin: 0 auto;
        margin-top: 10px;
        font-size: larger;
        background-color: rgb(52, 152, 219);
    }

    .list{
        width: 95%;
        min-height: 400px;
        margin-top: 30px;
        margin-left: auto;
        margin-right: auto;
        margin-bottom: 30px;
        overflow: auto;
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
        z-index: 99;
    }
    .delete{
        background-color: rgb(255, 28, 28);
    }
    .seller{
        color: rgb(255, 28, 28);
    }
    .buyer{
        color: rgb(43, 28, 255);
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
            <div id="unbanMain" style="background-color: white;">
                <div class="listLetter">거래 취소 리스트</div>
                <div class="list">
                    <table class="table">
                        <tr>
                            <th style="width: 8%;">거래 번호</th>
                            <th style="width: 8%;">거래 유형</th>
                            <th style="width: 10%;">금액</th>
                            <th style="width: 30%;">메세지</th>
                            <th style="width: 8%;">취소 요청자</th>
                            <th style="width: 15%;">처리 요청일</th>
                            <th style="width: 7%;">처리</th>
                        </tr>
                        <c:forEach var="cancel" items="${cancelArr}" varStatus="i">
                        	<tr>
	                            <td>
	                            	${cancel.diRef}
	                            	<input type="hidden" value="${cancel.diNum}" class="diNum">
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${cancel.boGroup == 1}">자유게시판</c:when>
	                            		<c:when test="${cancel.boGroup == 2}">1:1</c:when>
	                            		<c:when test="${cancel.boGroup == 3}">경매</c:when>
	                            		<c:when test="${cancel.boGroup == 4}">콘테스트</c:when>
	                            		<c:when test="${cancel.boGroup == 5}">에디터 등록</c:when>
	                            		<c:when test="${cancel.boGroup == 6}">가이드</c:when>
	                            	</c:choose>
	                            	<input type="hidden" value="${cancel.boGroup}" class="boGroup">
	                            </td>
	                            <td>${cancel.cbCash}</td>
	                            <td>${cancel.diContent}</td>
	                            <td>
	                            	<c:if test="${cancel.diStatus == 1}">
		                            	<span class="buyer">구매자</span>
	                            	</c:if>
	                            	<c:if test="${cancel.diStatus == 2}">
		                            	<span class="seller">판매자</span>
	                            	</c:if>
	                            </td>
	                            <td>${cancel.diDate}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${cancel.diRps == 'N'.charAt(0)}"><button class="needCheck">미처리</button></c:when>
	                            		<c:when test="${cancel.diRps == 'C'.charAt(0)}"><button class="delete">삭제</button></c:when>
	                            	</c:choose>
	                            </td>
                        	</tr>
                        </c:forEach>
                    </table>
                </div>
                <div class="listLetter">거래 중재 요청 리스트</div>
                <div class="list">
                    <table class="table">
                        <tr>
                            <th style="width: 8%;">거래 번호</th>
                            <th style="width: 8%;">거래 유형</th>
                            <th style="width: 10%;">금액</th>
                            <th style="width: 30%;">메세지</th>
                            <th style="width: 8%;">중재 요청자</th>
                            <th style="width: 15%;">처리 요청일</th>
                            <th style="width: 7%;">처리</th>
                        </tr>
                        <c:forEach var="dispute" items="${disputeArr}" varStatus="i">
                        	<tr>
	                            <td>
	                            	${dispute.diRef}
	                            	<input type="hidden" value="${dispute.diNum}" class="diNum">
	                            </td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${dispute.boGroup == 1}">자유게시판</c:when>
	                            		<c:when test="${dispute.boGroup == 2}">1:1</c:when>
	                            		<c:when test="${dispute.boGroup == 3}">경매</c:when>
	                            		<c:when test="${dispute.boGroup == 4}">콘테스트</c:when>
	                            		<c:when test="${dispute.boGroup == 5}">에디터 등록</c:when>
	                            		<c:when test="${dispute.boGroup == 6}">가이드</c:when>
	                            	</c:choose>
	                            	<input type="hidden" value="${dispute.boGroup}" class="boGroup">
	                            </td>
	                            <td>${dispute.cbCash}</td>
	                            <td>${dispute.diContent}</td>
	                            <td>
	                            	<c:if test="${dispute.diStatus == 3}">
		                            	<span class="buyer">구매자</span>
	                            	</c:if>
	                            	<c:if test="${dispute.diStatus == 4}">
		                            	<span class="seller">판매자</span>
	                            	</c:if>
	                            </td>
	                            <td>${dispute.diDate}</td>
	                            <td>
	                            	<c:choose>
	                            		<c:when test="${dispute.diRps == 'N'.charAt(0)}"><button class="needCheck">미처리</button></c:when>
	                            		<c:when test="${dispute.diRps == 'C'.charAt(0)}"><button class="delete">삭제</button></c:when>
	                            	</c:choose>
	                            </td>
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
        $(document).on("click", ".list tr:nth-of-type(1)~tr", function () {
            var diNum = $(this).find('.diNum').val();
            var boNum = $(this).children().eq(0).text().trim();
            var boGroup = $(this).find('.boGroup').val();
            var target = $(this).find('.needCheck');
            
            var check = $(this).children().eq(6).text().trim();
            if(check == "삭제됨"){
                return false;
            }

            var a = document.createElement('a');
            a.target="_blank";
            var location = "";
            switch (boGroup) {
                case '1': location = "detail.bo?boNum="+boNum; break;
                case '2': location = "detailView.ch?boNum="+boNum; break;
                // case별로 url 확인하여 넣어야함
                default: break;
            }
            a.href = location;
            a.click();
            
            $.ajax({
                url : "updateDispute.au",
                data : {diNum : diNum, type : 'N'},
                type : 'POST',
                success : function (data) {
                    if(data.trim() == 1){
                        target.replaceWith('<button class="delete">삭제</button>');
                    }
                }
            })
        })
        $(document).on("click", ".delete", function (e) {
            var diNum = $(this).closest('tr').find('.diNum').val();
            var boNum = $(this).closest('tr').children().eq(0).text().trim();
            var boGroup = $(this).closest('tr').find('.boGroup').val();
            var target = $(this);
            
            // var a = document.createElement('a');
            // a.target="_blank";
            // var location = "";
            // switch (boGroup) {
            //     case '1': location = "detail.bo?boNum="+boNum; break;
            //     case '2': location = "detailView.ch?boNum="+boNum; break;
            
            //     default: break;
            // }
            // a.href = location;
            // a.click();

            $.ajax({
                url : "updateDispute.au",
                data : {diNum : diNum, type : 'C'},
                type : 'POST',
                success : function (data) {
                    if(data.trim() == 1){
                        target.replaceWith('삭제됨');
                    }
                }
            })
            e.stopPropagation();
        })
    </script>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>