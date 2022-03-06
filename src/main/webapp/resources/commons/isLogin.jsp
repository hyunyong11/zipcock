<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
if(session.getAttribute("Id") == null)  {
%>
<script>
	alert('로그인 먼저 해주세요^^');
	location.href="./memberLogin.do";
</script>
<%
}
else if((session.getAttribute("UserStatus").equals(3))){
%>	
<script>
	alert('현재 접근이 불가능한 상태입니다.');
	location.href="./zipcock.do";
</script>
<%
}
%>
</head>

