<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	.cashChangeList{
		border: 1px solid lightgray;
		height: 940px;
		width: 80%;
		margin: auto;
	}

	.cashChangeListTopArea{height: 60px; background: #3DB7CC; color: white; font-size: 18pt; box-shadow: 2px 2px 5px black;}
	
	#cashChangeListText{font-weight: bolder; margin-top: 12px; padding-left: 40px; padding-right: 30px; display:inline-block;}

	#cashChangeListContent{
		height: 810px;
		margin-top: 30px;
	}
	
	/* 현재 캐쉬 현황 */
	#nowCash{
		margin: 30px;
		margin-left: 320px;
		margin-top: 40px;
		border: 1px solid black;
		width: 40%;
		height: 120px;
		box-shadow: 2px 2px 5px black;
		border-radius: 5px;
	}
	
	#nowCashText{
		font-size: 30pt;
		display: inline-block;
		margin: 35px;
		font-weight: bold;
	}

	#nowCashAmount{
		font-size: 30pt;
		display: inline-block;
		float: right;
		margin: 30px;
		margin-right: 50px;
		color: rgb(231, 76, 60);
		font-weight: bold;
	}	
	
	/* 캐쉬 변동 내역 게시판 */
	.cashChangeBoard{
		/* height: 850px;
		border: 1px solid black;
		margin: 30px;
		margin-top: 30px; */
		min-height:50px; padding-bottom: 50px;
		margin-left:auto; margin:auto; margin-top:50px;			
	}
	
/* 	.cashChangeListPaging{
		width: 500px;
		height: 120px;
		border: 1px solid black;
		margin: 20px;
	} */
	
	/* 게시판 테이블 css */
	#boardTable{text-align:center; margin: auto; width: 80%;}
	#boardTable th{border-bottom: 3px solid lightgray; background: #ececec; height: 50px; font-size: 13pt; border-bottom: 3px solid #036;}
	#boardTable td{border-bottom: 1px solid lightgray; height: 40px; font-size: 11pt;}	
	#boardTable tr:hover{
		background: rgba(161, 206, 244, 0.55);
	}
	
	/* 페이징 처리 css */
	.pagingCenter{
		text-align: center;
	}
	
	.pagination{
		display: inline-block;
	}

	.pagination a {
	  color: black;
	  float: left;
	  padding: 8px 16px;
	  text-decoration: none;
	  transition: background-color .3s;
	  border: 1px solid #ddd;
	}
	
	.pagination a.active {
	  background-color: rgb(52, 152, 219);
	  color: white;
	  border: 1px solid rgb(52, 152, 219);
	}
	
	.pagination a:hover:not(.active) {background-color: #ddd;}

	#cashChargeArea{
		width: 20%;
		min-height: 100px;
		/* background-color: rgba(135, 197, 238, 0.863); */
		text-align: center;
		font-size: large;
		position: fixed;
	}

	.comeon{
		margin-top: 50px;
		font-size: 50px; 
		font-weight: 900;
		text-shadow: 0px 0px 4px #ccc, 0px -5px 4px #ff3, 2px -10px 6px #fd3, -2px -15px 11px #f80, 2px -19px 18px #f20;
	}


	/* 충전 버튼 */
	#reqGifBtn {
	  position: relative;
	  background: none;
	  cursor: pointer;
	  border: 0;
	  padding: 0;
	  outline: 0;
	  font-family: 'Chewy', cursive;
	  color: crimson;
	}
	span {
	  display: block;
	}
	.shadow:before,
	.shadow:after {
	  content: '';
	  position: absolute;
	  top: 0;
	  left: 0;
	  width: 100%;
	  height: 100%;
	  border-radius: 100px;
	  background: red;
	  z-index: -2;
	  background: linear-gradient(to right, rgba(0,0,0,1) 0%,rgba(0,0,0,0) 100%);
	  opacity: .4;
	  transform: rotateX(0);
	  transform-origin: center 30px;
	  filter: blur(1px);
	  animation: shadowLeft 2s ease-in-out alternate infinite;
	  transition: all 1s cubic-bezier(0.875, -0.555, 0.190, 1.640);
	}
	@keyframes shadowLeft {
	  to {
	    opacity: .1;
	    filter: blur(5px);
	  }
	}
	.shadow:after {
	  background: linear-gradient(to left, rgba(0,0,0,1) 0%,rgba(0,0,0,0) 100%);
	  opacity: .1;
	  filter: blur(5px);
	  animation: shadowRight 2s ease-in-out alternate infinite;
	}
	@keyframes shadowRight {
	  to {
	    opacity: .4;
	    filter: blur(1px);
	  }
	}
	#reqGifBtn:focus .shadow:before,
	#reqGifBtn:focus .shadow:after {
	  transform: rotateX(180deg);
	}
	
	
	.vert {
	  transform: translateY(-20px);
	  animation: vert 1s ease-in-out alternate infinite;
	}
	@keyframes vert {
	  to {
	    transform: translateY(-25px);
	  }
	}
	.floating {
	  background-color: transparent;
	  -webkit-perspective: 800;
	  -webkit-transform-style: preserve-3d;
	  transform: rotateY(-3deg) skewY(-3deg);
	  animation: swing 2s cubic-bezier(0.420, 0.000, 0.580, 1.000) alternate infinite;
	}
	@keyframes swing {
	  to {
	    transform: rotateY(3deg) skewY(3deg);
	  }
	}
	.floating span {
	  display: block;
	  padding: 10px 0;
	  border-radius: 100px;
	  font-size: 25px;
	  background: rgb(187, 221, 243);
	  color: black;
	  transition: all 1s cubic-bezier(0.875, -0.555, 0.190, 1.640);
	  transform: translateY(-3px) translateZ(5px) rotateX(0);
	  width: 100%;
	}
	span.back {
	  position: absolute;
	  top: 0;
	  left: 0;
	  background: #aaa;
	  transform: translateY(3px) translateZ(-5px) rotateX(-180deg);
	}
	#reqGifBtn:focus .front {
	  transform: translateY(3px) translateZ(-5px) rotateX(180deg);
	  /* background: #aaa; */
	  background: aaa;
	  color: rgb(0, 0, 0);
	}
	
	#reqGifBtn:focus .back {
	  transform: translateY(-3px) translateZ(5px) rotateX(0);
	  background: yellow;
	}	
	#reqGifBtn{width: 60%; margin-top: 80px;}

	/* 버튼 끝 */

	#overWrite{
        width : 16%;
		min-height : 600px;
		float: left;
    }
	#cashChangeArea{
		width: 20%;
		min-height: 100px;
		/* background-color: rgba(135, 197, 238, 0.863); */
		text-align: center;
		font-size: large;
		position: fixed;
		right: 1%;
	}

	.inputCashtoChange{
		margin-top: 50px;
		font-size: larger; 
		font-weight: 600;
		text-shadow: 0px 0px 4px rgb(218, 223, 231), 0px -5px 4px #ff3, 2px -10px 6px rgb(104, 196, 202), -2px -15px 11px rgb(146, 118, 192), 2px -19px 18px rgb(79, 49, 161);
	}

	input[type=number]{
		height: 50px;
        font-size: x-large;
        font-weight: bolder;
        width: 80%;
        text-align: center;
		text-shadow: 0px 0px 4px rgb(143, 148, 80);
	}

	input[type=number]::-webkit-inner-spin-button {
        width: 30px;
        height: 50px;
    }

	


</style>
<title>Cash 내역</title>
</head>
<body>
	<jsp:include page="../common/mainHeader.jsp"/>
	<section>
		<div id="left-side">
			<div id="cashChargeArea">
				<span class="comeon">충전은 이쪽이다<br> 애송이!</span>
				<br><br>
				<fieldset>
					<legend>결제 수단 선택</legend>
						<label for="card">카드 : </label><input type="radio" value="card" id="card" name="way">&nbsp;
						<label for="phone">핸드폰 : </label><input type="radio" value="phone" id="phone" name="way">&nbsp;
						<label for="trans">계좌이체 : </label><input type="radio" value="trans" id="trans" name="way">&nbsp;<br>
						<label for="vbank">가상계좌 : </label><input type="radio" value="vbank" id="vbank" name="way">&nbsp;
						<label for="samsung">삼성페이 : </label><input type="radio" value="samsung" id="samsung" name="way">&nbsp;
						<label for="kpay">kPay : </label><input type="radio" value="kpay" id="kpay" name="way">&nbsp;<br>
						<label for="cultureland">문화상품권 : </label><input type="radio" value="cultureland" id="cultureland" name="way">&nbsp;
						<label for="smartculture">스마트문상 : </label><input type="radio" value="smartculture" id="smartculture" name="way">&nbsp;<br>
						<label for="happymoney">해피머니 : </label><input type="radio" value="happymoney" id="happymoney" name="way">&nbsp;
						<label for="booknlife">도서문상 : </label><input type="radio" value="booknlife" id="booknlife" name="way">
				</fieldset>
				<button id="reqGifBtn" class="moveBtn charge">
					<span class="shadow">
					  <span class="vert">
						<span class="floating">
						  <span class="front">결제! 가즈아~</span>
						  <span class="back">싼다~</span>
						</span>
					  </span>
					</span>
				</button>
			</div>
		</div>
		<script>
			window.onload = function name(params) {
				IMP.init('imp66715145');
			}

			$('.charge').click(function () {
				var way = $(":input:radio[name=way]:checked").val();
				if(typeof way == "undefined"){
					swal("뭘로하게?", "충전 수단을 선택해 주세요", "error");
					return false;
				}
				chargeAmountInput(way);
			})

			function chargeAmountInput(way) {
				swal({
					title: "How much?",
					text: '결제할 금액을 넣어주세요',
					icon: "info",
					content: "input",
					buttons : {
                              	cancle : {
                                 	text : '취소',
                                 	value : false
                             	},
                              	confirm : {
                                 	text : '입력완료',
                                 	value : true
                              	}
                           	}
					})
					.then(amount => {
						if(amount == false || amount == null){
							return false;
						}
						
						var regexp = /^[0-9]*$/
						if( !regexp.test(amount) ) {
							swal("Idiot?", "숫자만 넣는게 상식 아니겠니?", "error");
						} else {
						chargeCash(way, amount);
						}
					})
			}

			function chargeCash(way, amount) {
				IMP.request_pay({
					pg : 'html5_inicis',
					pay_method : way,
					merchant_uid : 'merchant_' + new Date().getTime(),
					name : '주문명:결제테스트',
					amount : amount,
					buyer_email : '${loginUser.email}',
					buyer_name : '${loginUser.userId}',
					buyer_tel : '${loginUser.phone}',
					buyer_addr : '서울특별시 강남구 삼성동',
					buyer_postcode : '123-456'
				}, function(rsp) {
					if ( rsp.success ) {
						$.ajax({
							url : "insertCP.my",
							data : {pcContent : '캐쉬 충전', pcAmount : rsp.paid_amount, pcDiv : 'C', pcId : '${loginUser.userId}'},
							type : "POST",
							success : function (data) {
								if(data == 1){
									var msg = '결제가 완료되었습니다.';
									// msg += '고유ID : ' + rsp.imp_uid;
									// msg += '상점 거래ID : ' + rsp.merchant_uid;
									msg += '\n결제자 : ' +  '${loginUser.userId}';
									msg += '\n결제 금액 : ' + rsp.paid_amount;
									swalOk(msg);

								} else {
									console.log("ajax insertCash 실패");
								}
							}
						})
					} else {
						var msg = '결제에 실패하였습니다.';
						msg += '\n에러내용 : ' + rsp.error_msg;
						swalOk(msg);
					}
				});
			}

			function swalOk(msg) {
				swal("Result", msg, "info")
				.then((okclick)=>{
					if(okclick){
						location.reload();
					}
				})
			}


		</script>
		<div id="main">
			<div class="cashChangeList">
				<div class="cashChangeListTopArea">
					<div id="cashChangeListText">Cash 변동내역</div>	
				</div>
				<div id="cashChangeListContent">
					<div id="nowCash">
						<div id="nowCashText">Cash</div>
						<div id="nowCashAmount"><fmt:formatNumber value="${ member.cash }"/></div>
						<div style="clear: both;"></div>
					</div>
					<div class="cashChangeBoard">
						<table id="boardTable">
							<tr>
								<th style="width: 40%;">변동 유형</th>
								<th style="width: 25%">금액</th>
								<th style="width: 30%">날짜</th>
							</tr>
	
							<c:forEach var="pc" items="${ pcList }">
							<c:if test="${ pc.pcDiv == 'C' }">
							<tr>
								<td>${ pc.pcContent }</td>
								<td>
									<span class="amount">
										${ pc.pcAmount }
									</span>
								</td>
								<td>${ pc.pcDate }</td>							
							</tr>
							</c:if>									
							</c:forEach>							
							
						</table>						
					</div>
					
					<!-- 페이징 처리 -->
					
					<!-- [이전] -->
					<div class="pagingCenter">
						<div class="pagination">
						<c:if test="${ pi.currentPage <= 1 }">
							<a href=""> &laquo; </a>
						</c:if>
						<c:if test="${ pi.currentPage > 1 }">
							<c:url var="before" value="cashChange.my">
								<c:param name="page" value="${ pi.currentPage - 1 }"/>
								<c:param name="userId" value="${ member.userId }"/>
							</c:url>
						<a href="${ before }"> &laquo; </a>
						</c:if>
					
					<!-- 페이지 -->	
					<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
						<c:if test="${ p eq pi.currentPage }">
							<a href="" class="active"> ${ p } </a>
						</c:if>
						
						<c:if test="${ p ne pi.currentPage }">
							<c:url var="pagination" value="cashChange.my">
								<c:param name="page" value="${ p }"/>
								<c:param name="userId" value="${ member.userId }"/>
							</c:url>
							<a href="${ pagination }">${ p }</a> &nbsp;
						</c:if>
					</c:forEach>	
					
					<!-- [다음] -->
					<c:if test="${ pi.currentPage >= pi.maxPage }">
						<a href=""> &raquo; </a>
					</c:if>
					<c:if test="${ pi.currentPage < pi.maxPage }">
						<c:url var="after" value="cashChange.my">
							<c:param name="page" value="${ pi.currentPage + 1 }"/>
							<c:param name="userId" value="${ member.userId }"/>
						</c:url> 
						<a href="${ after }"> &raquo; </a>
					</c:if>		
						
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="overWrite">
			<div id="cashChangeArea">
				<span class="comeon">환전은 이쪽이다<br> 애송이!</span>
				<span class="inputCashtoChange">환전할 금액을 입력해라!<br>수수료는 10%!!</span><br>
				<input type="number" max="${loginUser.cash}" step="100">
				<br>
				<button id="reqGifBtn" class="moveBtn change">
					<span class="shadow">
					  <span class="vert">
						<span class="floating">
						  <span class="front">환전! 가즈아~</span>
						  <span class="back">싼다~</span>
						</span>
					  </span>
					</span>
				</button>
			</div>
			<script>
				$('.change').click(function () {
					var cashToChange = Number($('input[type=number]').val());
					var havingCash = Number($('#nowCashAmount').text());
					

					console.log(typeof cashToChange);
					console.log(typeof havingCash);

					if(cashToChange > havingCash){
						swal('너 그만큼 돈 없다 ㅎㅎ');
						return false;
					}

					swal({
							title: "Are you sure?",
							text: "정말 환전하시겠습니까?",
							icon: "warning",
							buttons: true,
							dangerMode: true,
						})
						.then((willDelete) => {
							if (willDelete) {
								var content = "환전요청";
								insertCash(-cashToChange, content);
								swalOk("환전 요청 완료했습니다. 처리까지 몇분의 시간이 소요될 수 있슴돠");
							} else {
								return false;
							}
							});
				})

				function swalOk(msg) {
				swal("Result", msg, "info")
				.then((okclick)=>{
					if(okclick){
						location.reload();
					}
				})
				}
			</script>
		</div>
	</section>
	<jsp:include page="../common/footer.jsp"/>
</body>
</html>