<%@page import="mybatis.QBoardDTO"%>
<%@page import="mybatis.QBoardDAO"%>

<%@page import="board.MBoardDAO"%>
<%@page import="board.MBoardDTO"%>
<%@page import="utils.JSFunction"%>

<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 글쓰기 처리(insert)전 로그인 확인 -->    
<%
    //폼값 받기 
                String title = request.getParameter("title");
                String content = request.getParameter("content");
                String flag = request.getParameter("flag");
                String date = request.getParameter("postdate");

                //사용자가 입력한 폼값을 저장하기 위해 DTO객체 생성
                MBoardDTO dto = new MBoardDTO();
                QBoardDTO qdto = new QBoardDTO();
                dto.setMboard_title(title);
                dto.setMboard_content(content);
                qdto.setTitle(title);
                qdto.setContent(content);
                //dto.setFlag(flag);

                /* SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date postdate = new Date(sdf.parse(date).getTime());

                dto.setPostdate(postdate); */

                //세션영역에 저장된 회원 인증정보(아이디)를 가져와서 DTO에 저장한다. 
                dto.setMboard_id(session.getAttribute("Id").toString());
                qdto.setId(session.getAttribute("Id").toString());

                //DAO객체 생성 및 DB연결
                MBoardDAO dao = new MBoardDAO(application);
                QBoardDAO qdao = new QBoardDAO(application);


                /* 기존에 1개씩 입력하는 방식*/
                //dto객체를 매개변수로 전달하여 레코드 insert 처리
                if(flag.equals("notice")){
                
                	int iResult = dao.insertWrite(dto);
                	
                	dao.close();
                	
                	if(iResult == 1){
                		response.sendRedirect("member_list.jsp?flag="+flag);
                    } else {
                    	
                    	//실패한 경우에는 글쓰기 페이지로 이동한다. 즉 뒤로 이동한다.
                        JSFunction.alertBack("작성실패" , out);
                    }
                	
                }
                else if(flag.equals("qna")){
                	int iResult = qdao.insertWrite(qdto);
                	
					dao.close();
                	
                	if(iResult == 1){
                		response.sendRedirect("member_list.jsp?flag="+flag);
                    } else {
                    	
                    	//실패한 경우에는 글쓰기 페이지로 이동한다. 즉 뒤로 이동한다.
                        JSFunction.alertBack("작성실패" , out);
                    }
                	
                }

                
    %>