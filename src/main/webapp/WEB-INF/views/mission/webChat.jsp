<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Everyone Zipcock</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/chat.css" type="text/css">
</head>
<body>
<script>
//채팅에서 사용할 전역변수 생성
var messageWindow;	//대화내용이 출력될 엘리먼트
var inputMessage; 	//대화입력상자
var member_id;	   	//클라이언트 아이디
var webSocket;		//웹소켓 객체

//해당 문서의 로드가 완료되었을때
window.onload = function(){
	//전역변수로 선언한 엘리먼트의 DOM 객체를 얻어와서 저장
    messageWindow = document.getElementById("messageWindow");
    inputMessage = document.getElementById('inputMessage');
    member_id = document.getElementById('member_id').value; //클라이언트 아이디

    //스크롤바를 항상 아래로 내려주는 역할을 한다.
    messageWindow.scrollTop = messageWindow.scrollHeight;
    
    //웹소켓 객체 생성 (웹소켓 서버에서 @EndPoint로 선언된 요청명을 통해 생성한다.)
    webSocket = new WebSocket('ws://192.168.219.141:8081/zipcock/EchoServer.do');
    //webSocket = new WebSocket('ws://192.168.219.119:8081/websocket/EchoServer.do');
    
    //클라이언트가 접속했을때...
    webSocket.onopen = function(event){
    	wsOpen(event);
    };
    //서버가 클라이언트에게 메시지를 보냈을때...
    webSocket.onmessage = function(event){
    	wsMessage(event);
    };
    //클라이언트가 접속을 종료했을때..
    webSocket.onclose = function(event){
        wsClose(event);
    };
    //채팅중 에러가 발생했을때..
    webSocket.onerror = function(event){
        wsError(event);
    };
}

//접속했을때 호출됨.
function wsOpen(event){
    writeResponse("연결성공");
}

//서버가 클라이언트에게 메세지를 보냈을때 호출됨.
function wsMessage(event){
	/*
	메세지를 |(파이프) 기호로 분리하여 앞부분은 보낸사람, 뒷부분은 메세지로
	각각 변수에 저장한다.
	*/
    var message = event.data.split("|");
    var sender = message[0];
    var content = message[1];
    var msg;
    
    if(content == ""){
        //날라온 내용이 없으므로 아무것도 하지 않는다.
    }
    else{
    	//대화내용에 /가 포함되어 있다면 명령어로 판단한다.
        if(content.match("/")){
        	/*
        	현재 접속한 클라이언트의 아이디를 이용해서 본인한테 온 귓속말인지 판단한다.
        	아래 chat_id는 현재 페이지 로드시 접속한 아이디를 통해 
        	전역변수에 저장되어 있는 값이다.
        	따라서 받는 사람이 본인인 경우에만 대화내용을 디스플레이한다.
        	*/
            if(content.match(("/" + member_id))){
            	//명령어 부분을 '귓속말'로 변경한다.
                var temp = content.replace(("/" + member_id), "[귓속말]");
            	//메세지에 UI(디자인)을 적용하는 부분
            	var msg ='';
	        	msg += '<span class="anotherName">'
	        	msg += sender;
	        	msg += '</span>';
			    msg += '<div class="anotherMsg">';
			    msg += '<div class="msg" style="text-align:right;">'+temp+'</div>';
			    msg += '</div>';
                //msg = makeBalloon(sender, temp);
	        	//대화창에 대화내용을 출력한다.
                messageWindow.innerHTML += msg;
	        	//대화창의 스크롤바를 항상 아래로 내려준다.
                messageWindow.scrollTop = messageWindow.scrollHeight;
            }
        }
        else{
        	var msg ='';
        	msg += '<span class="anotherName">'
        	msg += sender;
        	msg += '</span>';
		    msg += '<div class="anotherMsg">';
		    msg += '<div class="msg" style="text-align:right;">'+content+'</div>';
		    msg += '</div>';
            messageWindow.innerHTML += msg;
            messageWindow.scrollTop = messageWindow.scrollHeight;
        }
    }
}
//접속이 종료되었을때
function wsClose(event){
    writeResponse("대화 종료");
}
//에러발생시 호출
function wsError(event){
    writeResponse("에러 발생");
    writeResponse(event.data);
}
//메세지를 출력하기 전 UI를 적용하는 함수
function makeBalloon(id, cont){
    var msg = '';
    msg += '<div>'+id +':'+cont+'</div>';
    return msg;
}

//클라이언트가 입력한 대화내용을 서버로 전송한다.
function sendMessage(){
	//웹소켓 서버로 전송시 파이프 기호를 통해 아이디와 내용을 구분한다.
    webSocket.send(member_id+'|'+inputMessage.value);

	//내가 보낸 대화내용을 대화창에 디스플레이 한다.
	//(서버로 메세지를 보내면 나를 제외한 모든 클라이언트에게 메세지를 전송한다.)
    var msg ='';
    msg += '<div class="myMsg">';
    msg += '<div class="msg" style="text-align:right;">'+inputMessage.value+'</div>';
    msg += '</div>';
    
    messageWindow.innerHTML += msg;
    inputMessage.value =""; //대화입력창을 비운다.
    messageWindow.scrollTop = messageWindow.scrollHeight; //스크롤바를 아래로 내린다.
}

//대화내용을 입력한 후 Enter키를 통해 메세지를 전송할 수 있다.
function enterkey(){
	//키보드를 눌렀다가 땠을때 키코드 값이 13일때만 전송함수를 호출한다.
    if(window.event.keyCode==13){
        sendMessage();
    }
}

function complete() {
	alert("집콕을 이용해주셔서 감사합니다^^ \n수행내역은 마이페이지에서 확인가능합니다.")
	opener.name = "parentPage";
    document.comForm.target = opener.name;
    document.comForm.action = "missionAction.do";
	
	document.comForm.submit();
	//window.opener.location.href="missionAction.do";
	self.close();

}
</script>

<div id="contentWrap">
 <input type="hidden" id="member_id" value="${param.member_id }" />
 <input type="hidden" id="chat_room" value="${param.chat_room }" />
    <div id="contentCover">
        <div id="chatWrap">
            <div id="chatHeader">Everyone Zipcock</div>
            <div id="messageWindow">
                <div class="anotherMsg">
                    <!-- <div class="msg">상대가보낸거</div> -->
                </div>
                <div class="myMsg">
                    <!-- <div class="msg" style="text-align:right;">내가쓴거</div> -->
                </div>
            </div> 
            <div id="chatForm">
                <input type="text" autocomplete="off" size="30" id="inputMessage" placeholder="메시지를 입력하세요" onkeyup="enterkey();" />
                <input type="button" id="sendBtn" onclick="sendMessage();" value="전송">
            </div>
            <form name="comForm" method="POST">
				<input type="hidden" name="mission_status" value="3" />
				<input type="hidden" name="mission_num" value="${param.chat_room }" />
				<c:if test="${ sessionScope.siteUserInfo.member_status eq 1}" >
			            <button class="btn btn-warning" onclick="complete();"  style="position: sticky; left: 90%; bottom: 2.75em;">
							심부름 완료
						</button>
				</c:if>
		            
			</form>		
        </div>
    </div>
</div>
</body>
</html>