<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="utils.JSFunction"%>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//폼값 받기
String num = request.getParameter("num");
String flag = request.getParameter("flag");

//DTO객체와 DB연결 및 기존 게시물 가져오기
MemberDTO dto = new MemberDTO();
MemberDAO dao = new MemberDAO(application);

int delResult = 0;
	
//DTO객체에 일련번호를 저장한 후 DAO로 매개변수 전달
delResult = dao.deletePost(num);
//연결 해제
dao.close();

if(delResult == 1){
	//게시물 삭제에 성공하면 리스트로 이동한다.
	JSFunction.alertLocation("삭제되었습니다.", "member_list.jsp?flag="+flag, out);
}
else{
	JSFunction.alertBack("삭제에 실패하였습니다.", out);
}


%>