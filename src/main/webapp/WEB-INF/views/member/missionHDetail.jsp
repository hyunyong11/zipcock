<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>${viewRow.mboard_title }</title>
    

    <!-- =============== Bootstrap Core CSS =============== -->
    <link rel="stylesheet" href="/zipcock/resources/css/bootstrap.min.css" type="text/css">
    <!-- =============== Google fonts =============== -->
    <link href='https://fonts.googleapis.com/css?family=Oswald:400,300' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Open+Sans:400,600' rel='stylesheet' type='text/css'>
	<!-- =============== fonts awesome =============== -->
    <link rel="stylesheet" href="/zipcock/resources/css/font-awesome.min.css" type="text/css">
    <!-- =============== Plugin CSS =============== -->
    <link rel="stylesheet" href="/zipcock/resources/css/animate.min.css" type="text/css">
    <!-- =============== Custom CSS =============== -->
    <link rel="stylesheet" href="/zipcock/resources/css/style.css" type="text/css">
    <!-- =============== Owl Carousel Assets =============== -->
    <link href="/zipcock/resources/owl-carousel/owl.carousel.css" rel="stylesheet">
    <link href="/zipcock/resources/owl-carousel/owl.theme.css" rel="stylesheet">
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
<!-- =============== Preloader =============== -->
    <!-- <div id="preloader">
        <div id="loading">
        </div>
    </div> -->
    <!-- =============== nav =============== -->
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top" style="background-color: black">
        <div class="container">
            <div class="container-fluid">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="zipcock.do"><img src="/zipcock/resources/img/logo.png" alt="Logo">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                       
                        
                        <!-- 로그인 유무에 따른 join logout -->
                        <c:choose>
                        <c:when test="${ empty sessionScope.siteUserInfo }">
                        <li>
                            <a class="page-scroll" href="memberLogin.do">Login</a>
                        </li>
                         <li>
                            <a class="page-scroll" href="memberRegist.do">Join</a>
                        </li>
                        <!-- 사용자로 로그인시 헬퍼 회원가입 가능하도록 -->
                        </c:when>
                       	<c:when test="${sessionScope.siteUserInfo.member_status eq 1 }">
                       	<li>
                            <a class="page-scroll" href="memberRegist.do">Join</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="logout.do">Logout</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="myPage.do">MyPage</a>
                        </li>
                        </c:when>
                        <c:otherwise>
                        <li>
                            <a class="page-scroll" href="logout.do">Logout</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="myPage.do">MyPage</a>
                        </li>
                        </c:otherwise>
                        </c:choose>
                        
                        <!-- 권한이 어드민일때만 어드민 출력 -->
                        <c:choose>
                       	<c:when test="${sessionScope.siteUserInfo.member_status eq 0 }">
                        <li>
                            <a class="page-scroll" href="./resources/adminpage/index.jsp" target="_blank">Admin</a>
                        </li>
                        </c:when>
                        </c:choose>
                    </ul>
                </div>
                <!-- =============== navbar-collapse =============== -->

            </div>
        </div>
        <!-- =============== container-fluid =============== -->
    </nav>

<div class="container">
	
	 <!-- =============== Price =============== -->
    <section id="Notice" class="">
	<!-- =============== container =============== -->
        <div class="container">

         <div class="row">
	
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
          <section class="cusMainFaqList">
          <br /><br /><br /><br /><br /><br /><br />
          
          <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;NOTICE</h3>
		<div class="container">
			<h2>공지사항</h2>

    <div class="card-body">
        <div class="table-responsive">
		<form name="writeFrm">
		<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
			<colgroup>
				<col width="20%" />
				<col width="30%" />
				<col width="20%" />
				<col width="30%" />
			</colgroup>
			
			<tr>
				<td colspan="4" align="center" style="background-color: lightgray; font-weight: bold;">	
				
					집에서 심부름을 콕! 집콕!
				
				</td>
			</tr>
			<c:forEach items="${lists }" var="row">        
	  		<c:if test="${sessionScope.siteUserInfo.member_id eq row.mission_Hid}">
			<tr>
				<th style="background-color: #ffc654">No</th>
				<td style="text-align: left; color: #FF4C00">${row.mission_num }</td>
				<th style="background-color: #ffc654">작성자</th>
				<td style="text-align: left; color: #FF4C00">${row.mission_id }</td>			
			</tr>
			<tr>
				<th style="background-color: #ffc654">비용</th>
				<td style="text-align: left; color: #FF4C00">${row.mission_cost }</td>			
				<th style="background-color: #ffc654">심부름 항목</th>
				<td style="text-align: left; color: #FF4C00">${row.mission_category }</td>
			</tr>
			<tr>
				<th style="background-color: #ffc654">제목</th>
				<td colspan="3" style="text-align: left; color: #FF4C00">
					${row.mission_name }
				</td>
			</tr>
			<tr>
				<th style="background-color: #ffc654">내용</th>
				<td colspan="3" style="height:150px; text-align: left; color: #FF4C00">
					${row.mission_content }
				</td>
			</tr>	
			</c:if>
    		</c:forEach> 
			<tr>
				<td colspan="4" align="center" style="background-color: lightgray">	
				
					
				<button type="button" style="background-color: #ffc654; font-weight: bold"
					onclick="location.href='./HInfoAll.do';">리스트보기</button>
				</td>
			</tr>
		</table>
		</form>   
        </div>
    </div>
</div>
</body>
</html>