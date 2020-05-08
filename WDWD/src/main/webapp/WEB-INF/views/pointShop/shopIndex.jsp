<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
    @import url(https://fonts.googleapis.com/css?family=Open+Sans:400);
    body {
         font-family: "Noto Sans KR", sans-serif;
      }
    a:link{text-decoration: none; }
    a:visited{text-decoration: none;}
    a:hover{text-decoration: none;}
    a:active{text-decoration: none;}
    ul{
        list-style:none;    
    }
    li {
        border: 0;
        margin: 0 30px 0 0;
        padding: 0 0 0 0;
        float: left;
        box-shadow: rgba(0, 0, 0, 0.2) 0px 5px 13px;
        overflow: hidden;
        border-radius: 6px;
    }

    li.card_all_link{
        box-shadow: none;
    }

    .con_main{
        width: 90%;
        text-align: center;
    }
    
    .con_main_wrap{
        display: inline-block;
    }

    .cards_wrap_images{
        background-color: rgb(250,250,250);
    }

    .card_products{
        display: inline-block;
    }
    .cards_conWrap{
        text-align: left;
        margin-top: 10px;
        margin-left: 20px;
    }
    .card_pro{
        width: 330px;
        height: 425px;
        margin-bottom: 20px;
    }
    
    .cards_Title{
        display: block;
        font-size:17px;
        color: black;
    }
    .cards_Price{
        display: inline-block;
        font-size: 22px;
        color: rgb(255, 68, 127);
        text-decoration: none;
    }
    .reviewsButton{
        margin-left:30%;
        display: inline-block;

    }

    #pointToCashArea{
        width: 94%;
        margin-left: 3%;
        display: grid;
        text-align: center;
        grid-template-columns: 36% 14% 36% 14%;
        box-shadow: 5px 5px 5px 5px gray;
    }

    #pointToCashArea input{
        height: 50px;
        font-size: larger;
        font-weight: bolder;
        width: 100%;
        text-align: center;
    }
    
    input[type=number]::-webkit-inner-spin-button {
        width: 30px;
        height: 50px;
    }

    .pcArea1{
        grid-column: 1/5;
        color: brown;
        font-weight: bold;
        font-size: larger;
        text-align: end;
        padding-right: 3%;
        padding-top: 10px;
        padding-bottom: 30px;
    }
    .pcArea2{
        grid-column: 1/3;
        padding-bottom: 10px;
        padding-right: 15%;
        font-weight: bold;
    }
    .pcArea3{
        grid-column: 3/5;
        padding-right: 15%;
        font-weight: bold;
    }
    .pcArea4{
        padding-left: 10%;
        padding-bottom: 10px;
    }
    .pcArea5{
        line-height: 50px;
        font-weight: bold;
        font-size: large;
        padding-left: 35%;
    }
    .pcArea6{
        padding-left: 10%;
    }
    .pcArea7{
        line-height: 50px;
    }
    .pcArea7 button{
        width: 60%;
        height: 50px;
    }
	.upReviewsButton{
		cursor: pointer;
	}
	#goChange{
		cursor: pointer;
	}
	
</style>

<body>

<jsp:include page="../common/mainHeader.jsp"/>

<section>
    <div id="left-side" style="background-color: yellow;"></div>
    <div id="shopContent" class="con_main" style="background: white">
        <article class="con_main_wrap">
            <ul class="card_products">
                <li class="card_pro">
                    <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1" width="330" height="330" class="cards_wrap_images"></span>
                    <div class="cards_conWrap">
                        <span font-size="16" class="cards_Title">문화상품권 5,000권</span>
                        <div font-size="22" class="cards_Price">5,000point</div>
                        <div class="reviewsButton"><button class="upReviewsButton" onclick="buyWithPoint(5000);">구매하기</button></div>
                    </div>
                </li>
                <li class="card_pro">
                    <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product2.png" alt="제품명_2"width="330" height="330" class="cards_wrap_images"></span>
                    <div class="cards_conWrap">
                        <div font-size="16" class="cards_Title">문화상품권 10,000권</div>
                        <div font-size="22" class="cards_Price">9,500point</div>
                        <div class="reviewsButton"><button class="upReviewsButton" onclick="buyWithPoint(9500);">구매하기</button></div>
                    </div>
                </li>
                <li class="card_pro">
                    <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product3.png" alt="제품명_3" width="330" height="330" class="cards_wrap_images"></span>
                    <div class="cards_conWrap">
                        <div font-size="16" class="cards_Title">문화상품권 50,000권</div>
                        <div font-size="22" class="cards_Price">45,000point</div>
                        <div class="reviewsButton"><button class="upReviewsButton" onclick="buyWithPoint(45000);">구매하기</button></div>
                    </div>
                </li>
                <br><br><br><br><br><br>
                <li class="card_pro">
                    <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product4.png" alt="제품명_1" width="330" height="330" class="cards_wrap_images"></span>
                    <div class="cards_conWrap">
                        <span font-size="16" class="cards_Title">CGV 영화관람권</span>
                        <div font-size="22" class="cards_Price">10,000point</div>
                        <div class="reviewsButton"><button class="upReviewsButton" onclick="buyWithPoint(10000);">구매하기</button></div>
                    </div>
                </li>
                <li class="card_pro">
                    <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product5.png" alt="제품명_2"width="330" height="330" class="cards_wrap_images"></span>
                    <div class="cards_conWrap">
                        <div font-size="16" class="cards_Title">롯데시네마 영화관람권</div>
                        <div font-size="22" class="cards_Price">11,000point</div>
                        <div class="reviewsButton"><button class="upReviewsButton" onclick="buyWithPoint(11000);">구매하기</button></div>
                    </div>
                </li>
                <li class="card_pro">
                    <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product6.png" alt="제품명_3" width="330" height="330" class="cards_wrap_images"></span>
                    <div class="cards_conWrap">
                        <div font-size="16" class="cards_Title">지각 2분 면제권</div>
                        <div font-size="22" class="cards_Price">30,000point</div>
                        <div class="reviewsButton"><button class="upReviewsButton" onclick="buyWithPoint(30000);">구매하기</button></div>
                    </div>
                </li>
            </ul>
            <br><br><br>
            <div class="con_all_wrap">
                <h3>포인트 캐쉬 전환</h3>
                <p>10% 차감 후 캐쉬로 전환됩니다. 100원단위 이하는 절사됩니다</p>

                <div id="pointToCashArea">
                    <div class="pcArea1">보 유  P O I N T : <span class="havingPoint">${mem.point}</span></div>
                    <div class="pcArea2">전환할 POINT</div>
                    <div class="pcArea3">전환될 CASH</div>
                    <div class="pcArea4"><input type="number" id="inputPoint" step="100" min="0" max="${mem.point}"></div>
                    <div class="pcArea5">--></div>
                    <div class="pcArea6"><input type="number" id="inputCash" readonly></div>
                    <div class="pcArea7"><button id="goChange">전환</button></div>
                </div>
            </div>
            <br><br>
            <script>
                function buyWithPoint(amount) {
                    if('${mem.point}' < amount){
                        swal("포인트가 부족합니다");
                        return false;
                    }

                    swal({
                    title: "이메일 주소 체크",
					text: '이메일 주소로 pin번호가 전송됩니다. 발송될 주소를 확인해주세요 \n!!전송 완료 메세지가 뜰때까지 기다려주세요!!',
					icon: "info",
					content: {
                        element: 'input',
                        attributes: {
                        defaultValue: '${mem.email}',
                        }
                    },
					buttons : {
                              	cancle : {
                                 	text : '취소',
                                 	value : "취소"
                             	},
                              	confirm : {
                                 	text : '입력완료',
                                 	value : true
                              	}
                           	}
					})
					.then((email) => {
                        if(email == ""){
                            email = '${mem.email}';
                        } else if (email == "취소" || email==null){
                            return false;
                        }
                        console.log(email);
                        console.log('false인데 여기까지오면 망하는거');
						
						var regExp = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
						if( !regExp.test(email) ) {
							swal("Check address", "유효한 이메일 주소가 아닙니다", "error");
						} else {
						    buyWithPoint2(amount, email);
						}
					})
                }

                function buyWithPoint2(amount, email) {
                    $.ajax({
                        url : "insertCP.my",
                        data : {pcContent : '포인트 전환(포인트 차감)', pcAmount : -amount, pcDiv : 'P', pcId : '${loginUser.userId}'},
                        type : "POST",
                        success : function (data) {
                            if(data == 1){
                                console.log('포인트 차감 성공');
                                buyWithPoint3(email);
                            } else {
                                console.log("ajax point 차감 실패");
                            }
                        }
                    })
                }

                function buyWithPoint3(email) {
                    $.ajax({
                        url : "sendPIN.ps",
                        data : {email : email},
                        type : "POST",
                        success : function (data) {
                            if(data == 1){
                                console.log('메일 보내기 성공');
                                msg = "PIN번호 발송 성공"
                                swalOk(msg);
                            } else {
                                console.log("메일 보내기 실패");
                            }
                        }
                    })
                }

                $('#inputPoint').on('input', function() {
                    point = $(this).val();
                    havingPoint = $('.havingPoint').text();
                    cash = Math.floor((Math.floor(point * 0.9))/100)*100;
                    $('#inputCash').val(cash);
                })

                $('#goChange').click(function name(params) {
                    if(point > havingPoint){
                        swal("가진 포인트보다 많이넣었어");
                        return back;
                    }

                    var check = false;
                    $.ajax({
                        url : "insertCP.my",
                        data : {pcContent : '포인트 전환(포인트 차감)', pcAmount : -point, pcDiv : 'P', pcId : '${loginUser.userId}'},
                        type : "POST",
                        success : function (data) {
                            if(data == 1){
                                console.log('포인트 차감 성공');
                                check = true;
                            } else {
                                console.log("ajax point 차감 실패");
                            }
                        }
                    })

                    $.ajax({
                        url : "insertCP.my",
                        data : {pcContent : '포인트 전환(캐쉬입금)', pcAmount : cash, pcDiv : 'C', pcId : '${loginUser.userId}'},
                        type : "POST",
                        success : function (data) {
                            if(data == 1){
                                console.log('캐쉬 증가 성공');
                                var msg = '전환 완료되었습니다.';
                                swalOk(msg);
                            } else {
                                console.log("ajax cash 입금 실패");
                            }
                        }
                    })
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
        </article>
    </div>
</section>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>