 
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="utils.JSFunction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//수정페이지에서 전송한 폼값 받
String id = request.getParameter("id");
String type = request.getParameter(id);



//DTO객체에 입력값 추가하
MemberDTO dto = new MemberDTO();
dto.setMember_id(id);
dto.setMember_status(Integer.parseInt(type));


//DB연
MemberDAO dao = new MemberDAO(application);
//수정처
int affected = dao.updateType(dto);
//자원 해제
dao.close();

if (affected ==1){
	//수정에 성공한 경우에는 수정된내용을 확인하기 위해 상세보기 페이지로 이동
	JSFunction.alertBack(id+"권한 수정 성공!", out);
}
else {
	JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}

%>
