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
    <title>공지사항</title>
    

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
    <nav id="mainNav" class="navbar navbar-default navbar-fixed-top">
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
        <span class="angle2"></span>
        <span class="angle"></span>

         <div class="row">
	
           
				<style>
				.cusMainNoticeList {
					position: relative;
		            display: block;
		            overflow: hidden;
		            margin: 0;
				    padding: 0;
				}
				article, aside, canvas, details, figcaption, figure, footer, header, hgroup, nav, menu, nav, section, main {
				    display: block;
				}
				.subTitle4C{
				    text-align: center;
				}
				.cusMainNoticeList .list {
					overflow: hidden;
					border: 1px solid #222;
				}
				.cusMainNoticeList .list ul {
					margin: -1px;
					display: block;
				    list-style-type: disc;
				    margin-block-start: 1em;
				    margin-block-end: 1em;
				    margin-inline-start: 0px;
				    margin-inline-end: 0px;
				    padding-inline-start: 40px;
			     	padding-left: 0px;
				}
				.cusMainNoticeList .list ul:after {content: ""; display: block; clear: both;}
				.cusMainNoticeList .list li {
					position: relative;
					float: left;
					width: 20%; height: 184px;
				    list-style: none;
				    display: list-item;
		  				text-align: -webkit-match-parent;
				}
				.cusMainNoticeList .list a {
					position: absolute;
					top: 0; right: 0; bottom: 0; left: 0;
					padding: 90px 32px 0;
					color: #222;
					transition: all .3s;
				    font-family: inherit;
				    font-size: inherit;
				    line-height: inherit;
				    letter-spacing: inherit;
				    color: inherit;
				    text-decoration: none;
				    outline: none;
				}
				.cusMainNoticeList .list a:after {
					content: "";
					position: absolute;
					top: 0; right: 0; bottom: -1px; left: -1px;
					border: 1px solid #dcdcdc;
					transition: all .3s;
				}
				.cusMainNoticeList .list a:hover {
					background: #104138;
					color: #fff;
					z-index: 2;
				}
				.cusMainNoticeList .list a:hover:after {border-color: #104138;}
				.cusMainNoticeList .list .num {
					position: absolute;
					top: 40px; left: 32px;
					font: 30px/1.2 'roboR';
				}
				.cusMainNoticeList .list .txt {
					display: block;
					display: -webkit-box;
					max-height: 70px;
					overflow: hidden;
					-webkit-line-clamp: 3;
					-webkit-box-orient: vertical;
				}
				.cusMainNoticeList .more {
					position: absolute;
					top: 15px; right: 10px;
					padding-right: 9px;
					font-size: 14px;
					background: url('../images/common/arw_btn_more.png') no-repeat 100% 50%;
				}
				
		   </style>
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
          <section class="cusMainFaqList">
          <br /><br /><br /><br /><br /><br /><br />
          
          <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;NOTICE</h3>
		<div class="container">
			<h2>공지사항</h2>

			
		<table border="1" width="100%">
			<tr>
				<td align="center" style="font-weight: bold; background-color: lightgray;">
					집에서 심부름을 콕! 집콕!
				</td>
			</tr>
		</table>
		
		<!-- table>tr*2>td*5 -->
		<table class="table table-bordered" id="dataTable" width="90%" cellspacing="0" >
				<tr style="background-color: #ffc654">
					<th width="10%" style="text-align: center">번호</th>
					<th width="*" >제목</th>
					<th width="15%" style="text-align: center">작성자</th>
					<th width="10%" style="text-align: center">작성일</th>
					<th width="15%" style="text-align: center">조회수</th>
				</tr> 
				<c:choose>
					<c:when test="${empty listRows }">
						<tr>
							<td colspan="6" class="text-center">
								등록된 게시물이 없습니다 ^^*
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${listRows }" var="row" 
							varStatus="loop">
							<!-- 리스트반복시작 -->
							<tr>
								<td class="text-center" style="background-color: lightgray">${row.virtualNum }</td>
								<td class="text-left">
									<a href="./NoticeV.do?num=${row.mboard_num}
										&nowPage=${nowPage}">${row.mboard_title}</a>
								</td>
								<td class="text-center">${row.mboard_id }</td>
								<td class="text-center">${row.mboard_date }</td>
								<td class="text-center" style="background-color: lightgray">${row.mboard_count }</td>
							</tr>
							<!-- 리스트반복끝 -->
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
				<button type="button" style="background-color: #FFC654; font-weight: bold; "
					onclick="location.href='zipcock.do';">메인으로 가기</button>
			</tr>
		</table>
		</table>
		</div>
			
		
        </section>
        </div>
        </div>    <!-- =============== container end =============== -->  
        </section>
<!-- Footer -->
    <footer id="footer">
	<!-- =============== container =============== -->
    <div class="container">
			    <div class="row">
                <div class="col-xs-12 col-sm-12 col-md-12">

					<ul class="social-links">
						<li><a class="wow fadeInUp animated" href="index.html#" style="visibility: visible; animation-name: fadeInUp;"><i class="fa fa-facebook"></i></a></li>
						<li><a data-wow-delay=".1s" class="wow fadeInUp animated" href="index.html#" style="visibility: visible; animation-delay: 0.1s; animation-name: fadeInUp;"><i class="fa fa-twitter"></i></a></li>
						<li><a data-wow-delay=".2s" class="wow fadeInUp animated" href="index.html#" style="visibility: visible; animation-delay: 0.2s; animation-name: fadeInUp;"><i class="fa fa-google-plus"></i></a></li>
						<li><a data-wow-delay=".4s" class="wow fadeInUp animated" href="index.html#" style="visibility: visible; animation-delay: 0.4s; animation-name: fadeInUp;"><i class="fa fa-pinterest"></i></a></li>
						<li><a data-wow-delay=".5s" class="wow fadeInUp animated" href="index.html#" style="visibility: visible; animation-delay: 0.5s; animation-name: fadeInUp;"><i class="fa fa-envelope"></i></a></li>
					</ul>

                    <p class="copyright">
                        &copy; 2016 Canvas
					</p>

				</div>
			</div>
    </div><!-- =============== container end =============== -->
	</footer>
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

