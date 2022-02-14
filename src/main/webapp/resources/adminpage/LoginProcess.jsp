  
<%@page import="membership.MemberDTO"%>
<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//로그인 폼에서 사용자가 입력한 아이디, 패스워드 받기
String userId = request.getParameter("user_id"); 
String userPwd = request.getParameter("user_pw");

//application내장객체를 통해 web.xml에 저장된 오라클 접속정보를 읽어옴
String OracleDriver = application.getInitParameter("OracleDriver");
String OracleURL = application.getInitParameter("OracleURL");
String OracleId = application.getInitParameter("OracleId");
String OraclePwd = application.getInitParameter("OraclePwd");

//JDBC를 통해 오라클 접속
MemberDAO dao = new MemberDAO(OracleDriver,OracleURL, OracleId, OraclePwd);
//받아온 아이디, 패스워드를 매개변수로 getMemberDTO()호출. 회원인증 시도함.
MemberDTO memberDTO = dao.getMemberVO(userId, userPwd);
//자원해제
dao.close();

System.out.println(memberDTO.getMember_status());

if(memberDTO.getMember_id() != null && memberDTO.getMember_status() == 0)
{
	session.setAttribute("UserId", memberDTO.getMember_id());
	session.setAttribute("UserName", memberDTO.getMember_name());
	session.setAttribute("UserStatus", memberDTO.getMember_status());
	session.setAttribute("siteUserInfo", memberDTO);
	//로그인 페이지로 단순 이동한다.
	response.sendRedirect("index.jsp");	
}
else if(memberDTO.getMember_id() != null){
%>
		<script>
		alert("어드민이 아닙니다.");
		location.href="login.jsp";
		</script>
<%
}
else{
%>
	<script>
	alert("로그인에 실패하였습니다");
	location.href="login.jsp";
	</script>
	
<%
}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>