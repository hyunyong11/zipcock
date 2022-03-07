 
<%@page import="mybatis.QBoardDTO"%>
<%@page import="mybatis.QBoardDAO"%>

<%@page import="board.MBoardDAO"%>
<%@page import="board.MBoardDTO"%>
<%@page import="utils.JSFunction"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//수정페이지에서 전송한 폼값 받기
String num = request.getParameter("num");
String flag = request.getParameter("flag");
String title = request.getParameter("title");
String content = request.getParameter("content");

//DTO객체에 입력값 추가하기
MBoardDTO dto = new MBoardDTO();
dto.setMboard_num(Integer.parseInt(num));
dto.setMboard_flag(flag);
dto.setMboard_title(title);
dto.setMboard_content(content);

QBoardDTO qdto = new QBoardDTO(); 
qdto.setNum(num); //(Integer.parseInt(num));
qdto.setTitle(title);
qdto.setContent(content);

//DB연결
MBoardDAO dao = new MBoardDAO(application);
QBoardDAO qdao = new QBoardDAO(application); 

if(flag.equals("notice")){
	int affected = dao.updateEdit(dto);
	//자원해제
	dao.close();

	if(affected == 1){
		//수정에 성공한 경우에는 수정된 내용을 확인하기 위해 상세보기 페이지로 이동
		response.sendRedirect("member_view.jsp?flag=" + flag + "&num=" +num);
	}
	else {
		//실패한 경우에는 뒤로이동
		JSFunction.alertBack("수정하기에 실패하였습니다.", out);
	}
}
else if(flag.equals("qna")){
	//수정처리
	int affected = qdao.updateEdit(qdto);
	//자원해제
	qdao.close();
	
	if(affected == 1){
		//수정에 성공한 경우에는 수정된 내용을 확인하기 위해 상세보기 페이지로 이동
		response.sendRedirect("member_view.jsp?flag=" + flag + "&num=" +num);
	}
	else {
		//실패한 경우에는 뒤로이동
		JSFunction.alertBack("수정하기에 실패하였습니다.", out);
	}
}
%>