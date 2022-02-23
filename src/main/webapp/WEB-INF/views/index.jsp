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
                       <!-- <li class="nav-item dropdown">
                      <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Cock Service
                      </a>
                      <ul class="dropdown-menu dropdown-menu-dark" aria-labelledby="navbarDarkDropdownMenuLink">
                        <li><a class="dropdown-item" href="HList.do">List</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                      </ul>
                    </li> -->
                    
                        <li>
                            <a class="page-scroll" href="#about">About</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="HList.do">Cock</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#Notice">Notice</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#Screenshots">Screenshots</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="#contact">Contact</a>
                        </li>
                         <!-- <li>
                            <a href="webSocket.do" target="_blank">웹소켓</a>
                        </li>
                         -->
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
            <span></span>
            <div class="row">
                <div class="col-xs-12 col-sm-5 col-md-3 wow fadeInLeft animated"  data-wow-delay=".5s">
                    <h1><span>HELLO!</span> '집콕'을 소개합니다.</h2>      
                  </div>
                  
                  <div class="col-xs-12 col-sm-7 col-md-9 wow fadeInRight animated" style="padding-left: 130px" data-wow-delay=".5s">
                  <h2 style="color: #ff4c00">최근 3년 연속 국내 배달앱 시장 중</h2>
                  <h2 style="color: #ff4c00">주문상품 대비 고객 포인트 적립율 1위!</h2>
                  <br />
                  <h4>우리집 안방 10km 내 유통된 모든 물건을 집앞까지 콕!!!</h4>
                  <br />
                     <h4>배달의 시작과 끝을 책임지는 실시간 위치 서비스로 한눈에 콕!!!</h4>
                  <br />
                    <h4>심부름꾼 후기 열람 기능을 통한 선순환 배달 안전 서비스 보장 콕!!!</h4>     
                  </div>  
            </div>
        </div>   
      <!-- =============== container end =============== -->      
    </section>
    <!-- =============== how it works =============== -->
    <section id="Cock" class="parallax">
   <!-- =============== container =============== -->
    <div class="container">
     <span class="angle2"></span>
    <span class="angle"></span>
    <style>
    button img{
        margin-top: 40px;
    }
    </style>
    <form method="get" action="mission_select.do">
     <div class="row">
    
       <div class="col-xs-12 col-sm-12 col-md-12 wow bounceIn animated headding" data-wow-delay=".5s">
           <br /><br />
           <h2>심부름 <span>요청하기</span></h2>
           <br /><br /><br />
       </div>
       
   
      <div class="col-xs-12 col-sm-4 col-md-4">
         <div class="row">     
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInLeft animated textright" data-wow-delay=".5s">
            <h3>배달, 장보기</h3>
              <p></p>     
          </div>
            <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInRight animated" data-wow-delay=".5s">
                <button type="submit" name="flag" value="배달,장보기"> <img alt="배달,장보기" src="/zipcock/resources/img/1.delivery.png"> </button>
                <!-- <input type="image" name="delivery" src="/zipcock/resources/img/1.delivery.png"> -->
          </div>    
        </div>
        <div class="row"> 
         <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInLeft animated textright" data-wow-delay=".6s">
            <h3>청소, 집안일</h3>
              <p></p>     
          </div>
           <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInRight animated" data-wow-delay=".6s">
                <button type="submit" name="flag" value="청소,집안일"> <img alt="청소,집안일" src="/zipcock/resources/img/2.clean.png"> </button>
          </div>     
        </div>
        <div class="row"> 
         <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInLeft animated textright" data-wow-delay=".6s">
            <h3>설치, 운반</h3>
              <p></p>     
          </div>
            <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInRight animated" data-wow-delay=".6s">
                <button type="submit" name="flag" value="설치,운반"> <img alt="설치,운반" src="/zipcock/resources/img/3.installation.png"> </button>
          </div>     
        </div>
        <div class="row">            
         <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInLeft animated textright" data-wow-delay=".7s">
            <h3>동행, 돌봄</h3>
              <p></p>     
          </div>
          <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInRight animated" data-wow-delay=".7s">
                <button type="submit" name="flag" value="동행,돌봄"> <img alt="동행,돌봄" src="/zipcock/resources/img/4.together.png"> </button>
          </div>         
           
        </div>        
      </div>

      <div class="col-xs-12 col-sm-4 col-md-4 wow bounceIn animated textcenter" data-wow-delay=".4s">
      <!-- 핸드폰이미지 -->
       <img src="/zipcock/resources/img/slide-bg.png" alt="slide-bg" />
      </div>  
         
      <div class="col-xs-12 col-sm-4 col-md-4">
         <div class="row" style="height: 90px;" >         
          <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInLeft animated" data-wow-delay=".5s">
                <button type="submit" name="flag" value="벌레,쥐잡기"> <img alt="벌레,쥐잡기" src="/zipcock/resources/img/5.bug.png"> </button>
          </div>    
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInRight animated textleft" data-wow-delay=".5s">
            <h3>&nbsp;&nbsp;벌레, 쥐잡기</h3>
              <p></p>    
          </div>
           
        </div>
        <div class="row" style="height: 90px;">   
        <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInLeft animated" data-wow-delay=".6s">
                <button type="submit" name="flag" value="역할대행"> <img alt="역할대행" src="/zipcock/resources/img/6.role.png"> </button>
          </div>          
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInRight animated textleft" data-wow-delay=".6s">
            <h3>&nbsp;&nbsp;역할대행</h3>
              <p></p>     
          </div>
          
        </div>
        <div class="row" style="height: 90px;">   
        <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInLeft animated" data-wow-delay=".6s">
                <button type="submit" name="flag" value="과외,알바"> <img alt="과외,알바" src="/zipcock/resources/img/7.lesson.png"> </button>
          </div>          
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInRight animated textleft" data-wow-delay=".6s">
            <h3>&nbsp;&nbsp;과외, 알바</h3>
              <p></p>     
          </div>
          
        </div>
        <div class="row" style="height: 90px;">    
        <div class="col-xs-2 col-sm-2 col-md-2 wow fadeInLeft animated" data-wow-delay=".7s">
               <button type="submit" name="flag" value="기타"> <img alt="기타" src="/zipcock/resources/img/8.etc.png"> </button>
          </div>          
          <div class="col-xs-10 col-sm-10 col-md-10 wow fadeInRight animated textleft" data-wow-delay=".7s">
            <h3>&nbsp;&nbsp;기타</h3>
              <p></p>     
              
          </div>
         
        </div>        
      </div>
    </div>
   </form>
    </div>   
   <!-- =============== container end =============== -->   
    </section>
    
    
    <!-- =============== Price =============== -->
    <section id="Notice" class="">
   <!-- =============== container =============== -->
     <div class="container">
     <span class="angle2"></span>
     <div class="row">



       <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
       <section class="cusMainFaqList">
          <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;NOTICE</h3>
      <div class="container">
      <h2>공지사항</h2>

         
      <table border="1" width="100%">
         <tr>
            <td align="center" style="background-color: lightgray;">
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
                  <td class="text-center">${row.virtualNum }</td>
                  <td class="text-left">
                     <a href="./NoticeV.do?num=${row.mboard_num}
                        &nowPage=${nowPage}">${row.mboard_title}</a>
                  </td>
                  <td class="text-center">${row.mboard_id }</td>
                  <td class="text-center">${row.mboard_date }</td>
                  <td class="text-center">${row.mboard_count }</td>
               </tr>
               
               <!-- 리스트반복끝 -->
            </c:forEach>
         </c:otherwise>
         </c:choose>
         <table border="1" width="100%">
            <tr>
               <td align="center" style="background-color: lightgray;">
                  집에서 심부름을 콕! 집콕!
               </td>
            </tr>
         </table>
      <!-- 페이지 번호 -->
         <table border="0" width="100%">
            <tr>
               <td align="center">
               <button type="button" style="background-color: #ffc654; font-weight: bold"
                  onclick="location.href='Notice.do'">더 보기</button>
               </td>
            </tr>
            <br />
         </table>
      </table>
      </div>
         
        </section>
        </div>
        </div>    <!-- =============== container end =============== -->  
        </section>

    <!-- =============== Screenshots =============== -->
    <section id="Screenshots" class="">
   <!-- =============== container =============== -->
    <div class="container">
    <span class="angle2"></span>
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
                        <a href="#">Get directions on the map</a> â  </div>
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

                    <p class="copyright">
                        &copy; 2021 Zipcock
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