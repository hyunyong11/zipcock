<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/header.jsp" %>
<%@ include file="/resources/commons/isLogin.jsp" %>
<head>
    <title>${viewRow.mboard_title }</title>
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
</style>

</head>
<body>
<script type="text/javascript">
function writeValidate(f)
{
/* 	if(f.name.value==""){
		alert("작성자 이름을 입력하세요");
		f.name.focus();
		return false;
	} */
	if(f.contents.value==""){
		alert("내용을 입력하세요");
		f.contents.focus(); 
		return false;
	} 
}
<%
String mission_num = request.getParameter("mission_num");
String mission_category = request.getParameter("row.mission_category");
%>
</script>
<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
  <div class="row">

    <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
    <section class="cusMainFaqList">
    <br /><br /><br /><br /><br /><br /><br />
         
         <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;</h3>
	<div class="container">
		<h2>리뷰게시판</h2>

		
	<table border="1" width="100%">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #B9EEFF;">
				집에서 심부름을 콕! 집콕!
			</td>
		</tr>
	</table>
	<form name="writeFrm" method="post" 
		onsubmit="return writeValidate(this);"
		action="<c:url value="/writeAction.do" />" >
		
	<table class="table table-bordered">
	<input type="hidden" class="form-control" name="mission_num"  value="<%=mission_num %>" />
	<colgroup>
		<col width="20%"/>
		<col width="10%"/>
		<col width="15%"/>
		<col width="10%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">작성자</th>
			<td>
				<input type="text" class="form-control" 
					style="width:100px;" name="review_id" 
						value="${sessionScope.siteUserInfo.member_id }" value="review_id" readonly/>
			<th class="text-center" 
				style="vertical-align:middle;">별점</th>
			<td>
                <span class="rate" style="text-align: center"> 
                    <select id="review_point" class="sel" name="review_point" required>
                            <option value="">별점</option>
                            <option value="1" style="color: red;">★</option>
                            <option value="2" style="color: red;">★★</option>
                            <option value="3" style="color: red;">★★★</option>
                            <option value="4" style="color: red;">★★★★</option>
                            <option value="5" style="color: red;">★★★★★</option>    
                    </select>
                </span>
            </td>
			<tr>
			<%-- <th class="text-center" 
				style="vertical-align:middle;">카테고리</th>
			<td>
				<input type="text" class="form-control" 
					style="width:100px;" name="mission_category" 
					value="<%=mission_category %>" />
			</td> --%>
			</tr>
		<tr>
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td colspan="5">
				<textarea rows="10" class="form-control" 
				name="review_content"></textarea>
			</td>
		</tr>	
	</tbody>
	</table>
	
	<div class="row text-center" style="">
		<!-- 각종 버튼 부분 -->
		
	<table  width="10%" style="margin-left: auto; margin-right: auto" >
			<tr>
		<button type="submit" class="btn btn2">작성하기</button>
		<button type="button" class="btn btn1" onclick="location.href='review.do';">리스트보기</button>
			</tr>
	</table>
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
</body>
</html>

