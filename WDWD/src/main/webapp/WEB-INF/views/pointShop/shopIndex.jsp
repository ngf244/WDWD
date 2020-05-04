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
        margin-left:120px;
        display: inline-block;

    }

    .card_all{
        text-align: center;
        display: block;
    }

    .con_all_wrap{
        display:block;
        text-align: center;
    }
    .card_all_link{
        margin-left:5px;
        margin-right:5px;
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
                    <a class="card_pro_link" href="detailShop.ps?pdId=psId">
                        <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1" width="330" height="330" class="cards_wrap_images"></span>
                        <div class="cards_conWrap">
                            <span font-size="16" class="cards_Title">문화상품권 5천원권</span>
                            <div font-size="22" class="cards_Price">20,000원</div>
                            <div class="reviewsButton"><button class="upReviewsButton">좋아요</button></div>
                        </div>
                    </a>
                </li>
                <li class="card_pro">
                    <a class="card_pro_link" href="detailShop.ps?pdId=psId">
                        <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1"width="330" height="330" class="cards_wrap_images"></span>
                        <div class="cards_conWrap">
                            <div font-size="16" class="cards_Title">문화상품권 5천원권</div>
                            <div font-size="22" class="cards_Price">20,000원</div>
                            <div class="reviewsButton"><button class="upReviewsButton">좋아요</button></div>
                        </div>
                    </a>
                </li>
                <li class="card_pro">
                    <a class="card_pro_link" href="detailShop.ps?pdId=psId">
                        <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1" width="330" height="330" class="cards_wrap_images"></span>
                        <div class="cards_conWrap">
                            <div font-size="16" class="cards_Title">문화상품권 5천원권</div>
                            <div font-size="22" class="cards_Price">20,000원</div>
                            <div class="reviewsButton"><button class="upReviewsButton" onclick="reviewButton();">좋아요</button></div>
                        </div>
                    </a>
                </li>
            </ul>
            <div class="con_all_wrap">
                <p>모든 상폼을 한 눈에</p>
                <h3>지금은 판매중</h3>
                <ul class="card_all">
                    <li class="card_all_link">
                        <a class="card_all_link" href="detailShop.ps?pdId=psId">
                            <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1"width="240" height="200" class="cards_wrap_images"></span>
                            <div class="cards_all_conWrap">
                                <div font-size="16" class="cards_all_Title">문화상품권 5천원권</div>
                                <div font-size="22" class="cards_all_Price">20,000원</div>
                                <div class="reviewsButton"><button class="upReviewsButton">좋아요</button></div>
                            </div>
                        </a>
                    </li>
                    <li class="card_all_link">
                        <a class="card_all_link" href="detailShop.ps?pdId=psId">
                            <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1"width="240" height="200" class="cards_wrap_images"></span>
                            <div class="cards_all_conWrap">
                                <div font-size="16" class="cards_all_Title">문화상품권 5천원권</div>
                                <div font-size="22" class="cards_all_Price">20,000원</div>
                                <div class="reviewsButton"><button class="upReviewsButton">좋아요</button></div>
                            </div>
                        </a>
                    </li>
                    <li class="card_all_link">
                        <a class="card_all_link" href="detailShop.ps?pdId=psId">
                            <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1"width="240" height="200" class="cards_wrap_images"></span>
                            <div class="cards_all_conWrap">
                                <div font-size="16" class="cards_all_Title">문화상품권 5천원권</div>
                                <div font-size="22" class="cards_all_Price">20,000원</div>
                                <div class="reviewsButton"><button class="upReviewsButton">좋아요</button></div>
                            </div>
                        </a>
                    </li>
                    <li class="card_all_link">
                        <a class="card_all_link" href="detailShop.ps?pdId=psId">
                            <span class="cards_wrap_images"><img src="${ contextPath }/resources/images/pointShop/product1.png" alt="제품명_1"width="240" height="200" class="cards_wrap_images"></span>
                            <div class="cards_all_conWrap">
                                <div font-size="16" class="cards_all_Title">문화상품권 5천원권</div>
                                <div font-size="22" class="cards_all_Price">20,000원</div>
                                <div class="reviewsButton"><button class="upReviewsButton">좋아요</button></div>
                            </div>
                        </a>
                    </li>
    
                </ul>
    
    
    
            </div>
           
        </article>


        <script>
            function reviewButton(){
                alert("hi");
            }

        </script>

          
    </div>
</section>

<jsp:include page="../common/footer.jsp"/>
</body>
</html>