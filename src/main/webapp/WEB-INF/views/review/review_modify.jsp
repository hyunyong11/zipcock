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
</script>
<!-- JSTL의 url태그는 컨텍스트루트 경로를 자동으로 포함시켜 준다. -->
  <div class="row">

    <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
    <section class="cusMainFaqList">
    <br /><br /><br /><br /><br /><br /><br />
    
    <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;</h3>
	<div class="container">
		<h2>리뷰게시판</h2>
	<form name="writeFrm" method="post" 
        onsubmit="return writeValidate(this);"
        action="<c:url value="/modifyAction.do" />" >
	<table border="1" width="100%">
		<tr>
			<td align="center" style="font-weight: bold; background-color: #B9EEFF;">
				집에서 심부름을 콕! 집콕!
			</td>
		</tr>
	</table> 
			
	<!-- 게시물의 일련번호와 작성자ID를 hidden속성으로 삽입한다.  -->
	<input type="hidden" name="review_num" value="${dto.review_num}"/>
	<input type="hidden" name="member_id" value="${sessionScope.siteUserInfo.member_id }"/>
		
	<table class="table table-bordered">
	<colgroup>
		<col width="20%"/>
		<col width="*"/>
	</colgroup>
	<tbody>
        <tr>
            <th class="text-center" 
                style="vertical-align:middle;">작성자</th>
            <td>
                <input type="text" class="form-control" 
                    style="width:100px;" name="review_id" 
                        value="${sessionScope.siteUserInfo.member_id }" />
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
			<th class="text-center" 
				style="vertical-align:middle;">내용</th>
			<td colspan="5">
				<textarea rows="10" class="form-control" 
				name="review_content" >${dto.review_content }</textarea>
			</td>
		</tr>	
	</tbody>
	</table>
	
		<!-- 각종 버튼 부분 -->		
		<button type="submit" class="btn btn1">수정완료</button>
		<!-- <button type="reset" class="btn btn2">다시쓰기</button> -->
		<button type="button" class="btn btn3" 
			onclick="location.href='review.do';">리스트보기</button>
     </form>
     </section>
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
