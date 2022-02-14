<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
</head>
<body>
<div class="container">
<!-- 바디 -->
	<!-- header -->
	<div id="header">
		<h1 class="login_title">
			<label for="email">회원가입</label><br>
			<!-- <img src="images/villagehero.png"> -->
		</h1>
		<h3>Welcome! 집콕에 오신 것을 환영합니다.</h3>
	</div>

	<!-- wrapper -->
	<div id="wrapper">

		<!-- content -->
		<div id="content">

			<!-- Login BTN-->
			<div class="btn_area">
				<button type="button" id="btnJoin" style="margin-top: 50px;"
					onclick="location.href='memberRegist_user.do';">
					<span>사용자 회원가입</span>
				</button>
			</div>
			<div class="btn_area">
				<button type="button" id="btnJoin"
					onclick="location.href='memberRegist_Helper.do';">
					<span>셔틀콕 회원가입</span>
				</button>
			</div>
					
		</div>
		<!-- content -->

	</div>
	<!-- wrapper -->



</div>
</body>
</html>