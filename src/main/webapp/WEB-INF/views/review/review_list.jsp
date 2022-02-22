<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>리뷰게시판</title>
    

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
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}

.btn1 {
  background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}

.btn1:hover {
  background-color: #4CAF50;
  color: white;
}

.btn2 {
  background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
}

.btn2:hover {
  background-color: #008CBA;
  color: white;
}
.btn3{
 background-color: white; 
  color: black; 
  border: 2px solid #008CBA;
  float:right;
}
.btn3:hover{
  background-color: #008CBA;
  color: white;

}
.btn4{
background-color: white; 
  color: black; 
  border: 2px solid #4CAF50;
}
.btn4:hover{
 background-color: #4CAF50;
  color: white;
}
</style>
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
                    <a class="page-scroll" href="mypage.do">MyPage</a>
                </li>
                </c:when>
                <c:otherwise>
                <li>
                    <a class="page-scroll" href="logout.do">Logout</a>
                </li>
                <li>
                    <a class="page-scroll" href="mypage.do">MyPage</a>
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
<script>
function deleteRow(review_num){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="delete.do?review_num="+ review_num;
	}
}
</script>
<body>
<<div class="container">
	
	 <!-- =============== Price =============== -->
<section id="review" class="">
<!-- =============== container =============== -->
      <div class="container">
     <!--  <span class="angle2"></span>
      <span class="angle"></span>
 -->
       <div class="row">

        <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
        <section class="cusMainFaqList">
        <br /><br /><br /><br /><br /><br /><br />
        
        <!-- <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;리뷰게시판</h3>-->
<div class="container">
	<h2>리뷰게시판</h2>
<table border="1" width="100%">
	<tr>
		<td align="center" style="font-weight: bold; background-color: #B9EEFF;">
			집에서 심부름을 콕! 집콕!
			</td>
	</tr>
</table>
	<div class="text-right">
	<button class="btn btn3" onclick="location.href='write.do';">
		리뷰작성하기
	</button>
<!--  
	EL의 내장객체인 sessionScope를 통해 세션영역에 저장된
	속성이 있는지 확인함. 단, 영역에 저장된 속성명이 유일할 경우
	내장객체는 생략할 수 있으므로 필수사항은 아니다. 
-->
<!-- 로그인 되지 않았을때.. -->
&nbsp;&nbsp;

</div>
 	<!-- table>tr*2>td*5 -->
<table class="table table-bordered" id="dataTable" width="90%" cellspacing="0" >
		<tr style="background-color: #ffc654">
<th width="10%" style="text-align: center">번호</th>
<th width=10%  style="text-align: center"> 심부름내역</th>
<th width="*" style="text-align: center" >리뷰내용</th>
<th width="10%" style="text-align: center"> 별점</th>
<th width="15%" style="text-align: center">작성자</th>
<th width="20%" style="text-align: center">작성일</th> 
<c:choose>
<c:when test="${empty lists }">
<tr>
	<td colspan="6" class="text-center">
		등록된 게시물이 없습니다 ^^*
	</td>
</tr>
</c:when>
<c:otherwise>
<c:forEach items="${lists }" var="row" varStatus="loop">
<c:if test="${sessionScope.siteUserInfo.member_id eq row.review_id}">
<!-- 리스트반복시작 -->
<tr>
	<td class="text-center" style="background-color: lightgray">${row.review_num }</td>
<td class="text-center" >${row.mission_num }</td>
<td class="text-center" >${row.review_content  }</td>
<td class="text-center">${row.review_point  }</td>
<td class="text-cemter"><img src="./resources/zipcock.png" class="media-object" style="width:70px">${row.review_id }</td>
<td class="text-center">${row.review_date }&nbsp;&nbsp;<br>
<!--  수정,삭제버튼 -->
<c:if test="${sessionScope.siteUserInfo.member_id eq row.review_id}">
<button class="btn btn2" 
	onclick="location.href='modify.do?review_num=${row.review_num}&review_id=${row.review_id }';">수정</button>
<!-- 삭제 버튼을 누를경우 review_num값을 JS의 함수로 전달한다.  -->
<button class="btn btn1" 
	onclick="javascript:deleteRow(${row.review_num});">삭제</button>

</c:if>

</td>

</tr>
<!-- 작성자 본인에게만 수정/삭제 버튼 보임 처리 -->					 
<!-- 리스트반복끝 -->
</c:if>
</c:forEach>
</c:otherwise>
</c:choose>

<!-- 페이지 번호 -->
<table  width="10%" style="margin-left: auto; margin-right: auto" >
<tr>
	<td align="center">
		${pagingImg }
		</td>
	</tr>
</table>	
<table  width="10%" style="margin-left: auto; margin-right: auto" >
<tr>
	<button type="button" class="btn btn4"
onclick="location.href='zipcock.do';">메인으로 가기</button>
	</tr>
</table>
</table>
</div>

    <!-- =============== jQuery =============== -->
    <script src="/zipcock/resources/js/jquery.js"></script>
    <!-- =============== Bootstrap Core JavaScript =============== -->
    <script src="/zipcock/resources/js/bootstrap.min.js"></script>
    <!-- =============== Plugin JavaScript =============== -->
    <script src="/zipcock/resources/js/jquery.easing.min.js"></script>
    <script src="/zipcock/resources/js/jquery.fittext.js"></script>
    <script src="/zipcock/resources/js/wow.min.js"></script>
    <!-- =============== Custom Theme JavaScript =============== -->
    <script src="/zipcock/resources/js/creative.js"></script>
    <!-- =============== owl carousel =============== -->
    <script src="/zipcock/resources/owl-carousel/owl.carousel.js"></script>
    <script>
        $(document).ready(function () {
            $("#owl-demo").owlCarousel({
                autoPlay: 3000,
                items: 3,
                itemsDesktop: [1199, 3],
                itemsDesktopSmall: [979, 3]
            });

        });
    </script>
    <!-- 챗봇 코드 -->
    <script>
	  (function() {
	    var w = window;
	    if (w.ChannelIO) {
	      return (window.console.error || window.console.log || function(){})('ChannelIO script included twice.');
	    }
	    var ch = function() {
	      ch.c(arguments);
	    };
	    ch.q = [];
	    ch.c = function(args) {
	      ch.q.push(args);
	    };
	    w.ChannelIO = ch;
	    function l() {
	      if (w.ChannelIOInitialized) {
	        return;
	      }
	      w.ChannelIOInitialized = true;
	      var s = document.createElement('script');
	      s.type = 'text/javascript';
	      s.async = true;
	      s.src = 'https://cdn.channel.io/plugin/ch-plugin-web.js';
	      s.charset = 'UTF-8';
	      var x = document.getElementsByTagName('script')[0];
	      x.parentNode.insertBefore(s, x);
	    }
	    if (document.readyState === 'complete') {
	      l();
	    } else if (window.attachEvent) {
	      window.attachEvent('onload', l);
	    } else {
	      window.addEventListener('DOMContentLoaded', l, false);
	      window.addEventListener('load', l, false);
	    }
	  })();
	  ChannelIO('boot', {
	    "pluginKey": "9145fc6d-f292-46af-b22a-2e630b92ab68"
	  });
	</script>
</body>
</html>