<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/header.jsp" %>  
<%@ include file="/resources/commons/isLogin.jsp" %>  
<head>
    <title>마이페이지</title>
    
    <link rel="stylesheet" href="/zipcock/resources/css/mypage.css" type="text/css">
</head>
<body>

<div class="container">
  
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
    
      </section>
      </div>
      </div>    <!-- =============== container end =============== -->  
       <div class="container">
      <span class="angle2"></span>
      <span class="angle"></span>

       <div class="row">

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
   <%@ include file="/resources/commons/chatBot.jsp" %>
</body>
</html>