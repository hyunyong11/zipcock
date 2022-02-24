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
<%
String id = (String)session.getAttribute("Id");
 
if(session.getAttribute("Id") == null)  {
%>
<script>
	alert('로그인 후 신청가능합니다.');
	location.href="./memberLogin.do";
</script>
<%
}
else if((session.getAttribute("UserStatus").equals(3))){
%>	
<script>
	alert('현재 심부름 신청이 불가능합니다.');
	location.href="../zipcock.do";
</script>
<%
}
%>
<script>
//채팅창 오픈을 위한 함수
function chatWin(skin){
//채팅 아이디(대화명)가 입력되었는지 확인한다.
    var id = document.getElementById("member_id");
    
    //getElementById로 각각의 속성을 가져와서 띄워주고 잇다.
    //채팅창을 오픈한다.
    var room = document.getElementById("chat_room");
    if(skin == 'normal'){
        window.open("webChat.do?member_id=" + id.value + "&chat_room=" + room.value, 
        		room.value+"-"+id.value, "width=500, height=800");
       /*
       window.open(창의 URL(경로), 창의 이름, 창의 속성);
       ※창의 이름이 동일할 경우 여러개의 창을 열어도 하나의 창에서
       열리게 되므로 항상 다른 이름으로 설정해야 한다.
       */
    }
}
</script>
</head>
<body>
<div class="container">
	<h2>SPRING WebSocket 활용한 채팅</h2>
	<table border=1 cellpadding ="10" cellspacing="0">
		<tr>
			<td>채팅방</td>
			<td>
				<select id="chat_room">
					<%-- <option value="<%=mission_num%>">심부름 등록방</option> --%>
					<option value="myRoom1">심부름 등록방</option>
				</select>
			</td>
		</tr>
		<tr>
			<td>회원아이디</td>
			<td>
				<input type="text" id="member_id" value=<%=id %> />
			</td>
		</tr>
		<tr>
			<td colspan="2" style="text-align:center;">
				<button type="button" onclick="chatWin('normal');" class="btn btn-primary">채팅창열기</button>
			</td>
		</tr>
	</table>
</div>
</body>
</html>