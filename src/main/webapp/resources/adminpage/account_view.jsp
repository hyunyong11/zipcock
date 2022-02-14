
<%@page import="membership.MemberDAO"%>
<%@page import="membership.MemberDTO"%>
<%@page import="java.util.HashMap"%> 
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String flag = request.getParameter("flag"); //플래그 값
//DB연결
MemberDAO dao = new MemberDAO(application);
//아이디에 해당하는 게시물 조회
MemberDTO dto = dao.viewMember(flag);
//자원해제
dao.close();
%>

<script>
function deletePost(){
	var confirmed = confirm("정말로 삭제하겠습니까?");
	if(confirmed){
		
		var form = document.writeFrm;
		form.method = "post";	// 전송방식을 post로 설정
		form.action = "Memberdeleteprocess.jsp?flag="+<%= flag %>; //전송할 URL
		form.submit();	//폼값 전송
	}
}
</script>
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
                    
                    <h1 class="h3 mb-2 text-gray-800">게시판관리</h1>
                    <p class="mb-4">게시판 내용을 수정/삭제 할수있습니다. </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">게시판관리</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
 								<form name="writeFrm">
                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                    <tbody>
									<!-- 게시물의 일련번호 : 삭제시 사용할 예정임. -->					 
								<input type="hidden" name="flag" value="<%=flag %>" class="form-control" />  

									
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">상태</th>
										<td>
											<% if(dto.getMember_status()==0){ %>
											관리자
											<%}else if(dto.getMember_status()==1){ %>
											일반
											<%}else if(dto.getMember_status()==2){ %>
											헬퍼
											<%}else if(dto.getMember_status()==3){ %>
											블랙리스트
											<%} %>
										</td>
										
										<th class="text-center" 
											style="vertical-align:middle;">아이디</th>
										<td>
											<%= dto.getMember_id() %>
										</td>
									</tr>
									
									<tr>
										
										<th class="text-center" 
											style="vertical-align:middle;">이메일</th>
										<td colspan="3">
											<%= dto.getMember_email() %> 
										</td>
										
										
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">나이</th>
										<td colspan="3">
											<%= dto.getMember_age() %>
										</td>
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">성별</th>
										<td colspan="3">
											<%if(dto.getMember_sex()==1){ %>
											남자
											<%}else if(dto.getMember_sex()==2){ %>
											여자
											<%} %>
										</td>
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">전화번호</th>
										<td colspan="3">
											<%= dto.getMember_phone() %>
										</td>
									</tr>
									<% if(dto.getMember_status()==2){ %>
									<tr>
										
										<th class="text-center" 
											style="vertical-align:middle;">계좌번호</th>
										<td colspan="3">
											<%= dto.getMember_account() %> 
										</td>
										
										
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">이동수단</th>
										<td colspan="3">
											<%= dto.getMember_vehicle() %>
										</td>
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">자기소개</th>
										<td colspan="3">
											<%= dto.getMember_introduce() %>
										</td>
									</tr>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">포인트</th>
										<td colspan="3">
											<%= dto.getMember_point() %>
										</td>
									</tr>
									<%} %>
									
									<tr>
										<% if(dto.getMember_status()==2){ %>
											<th class="text-center" 
												style="vertical-align:middle;">심부름 완료 횟수</th>
											<td colspan="3">
												<%= dto.getMember_missionC() %>
											</td>
										<%}else{ %>								
											<th class="text-center" 
												style="vertical-align:middle;">심부름 요청 횟수</th>
											<td colspan="3">
												<%= dto.getMember_missionN() %>
											</td>
										<%} %>
									</tr>
									
									<%-- <tr>
										<th class="text-center" 
											style="vertical-align:middle;">내용</th>
										<td colspan="3">
											<%= dto.getContent().replace("\r\n", "<br/>") %>
										</td>
									</tr> --%>
									<%-- <%  	
									if(flag.equals("info") || flag.equals("pic") || flag.equals("emp") || flag.equals("guard")){
									%>
									<tr>
										<th class="text-center" 
											style="vertical-align:middle;">첨부파일</th>
										<%
										if(!(dto.getSfile().equals(null))){
										%>
										<td colspan="3">
											<img src="../Uploads/<%= dto.getSfile() %>" width="200">
										</td>
										<%} %>
									</tr>
									<%
									}
									%> --%>
								</tbody>
                                </table>    
                               <div class="col d-flex justify-content-end" style="">
									<!-- 각종 버튼 부분 -->
									
									<button type="button" class="btn btn-primary" onclick="location.href='member_edit.jsp?flag=<%=flag%>';">수정하기</button>
									<button type="button" class="btn btn-success" onclick="deletePost();">삭제하기</button>						
									<button type="button" class="btn btn-warning" 
										onclick="location.href='member_list.jsp?flag=<%=flag%>';">리스트보기</button>
								</div>    
								</form>   
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