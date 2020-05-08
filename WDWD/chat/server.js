var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
 
app.get('/', function (req, res) {
    res.send('<h1>안녕하세요 "/" 경로 입니다.</h1>');
});
 
io.on('connection', function (socket) {
    console.log('한명의 유저가 접속을 했습니다.');
    socket.on('disconnect', function () {
        console.log('한명의 유저가 접속해제를 했습니다.');
    });
 
    socket.on('chatArr', function (chatArr) {
        io.emit('chatArr', chatArr);
    });
    
    socket.on('addCount', function (board) {
        io.emit('addCount', board);
    });
    
    socket.on('chatCheck', function (data) {
        io.emit('chatCheck', data);
    });

    //로그인 체크
    socket.on('loginCheck', function (loginCheck) {
    	console.log("로그인 성공", loginCheck);
		io.emit('loginCheck', loginCheck);
    });
    //쪽지 알림	
    socket.on('alertArr', function (alertArr) {
    	io.emit('alertArr', alertArr);
    });
    
    socket.on('receiveMsg', function (data) {
    	io.emit('receiveMsg', data);
    });
    
    
    
});
 
http.listen(82, function () {
    console.log('listening on *:82');
});
