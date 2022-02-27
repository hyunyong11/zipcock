
<%@page import="mybatis.QBoardDTO"%>
<%@page import="mybatis.QBoardDAO"%>
<%@page import="board.MBoardDTO"%>
<%@page import="board.MBoardDAO"%>
<%@page import="java.net.URLEncoder"%>

<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//DAO 객체 생성 및 DB연결
MBoardDAO dao = new MBoardDAO(application);
QBoardDAO qdao = new QBoardDAO(application);
 
//검색어가 있는 경우 파라미터를 저장하기 위한 Map컬렉션 생성
Map<String, Object> param = new HashMap<String, Object>();
//검색 파라미터를 request내장객체를 통해 얻어온다. 
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");
//검색어가 있는 경우에만..
if (searchWord != null) {
	//Map컬렉션에 파라미터 값을 추가한다. 
    param.put("searchField", searchField);//검색필드명(title, content등)
    param.put("searchWord", searchWord);//검색어
}

String flag = request.getParameter("flag"); //플래그 값여기서 받음 플래그 시작!!!
param.put("flag", flag);

//board테이블에 저장된 게시물의 갯수 카운트
int totalCount = dao.selectCount(param); 
int QtotalCount = qdao.selectCount(param); 



//*** 페이지 처리 end ***/


//출력할 레코드 추출
List<MBoardDTO> boardLists = dao.selectList(param); 
List<QBoardDTO> QboardLists = qdao.selectList(param); 
//자원 해제
dao.close();
qdao.close();
%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">

</head>

<body id="page-top">
	<% 
	if(session.getAttribute("Id") == null  || !(session.getAttribute("UserStatus").equals(0)))  {%>
	<script>
		alert('관리자 계정 로그인후에 작성가능합니다.');location.href="logout.jsp";
	</script>
	<%
	}
	%>
    <!-- Page Wrapper -->
    <div id="wrapper">

       <%@ include file="./commons/left.jsp" %>

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">
				<%@ include file="./commons/top.jsp" %>
                <!-- Topbar -->
                
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <%
                    if(flag==null || flag.equals("notice")) {
                    %>
                    <h1 class="h3 mb-2 text-gray-800">공지사항 게시판</h1>
                    <p class="mb-4">공지사항을 작성/수정할수있습니다.</p>
                    <%
                    }
                   else if(flag.equals("qna")){
                    %>
					<h1 class="h3 mb-2 text-gray-800">Q&A게시판</h1>
                    <p class="mb-4">Q&A게시판을 작성/수정할수있습니다.</p>
					<%
					}
					%>
					

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
 								
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                       	<tr> <!-- 꾸밀거면 여기서 꾸미자 -->
											<th>번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<th>조회수</th>
											
										</tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>번호</th>
                                            <th>제목</th>
                                            <th>작성자</th>
                                            <th>작성일</th>
                                            <th>조회수</th>
                                           
                                        </tr>
                                    </tfoot>                   			
	                                    <tbody>
	                                <%
				                    if(flag==null || flag.equals("notice")) {
				                    
	                                    if (boardLists.isEmpty()) {
	                                   // 게시물이 하나도 없을 때
	                                    %>
														
											<tr>
												<td colspan="5" align="center">
												    등록된 게시물이 없습니다^^*
												</td>
											</tr>
											        
										<%
      										}
										else {
											// 게시물이 있을 때 
											int virtualNum = 0;//게시물의 출력 번호
											int countNum = 0;
											for (MBoardDTO dto : boardLists)
											{
											//전체 레코드 수를 1씩 차감하면서 번호를 출력
												virtualNum = totalCount--;
      										%> 
									        <tr>
									        <td><%= virtualNum %></td>
									        <td class="text-start">
									        <a href="member_view.jsp?flag=<%= flag %>&num=<%= dto.getMboard_num() %>"><%= dto.getMboard_title() %></a>    
									        </td>
									        <td><%= dto.getMboard_id() %></td>
									        <td><%= dto.getMboard_date() %></td>
									        <td><%= dto.getMboard_count() %></td>
									        </tr>
									    <%
												
											}
										}
										%>  
	                               	<%
				                    }
				                    else if(flag.equals("qna")){
				                    	
				                    	if (QboardLists.isEmpty()) {
			                                   // 게시물이 하나도 없을 때
			                       	%>
	                                    				
											<tr>
												<td colspan="5" align="center">
												    등록된 게시물이 없습니다^^*
												</td>
											</tr>
											        
									<%
      									}
										else {
											// 게시물이 있을 때 
											int virtualNum = 0;//게시물의 출력 번호
											int countNum = 0;
											for (QBoardDTO dto : QboardLists)
											{
											//전체 레코드 수를 1씩 차감하면서 번호를 출력
												virtualNum = totalCount--;
      										%> 
									        <tr>
									        <td><%= virtualNum %></td>
									        <td class="text-start">
									        <a href="member_view.jsp?flag=<%= flag %>&num=<%= dto.getNum() %>"><%= dto.getTitle() %></a>    
									        </td>
									        <td><%= dto.getId() %></td>
									        <td><%= dto.getPostdate() %></td>
									        <td><%= dto.getContent() %></td>
									        </tr>
									    <%
											}
										}
									}
									%>  
	                                    
	                                    
	                                    
	                                   	</tbody>
                                </table>                            
	                            </div>
	                            <div class="col d-flex justify-content-end">
								<button type="button" class="btn btn-primary" onclick="location.href='member_write.jsp?flag=<%=flag%>';">글쓰기</button>
								<!-- <button type="button" class="btn btn-primary">수정하기</button>
								<button type="button" class="btn btn-success">삭제하기</button>
								<button type="button" class="btn btn-info">답글쓰기</button>
								<button type="button" class="btn btn-warning">리스트보기</button>
								<button type="submit" class="btn btn-danger">전송하기</button> -->
							</div>
                        </div>
                    </div>

                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.jsp">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>