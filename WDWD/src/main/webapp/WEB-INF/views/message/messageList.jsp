<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
	div.tableTitle {
	    width:100% ;
	    border-top:solid 1px ;
	    border-bottom:solid 1px ;
	    height:30px ;
	    clear:both ;
	    background-color:#EDEDED ;
	    font-weight:bold ;
	}
		
		
	div.tableRow {
	    border-bottom:solid 1px #eaeaea ;
	    width:100% ;
	    clear:both ;
	    height:30px ;
	}
	
	div.tableCol {
		text-align:center;
	    float:left ;
	    padding:8px 3px 0 3px ;
	    overflow-x:hidden;
	    overflow-y:hidden ;
	    height:20px ;
	}	

</style>

<meta charset="UTF-8">
<title>쪽지</title>
</head>
<body>
	<h1>받은 쪽지함</h1>
	
	
	<form method="get">
		<div style="width:100% ; text-align:right ; padding:0 0 5px 0">
		    <input type="text" class="text" size="20" name="keyword" value="">
		    <input type="submit" id="searchButton" class="button" value="검색">
		    <input type="button" value="보낸쪽지 목록" id="sendMsgButton" class="sendMsgButton" role="button" aria-disabled="false">
		</div>
	</form>
	
	<form name="frm" action="./member.delete.letter.do.php" method="post">
		<input type="hidden" name="action" value="receiver">
		<input type="hidden" name="type" value="many">

		<!-- 리스트 출력 -->
		<div class="tableTitle">
		    <div class="tableCol checkBox" style="padding-left:0; padding-right:0; width:5%; text-align:center;"><input type="checkbox" onclick="lfCheckAll(this.checked)"></div>
		    <div class="tableCol sender" style="padding-left:0; padding-right:0; width:20%; text-align:center;">발신자</div>
		    <div class="tableCol subject" style="padding-left:0; padding-right:0; width:45%; text-align:center;">제목</div>
		    <div class="tableCol sendDate" style="padding-left:0; padding-right:0; width:25%; text-align:center;">발신일</div>
		</div>
		<c:forEach var="ms" items="${ list }">
	 			<c:url var="msDetail" value="msDetail.ms">
					<c:param name="msNum" value="${ ms.msgNum }"/>
					<c:param name="page" value="${ pi.currentPage }"/>
				</c:url>
			    <div class=tableRow>
			        <div class="tableCol checkBox" style="padding-left:0; padding-right:0; width:5%; text-align:center;"><input type=checkbox name="msgkeys[]" value="${ ms.msgNum }" class=letterCheckBox></div>
			        <div class="tableCol sender" style="padding-left:0; padding-right:0; width:20%;"> ${ ms.ssgNick }</div>
			        <div class="tableCol subject" style="padding-left:0; padding-right:0; width:45%;">&nbsp;<a href="./member.read.letter.php?msgkey=912431"> ${ ms.msgTitle }</a></div>
			        <div class="tableCol sendDate" style="padding-left:0; padding-right:0; width:25%; text-align:center;">${ ms.msgDate }</div>
			    </div>
		
	    </c:forEach>
	</form> 
	
	
	<div style="width:100% ; text-align:right">
    <!-- 페이징 -->
                <b>1</b>

                <a href="/member/member.sender.letter.php?page=2&amp;keyword=">2</a>

                <a href="/member/member.sender.letter.php?page=3&amp;keyword=">3</a>

    (총 35 건)
	</div>
	
	<div style="width:100% ; clear:both ; padding:10px 0 0 0 ; text-align:right">
    	<button id="deleteButton" class="ui-button ui-widget ui-state-default ui-corner-all ui-button-text-only" role="button" aria-disabled="false"><span class="ui-button-text">선택쪽지 삭제</span></button>
	</div>
	
	<script>
	    function lfCheckAll(bl) {
	        $("input.letterCheckBox").attr("checked", bl);
	    }
	
	    function lfLayout() {
	        if ($(window).width() < 480) {
	            $('.checkBox').hide();
	            $('.receiveDate').hide();
	            $('.sender').width('25%');
	            $('.subject').width('55%');
	            $('.sendDate').width('20%');
	
	            $("#deleteButton").hide();
	        } else {
	            $('.checkBox').show();
	            $('.receiveDate').show();
	            $('.sender').width('20%');
	            $('.subject').width('45%');
	            $('.sendDate').width('15%');
	
	            $("#deleteButton").show();
	        }
	    }
	
	    
		/* 삭제버튼  */
		$('#deleteButton').click(function() {
			var checkArr = new Array();
			
			var checkBox = $("input.letterCheckBox").is(":checked");
			console.log(checkBox);
			
			
			if(checkBox){	
		         swal({
		                title: "선택한 쪽지를 삭제 하시겠습니까?",
		                icon: "info",
		                buttons : {
		                   cancle : {
		                      text : '취소',
		                      value : false
		                   },
		                   confirm : {
		                      text : '삭제',
		                      value : true
		                   }
		                }
		             }).then((result) => {
		                if(result) {							
	    					$('input.letterCheckBox:checked').each(function() {
								checkArr.push($(this).val()); //체크한 쪽지 배열로 저장
	    						console.log(checkArr);
	    					});

		    				jQuery.ajaxSettings.traditional = true;

		    				//ajax실행해서 배열로 값넘긴 후에 deleteM실행한 후에 다시 돌아온다. 
		    				$.ajax({
		    					url : 'deleteM.ms',
		    					type : 'get',
		    					data : {
		    						checkArr : checkArr
		    					}, //쉼표로 구분
		    					success : function(data) {
		    						alert(data);
		    						window.location.href = 'messageList.ms';

		    					}, error : function(e){
		    						console.log("삭제 안돼");
		    					}

		    				});
		    			} 
		                } else {
		                   swal({
		                    title: "쪽지",
		                    text: "쪽지 삭제에 실패하였습니다.",
		                    icon: "error" //"info,success,warning,error" 중 택1
		                });
		                }
             });
		});		
	</script>

	
	
	
<%-- 	
		<div class="outer">
		<div class="messageOuter">
			<div class="inContentTitle">
				<img src="<%= request.getContextPath() %>/images/readMsg.png" width="190px" height="200px">
			</div>
			<form method="get">

				<!-- <input type="text" class="textMsg" size="20">
			   	<input type="submit" id="searchButton" class="button" value="검색"> -->
				<div class="messageControll">
					<input type="button" onclick="location.href='<%=request.getContextPath()%>/listSend.ms'" value=" 보낸쪽지함 " id="sendMsgButton" class="sendMsgButton"
						role="button" aria-disabled="false">
					<input type="button" id="deleteButton" class="deleteButton" role="button" aria-disabled="false" value="선택쪽지 삭제">
				</div>

				<div class="tableTitle">
					<table id="msgArea">
						<tr>
							<th><div class="tableCol checkBox">
									<input type="checkbox" name="check" id="aCheck" onclick="allCheck(this);">
								</div></th>
							<th><div class="tableCol receiver">발신자</div></th>
							<th><div class="tableCol subject">제목</div></th>
							<th><div class="tableCol sendDate">발신일</div></th>
						</tr>

						<!-- 이따가 조회 리스트 추가 -->
						<%
							if (mList.isEmpty()) {
						%>

						<tr>
							<td colspan="4">조회된 리스트가 없습니다.</td>
						</tr>
						<%
							} else {
								for (Message m : mList) {
						%>
						<tr>
							<td><input type="checkbox" name="check" class="check" data-mNum="<%=m.getMsgNum()%>"></td>
							<td class="rId"><input type="hidden" class="mNum"
								name="mNum" value='<%=m.getMsgNum()%>'><%=m.getSNick()%><input
								type="hidden" value='<%=m.getSNick()%>'></td>
							<td class="mTitle"><%=m.getMsgTitle()%><input
								type="hidden" value='<%=m.getMsgTitle()%>'></td>
							<td><%=m.getMsgDate()%><input type="hidden"
								value='<%=m.getMsgDate()%>'></td>
						</tr>

						<%
							}

							}
						%>
						
					</table>
						
							<!-- 하단에 페이징 번호 -->
					<div class="pagingArea" align="center">
						<%
							if (!mList.isEmpty()) {
						%>
						<button type="button" onclick="location.href='<%=request.getContextPath()%>/list.ms?currentPage=1'">&lt;&lt;</button>
	
	
						<!-- 이전 페이지 -->
						<button type="button" onclick="location.href='<%=request.getContextPath()%>/list.ms?currentPage=<%=currentPage - 1%>'" id="beforeBtn">&lt;</button>
						<!-- 이전 페이지 갈 작동 함수 필요 -->
						<script>
						if(<%=currentPage%> <= 1){
							var before = $('#beforeBtn');
							before.attr('disabled', 'true'); // 첫번째 페이지면 클릭이 안되게 한다. 
						}
					
					</script>
	
						<!-- 10개의 페이지 목록 -->
						<%
							for (int p = startPage; p <= endPage; p++) {
						%>
						<%
							if (p == currentPage) {
						%>
						<button id="choosen" type="button" disabled><%=p%></button>
						<%
							} else {
						%>
						<button id="numBtn" type="button" onclick="location.href='<%=request.getContextPath()%>/list.ms?currentPage=<%=p%>'"><%=p%></button>
						<%
							}
						%>
						<%
							}
						%>
						<!-- 다음 페이지 -->
						<button type="button" onclick="location.href='<%=request.getContextPath()%>/list.ms?currentPage=<%=currentPage + 1%>'"
							id="afterBtn">&gt;</button>
						<script>
						if(<%=currentPage%> >= <%=maxPage%>){
							var after = $("#afterBtn");
							after.attr('disabled', 'true');
						}
					</script>
	
						<!-- 맨 끝으로 -->
						<button type="button" onclick="location.href='<%=request.getContextPath()%>/list.ms?currentPage=<%=maxPage%>'">&gt;&gt;</button>
						<%
							}
						%>
					</div>
				</div>
				
			</form>
		</div>



	</div>




	<script>
	$(function(){
		$('tbody td').mouseenter(function(){
			$(this).parent().css({'background':'#ffe3e4', 'cursor':'pointer'});
		}).mouseout(function(){
			$(this).parent().css("background", "none");
		});			
		});
	
	
/* 		$('button').mouseenter(function(){
			$('button').css({'background':'#ffe3e4', 'cursor':'pointer'});
		}).mouseout(function(){
			$('button').parent().css("background", "none");
		}); */
		
		
		 function allCheck() {

			 var check = document.getElementsByName("check");
			 
		 	for(var i=0; i < check.length; i++) {
			 	 if(check[0].checked == true) {
			 		check[i].checked = true;
				 } else {
					 check[i].checked = false;
				   } 
				 
			 }
			 
		 }
		
		
		$(".check").click(function(){
			$('#aCheck').prop("checked", false);
		});
		
		
		/* 쪽지 가져오기 */
		$("td.mTitle").click(function(){
			var mNum = $(this).parent().children().children('.mNum').val();

			<%if (loginUser != null) {%>
				location.href='<%=request.getContextPath()%>/detail.ms?mNum=' + mNum;
			<%} else {%>
			 alert("로그인 후에 이용해주세요.");
			 
			 location.href='<%=request.getContextPath()%>/index.jsp';
	<%}%>
		});

		$('.deleteButton').click(function() {
			var checkArr = new Array();
			
			var checkBox = $("input:checkbox[name='check']").is(":checked");
			console.log(checkBox);
			
			
			if(checkBox){
				var confirm1 = confirm("정말 삭제하시겠습니까?");
				

				if (confirm1) {
					$('input[class="check"]:checked').each(function() {
						checkArr.push($(this).attr("data-mNum")); //체크한 쪽지 배열로 저장
						console.log(checkArr);
					});
				}

				jQuery.ajaxSettings.traditional = true;

				//ajax실행해서 배열로 값넘긴 후에 deleteM실행한 후에 다시 돌아온다. 
				$.ajax({
					url : 'deleteM.ms',
					type : 'post',
					data : {
						checkArr : checkArr
					}, //쉼표로 구분
					success : function(data) {
						alert(data);
						window.location.href = 'list.ms';

					}

				});
			} else {
				confirm1 = alert("삭제할 쪽지를 선택하세요.");
			}
		});
	</script>	 --%>
	
</body>
</html>

