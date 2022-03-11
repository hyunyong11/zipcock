<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
</head>
<body>
<script type="text/javascript">
function joinValidate(form){
	
	if( !(form.id.value.length >=4 && form.id.value.length <=12)){ 
	    alert("4자 이상 12자 이내의 값만 입력하세요");
	    form.id.value = '';
	    form.id.focus(); 
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
	
	if(form.pass1.value != form.pass2.value){
	    alert('입력한 패스워드가 일치하지 않습니다.');
	    form.pass1.value=""; 
	    form.pass2.value="";
	    form.pass1.focus();
	    return false;
	}
	
	if(form.idDuplication.value != "idCheck"){
		alert("아이디 중복체크를 해주세요.");
		return false;
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

function input_bank(frm) {
	var bank = frm.bank_check.value;
	
	if(bank == "") {
		frm.member_account.readOnly = true;
	}
	else {
		frm.member_account.readOnly = false;
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


</script>
<div class="container">
	<!-- header -->
	<div id="header">
		<h1 class="join_title">
			<label for="id"><strong>회원가입</strong></label>
		</h1>
	</div>

	<!-- wrapper in -->
	<div id="wrapper">

		<!-- content in -->
		<div id="content">

			<!-- form in -->
			<form name = "Hjoin" method="post" onsubmit="return joinValidate(this);" enctype="multipart/form-data" action='<c:url value="/helper.do" />'>
				
				<!-- 회원등급 -->
				<input type="hidden" name="member_status" value="2">
				<!-- NAME -->
				<div>
					<h3 class="join_title">
						<label for="name">이름</label>
					</h3>
					<span class="box int_name"> 
						<input type="text" id="name" class="join_H" maxlength="20" name="member_name" required> 
					</span> <span class="error_next_box"></span>
				</div>
				
				<!-- ID -->
				<div>
					<h3 class="join_title">
						<label for="id">아이디</label>
					</h3>
					<span class="box int_id"> 
						<input type="text" id="id" class="join_H" maxlength="30" name="member_id" required> 
						<button type="button" class="doubleCheck" onclick="id_check_person(this.form);"><img src="/zipcock/resources/img/m_icon_danger.png" alt="중복확인" class="passImg"></button>
					</span>
					
					<input type="hidden" name="idDuplication" value="idUncheck" >
				 	<span class="error_next_box"></span>
				</div>

				<!-- pass1 -->
				<div>
					<h3 class="join_title">
						<label for="pass1">비밀번호</label>
					</h3>
					<span class="box int_pass"> 
						<input type="password" id="pass1" class="join_H" maxlength="16" name="member_pass" required> 
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
						<input type="password" id="pass2" class="join_H" maxlength="16" name="password2" required>
						<img src="/zipcock/resources/img/m_icon_check_disable.png" id="pass2_img" class="passImg">
					</span> <span class="error_next_box"></span>
				</div>

				<!-- Email -->
				<div>
					<h3 class="join_title">
						<label for="email">이메일</label>
					</h3>
					<span class="box_email"> 
						<input type="text" id="email_1" class="join_email" maxlength="20" name="email_1" value="" required>
					</span>
					&nbsp;@
					<span class="box_email"> 
						<input type="text" id="email_2" class="join_email" maxlength="20" name="email_2" value="" style="width:20%"readonly required> 
					</span>
					&nbsp;
					<span class="box_email"> 
						<select name="email_check" onchange="email_input(this.form);" class="join_email" id="email_check" style="width:20%" required>
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

				<!-- age -->
				<div>
					<h3 class="join_title">
						<label for="age">나이 / 성별</label>
					</h3>
					<div id="age_wrap">
						
						<div id="age">
							<span class="box"> 
								<select id="age_check" class="sel" name="member_age" required>
										<option value="">나이</option>
										<option value="10대">10대</option>
										<option value="20대">20대</option>
										<option value="30대">30대</option>
										<option value="40대">40대</option>
										<option value="50대">50대</option>
										<option value="60대">60대</option>
										<option value="기타">기타</option>
										
								</select>
							</span>
						</div>
						

						<!-- GENDER -->
						<div id="gender">
                            <span class="box gender_code">
                        		<select id="gender" class="sel" name="member_sex" required>
                            		<option value="">성별</option>
                            		<option value="0">남자</option>
                           			<option value="1">여자</option>
                        		</select>                            
                    		</span>
                    		<span class="error_next_box">필수 정보입니다.</span>
                    	</div> 

					</div>

					<span class="error_next_box"></span>
				</div>

				
				<!-- phone -->
				<div>
					<h3 class="join_title">
						<label for="phone">휴대전화</label>
					</h3>
					<span class="box int_phone"> 
						<input type="text" id="phone" class="join_H" maxlength="11" placeholder="휴대전화 입력" name="member_phone" required>
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
							<select id="bank_check" class="sel" name="member_bank" onchange="input_bank(this.form)" required> 
									<option value="">은행선택</option>
									<option value="기업은행">기업은행</option>
									<option value="국민은행">국민은행</option>
									<option value="우리은행">우리은행</option>
									<option value="신한은행">신한은행</option>
									<option value="하나은행">하나은행</option>
									<option value="농협은행">농협은행</option>
									<option value="SC은행">SC은행</option>
									<option value="카카오뱅크">카카오뱅크</option>
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
						<input type="text" id="account" class="join_H" maxlength="30" placeholder="계좌번호 입력" name="member_account" required>
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
							<span class="box" > 
								<label><input type="radio" id="vehicle_check" value="0" name="member_vehicle" checked>&nbsp;자동차&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="1" name="member_vehicle">&nbsp;오토바이&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="2" name="member_vehicle">&nbsp;자전거&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="3" name="member_vehicle">&nbsp;도보&nbsp;</label>
								<label><input type="radio" id="vehicle_check" value="4" name="member_vehicle">&nbsp;기타&nbsp;</label>
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
						<input type="text" id="introduce" class="join_H" maxlength="20" placeholder="20자 이내 입력" name="member_introduce" required> 
					</span> <span class="error_next_box"></span>
				</div>

				<!-- picture -->
				 <div>
                	<h3 class="join_title"><label for="picture">프로필사진</label></h3>
                	<span class="box int_picture">
                		<input type="file" name="ofile" id="pictureInput" accept="/zipcock/resources/img/png, img/jpeg">
                		<!-- <input type="submit"> -->
                	</span>
                </div>

				
				<!-- JOIN BTN-->
				<div class="btn_area">
					<button type="submit" id="btnJoin">
						<span>가입하기</span>
					</button>
				</div>

			</form>
			<!-- form out -->
			
		</div>
		<!-- content-->

	</div>
	<!-- wrapper -->


</div>
</body>
</html>