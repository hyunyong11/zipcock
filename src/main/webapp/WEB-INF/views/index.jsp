<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<!--
	Canvas by TEMPLATE STOCK
	templatestock.co @templatestock
	Released for free under the Creative Commons Attribution 3.0 license (templated.co/license)
-->
<html lang="en">
<head>  
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>집에서 심부름을 콕! 집콕!</title>
    

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
                    <a class="navbar-brand" href="#"><img src="/zipcock/resources/img/logo.png" alt="Logo">
                    </a>
                </div>

                <!-- Collect the nav links, forms, and other content for toggling -->

                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a class="page-scroll" href="#about">About</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#how-it-works">How it works</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#Screenshots">Screenshots</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#Price">Price</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#contact">Contact</a>
                        </li>
                        
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
    <!-- =============== header =============== -->
    <header>
		<!-- =============== container =============== -->
        <div class="container">
            <div class="header-content row">
                <div class="col-xs-12 col-sm-5 col-md-5">
                    <h2 class="wow bounceIn animated" data-wow-delay=".40s">FRIENDLY TEMPLATE FOR YOUR APP</h2>
                    <h3 class="wow bounceIn animated" data-wow-delay=".50s">FOR YOUR SMARTPHONE</h3>
                    <p class="wow bounceIn animated" data-wow-delay=".60s">Lorem ipsum dolor sit amet, consectetur adipiscing elit.We ensure sit amet, consectetur adipiscing elit</p>
                    <p>
                        <div class="btn btn-primary btn-lg btn-ornge wow bounceIn animated" data-wow-delay="1s"><i class="hbtn"></i> <span>Free Download</span> <i class="fa fa-cloud-download"></i>
                        </div>
                    </p>
                </div>
                <div class="col-xs-12 col-sm-7 col-md-7 wow slideInLeft animated">
                    <img src="/zipcock/resources/img/phones.png" alt="phones" />
                </div>
            </div>
        </div>
		<!-- =============== container end =============== -->
    </header>
    <!-- =============== About =============== -->
    <section id="about" class="">
		<!-- =============== container =============== -->
        <div class="container">
            <span class="angle2"></span>
            <span class="angle"></span>
            <div class="row">
                <div class="col-xs-12 col-sm-5 col-md-3 wow fadeInLeft animated" data-wow-delay=".5s">
                    <h1><span>HELLO!</span> '집콕'을 소개합니다.</h2>      
                  </div>
                  <div class="col-xs-12 col-sm-7 col-md-9 wow fadeInRight animated" data-wow-delay=".5s">
                  <h2>집콕서비스를 소개합니다.</h2>
                  <p>집콕서비스는 매우매우 좋음</P>

                     <p>소개글쓰기</p>

                    <p>짱좋음</p>     
					<p>핵좋음</p>
                  </div>     
            </div>
        </div>   
		<!-- =============== container end =============== -->		
    </section>
    <!-- =============== how it works =============== -->
    <section id="how-it-works" class="parallax">
	<!-- =============== container =============== -->
    <div class="container">
     <span class="angle2"></span>
    <span class="angle"></span>
     <div class="row">

       <div class="col-xs-12 col-sm-12 col-md-12 wow bounceIn animated headding" data-wow-delay=".5s">
           <h2>어플 <span>미리보기?</span></h2>
           <p>Display your mobile apps awesome features with icon lists and an image carousel of each page. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.</p>
       </div>

      <div class="col-xs-12 col-sm-4 col-md-4">
         <div class="row">     
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInLeft animated textright" data-wow-delay=".5s">
            <h3>사용자</h3>
              <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum.</p>     
          </div>
            <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInRight animated" data-wow-delay=".5s">
                <i class="fa fa-apple iconfont"></i>
          </div>    
        </div>
        <div class="row"> 
         <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInLeft animated textright" data-wow-delay=".6s">
            <h3>헬퍼</h3>
              <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum.</p>     
          </div>
            <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInRight animated" data-wow-delay=".6s">
                <i class="fa fa-rocket iconfont"></i>
          </div>     
        </div>
        <div class="row">            
         <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInLeft animated textright" data-wow-delay=".7s">
            <h3>심부름리스트</h3>
              <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum.</p>     
          </div>
          <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInRight animated" data-wow-delay=".7s">
                <i class="fa fa-film iconfont"></i>
          </div>         
           
        </div>        
      </div>

      <div class="col-xs-12 col-sm-4 col-md-4 wow bounceIn animated textcenter" data-wow-delay=".4s">
       <img src="/zipcock/resources/img/slide-bg.png" alt="slide-bg" />
      </div>  
         
      <div class="col-xs-12 col-sm-4 col-md-4">
         <div class="row">         
          <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInLeft animated" data-wow-delay=".5s">
                <i class="fa fa-android iconfont2"></i>
          </div>    
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInRight animated textleft" data-wow-delay=".5s">
            <h3>지도(혹은 진행상황)</h3>
              <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum.</p>     
          </div>
           
        </div>
        <div class="row">    
        <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInLeft animated" data-wow-delay=".6s">
                <i class="fa fa-css3 iconfont2"></i>
          </div>          
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInRight animated textleft" data-wow-delay=".6s">
            <h3>팁</h3>
              <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum.</p>     
          </div>
          
        </div>
        <div class="row">    
        <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInLeft animated" data-wow-delay=".7s">
                <i class="fa fa-users iconfont2"></i>
          </div>          
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInRight animated textleft" data-wow-delay=".7s">
            <h3>챗봇</h3>
              <p>Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum.</p>     
          </div>
           
        </div>        
      </div>
    </div>
    </div>   
	<!-- =============== container end =============== -->	
    </section>
    
    
     <!-- =============== Price =============== -->
    <section id="Notice" class="">
	<!-- =============== container =============== -->
        <div class="container">
        <span class="angle2"></span>
        <span class="angle"></span>

         <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
               <h2>공지사항 <span></span></h2>
               <p>Display your mobile apps awesome features with icon lists and an image carousel of each page. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.</p>
           </div>
           
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
          <h3 class="subTitle4C">FAQ</h3>
		<div class="list">
			<h2>공지사항 게시판</h2>

		
			
			
			
			
			<!-- table>tr*2>td*5 -->
			<table border="1" width="100%" >
				<tr style="background-color: #ff996d">
					<th width="10%">번호</th>
					<th width="*">제목</th>
					<th width="15%">작성자</th>
					<th width="10%">조회수</th>
					<th width="15%">작성일</th>
					<!-- <th width="5%">첨부</th> -->
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
								<td class="text-center">${row.virtualNum }</td>
								<td class="text-left">
									<a href="./view.do?idx=${row.idx}
										&nowPage=${nowPage}">${row.title}</a>
								</td>
								<td class="text-center">${row.name }</td>
								<td class="text-center">${row.postdate }</td>
								<td class="text-center">${row.hits }</td>
								<!-- <td class="text-center">--</td> -->
							</tr>
							<!-- 리스트반복끝 -->
						</c:forEach>
					</c:otherwise>
				</c:choose>
			<!-- 페이지 번호 -->
			<table border="1" width="90%">
				<tr>
					<td align="center">
						${pagingImg }
					</td>
				</tr>	
			</table>
			</table>
		</div>
			
		<a href="MboardList.do" class="more">전체보기</a>
        </section>
        </div>
        </div>    <!-- =============== container end =============== -->  
        </section>
    
    
    
    
    
    
    
    
    
    <!-- =============== Screenshots =============== -->
    <section id="Screenshots" class="">
	<!-- =============== container =============== -->
    <div class="container">
    <span class="angle2"></span>
    <span class="angle"></span>
     <div class="row">

       <div class="col-xs-12 col-sm-12 col-md-12 wow bounceIn animated headding" data-wow-delay=".1s">
           <h2>Screen <span>Shots</span></h2>
           <p>Display your mobile apps awesome features with icon lists and an image carousel of each page. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.</p>
       </div>

      <div class="col-xs-12 col-sm-12 col-md-12">
         <div class="row">     
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated textright" data-wow-delay=".1s">           
               <div class="span12">

                      <div id="owl-demo" class="owl-carousel">
                        <div class="item">
                            <div class="imghover" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo"><img src="/zipcock/resources/img/owl1.jpg" alt="Owl Image">         
                            <div class="hover-bg"><i class="fa fa-camera camera"></i></div>                 
                            </div> 
                        </div>
                        <div class="item">
                            <div class="imghover" data-toggle="modal" data-target="#exampleModa2" data-whatever="@mdo">
                            <img src="/zipcock/resources/img/owl2.jpg" alt="Owl Image">
                             <div class="hover-bg"><i class="fa fa-camera camera"></i></div>                 
                            </div>
                        </div>
                       <div class="item">
                            <div class="imghover" data-toggle="modal" data-target="#exampleModa3" data-whatever="@mdo">
                            <img src="/zipcock/resources/img/owl3.jpg" alt="Owl Image">
                             <div class="hover-bg"><i class="fa fa-camera camera"></i></div>                 
                            </div>
                        </div> 
                        <div class="item">
                            <div class="imghover" data-toggle="modal" data-target="#exampleModa4" data-whatever="@mdo">
                            <img src="/zipcock/resources/img/owl4.jpg" alt="Owl Image">
                             <div class="hover-bg"><i class="fa fa-camera camera"></i></div>                 
                            </div>
                        </div>
                      </div>              
                    </div>     
                      
        </div>     
          <!-- =============== popup large image =============== -->
          <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
          <div class="modal-dialog" role="document">
            <img src="/zipcock/resources/img/owl1.jpg" alt="Owl Image">
          </div>
         </div>

         <div class="modal fade" id="exampleModa2" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabe2">
          <div class="modal-dialog" role="document">
            <img src="/zipcock/resources/img/owl2.jpg" alt="Owl Image">
          </div>
         </div>
         
         <div class="modal fade" id="exampleModa3" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabe3">
          <div class="modal-dialog" role="document">
            <img src="/zipcock/resources/img/owl3.jpg" alt="Owl Image">
          </div>
         </div>
         
         <div class="modal fade" id="exampleModa4" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabe4">
          <div class="modal-dialog" role="document">
            <img src="/zipcock/resources/img/owl4.jpg" alt="Owl Image">
          </div>
         </div>
		 <!-- =============== popup large image end =============== -->
      </div>
      
    </div>
    </div>      
	</div><!-- =============== container end =============== -->
    </section>
    <!-- =============== Price =============== -->
    <section id="Price" class="">
	<!-- =============== container =============== -->
        <div class="container">
        <span class="angle2"></span>
        <span class="angle"></span>

         <div class="row">

            <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
               <h2>자주하는 질문 <span></span></h2>
               <p>Display your mobile apps awesome features with icon lists and an image carousel of each page. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.</p>
           </div>
           
				<style>
				.cusMainFaqList {
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
				.cusMainFaqList .list {
					overflow: hidden;
					border: 1px solid #222;
				}
				.cusMainFaqList .list ul {
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
				.cusMainFaqList .list ul:after {content: ""; display: block; clear: both;}
				.cusMainFaqList .list li {
					position: relative;
					float: left;
					width: 20%; height: 184px;
				    list-style: none;
				    display: list-item;
		  				text-align: -webkit-match-parent;
				}
				.cusMainFaqList .list a {
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
				.cusMainFaqList .list a:after {
					content: "";
					position: absolute;
					top: 0; right: 0; bottom: -1px; left: -1px;
					border: 1px solid #dcdcdc;
					transition: all .3s;
				}
				.cusMainFaqList .list a:hover {
					background: #104138;
					color: #fff;
					z-index: 2;
				}
				.cusMainFaqList .list a:hover:after {border-color: #104138;}
				.cusMainFaqList .list .num {
					position: absolute;
					top: 40px; left: 32px;
					font: 30px/1.2 'roboR';
				}
				.cusMainFaqList .list .txt {
					display: block;
					display: -webkit-box;
					max-height: 70px;
					overflow: hidden;
					-webkit-line-clamp: 3;
					-webkit-box-orient: vertical;
				}
				.cusMainFaqList .more {
					position: absolute;
					top: 15px; right: 10px;
					padding-right: 9px;
					font-size: 14px;
					background: url('../images/common/arw_btn_more.png') no-repeat 100% 50%;
				}
				
		   </style>
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
          <section class="cusMainFaqList">
          <h3 class="subTitle4C">FAQ</h3>

			<div class="list">
			<ul>
				<li>
					<!-- <a href="https://www.innisfree.com/kr/ko/FaqList.do?seq=1"> -->
					<a href="#">
						<span class="num">1</span>
						<span class="txt">질문1</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">2</span>
						<span class="txt">질문2</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">3</span>
						<span class="txt">질문3</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">4</span>
						<span class="txt">질문4</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">5</span>
						<span class="txt">질문5</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">6</span>
						<span class="txt">질문6</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">7</span>
						<span class="txt">질문7</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">8</span>
						<span class="txt">질문8</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">9</span>
						<span class="txt">질문9</span>
					</a>
				</li>
			
				<li>
					<a href="#">
						<span class="num">10</span>
						<span class="txt">질문10</span>
					</a>
				</li>
			
			
			</ul>
		</div>
		<a href="#" class="more">전체보기</a>
        </section>
        </div>
        </div>    <!-- =============== container end =============== -->  
        </section>
    <!-- =============== Contact =============== -->
    <section id="contact">
	<!-- =============== container =============== -->
		<div class="container">
			    <div class="row">
                 <div class="col-xs-12 col-sm-12 col-md-12 wow bounceIn animated headding" data-wow-delay=".1s">
                   <h2>Contact <span>Us</span></h2>
                   <p>Display your mobile apps awesome features with icon lists and an image carousel of each page. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation.</p>
               </div>


			</div>

			<div class="row">

				<div class="col-xs-12 col-sm-4 col-md-4 wow bounceIn animated" data-wow-delay=".1s">

					<form>
						<div class="ajax-hidden">
							<div class="form-group wow fadeInUp animated">
								<label for="c_name" class="sr-only">Name</label>
								<input type="text" placeholder="Name" name="c_name" class="form-control" id="c_name">
							</div>

							<div data-wow-delay=".1s" class="form-group wow fadeInUp animated">
								<label for="c_email" class="sr-only">Email</label>
								<input type="email" placeholder="E-mail" name="c_email" class="form-control" id="c_email">
							</div>

							<div data-wow-delay=".2s" class="form-group wow fadeInUp animated">
								<textarea placeholder="Message" rows="7" name="c_message" id="c_message" class="form-control"></textarea>
							</div>

							<button data-wow-delay=".3s" class="btn btn-sm btn-block wow fadeInUp animated" type="submit">Send Message</button>
						</div>
						<div class="ajax-response"></div>
					</form>

				</div>
                <div class="col-xs-12 col-sm-4 col-md-4 wow bounceIn animated map" data-wow-delay=".5s">

					  <iframe src="https://www.google.com/maps/embed?pb=!1m16!1m12!1m3!1d6508922.473104964!2d-123.76275651635396!3d37.19583981824279!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!2m1!1sCalifornia%2C+United+States!5e0!3m2!1sen!2sin!4v1450994260631" width="100%" height="250" frameborder="0" style="border:0" allowfullscreen></iframe>

				</div>
                 <div class="col-xs-12 col-sm-4 col-md-4 wow bounceIn animated" data-wow-delay=".6s">

					  <section id="text-15" class="widget widget_text">
                         <h3 class="widget-title">California, United States</h3> <div class="textwidget">785, Firs Avenue, place Mall,<br>
                        <p>Tel: 01 234-56786<br>
                        Mobile: 01 234-56786<br>
                        E-mail: <a href="#">info@templatestock.com</a></p>
                        <a href="#">Get directions on the map</a> â</div>
                    </section>

				</div>                
			</div>
		</div><!-- =============== container end =============== -->
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