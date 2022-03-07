<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/resources/commons/header.jsp" %>
<%@ include file="/resources/commons/isLogin.jsp" %>  
<head>
    <title>마이페이지</title>
</head>
<% 
String id = (String)session.getAttribute("Id");
%>
<body>
<div class="container">
	
	 <!-- =============== Price =============== -->
    <section id="Notice" class="">
	<!-- =============== container =============== -->
        <div class="container">
        <span class="angle2"></span>
        <span class="angle"></span>

         <div class="row">
	
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
          <section class="cusMainFaqList">
          <br /><br /><br /><br /><br /><br /><br />
          
          <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;My page(헬퍼)</h3>
		<div class="container">
			<h2>수행내역</h2>

			
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
					<th width="10%" style="text-align: center">비용</th>
				</tr> 
				<c:choose>
					<c:when test="${empty lists }">
						<tr>
							<td colspan="6" class="text-center">
								등록된 게시물이 없습니다 ^^*
							</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${lists }" var="row">        
	  			<c:if test="${sessionScope.siteUserInfo.member_id eq row.mission_Hid}">
                <tr>
                    <td>${row.virtualNum }</td>
                    <th>
                      <a href="missionHDetail.do?mission_num=${row.mission_num }">${row.mission_name }</a>
                    </th>
                    <td>${row.mission_id }</td>
                    <td>${row.mission_cost }</td>
                </tr>
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
     <%@ include file="/resources/commons/chatBot.jsp" %>
</body>
</html>
