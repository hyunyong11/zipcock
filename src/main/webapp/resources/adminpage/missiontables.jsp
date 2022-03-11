<%@page import="mission.MissionDTO"%>
<%@page import="mission.MissionDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

MissionDAO dao = new MissionDAO(application);
Map<String, Object> param = new HashMap<String, Object>();

String flag = request.getParameter("flag"); //플래그 값여기서 받음 플래그 시작!!!
param.put("flag", flag);

List<MissionDTO> boardLists = dao.getmission(param);
List<MissionDTO> boardLists1 = dao.getmission1(param); 
List<MissionDTO> boardLists2 = dao.getmission2(param);
dao.close();
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

	<% if(session.getAttribute("Id") == null || !(session.getAttribute("UserStatus").equals(0)))  {%>
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
                    <h1 class="h3 mb-2 text-gray-800">심부름 목록</h1>
                    <p class="mb-4">심부름 목록입니다. </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">심부름 항목</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
 								
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <thead>
                                        <tr>
                                            <th>심부름 번호</th>
                                            <th>신청자 이름</th>
                                            <th>심부름 항목</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>예상소요시간</th>
                                            <th>비용</th>
                                            <th>매칭상태</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>심부름 번호</th>
                                            <th>신청자 이름</th>
                                            <th>심부름 항목</th>
                                            <th>제목</th>
                                            <th>내용</th>
                                            <th>예상소요시간</th>
                                            <th>비용</th>
                                            <th>매칭상태</th>
                                        </tr>
                                    </tfoot>
                                    
                                    
                        			
                                    <tbody>
                                    	<%
                                    	if(flag==null || flag.equals("1")) {
								        if (boardLists.isEmpty()){
								        %>
								        	<tr>
								        		<td colspan="8" align="center">
								        			등록된 심부름이 없습니다.
								        		</td>
								        	</tr>
								        <%
								        }
								        else{
								        	int virtualNum = 0;
								        	
								        	for (MissionDTO dto : boardLists)
								        	{								        		
								        %> 

								        <tr>
							        		<th><input type="hidden" name="id" value="<%=dto.getMission_num()%>"/><%=dto.getMission_num()%></th>
                                            <th><%=dto.getMission_id() %></th>
                                            <th>
                                            <% if(dto.getMission_category().equals("배달,장보기")){ %>
                                            배달, 장보기
                                            <%}else if(dto.getMission_category().equals("청소,집안일")){ %>
                                            청소, 집안일
                                            <%}else if(dto.getMission_category().equals("설치,운반")){ %>
                                            설치, 조립, 운반
                                            <%}else if(dto.getMission_category().equals("동행,돌봄")){ %>
                                            동행, 돌봄
                                            <%}else if(dto.getMission_category().equals("벌레,쥐잡기")){ %>
                                            벌레, 쥐잡기
                                            <%}else if(dto.getMission_category().equals("역할대행")){ %>
                                            역할대행
                                            <%}else if(dto.getMission_category().equals("과외,알바")){ %>
                                            과외, 알바
                                            <%}else if(dto.getMission_category().equals("기타")){ %>
                                            기타 원격
                                            <%} %>
                                            </th>
                                            <th><%=dto.getMission_name() %></th>
                                            <th><%=dto.getMission_content() %></th>
                                            <th>
											<% if(dto.getMission_time().equals("1")){ %>
                                            10분이내
                                            <%}else if(dto.getMission_time().equals("2")){ %>
                                            10~20분
                                            <%}else if(dto.getMission_time().equals("3")){ %>
                                            20~40분
                                            <%}else if(dto.getMission_time().equals("4")){ %>
                                            40~60분
                                            <%}else if(dto.getMission_time().equals("5")){ %>
                                            60분이상
                                            <%} %>
											</th>
                                            <th><%=dto.getMission_cost() %></th>     
                                            <!-- 이거 Hlist에서는 3가지(1,2,3)로 나누어져있음 확인바람 -->                                  
                                            <th>
                                            <%if(dto.getMission_status()==1){ %>
                                            심부름 매칭중
                                            <%}else if(dto.getMission_status()==2){ %>
                                            심부름 매칭완료
                                            <%}else if(dto.getMission_status()==3){ %>
                                            심부름 완료
                                            <%} %>
                                            </th>                                            
                                        </tr>
                                        </div>
								        <%
								        	virtualNum++;
								        	}
								          }  
                                    	}
                                    	else if(flag.equals("2")) {
									        if (boardLists.isEmpty()){
									        %>
									        	<tr>
									        		<td colspan="8" align="center">
									        			등록된 심부름이 없습니다.
									        		</td>
									        	</tr>
								        <%
									        }
									        else {
									        	int virtualNum = 0;
									        	
									        	for (MissionDTO dto : boardLists1)
									        	{								        		
								        %> 
				                    
                                        <tr>
							        		<th><input type="hidden" name="id" value="<%=dto.getMission_num()%>"/><%=dto.getMission_num()%></th>
                                            <th><%=dto.getMission_id() %></th>
                                            <th>
                                            <% if(dto.getMission_category().equals("배달,장보기")){ %>
                                            배달, 장보기
                                            <%}else if(dto.getMission_category().equals("청소,집안일")){ %>
                                            청소, 집안일
                                            <%}else if(dto.getMission_category().equals("설치,운반")){ %>
                                            설치, 조립, 운반
                                            <%}else if(dto.getMission_category().equals("동행,돌봄")){ %>
                                            동행, 돌봄
                                            <%}else if(dto.getMission_category().equals("벌레,쥐잡기")){ %>
                                            벌레, 쥐잡기
                                            <%}else if(dto.getMission_category().equals("역할대행")){ %>
                                            역할대행
                                            <%}else if(dto.getMission_category().equals("과외,알바")){ %>
                                            과외, 알바
                                            <%}else if(dto.getMission_category().equals("기타")){ %>
                                            기타 원격
                                            <%} %>
                                            </th>
                                            <th><%=dto.getMission_name() %></th>
                                            <th><%=dto.getMission_content() %></th>
                                            <th>
											<% if(dto.getMission_time().equals("1")){ %>
                                            10분이내
                                            <%}else if(dto.getMission_time().equals("2")){ %>
                                            10~20분
                                            <%}else if(dto.getMission_time().equals("3")){ %>
                                            20~40분
                                            <%}else if(dto.getMission_time().equals("4")){ %>
                                            40~60분
                                            <%}else if(dto.getMission_time().equals("5")){ %>
                                            60분이상
                                            <%} %>
											</th>
                                            <th><%=dto.getMission_cost() %></th>     
                                            <!-- 이거 Hlist에서는 3가지(1,2,3)로 나누어져있음 확인바람 -->                                  
                                            <th>
                                            <%if(dto.getMission_status()==1){ %>
                                            심부름 매칭중
                                            <%}else if(dto.getMission_status()==2){ %>
                                            심부름 매칭완료
                                            <%}else if(dto.getMission_status()==3){ %>
                                            심부름 완료
                                            <%} %>
                                            </th>                                            
                                        </tr>
                                        </div>
								        <%
								        	virtualNum++;
								        	}
								          }
                                    	}
                                    	else if(flag.equals("3")) {
								        if (boardLists.isEmpty()){
								        %>
								        	<tr>
								        		<td colspan="8" align="center">
								        			등록된 심부름이 없습니다.
								        		</td>
								        	</tr>
								        <%
								        }
								        else {
								        	int virtualNum = 0;
								        	
								        	for (MissionDTO dto : boardLists2)
								        	{								        		
								        %> 
				                    
                                        <tr>
							        		<th><input type="hidden" name="id" value="<%=dto.getMission_num()%>"/><%=dto.getMission_num()%></th>
                                            <th><%=dto.getMission_id() %></th>
                                            <th>
                                            <% if(dto.getMission_category().equals("배달,장보기")){ %>
                                            배달, 장보기
                                            <%}else if(dto.getMission_category().equals("청소,집안일")){ %>
                                            청소, 집안일
                                            <%}else if(dto.getMission_category().equals("설치,운반")){ %>
                                            설치, 조립, 운반
                                            <%}else if(dto.getMission_category().equals("동행,돌봄")){ %>
                                            동행, 돌봄
                                            <%}else if(dto.getMission_category().equals("벌레,쥐잡기")){ %>
                                            벌레, 쥐잡기
                                            <%}else if(dto.getMission_category().equals("역할대행")){ %>
                                            역할대행
                                            <%}else if(dto.getMission_category().equals("과외,알바")){ %>
                                            과외, 알바
                                            <%}else if(dto.getMission_category().equals("기타")){ %>
                                            기타 원격
                                            <%} %>
                                            </th>
                                            <th><%=dto.getMission_name() %></th>
                                            <th><%=dto.getMission_content() %></th>
                                            <th>
											<% if(dto.getMission_time().equals("1")){ %>
                                            10분이내
                                            <%}else if(dto.getMission_time().equals("2")){ %>
                                            10~20분
                                            <%}else if(dto.getMission_time().equals("3")){ %>
                                            20~40분
                                            <%}else if(dto.getMission_time().equals("4")){ %>
                                            40~60분
                                            <%}else if(dto.getMission_time().equals("5")){ %>
                                            60분이상
                                            <%} %>
											</th>
                                            <th><%=dto.getMission_cost() %></th>     
                                            <!-- 이거 Hlist에서는 3가지(1,2,3)로 나누어져있음 확인바람 -->                                  
                                            <th>
                                            <%if(dto.getMission_status()==1){ %>
                                            심부름 매칭중
                                            <%}else if(dto.getMission_status()==2){ %>
                                            심부름 매칭완료
                                            <%}else if(dto.getMission_status()==3){ %>
                                            심부름 완료
                                            <%} %>
                                            </th>                                            
                                        </tr>
                                        </div>
								        <%
								        	virtualNum++;
								        	}
								          }
                                    	}
										%> 
										
                                    </tbody>
                                </table>
                               
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