<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>심부름 요청 수정</title>

<link rel="stylesheet" href="/zipcock/resources/css/errandform.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
</head>
<%
String flag = request.getParameter("flag");
String id = (String)session.getAttribute("Id");
 
if(session.getAttribute("Id") == null)  {
%>
<script>
	alert('로그인 후 신청가능합니다.');
	location.href="../memberLogin.do";
</script>
<%
} else if(session.getAttribute("UserStatus").equals(2)) {
%>
	<script type="text/javascript">
		alert("헬퍼는 이용하실 수 없습니다.");
		location.href='./zipcock.do';
	</script>
<%
}
else if(session.getAttribute("UserStatus").equals(3)){
%>	
	<script>
		alert('현재 심부름 신청이 불가능합니다.');
		location.href="../zipcock.do";
	</script>
<%
} else if(!(session.getAttribute("missionStatus").equals(1))) {
%>
	<script type="text/javascript">
		alert("매칭 중 일때만 수정할 수 있습니다.");
		history.back();
	</script>
<%
}
%>

<!-- 페이지 로드시 심부름 항목 자동셀렉 -->
<%-- <script type="text/javascript">
$(document).ready(function() {
	$("#category-errand").val('<%=flag%>').prop("selected", true);
});
</script> --%>

<!-- 우편번호 API -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
/* 출발지 */
function startZipFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            var form = document.miss_regiForm;
            form.start_1.value = data.address; //기본주소
            form.start_2.focus() //상세주소
        }
    }).open();
}
/* 중간 */
function wayZipFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            var form = document.miss_regiForm;
            form.way_1.value = data.address; //기본주소
            form.way_2.focus();//상세주소
        }
    }).open();
}
/* 도착지 */
function endZipFind(){
    new daum.Postcode({
        oncomplete: function(data) {
            var form = document.miss_regiForm;
            form.end_1.value = data.address; //기본주소
            form.end_2.focus();//상세주소
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

//이미지 이름 띄우기
function inputImg(frm) {
	var input = frm.pictureInput.value;
	
	if(!input=="") {
		frm.pictureInput2.value = input;
	}
}

</script>

<!-- 확인용 -->
<!-- <script type="text/javascript">
	var a = $("#category-errand option:selected").val();
	alert(a);
</script> -->

<!-- 바디 -->
<body>
   <!-- header -->
   <div id="header">
      <h1 class="join_title">
         <label for="id">심부름 요청 수정</label>
      </h1>
   </div>

   <!-- wrapper in -->
   <div id="wrapper">

      <!-- content in -->
      <div id="content">

         <!-- form in -->
         <form name ="miss_regiForm" method="post" onsubmit="return validateForm(this)" enctype="multipart/form-data" action='<c:url value="/userEditAction.do"/>'>
            <!-- <input type="hid-den" name="mission_category" value="del"> -->
			
			<c:forEach items="${ lists }" var="list">
			
			<input type="hidden" value="${ list.mission_num }" name="num">
            <!-- 가격/심부름 종류 -->
            <div>
               <h3 class="join_title">
                  <label for="category-errand">심부름 항목</label>
               </h3>
				
				<!-- 일단 넘기기 -->
               <span class="box int_category" > 
               <select id="category-errand" class="sel" name="mission_category" required >
               	<c:if test="${ not empty list.mission_category }">
               		 <option value="${ list.mission_category }">${ list.mission_category }</option>
               	</c:if>
               	<c:forEach items="${ list.mission_category }" var="cate" end="0">
                     <option value="">--필수선택--</option>
                     <option value="배달,장보기">배달,장보기</option>
                     <option value="청소,집안일">청소,집안일</option>
                     <option value="설치,운반">설치,조립/운반</option>
                     <option value="동행,돌봄">돌봄,동행</option>
                     <option value="벌레,쥐잡기">벌레,쥐잡기</option>
                     <option value="역할대행">역할대행</option>
                     <option value="과외,알바">과외,공부</option>
                     <option value="기타">기타</option>
               	</c:forEach>
               </select>
               </span> <span class="error_next_box">필수 정보입니다.</span>
            </div>

            <!-- 심부름 제목 -->
            <div>
               <h3 class="join_title">
                  <label for="id">심부름 제목</label>
               </h3>
               <span class="box int_id"> <input type="text" id="id"
                  class="int" maxlength="50" name="mission_name" value="${ list.mission_name }" required> <span
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
               	<c:if test="${ not empty list.mission_sex }">
               		<option value="${ list.mission_sex }">
               			<c:if test="${ list.mission_sex eq 1 }">무관</c:if>
               			<c:if test="${ list.mission_sex eq 2 }">남</c:if>
               			<c:if test="${ list.mission_sex eq 3 }">여</c:if>
               		</option>
               	</c:if>
                     <option value="">--셔틀콕 성별 선택 --</option>
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
               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="way_1" value="${ way_1 }" >
               </span>
               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="way_2" value="${ way_2 }" >
               <span class="step_url">상세주소 입력</span>
               </span>
            </div>
            <!-- 도착지 -->
            <div>
               <h3 class="join_title">
                  <label for="errLoca">도착지 주소&nbsp;&nbsp;</label><a href="javascript:;" title="새 창으로 열림" onclick="endZipFind();" onkeypress="">[검색]</a> 
               </h3>
               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="end_1" value="${ end_1 }" required>
               </span>
               <span class="box int_location"> 
               <input type="text" id="errLoca" class="int" maxlength="50" name="end_2" value="${ end_2 }" required>
               <span class="step_url">상세주소 입력</span>
               </span> 
            </div>

            <!-- 요청일시 -->
            <div>
               <h3 class="join_title">
                  <label for="mission_mission">요청일시</label>
               </h3>
               
               <input type="radio" value="1" id="imm" name="mission_mission" onchange="setDisplay()" <c:if test="${ list.mission_mission eq 1 }">checked</c:if>>즉시
               <input type="radio" value="2" id="res" name="mission_mission" onchange="setDisplay()" <c:if test="${ list.mission_mission eq 2 }">checked</c:if>>예약
               
	               <span class="box int_date" id="selectBox1" <c:if test="${ list.mission_mission eq 1 }">style="display:none"</c:if>>
	               <input type="date" id="reqDate" class="int" name="mission_reservation" value="${ mission_reservation }"> 
	               <span class="step_url"></span>
	               </span> 
            </div>
            
            <!-- 예상소요시간 -->
            <div>
               <h3 class="join_title">
                  <label for="mission_mission">예상소요시간</label>
               </h3>
               <span class="box int_category" id="selectBox2" > 
               <select id="category-errand" class="sel" name="mission_time" required>
               	<c:if test="${ not empty list.mission_time }">
               		 <option value="${ list.mission_time }">
               		 	<c:set var="time" value="${ list.mission_time }" />
               		 	<c:choose>
               		 		<c:when test="${ time eq 1 }">10분 이내</c:when>
               		 		<c:when test="${ time eq 2 }">10 ~ 20분</c:when>
               		 		<c:when test="${ time eq 3 }">20 ~ 30분</c:when>
               		 		<c:when test="${ time eq 4 }">40 ~ 50분</c:when>
               		 		<c:otherwise>60분 이상</c:otherwise>
               		 	</c:choose>
               		 </option>
               	</c:if>
                     <option value="">-- 필수 입력 -- </option>
                     <option value="1"> 10분 이내 </option>
                     <option value="2"> 10 ~ 20분 </option>
                     <option value="3"> 20 ~ 30분 </option>
                     <option value="4"> 40 ~ 50분 </option>
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
                     name="mission_content" required>${ list.mission_content }</textarea>
                     <span class="step_url">200자 제한</span>
               </span> <span class="error_next_box"></span>	
            </div>
            
			<!-- picture -->
			 <div>
              	<h3 class="join_title"><label for="picture">첨부파일(선택)</label></h3>
              	<span class="box int_picture">
              		<input type="file" name="ofile" id="pictureInput" accept="/zipcock/resources/img/png, img/jpeg"
              			onchange="inputImg(this.form);">
              	</span>
              	<input type="text" class="box int_picture" value="${ list.mission_ofile }" name="ofile" id="pictureInput2" />
             </div>
                
			<%-- <!-- 가격 -->
            <div>
               <h3 class="join_title">
                  <label for="pay">심부름 가격</label>
               </h3>
               <span class="box int_pay"> 
                  <input type="text" id="pay" class="int" maxlength="7" name="mission_cost" value="${ list.mission_cost }" required> 
                  <span class="step_url">최소금액 3,000원</span>
               </span> 
               <span class="error_next_box">필수 정보입니다.</span>
            </div> --%>

            <!-- 등록 버튼 -->
            <div class="btn_area">
               <button type="submit" id="btnJoin">
                  <span>요청변경</span>
               </button>
            </div>
			</c:forEach>
         </form> 
         <!-- form out -->

      </div>
      <!-- content out-->

   </div>
   <!-- wrapper out-->
   
  <!--  <script src="../js/errandform.js"></script> -->
</body>
</html>