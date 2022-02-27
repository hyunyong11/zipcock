<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>

 <title>회원탈퇴</title> 
 
<script>
function deleteRow(member_id){
	if(confirm("정말로 탈퇴 하시겠습니까?")){
		location.href="mdelete.do"
	}
}
</script>
</head>
<body>
<div class="container">
<!-- 바디 -->
	<!-- header -->
	<div id="header">
		<h1 class="login_title">
			<label for="email">회원탈퇴</label><br>
			<!-- <img src="images/villagehero.png"> -->
		</h1>
		<h3>집콕 회원 탈퇴 신청 </h3>
	</div>

<!-- wrapper -->
	<div id="wrapper">

		<!-- content -->
		<div id="content">
			<div>
				<h3 class="join_title">
					<label for="id">아이디</label>
				</h3>
				<span class="box int_id"> 
					<input type="text" class="join_H" id="identification" name="member_id" value="${sessionScope.siteUserInfo.member_id }" readonly/>
				</span>
			 	<span class="error_next_box"></span>
		<div>
			<h3 class="join_title">
				<label for="pass" class="join_H">비밀번호</label>
			</h3>
			<span class="box int_pass"> 
				<input type="password" id="pass" class="join_H" maxlength="16" name="pass" required> 
				<img src="/zipcock/resources/img/m_icon_pass.png" id="pass1_img" class="passImg">
			</span> <span class="error_next_box"></span>
		</div>
		<div class="btn_area">
			<button type="button" id="btnJoin"
					onclick="javascript:deleteRow(${row.member_id});"><span>회원탈퇴</span>
			</button>
		</div>
</form>
</body>
</html>