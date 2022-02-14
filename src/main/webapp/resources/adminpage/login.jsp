<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>어드민 로그인</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    
    <script>
	function formValidate(frm){
		if(frm.user_id.value==''){alert('아이디를 입력해주세요');frm.user_id.focus();return false;}
		if(frm.user_pw.value==''){alert('비밀번호를 입력해주세요');frm.user_pw.focus();return false;}
	}
	</script>

</head>

<body class="bg-gradient-primary">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-10 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg my-5">
                    <div class="card-body p-0">
                        <!-- Nested Row within Card Body -->
                        <div class="row">
                            <div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
                            <div class="col-lg-6">
                                <div class="p-5">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">어드민 로그인!</h1>
                                    </div>
                                    <c:choose>
									<c:when test="${ empty sessionScope.siteUserInfo }">
                                    <form name="myform" action="LoginProcess.jsp" method="post" onsubmit="return formValidate(this);">
                                        <div class="form-group">
                                            <input type="text" name="user_id" class="form-control form-control-user"
                                                id="exampleInputEmail" aria-describedby="emailHelp"
                                                placeholder="Enter Id...">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" name="user_pw" class="form-control form-control-user"
                                                id="exampleInputPassword" placeholder="Password">
                                        </div>
                                 
                                        <input type="submit" value="Login" class="btn btn-primary btn-user btn-block">
                                
                                        </a>
                                    </form>
                                    </c:when>
									<c:otherwise>
                                       
                                        <a href="logout.jsp" class="btn btn-primary btn-user btn-block">
                                        Logout
                                        </a>
                              
                                        </a>
                                        
                                        <hr>                                     
                                    <hr>
                                    <div class="text-center">
                                        <a class="small" href="forgot-password.jsp">Forgot Password?</a>
                                    </div>
                                    </c:otherwise>
									</c:choose>
                                    <div class="text-center">
                                        <a class="small" href="register.jsp">Create an Account!</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
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

</body>

</html>