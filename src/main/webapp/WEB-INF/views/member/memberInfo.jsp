<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/isLogin.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 변경</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
</head>
<body>
<script type="text/javascript">
function joinValidate(form){
	
	if(form.email_1.value==""){
	    alert("이메일을 입력하세요");
	    form.email_1.focus();
	    return false;
	}
	
	if(!form.pass1.value || !form.pass2.value){
	    alert('패스워드를 입력하세요');
	    return false;
	}
	
	if(form.pass1.value != form.pass2.value){
	    alert('입력한 패스워드가 일치하지 않습니다.');
	    form.pass1.value=""; 
	    form.pass2.value="";
	    form.pass1.focus();
	    return false;
	}
	
	
	if(form.email_check.value==""){
	    alert("도메인을 선택하세요");
	    form.email_check.focus();
	    return false;
	}
	
	if(form.age_check.value == "1") {
		alert("나이를 입력하세요");
		form.age_check.focus();
		return false;
	}

	if(form.phone.value =="" ){
	    alert("핸드폰번호를 입력하세요");
	    form.phone.focus();
	    return false;
	}
	
	if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
	}
	
	if((form.bank_check.value == "1")) {
		alert("은행을 선택해주세요");
		form.bank_check.focus();
		return false;
	}
	
	if((form.account.value == '')) {
		alert("계좌번호를 입력해주세요");
		form.account.focus();
		return false;
	}
	
	//숫자랑 영문 이외에는 모든 값을 입력할 수 없음
	var whatType = form.id.value
	for(var i=0; i<whatType.length; i++){
	    if(!((whatType[i]>='a' && whatType[i]<='z') ||
	            (whatType[i]>='A' && whatType[i]<='Z') ||
	            (whatType[i]>='0' && whatType[i]<='9'))){
	        alert("아이디는 숫자랑 영문자만 입력가능합니다");
	        form.id.value = '';
	        form.id.focus(); 
	        return false;
	    }
	}
}

function email_input(form){
    var domain = form.email_check.value;
    if(domain==''){ //'선택해주세요'부분을 선택했을때
    	form.email_1.value='';
    	form.email_2.value='';
    }
    else if(domain =="1"){ //'직접입력'을 선택했을때
    	form.email_2.readOnly = false; 
    	form.email_2.value='';
    	form.email_2.focus();
    }
    else{ //도메인을 선택했을때
    	form.email_2.value = domain; 
    	form.email_2.readOnly = true;
    }
}

//중복확인
function id_check_person(form){
	
	if(form.id.value==""){
        alert("아이디를 입력후 중복확인을 누르세요");
        form.id.focus();
        return false;
    }
	
	if( !(form.id.value.length >=4 && form.id.value.length <=12)){ 
	    alert("4자 이상 12자 이내의 값만 입력하세요");
	    form.id.value = '';
	    form.id.focus(); 
	    return false;
	}
    else{
    	form.id.readOnly = true; //검증이 끝난후 수정을 할 수 없게하고 팝업창에서는 수정할 수 있도록 readOnly사용 
    	var popupX = (document.body.offsetWidth / 2) - (200 / 2)-300;
    	var popupY= (document.body.offsetHeight / 2) - (300 / 2);
        window.open("./resources/H_idCheckProcess.jsp?id=" + form.id.value, "idover", 'status=no, height=300, width=500, left='+ popupX + ', top='+ popupY);
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

<%
if(!(session.getAttribute("Id") == null) && session.getAttribute("UserStatus").equals(2)) {
%>
<div class="container">
	
	<!-- 회원등급 -->
	<input type="hidden" name="member_status" value="2">
	<!-- header -->
	<div id="header">
		<h1 class="join_title">
			<label for="id">회원정보 변경</label>
		</h1>
	</div>

	<!-- wrapper in -->
	<div id="wrapper">

		<!-- content in -->
		<div id="content">

			<!-- form in -->
			<form name = "Hjoin" method="post" onsubmit="return joinValidate(this);" enctype="multipart/form-data" action='<c:url value="myHelperPageAction.do" />'>
			
				
				<!-- Email -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일</label>
					</h3>
					<span class="box_email"> 
						<input type="text" id="email_1" class="join_email" maxlength="20" name="email_1" value="${ email_1 }">
					</span>
					&nbsp;@
					<span class="box_email"> 
						<input type="text" id="email_2" class="join_email" maxlength="20" name="email_2" value="${ email_2 }" style="width:20%"readonly> 
					</span>
					&nbsp;
					<span class="box_email"> 
						<select name="email_check" onchange="email_input(this.form);" class="join_email" id="email_check" style="width:20%">
								<option selected="" value="${ email_2 }">-선택-</option>
								<option value="1" >직접입력</option>
								<option value="dreamwiz.com" >dreamwiz.com</option>
								<option value="empal.com" >empal.com</option>
								<option value="empas.com" >empas.com</option>
								<option value="freechal.com" >freechal.com</option>
								<option value="hanafos.com" >hanafos.com</option>
								<option value="hanmail.net" >hanmail.net</option>
								<option value="hotmail.com" >hotmail.com</option>
								<option value="intizen.com" >intizen.com</option>
								<option value="korea.com" >korea.com</option>
								<option value="kornet.net" >kornet.net</option>
								<option value="msn.co.kr" >msn.co.kr</option>
								<option value="nate.com" >nate.com</option>
								<option value="naver.com" >naver.com</option>
								<option value="netian.com" >netian.com</option>
								<option value="orgio.co.kr" >orgio.co.kr</option>
								<option value="paran.com" >paran.com</option>
								<option value="sayclub.com" >sayclub.com</option>
								<option value="yahoo.co.kr" >yahoo.co.kr</option>
								<option value="yahoo.com" >yahoo.com</option>
							</select>
					 </span> <span class="error_next_box"></span>
				</div> 
				
				<c:forEach items="${ dto }" var="list">
				<!-- pass1 -->
				<div>
					<h3 class="join_title">
						<label for="pass1">비밀번호</label>
					</h3>
					<span class="box int_pass"> 
						<input type="password" id="pass1" class="join_H" maxlength="16" name="member_pass" value="${ list.member_pass }"> 
						<span id="alertTxt">사용불가</span> 
						<img src="/zipcock/resources/img/m_icon_pass.png" id="pass1_img" class="passImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- pass2 -->
				<div>
					<h3 class="join_title">
						<label for="pass2">비밀번호 확인</label>
					</h3>
					<span class="box int_pass_check"> 
						<input type="password" id="pass2" class="join_H" maxlength="16" name="password2" value="${ list.member_pass }">
						<img src="/zipcock/resources/img/m_icon_check_disable.png" id="pass2_img" class="passImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- age -->
				<div>
					<h3 class="join_title">
						<label for="age">나이</label>
					</h3>
					<div id="age_wrap">
						
						<div id="age">
							<span class="box"> 
								<select id="age_check" class="sel" name="member_age" >
									<c:if test="${ not empty list.member_age }">
										<option value="${ list.member_age }">${ list.member_age }</option>
									</c:if>
									<c:forEach items="${ list.member_age }" var="age">
										<option value="1">---나이변경---</option>
										<option value="10대" <c:if test="${ age eq '10대' }">style="display:none"</c:if>>10대</option>
										<option value="20대" <c:if test="${ age eq '20대' }">style="display:none"</c:if>>20대</option>
										<option value="30대" <c:if test="${ age eq '30대' }">style="display:none"</c:if>>30대</option>
										<option value="40대" <c:if test="${ age eq '40대' }">style="display:none"</c:if>>40대</option>
										<option value="50대" <c:if test="${ age eq '50대' }">style="display:none"</c:if>>50대</option>
										<option value="60대" <c:if test="${ age eq '60대' }">style="display:none"</c:if>>60대</option>
										<option value="기타" <c:if test="${ age eq '기타' }">style="display:none"</c:if>>기타</option>
									</c:forEach>
										
								</select>
							</span>
						</div>
					</div>
	
				<!-- phone -->
				<div>
					<h3 class="join_title">
						<label for="phone">휴대전화</label>
					</h3>
					<span class="box int_phone"> 
						<input type="text" id="phone" class="join_H" maxlength="11" placeholder="휴대전화 입력" name="member_phone" value="${ list.member_phone }">
						<span class="step_url">'-' 생략</span>
					</span> <span class="error_next_box"></span>
				</div>

				<!-- bank -->
				<div>
					<h3 class="join_title">
						<label for="bank">입금계좌 은행</label>
					</h3>
					<div id="bank_wrap">

						<div id="bank">
							<span class="box"> 
							<select id="bank_check" class="sel" name="member_bank">
								<c:if test="${ not empty list.member_bank }">
									<option value="${ list.member_bank }">${ list.member_bank }</option>
								</c:if>
								<c:forEach items="${ list.member_bank }" var="bank">
									<option value="1">----은행변경----</option>
									<option value="기업은행" <c:if test="${ bank eq '기업은행' }">style="display:none"</c:if>>기업은행</option>
									<option value="국민은행" <c:if test="${ bank eq '국민은행' }">style="display:none"</c:if>>국민은행</option>
									<option value="우리은행" <c:if test="${ bank eq '우리은행' }">style="display:none"</c:if>>우리은행</option>
									<option value="신한은행" <c:if test="${ bank eq '신한은행' }">style="display:none"</c:if>>신한은행</option>
									<option value="하나은행" <c:if test="${ bank eq '하나은행' }">style="display:none"</c:if>>하나은행</option>
									<option value="농협은행" <c:if test="${ bank eq '농협은행' }">style="display:none"</c:if>>농협은행</option>
									<option value="SC은행" <c:if test="${ bank eq 'SC은행' }">style="display:none"</c:if>>SC은행</option>
									<option value="카카오뱅크" <c:if test="${ bank eq '카카오뱅크' }">style="display:none"</c:if>>카카오뱅크</option>
								</c:forEach>
							</select>
							</span> <span class="error_next_box">하나는 필수 선택.</span>
						</div>
					</div>
				</div>
				
				<!-- account -->
				<div>
					<h3 class="join_title">
						<label for="account">계좌번호</label>
					</h3>
					<span class="box int_phone"> 
						<input type="text" id="account" class="join_H" maxlength="30" placeholder="계좌번호 입력" name="member_account" value="${ list.member_account }">
						<span class="step_url">'-' 생략</span>
					</span> <span class="error_next_box"></span>
				</div>
				
				<!-- vehicle -->
				<div>
					<h3 class="join_title">
						<label for="vehicle">보유중인 주요 이동수단</label>
					</h3>
					<div id="vehicle_wrap">

						<div id="vehicle">
							<span class="box">
							<c:if test=""></c:if>
								<label><input type="radio" id="vehicle_check" value="0" name="member_vehicle"
								<c:if test="${ list.member_vehicle eq 0 }">checked="checked"</c:if>>&nbsp;자동차&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="1" name="member_vehicle"
								<c:if test="${ list.member_vehicle eq 1 }">checked="checked"</c:if>>&nbsp;오토바이&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="2" name="member_vehicle"
								<c:if test="${ list.member_vehicle eq 2 }">checked="checked"</c:if>>&nbsp;자전거&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="3" name="member_vehicle"
								<c:if test="${ list.member_vehicle eq 3 }">checked="checked"</c:if>>&nbsp;도보&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="4" name="member_vehicle"
								<c:if test="${ list.member_vehicle eq 4 }">checked="checked"</c:if>>&nbsp;기타&nbsp;</label>
							</span>
						</div>
					</div>
				</div>

				<!-- introduce -->
				<div>
					<h3 class="join_title">
						<label for="introduce">자기소개</label>
					</h3>
					<span class="box int_address"> 
						<input type="text" id="introduce" class="join_H" maxlength="20" placeholder="20자 이내 입력" name="member_introduce" value="${ list.member_introduce }"> 
					</span> <span class="error_next_box"></span>
				</div>

				<!-- picture -->
				 <div>
                	<h3 class="join_title"><label for="picture">프로필사진(변경시 입력만 지울시에는 그대로 두세요)</label></h3>
                	<span class="box int_picture">
                		<input type="file" name="ofile" id="pictureInput" accept="/zipcock/resources/img/png, img/jpeg" value="${ list.member_ofile }" 
                		 	onchange="inputImg(this.form);" />
                	</span>
                		<input type="text" class="join_H" value="${ list.member_ofile }" name="ofile" id="pictureInput2" />
           
                </div>

				
			</c:forEach>
				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>변경하기</span>
					</button>
				</div>
				
			</form>
			<!-- form out -->
			
		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->
	
</div>
<%
} else if(!(session.getAttribute("Id") == null) && session.getAttribute("UserStatus").equals(1) || session.getAttribute("UserStatus").equals(0)) {
%>
	
<div class="container">
	<!-- 회원등급 -->
	<input type="hidden" name="member_status" value="1">
	<!-- header -->
	<div id="header">
		<h1 class="join_title">
			<label for="id">회원정보수정</label>
		</h1>
	</div>

	<!-- wrapper in -->
	<div id="wrapper">

		<!-- content in -->
		<div id="content">

			<!-- form in -->
			<form name = "Ujoin" method="post" onsubmit="return joinValidate(this);" action='<c:url value="myUserPageAction.do" />'>

				<!-- Email -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일</label>
					</h3>
					<span class="box_email"> 
						<input type="text" id="email_1" class="join_email" maxlength="20" name="email_1" value="${ email_1 }">
					</span>
					&nbsp;@
					<span class="box_email"> 
						<input type="text" id="email_2" class="join_email" maxlength="20" name="email_2" value="${ email_2 }" style="width:20%"readonly> 
					</span>
					&nbsp;
					<span class="box_email"> 
						<select name="email_check" onchange="email_input(this.form);" class="join_email" id="email_check" style="width:20%">
								<option selected="" value="">-선택-</option>
								<option value="1" >직접입력</option>
								<option value="dreamwiz.com" >dreamwiz.com</option>
								<option value="empal.com" >empal.com</option>
								<option value="empas.com" >empas.com</option>
								<option value="freechal.com" >freechal.com</option>
								<option value="hanafos.com" >hanafos.com</option>
								<option value="hanmail.net" >hanmail.net</option>
								<option value="hotmail.com" >hotmail.com</option>
								<option value="intizen.com" >intizen.com</option>
								<option value="korea.com" >korea.com</option>
								<option value="kornet.net" >kornet.net</option>
								<option value="msn.co.kr" >msn.co.kr</option>
								<option value="nate.com" >nate.com</option>
								<option value="naver.com" >naver.com</option>
								<option value="netian.com" >netian.com</option>
								<option value="orgio.co.kr" >orgio.co.kr</option>
								<option value="paran.com" >paran.com</option>
								<option value="sayclub.com" >sayclub.com</option>
								<option value="yahoo.co.kr" >yahoo.co.kr</option>
								<option value="yahoo.com" >yahoo.com</option>
							</select>
					 </span> <span class="error_next_box"></span>
				</div>
				
				<c:forEach items="${ dto }" var="list">
					<div>
						<h3 class="join_title">
							<label for="pass1">비밀번호</label>
						</h3>
						<span class="box int_pass"> 
							<input type="password" id="pass1" class="join_H" maxlength="16" name="member_pass" value="${ list.member_pass }"> 
							<span id="alertTxt">사용불가</span> 
							<img src="/zipcock/resources/img/m_icon_pass.png" id="pass1_img" class="passImg">
						</span> <span class="error_next_box"></span>
					</div>
	
					<!-- pass2 -->
					<div>
						<h3 class="join_title">
							<label for="pass2">비밀번호 확인</label>
						</h3>
						<span class="box int_pass_check"> 
							<input type="password" id="pass2" class="join_H" maxlength="16" name="password2" value="${ list.member_pass }">
							<img src="/zipcock/resources/img/m_icon_check_disable.png" id="pass2_img" class="passImg">
						</span> <span class="error_next_box"></span>
					</div>
	
					 
	
					<!-- age -->
					<div>
						<h3 class="join_title">
							<label for="age">나이 / 성별</label>
						</h3>
						<div id="age_wrap">
							
							<div id="age">
								<span class="box"> 
									<select id="age_check" class="sel" name="member_age">
										<c:if test="${ not empty list.member_age }">
											<option value="${ list.member_age }">${ list.member_age }</option>
										</c:if>
										<c:forEach items="${ list.member_age }" var="age">
											<option>나이----(변경하실려면 아래 중 선택해주세요)</option>
											<option value="10대" <c:if test="${ age eq '10대' }">style="display:none"</c:if>>10대</option>
											<option value="20대" <c:if test="${ age eq '20대' }">style="display:none"</c:if>>20대</option>
											<option value="30대" <c:if test="${ age eq '30대' }">style="display:none"</c:if>>30대</option>
											<option value="40대" <c:if test="${ age eq '40대' }">style="display:none"</c:if>>40대</option>
											<option value="50대" <c:if test="${ age eq '50대' }">style="display:none"</c:if>>50대</option>
											<option value="60대" <c:if test="${ age eq '60대' }">style="display:none"</c:if>>60대</option>
											<option value="기타" <c:if test="${ age eq '기타' }">style="display:none"</c:if>>기타</option>
										</c:forEach>
									</select>
								</span>
							</div>
						</div>
							
	
					<!-- phone -->
					<div>
						<h3 class="join_title">
							<label for="phone">휴대전화</label>
						</h3>
						<span class="box int_phone"> 
							<input type="text" id="phone" class="join_H" maxlength="11" placeholder="휴대전화 입력" name="member_phone" value="${ list.member_phone }">
							<span class="step_url">'-' 생략</span>
						</span> <span class="error_next_box"></span>
					</div>
				
				</c:forEach>

				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>변경하기</span>
					</button>
				</div>

			</form>
			<!-- form out -->
			
		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->

</div>
<%
} else if(session.getAttribute("UserStatus").equals(3)) {
%>
	
	<script type="text/javascript">
		alert("당신은 현재 블랙당한 상태입니다.");
		history.back();
	</script>


<%
} else {
	
%>
	<script type="text/javascript">
		alert("로그인 상태로 들어와주세요!");
		history.back();
	</script>
<%
}
%>

</body>
</html>