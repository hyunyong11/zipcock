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
<link rel="stylesheet" href="./resources/css/joinmember.css">
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
        window.open("./resources/U_idCheckProcess.jsp?id=" + form.id.value, "idover", 'status=no, height=300, width=500, left='+ popupX + ', top='+ popupY);
    }
}

</script>
<div class="container">
	<!-- header -->
	<div id="header">
		<h1 class="join_title">
			<label for="id">회원가입</label>
		</h1>
	</div>

	<!-- wrapper in -->
	<div id="wrapper">

		<!-- content in -->
		<div id="content">

			<!-- form in -->
			<form name = "Ujoin" method="post" onsubmit="return joinValidate(this);" action='<c:url value="/member.do" />'>

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
								<select id="age_check" class="sel" name="member_age"  required>
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