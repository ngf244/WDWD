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
        console.log('success');
    });
});
 
http.listen(82, function () {
    console.log('listening on *:82');
});
