<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container">
	<h2>Web Notification01</h2>
	<button onclick="calculate();">버튼을 누르면 1초 후에 WebNotification이 뜹니다.</button>
	 <script>
        window.onload = function(){
        	//현재 웹브라우저가 웹노티를 지원하는지 확인한다.
            if(window.Notification){
            	//알림에 관한 권한 요청 알림창 띄움
                Notification.requestPermission();
            }
            else{
                alert("웹노티를 지원하지 않습니다.");
            }
        }

        //버튼 클릭시 1초 후 notify() 메서드를 호출한다.
        function calculate(){
            setTimeout(function(){
                notify();
            }, 1000);
        }

        //실행시 권한을 확인하여 허용되지 않았다면 경고창 띄움
        function notify(){
            if(Notification.permission !== "granted"){
                alert("웹노티를 지원하지 않습니다.");
            }
            else{
            	console.log("웹노티 클릭");
            	//Notification 객체를 통해 제목, 내용, 아이콘을 설정한 후 표시한다.
                var notification = new Notification(
                    'Title 입니다.',
                    {
                        icon: 'http://cfile201.uf.daum.net/image/235BFD3F5937AC17164572',
                        body: '여긴내용입니다. 클릭하면 KOSMO로 이동합니다.'
                    }
                );
            	//알림창을 클릭했을때 이동할 URL을 이벤트 핸들러에 등록한다.
                notification.onclick = function(){
                    window.open('http://www.ikosmo.co.kr')
                };
            }
        }
    </script>
    
    <ul>
		<li>웹노티 Browser compatibility -> https://developer.mozilla.org/ko/docs/Web/API/notification</li>
	  	<li>Chrome, Firefox지원됨. IE지원안됨</li>
	</ul>

</div>
</body>
</html>