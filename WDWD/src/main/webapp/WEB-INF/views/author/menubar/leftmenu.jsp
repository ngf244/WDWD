<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .authorMenu {
        width: 100%;
    }
    .authorFixed {
        position: fixed;
        top: 0px;
        left: 7px;
        transition: 1s ease;
    }
    .authorMenuBtn{
        width: 80%;
        margin-left: 10%;
        height: 60px;
        background-color: rgb(52, 152, 219);
        cursor: pointer;
        border: outset;
        font-size: large;
        margin-top: 60px;
    }
    .authorMenuBtn:hover{
        background-color: blue;
    }
</style>
</head>
<body>
    <div class="authorMenu">
        <button class="authorMenuBtn" style="margin-top: 10px;" id="authorTrade">분쟁 처리<br>요청 목록</button>
        <button class="authorMenuBtn" id="ban">신고, 제재<br>유저리스트</button>
        <button class="authorMenuBtn" id="unban">정지 해제</button>
        <button class="authorMenuBtn" id="changeRequest">환전 요청</button>
    </div>
</body>
<script>
    $( document ).ready( function() {
    var jbOffset = $( '.authorMenu' ).offset();
    // console.log(jbOffset);
    $( window ).scroll( function() {
        // console.log($(document).scrollTop());
        if ( $( document ).scrollTop() > jbOffset.top ) {
        $( '#left-side' ).addClass( 'authorFixed' );
        $('#main').css('margin-left','14%');
        }
        else {
        $( '#left-side' ).removeClass( 'authorFixed' );
        $('#main').css('margin-left','');
        }
    });
    } );
    
    $('#authorTrade').click(function(){
    	location.href = "trade.au";
    })
    $('#ban').click(function(){
    	location.href = "ban.au";
    })
    $('#unban').click(function(){
    	location.href = "unban.au";
    })
    $('#changeRequest').click(function(){
    	location.href = "changeRequest.au";
    })
</script>
</html>