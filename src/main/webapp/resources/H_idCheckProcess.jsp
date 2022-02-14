<%@page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function idUse(userid){
	
	opener.document.Hjoin.idDuplication.value ="idCheck";
    opener.document.Hjoin.id.value = userid;
    self.close();
}

function validateForm(form){
	
	
	if(form.id.value==''){
		alert('아이디를 입력해주세요'); 
		form.id.focus(); 
		return false; 
	}
	
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
}
</script>
</head>
<body>
<%
String id = request.getParameter("id");
MemberDAO dao = new MemberDAO();
//boolean result = dao.idCheck(id, "");
boolean result = dao.idCheck(id);
dao.close();

if(result){
%>
	<div id="member_checkId">
	<fieldset>
	<div align="center">
    <h2>[<%= request.getParameter("id") %>]는 사용중인 아이디 입니다.</h2>
    <h2>새로운 아이디를 입력해주세요.</h2>
    <form name="overlapFrm" onsubmit="return validateForm(this)">
        <input type="text" name="id" size="20">
        <input type="submit" value="중복확인"  ><br>
    </form>
    </div>
    <ul style="color:#757575; list-style: none; font-size: 13px">
	    <li >공백 또는 특수문자가 포함된 아이디는 사용할 수 없습니다.</li>
	    <li>숫자로 시작하거나, 숫자로만 이루어진 아이디는 사용할 수 없습니다.</li>
    
    </ul>
    
    </fieldset>
<%
}
else{
%>
	<fieldset>
	<div align="center">
	<h2>[<%= request.getParameter("id") %>]는 사용 가능한 아이디 입니다.</h2>
	<button type="button" onclick="idUse('<%= request.getParameter("id") %>');">아이디 사용</button>
	</div>
	</fieldset>
	</div>
<%
}
%>
</body>
</html>