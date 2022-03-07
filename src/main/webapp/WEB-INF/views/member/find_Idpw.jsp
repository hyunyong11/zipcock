<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID/PW 찾기</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
<style type="text/css">
</style>
</head>
<body>
<script>
	function setDisplay(){
	    if($('input:radio[value=id]').is(':checked')){
	        $('.pw_box').hide();
	        $('.id_box').show();
	    }else{
	        $('.pw_box').show();
	        $('.id_box').hide();
	    }
	}
	
	function findPwd(){
	    alert("죄송합니다. 챗봇을 통해 문의해주세요.\n(메인 오른쪽 하단)");
	    window.location.href = "zipcock.do";
	    return false;

		var form = document.pwdFrm;
		if(form.id.value==''){
			alert('아이디를 입력해주세요'); 
			form.id.focus(); 
			return false; 
		}
		if(!form.name.value){
	        alert('이름을 입력하세요');
	        form.name.focus();
	        return false;
	    }
	   	if(!form.email_1.value){
		    alert("이메일을 입력하세요");
		    form.email_1.focus();
		    return false;
		}
	   	if(form.email_check.value==""){
		    alert("도메인을 선택하세요");
		    form.email_check.focus();
		    return false;
		}
		form.method = "post";
		form.action = "FindPw.do"; 
		form.submit(); 
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
	
	function findIdRequest(){
		const name = document.getElementById('name').value;
		const email_1 = document.getElementById('email_1').value;
		const email_2 = document.getElementById('email_2').value;
		
		var form = document.idFrm;
	   	if(!form.name.value){
	        alert('이름을 입력하세요');
	        form.name.focus();
	        return false;
	    }
	   	
	   	if(!form.email_1.value){
		    alert("이메일을 입력하세요");
		    form.email_1.focus();
		    return false;
		}
		if(form.email_check.value==""){
		    alert("도메인을 선택하세요");
		    form.email_check.focus();
		    return false;
		}
		
		$.ajax({
			type : 'post',
			url : 'findId.do',
			data : {'name': name, 'email_1': email_1, 'email_2': email_2},
			success : function(data) {
				console.log(data);
				alert("아이디는 '"+ data +"'입니다.");
				window.location.href = "memberLogin.do";
			},
			error : function(){
				alert("일치하는 회원이 없습니다.");
				window.location.reload();
			}
		})
	}
	
</script>
<div class="container">
	
	<!-- header -->
	<div id="header">
		<h1 class="login_title">
			<label for="email">ID/PW 찾기</label><br>
		</h1>
		<!-- wrapper -->
		<div id="wrapper">
			<!-- content -->
			<div id="content">
			
			<div class="idpw_box">
				<input type="radio" name="idpw" value="id" onchange="setDisplay()" checked > 아이디 찾기
				<input type="radio" name="idpw" value="pw" onchange="setDisplay()" > 비밀번호 찾기
					
				<div class="id_box">
				<!-- ID form in -->
				<form name="idFrm">
						
					<!-- NAME -->
					<div>
						<h3 class="join_title" style="width: 50px;">
							<label for="name">이름</label>
						</h3>
						<span class="box int_name"> 
							<input type="text" id="name" class="join_H" maxlength="20" name="name"> 
						</span> <span class="error_next_box"></span>
					</div>
					
					<!-- Email -->
					<div>
						<h3 class="join_title" style="width: 50px;">
							<label for="email">이메일</label>
						</h3>
						<span class="box_email"> 
							<input type="text" id="email_1" class="join_email" maxlength="20" name="email_1" value="">
						</span>
						&nbsp;@
						<span class="box_email"> 
							<input type="text" id="email_2" class="join_email" maxlength="20" name="email_2" value="" style="width:20%"readonly> 
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
					<!-- FIND BTN-->
					<div class="btn_area">
						<button type="button" id="btnJoin" onclick="findIdRequest()">
							<span>아이디 찾기</span>
						</button>
					</div>
				</form>
				<!-- ID form out -->
				</div>
				
				<div class="pw_box" style="display: none">
				<!-- PW form in -->
				<form name="pwdFrm" onsubmit="return findPwd(this);">
						
					<!-- ID -->
					<div>
						<h3 class="join_title" style="width: 50px;">
							<label for="id">아이디</label>
						</h3>
						<span class="box int_id"> 
							<input type="text" id="id" class="join_H" maxlength="30" name="member_id"> 
							<button type="button" class="doubleCheck" onclick="id_check_person(this.form);"><img src="/zipcock/resources/img/m_icon_danger.png" alt="중복확인" class="passImg"></button>
						</span>
						
						<input type="hidden" name="idDuplication" value="idUncheck" >
					 	<span class="error_next_box"></span>
					</div>
						
					<!-- NAME -->
					<div>
						<h3 class="join_title" style="width: 50px;">
							<label for="name">이름</label>
						</h3>
						<span class="box int_name"> 
							<input type="text" id="name" class="join_H" maxlength="20" name="member_name" > 
						</span> <span class="error_next_box"></span>
					</div>
					
					<!-- Email -->
					<div>
						<h3 class="join_title" style="width: 50px;">
							<label for="email">이메일</label>
						</h3>
						<span class="box_email"> 
							<input type="text" id="email_1" class="join_email" maxlength="20" name="member_email" value="">
						</span>
						&nbsp;@
						<span class="box_email"> 
							<input type="text" id="email_2" class="join_email" maxlength="20" name="email_2" value="" style="width:20%"readonly> 
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
					<!-- FIND BTN-->
					<div class="btn_area">
						<button type="submit" id="btnJoin">
							<span>비밀번호 찾기</span>
						</button>
					</div>
					
				</form>
				<!-- PW form out -->
				</div>
			</div>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>