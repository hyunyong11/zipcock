<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<html lang="en">
<head>
<style>
<style>
body{
  padding: 0;
  margin: 0;
}
div{
  box-sizing: border-box;
}

/* alert badge */
.circle{
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 2.5px;
  background-color: #ff0000;
  position: absolute;
  top: -5px;
  left: 110%;
}

/* 녹색 텍스트 */
.green{
  color: #24855b;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 20px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer{
  background-color: lightgray;  
  display: flex;  
  padding: 21px 16px;  
  height: 170px;
  boder: 1px solid black;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 녹색 숫자 */
.summaryContainer .number{
  font-size: 19px;
  font-weight: bold;
  color: #24855b;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer{
  padding: 21px 16px;
  background-color: white;
  margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title{
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status{
  display: flex;
  justify-content: space-between;
  margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item{
  display: flex;
}

.shippingStatusContainer .number{
  font-size: 31px;
  font-weight: 500;
  text-align: center;
}
.shippingStatusContainer .text{
  font-size: 12px;
  font-weight: normal;
  color: #c2c2c2;
  text-align: center;
}
.shippingStatusContainer .icon{
  display: flex;
  align-items: center;
  padding: 20px;
  width: 16px;
  height: 16px;
}


/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
.listContainer{  
  padding: 0;
  background-color: #ffffff;
  margin-bottom: 10px;
}
.listContainer .item{  
  display: flex;
  align-items: center;
  padding: 16px;
  color: black;
  text-decoration: none;  
  height: 56px;
  box-sizing: border-box;
 
}
.listContainer .icon{  
  margin-right: 14px;
}
.listContainer .text{
  font-size: 16px;
  position: relative;
}
.listContainer .right{
  margin-left: auto;
}


/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight{
  font-size: 14px;
  color: #c2c2c2;  
}
.listContainer .smallLight > span{
  margin-left: 10px;
}

.listContainer .right .blct{
  font-size: 14px;
  font-weight: bold;
  margin-right: 5px;
}



/* 공지사항 이용안내 고객센터 */
.infoContainer{
  background-color: white; 
  display: flex;
  height: 100px;
  margin-bottom: 10px;    
}

.infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 13px;
  text-decoration: none;
  color: black;
}
.infoContainer .item > div:first-child{
  margin-bottom: 2px;
}



/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}
</style>
</style>
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
                        <li>
                           <a href="Notice.do" class="item">Notice</a>  
                   </li>  
                   <li>
                      <a href="serviceCenter.do" class="item">Q&A</a> 
                   </li>   
                        </c:when>
                        <c:otherwise>
                        <li>
                            <a class="page-scroll" href="logout.do">Logout</a>
                        </li>
                        <li>
                            <a class="page-scroll" href="myPage.do">MyPage</a>
                        </li>
                        <li>
                           <a href="Notice.do" class="item">Notice</a>  
                   </li>  
                    <li>
                      <a href="serviceCenter.do" class="item">Q&A</a> 
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
    <section id="" class="">
   <!-- =============== container =============== -->
        <div class="container">
        <span class="angle2"></span>
        <span class="angle"></span>

         <div class="row">
   
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
          <section class="cusMainFaqList">
             <br /><br /><br /><br /><br /><br /><br />
          <div class="col-xs-12 col-sm-12 col-md-12 wow bounceIn animated headding" data-wow-delay=".1s">
                   <h2>My <span>Page</span></h2>
               </div>
          
          
          <div class="summaryContainer" style="border:0px solid red;margin-top:50px;">



    <div class="item" style=" background-color: #fc6b32;" >
        <div style="font-size:30px; border:1px solid black;  ">이름
        </div>
        <div style="font-size:30px; border:1px solid black;  ">
        <br />${sessionScope.siteUserInfo.member_name }</div>
 
      </div>
      
      
      
      <div class="item" style=" background-color: #fc6b32;">
        <div style="font-size:30px; border:1px solid black;  ">보유포인트
        </div>
        <div style="font-size:30px; border:1px solid black;  ">
        <br />${sessionScope.siteUserInfo.member_point }</div>
      </div>
  </div>  
    
  </div>  
  <div class="infoContainer">
    
  </div>
</div>
         
      
        </section>
        </div>
        </div>    <!-- =============== container end =============== -->  
        </section>
         <div class="container">
        <span class="angle2"></span>
        <span class="angle"></span>

         <div class="row">

            
           
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
                  padding-left: 20%;
                  
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
               background: #ff4c00;
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
               /* background: url('../images/common/arw_btn_more.png') no-repeat 100% 50%; */
            }
            
         </style>
         
         
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
              <br /><br /><section class="cusMainFaqList">

         <div class="list" style="width:100%;">
         <ul style="margin-left: auto; margin-right: auto;">
         <li style="background-color: lightgray;">
            <!-- <a href="https://www.innisfree.com/kr/ko/FaqList.do?seq=1"> -->
            <a href="myPage.do">
                   <div class="text" style="font-size:1.3em">회원정보수정</div></span>
            </a>
         </li>
      
         
         <li style="background-color: lightgray; ">
            <a href="#">
               <a href="review.do" class="item">
                         <div class="text" style="font-size:1.5em">리뷰보기</div>
                    </a>
            </a>
         </li>
         
         <li style="background-color: lightgray;">
            <a href="#">
            <c:choose>
                   <c:when test="${sessionScope.siteUserInfo.member_status eq 1 }">
            
                    <a href="CInfoAll.do" class="item">
                       <div class="text" style="font-size:1.5em">요청내용</div>
                       <div class="text" style="font-size:1.5em">보기</div>
                   </a>
                  </c:when>
                  <c:when test="${sessionScope.siteUserInfo.member_status eq 2 }">
                    <a href="HInfoAll.do" class="item">
                       <div class="text" style="font-size:1.5em">수행내용</div>
                       <div class="text" style="font-size:1.5em">보기</div>
                    </a>
                   </c:when>
               </c:choose>
            </a>
         </li>
         <li style="background-color: lightgray;">
            <a href="#" class="item">
                 <div class="text" style="font-size:1.5em">회원탈퇴</div>
             </a>
         </li>   
         </ul>
      </div>
      
        </section>
        </div>
        </div>    <!-- =============== container end =============== --> 
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