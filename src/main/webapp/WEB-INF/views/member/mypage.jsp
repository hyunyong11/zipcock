<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/header.jsp" %>  
<%@ include file="/resources/commons/isLogin.jsp" %>
<head>
<title>마이페이지</title>
<link rel="stylesheet" href="/zipcock/resources/css/mypage.css" type="text/css">
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
</head>
<body>
<body>
<div class="container">
   <div id="header">
   <h1 class="login_title">
      <label>MY PAGE</label><br>
   </h1>
 </div>
 <div id="wrapper">
 <div class="summaryContainer">
   <div class="item">
       <div class="number">${sessionScope.siteUserInfo.member_name }</div>
     </div>
     <c:choose>
         <c:when test="${sessionScope.siteUserInfo.member_status eq 1 }">
        <div class="item">
          <div class="number"><a href="CInfoAll.do">요청내용보기</a></div>
        </div>
        </c:when>
        <c:when test="${sessionScope.siteUserInfo.member_status eq 2 }">
        <div class="item">
          <div class="number"><a href="HInfoAll.do">수행내용보기</a></div>
        </div>
        </c:when>
        <%-- <c:otherwise>
        <div class="item">
          <div class="number">그외</div>
          <div>아직 구현못함 ㅠ</div>
        </div>
        </c:otherwise> --%>
     </c:choose>
     <c:choose>
     <c:when test="${sessionScope.siteUserInfo.member_status eq 2 }">
     <div class="item">
       <div class="number">${sessionScope.siteUserInfo.member_point }</div>
       <div>보유포인트</div>
     </div>
     </c:when>
     </c:choose>
   </div>
 </div>  
 <div class="listContainer">
   <a href="myPage.do" class="item">
       <div class="icon">Ⅰ</div>
       <div class="text">회원정보수정<span class="circle"></span></div>
       <div class="right"> > </div>
   </a>
   
   <a href="memberDelete.do" class="item">
       <div class="icon">Ⅱ</div>
       <div class="text">회원탈퇴<span class="circle"></span></div>
       <div class="right"> > </div>
   </a>
   <c:choose>
      <c:when test="${sessionScope.siteUserInfo.member_status eq 1 }">
         <a href="review.do" class="item">
         <div class="icon">Ⅲ</div>
         <div class="text">내가쓴리뷰관리<span class="circle"></span></div>
         <div class="right"> > </div>
      </a>
      </c:when>
      <c:when test="${sessionScope.siteUserInfo.member_status eq 2 }">
         <a href="review.do" class="item">
             <div class="icon">Ⅲ</div>
             <div class="text">리뷰보기<span class="circle"></span></div>
             <div class="right"> > </div>
           </a>
      </c:when>
   </c:choose>
 </div>
 <div class="infoContainer">
   <a href="Notice.do" class="item">
     <div>공지사항</div>
   </a>    
   <a href="/zipcock/resources/build/index.html" class="item">
     <div>Q&A</div>
   </a>    
   <a href="download.do" class="item">
     <div>앱 다운로드</div>
   </a>
   </div>
 </div>

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