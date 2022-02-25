<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
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
 <title>회원탈퇴</title> 
 
<script>
function deleteRow(member_id){
	if(confirm("정말로 탈퇴 하시겠습니까?")){
		location.href="mdelete.do"
	}
}
</script>
<body>
</head>
<body>
 	
 	<div>
 		<label for="member_id">아이디</label>
 		<input type="text" id="identification" name="member_id" value="${sessionScope.siteUserInfo.member_id }" readonly/>
 	</div>
 	
 	<div>
 		<label for="member_pass">비밀번호</label>
 		<input type="password" id="password" name="member_pass" />
 	</div>
 	
 <button class="btn btn1" 
	onclick="javascript:deleteRow(${row.member_id});">탈퇴</button> 
 	
</form>
</body>
</html>