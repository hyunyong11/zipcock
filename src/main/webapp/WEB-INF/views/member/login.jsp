<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<script>

<!-- 카카오 스크립트 -->

window.Kakao.init('fd6202fdf742e1c361e44f8a65bdba05'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단

//카카오로그인
function kakaoLogin() {
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          success: function (response) {
        	  console.log(response)
	       	  const email = response.kakao_account.email;
			  const name = response.properties.nickname;
			  
			  console.log(email);
			  console.log(name);
			  
			  $('#kakaoemail').val(email);
			  $('#kakaoname').val(name);
			  document.loginForm.submit();
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
//카카오로그아웃  
function kakaoLogout() {
    if (Kakao.Auth.getAccessToken()) {
      Kakao.API.request({
        url: '/v1/user/unlink',
        success: function (response) {
        	console.log(response)
        },
        fail: function (error) {
          console.log(error)
        },
      })
      Kakao.Auth.setAccessToken(undefined)
    }
  }
</script>
<div class="container">
<!-- 바디 -->
	<!-- header -->
	<div id="header">
		<h1 class="login_title">
			<label for="email">로그인</label><br>
			<!-- <img src="images/villagehero.png"> -->
		</h1>
		<h3>Welcome! 집콕에 오신 것을 환영합니다.</h3>
	</div>

	<!-- wrapper -->
	<div id="wrapper">

		<!-- content -->
		<div id="content">
			<c:choose>
			<c:when test="${ empty sessionScope.siteUserInfo }">
			<!-- 로그인되지 않았을 때 페이지 출력 -->
			<form name="loginForm" method="post" action="./memberLoginAction.do" 
				onsubmit="return validateForm(this);">
			<input type="hidden" name="login_ok" value="1"/>
			<!-- 로그인에 성공할 경우 돌아갈 페이지 경로 -->
			<input type="hidden" name="backUrl" value="${ param.backUrl }"/>
				<div>
					<!-- ID -->
				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> 
						<input type="text" id="id" class="join_H" maxlength="30" name="id" required> 
					</span>
				 	<span class="error_next_box"></span>
				</div>

				<!-- pass1 -->
				<div>
					<h3 class="join_title">
						<label for="pass">비밀번호</label>
					</h3>
					<span class="box int_pass"> 
						<input type="password" id="pass" class="join_H" maxlength="16" name="pass" required> 
						<span id="alertTxt">사용불가</span> 
						<img src="/zipcock/resources/img/m_icon_pass.png" id="pass1_img" class="passImg">
					</span> <span class="error_next_box"></span>
				</div>
				<!-- 로그인에 실패할 경우 에러메세지 출력 부분 -->
				<span style="font-size:1.5em; color:red;">${ LoginNG }</span>
				
				
					
					<!-- Login BTN-->
					<div class="btn_area">
						<p style="text-align: right;"><a href="findIdpw.do">아이디/비밀번호 찾기</a></p>
						<input type="submit" id="btnJoin" value="로그인" @click="logInCheck">
						<br> <br>
						<button type="button" id="btnJoin"
							onclick="location.href='memberRegist.do';">
							<span>회원가입</span>
						</button>
						<br> <br>
						<div>-------------------------- 또는 --------------------------</div>
						<br>
					     <!-- 카카오 로그인 버튼 -->
						<div id="kakaologin">
							<div class="kakaobtn">
								<input type="hidden" name="kakaoemail" id="kakaoemail" value=""/>
								<input type="hidden" name="kakaoname" id="kakaoname" value=""/>
								<a href="javascript:kakaoLogin();"> 
									<img src="/zipcock/resources/img/kakao_login_medium_wide.png" style="width: 100%;"/>
								</a>
							</div>
						</div>
					</div>

				</div>
			</form>
			</c:when>
			<c:otherwise>
			<!-- 로그인되었을 때의 페이지 출력 -->
			<%
			session.setAttribute("UserId", session.getAttribute("siteUserInfo.member_id"));
			if(!(session.getAttribute("UserStatus").equals(0))){
			%>
			
				<!-- 로그인에 성공할 경우 MemberDTO 객체를 통해 반환 받아 세션영역에
				저장할 것이므로 아래는 각 멤버변수에 접근해서 데이터를 출력하는 것이다. -->	
				<div style="text-align: center;">
				<h4><b>${sessionScope.siteUserInfo.member_name}</b>님 어서오세요!</h4>
				<br /><br />
				<button class="btn btn-success" 
					onclick="location.href='mypage.do';">
					마이페이지</button>
				<button class="btn btn-danger" 
					onclick="location.href='logout.do';">
					로그아웃</button>
				<button class="btn btn-primary" 
					onclick="location.href='zipcock.do';">
					메인으로</button>
				</div>
			<%
			}
			else if((session.getAttribute("UserStatus").equals(0))){
			%>
				<div style="text-align: center;">
				<h4><b>${sessionScope.siteUserInfo.member_name}</b>님 어서오세요!</h4>
				<br /><br />
				<button class="btn btn-success" 
					onclick="location.href='./resources/adminpage/index.jsp';">
					관리자모드</button>
				<button class="btn btn-danger" 
					onclick="location.href='logout.do';">
					로그아웃</button>
				<button class="btn btn-primary" 
					onclick="location.href='zipcock.do';">
					메인으로</button>
				</div>
			<%
			}
			%>
				</div>
			</c:otherwise>
			</c:choose>
	
	
			<!-- component -->
			<div id="app">
				<form-com></form-com>
			</div>

		</div>
		<!-- content -->

	</div>
	<!-- wrapper -->
</div>
</body>
</html>