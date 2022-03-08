<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  
<%@ include file="/resources/commons/header.jsp" %>  
<%@ include file="/resources/commons/isLogin.jsp" %>
<head>
    <title>리뷰게시판</title>
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
<script>
function deleteRow(review_num){
	if(confirm("정말로 삭제하시겠습니까?")){
		location.href="delete.do?review_num="+ review_num;
	}
}
</script>
<body>
<div class="container">
	
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
	 	<%--<c:choose>
    	 <c:when test="${sessionScope.siteUserInfo.member_status eq 1 }">
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
		</c:when>
		</c:choose> --%>
		 	<!-- table>tr*2>td*5 -->
		<table class="table table-bordered" id="dataTable" width="90%" cellspacing="0" >
			<tr style="background-color: #ffc654">
				<th width="10%" style="text-align: center">번호</th>
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
				<td class="text-center" style="background-color: lightgray">${row.virtualNum }</td>
				<td class="text-center" >${row.review_content  }</td>
				<td class="text-center">${row.review_point  }</td>
				<td class="text-cemter"><img src="" class="media-object" style="width:70px">${row.review_id }</td>
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
			<button type="button" class="btn btn4" onclick="location.href='zipcock.do';">메인으로 가기</button>
			</tr>
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
</body>
</html>