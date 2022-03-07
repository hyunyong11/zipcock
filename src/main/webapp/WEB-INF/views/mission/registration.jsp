<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/header.jsp" %>
<%@ include file="/resources/commons/isLogin.jsp" %>
<head>
<title>심부름 요청</title>

<link rel="stylesheet" href="/zipcock/resources/css/errandform.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=33b3ae03428195d3abc232d84375aceb&libraries=services"></script>

</head>
<%
String flag = request.getParameter("flag");
String id = (String)session.getAttribute("Id");
String email = (String)session.getAttribute("Email");
String name = (String)session.getAttribute("UserName");
String tel = (String)session.getAttribute("Phone");
%>

<!-- 페이지 로드시 심부름 항목 자동셀렉 -->
<script type="text/javascript">
$(document).ready(function() {
	$("#category-errand").val('<%=flag%>').prop("selected", true);
});
</script>

<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

/* 위도,경도 가져오기 */
var geocoder = new kakao.maps.services.Geocoder();

/* 경유지 */
function wayZipFind(){
	new daum.Postcode({
        oncomplete: function(data) {
            var form = document.form1;
            var callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
					/* console.log(result); */
		            form.mission_waypoint0.value = result[0].address.x +"|" +result[0].address.y ; //기본주소
                }
            };
            geocoder.addressSearch(data.address, callback);
            
            form.mission_waypoint1.value = data.address; //기본주소
            form.mission_waypoint2.focus();//상세주소
        }
    }).open();
}
/* 도착지 */
function endZipFind(){
	new daum.Postcode({
        oncomplete: function(data) {
            var callback = function(result, status) {
                if (status === kakao.maps.services.Status.OK) {
					/* console.log(result); */
		            form.mission_end0.value = result[0].address.x +"|" +result[0].address.y ; //기본주소
                }
            };
            geocoder.addressSearch(data.address, callback);
            
            var form = document.form1;
            form.mission_end1.value = data.address; //기본주소
            form.mission_end2.focus();//상세주소
        }
    }).open();
}
/* 최소 심부름 금액 */

function validateForm(form) {
	if(form.mission_cost.value < 3000){ 
	    alert("최소 심부름 금액은 3,000원 입니다.");
	    form.mission_cost.value = '';
	    form.mission_cost.focus(); 
	    return false;
	}
}


/* 즉시, 예약 */
function setDisplay(){
    if($('input:radio[id=imm]').is(':checked')){
        $('#selectBox1').hide();
    }else{
        $('#selectBox1').show();
    }
}

</script>

<!-- 바디 -->
<body>
   <!-- header -->
   <div id="header">
      <h1 class="join_title">
         <label for="id">심부름 요청</label>
      </h1>
   </div>

   <!-- wrapper in -->
   <div id="wrapper">

      <!-- content in -->
      <div id="content">

         <!-- form in -->
         <form name="form1" id="form1" method="post" onsubmit="return validateForm(this);" enctype="multipart/form-data" action='<c:url value="/mission_pay.do"/>'>
            <input type="hidden" name="mission_id" value="<%= id %>">
            <input type="hidden" name="buyer_emaill" value="<%= email %>">
            <input type="hidden" name="buyer_name" value="<%= name %>">
            <input type="hidden" name="buyer_tel" value="<%= tel %>">
            <input type="hidden" name="mission_Hid" value="">

            <!-- 가격/심부름 종류 -->
            <div>
               <h3 class="join_title">
                  <label for="category-errand">심부름 항목</label>
               </h3>

               <span class="box int_category" > 
               <select id="category-errand" class="sel" name="mission_category" required >
                     <option value="">--필수선택--</option>
                     <option value="배달,장보기">배달/장보기</option>
                     <option value="청소,집안일">청소/집안일</option>
                     <option value="설치,운반">설치/조립/운반</option>
                     <option value="동행,돌봄">돌봄/동행</option>
                     <option value="벌레,쥐잡기">벌레/쥐잡기</option>
                     <option value="역할대행">역할대행</option>
                     <option value="과외,알바">과외/공부</option>
                     <option value="기타">기타</option>
               </select>
               </span> <span class="error_next_box">필수 정보입니다.</span>
            </div>

            <!-- 심부름 제목 -->
            <div>
               <h3 class="join_title">
                  <label for="id">심부름 제목</label>
               </h3>
               <span class="box int_id"> <input type="text" id="id"
                  class="int" maxlength="50" name="mission_name" required> <span
                  class="step_url">50자 제한</span>
               </span> <span class="error_next_box">필수 정보입니다.</span>
            </div>
            <!-- 선호 성별 -->
            <div>
               <h3 class="join_title">
                  <label for="category-errand">셔틀콕 성별</label>
               </h3>

               <span class="box int_category" > 
               <select id="category-errand" class="sel" name="mission_sex">
                     <option value="1">--셔틀콕 성별 선택 --</option>
                     <option value="1">무관</option>
                     <option value="2">남</option>
                     <option value="3">여</option>
               </select>
               </span> <span class="error_next_box">필수 정보입니다.</span>
            </div>        

            
            <!-- 경유지 -->
            <div>
               <h3 class="join_title">
                  <label for="errLoca">경유지 주소(선택)&nbsp;&nbsp;</label><a href="javascript:;" title="새 창으로 열림" onclick="wayZipFind();" onkeypress="">[검색]</a> 
               </h3>
               
               <input type="hidden" id="errLoca" class="int" maxlength="50" name="mission_waypoint0" value="" >

               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="mission_waypoint1" value="">
               </span>
               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="mission_waypoint2" value="">
               <span class="step_url">상세주소 입력</span>
               </span> 
            </div>
            <!-- 도착지 -->
            <div>
               <h3 class="join_title">
                  <label for="errLoca">도착지 주소&nbsp;&nbsp;</label><a href="javascript:;" title="새 창으로 열림" onclick="endZipFind();" onkeypress="">[검색]</a> 
               </h3>
               <input type="hidden" id="errLoca" class="int" maxlength="50" name="mission_end0" value="" required>
               
               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="mission_end1" value="" required>
               </span>
               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="mission_end2" value="" required>
               <span class="step_url">상세주소 입력</span>
               </span> 
            </div>

            <!-- 요청일시 -->
            <div>
               <h3 class="join_title">
                  <label for="mission_mission">요청일시</label>
               </h3>
               
               <input type="radio" value="1" id="imm" name="mission_mission" onchange="setDisplay()" checked>즉시
               <input type="radio" value="2" id="res" name="mission_mission" onchange="setDisplay()">예약
               
               <span class="box int_date" id="selectBox1" style="display: none;">
               <input type="date" id="reqDate" class="int" name="mission_reservation"> <span class="step_url"></span>
               </span> 
            </div>
            
            <!-- 예상소요시간 -->
            <div>
               <h3 class="join_title">
                  <label for="mission_mission">예상소요시간</label>
               </h3>
               <span class="box int_category" id="selectBox2" > 
               <select id="category-errand" class="sel" name="mission_time" required>
                     <option value="">-- 필수 입력 -- </option>
                     <option value="1"> 10분 이내 </option>
                     <option value="2"> 10 ~ 20분 </option>
                     <option value="3"> 20 ~ 40분 </option>
                     <option value="4"> 40 ~ 60분 </option>
                     <option value="5"> 60분 이상 </option>
               </select>
               </span> <span class="error_next_box">필수 정보입니다.</span>
            </div>

            <!-- 심부름 내용 -->
            <div>
               <h3 class="join_title">
                  <label for="content-errand">심부름 내용</label>
               </h3>
               <span class="box2 int_content"> <textarea
                     id="content-errand" class="textarea" maxlength="200"
                     name="mission_content" required></textarea><span class="step_url">200자
                     제한</span>
               </span> <span class="error_next_box"></span>
            </div>
            
			<!-- picture -->
			 <div>
              	<h3 class="join_title"><label for="picture">첨부파일(선택)</label></h3>
              	<span class="box int_picture">
              		<input type="file" name="ofile" id="pictureInput" accept="/zipcock/resources/img/png, img/jpeg">
              	</span>
             </div>
                
			<!-- 가격 -->
            <div>
               <h3 class="join_title">
                  <label for="pay">심부름 가격</label>
               </h3>
               <span class="box int_pay"> 
                  <input type="text" id="pay" class="int" maxlength="7" name="mission_cost" required> 
                  <span class="step_url">최소금액 3,000원</span>
               </span> 
               <span class="error_next_box">필수 정보입니다.</span>
            </div>

            <!-- 등록 버튼 -->
            <div class="btn_area">
               <button type="submit" id="btnJoin">
                  <span>등록하기</span>
               </button>
            </div> 
         </form> 
         <!-- form out -->

      </div>
      <!-- content out-->

   </div>
   <!-- wrapper out-->
   
</body>
</html>
