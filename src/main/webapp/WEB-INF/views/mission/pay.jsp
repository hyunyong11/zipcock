<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page session="false" %>
<% request.setCharacterEncoding("euc-kr");
String id = request.getParameter("mission_id");
int mission = Integer.parseInt(request.getParameter("mission_mission"));
String hid = request.getParameter("mission_Hid");
String category = request.getParameter("mission_category");
String name = request.getParameter("mission_name");
String sex = request.getParameter("mission_sex");
String way0 = request.getParameter("mission_waypoint0");
String way1 = request.getParameter("mission_waypoint1");
String way2 = request.getParameter("mission_waypoint2");
String end0 = request.getParameter("mission_end0");
String end1 = request.getParameter("mission_end1");
String end2 = request.getParameter("mission_end2");
String reservation = request.getParameter("mission_reservation");
String time = request.getParameter("mission_time");
String content = request.getParameter("mission_content");
String ofile = request.getParameter("ofile");
String cost = request.getParameter("mission_cost");
String buyer_name = request.getParameter("buyer_name");
String buyer_email = request.getParameter("buyer_email");
String buyer_tel = request.getParameter("buyer_tel");
%>
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script type="text/javascript">
$(document).ready(function(){
         
      var IMP = window.IMP;
      var code = "imp76568217"; //가맹점 식별코드
      IMP.init(code);
      
      $(document).ready(function(e){
    	 var form = $('#form1')[0];
    	 var formData = new FormData(form);
         //결제요청
         IMP.request_pay({
            //name과 amout만있어도 결제 진행가능
            pg : 'kakao', //pg사 선택 (kakao, kakaopay 둘다 가능)
            pay_method: 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
            name : "<%=name%>", // 상품명
            amount : <%=cost%>,
            buyer_email : <%= buyer_email%>,
            buyer_name : "<%= buyer_name%>",
            buyer_tel : <%= buyer_tel%>,  //필수항목
            //m_redirect_url : 'https://localhost:8080/payments/complete'
         }, function(rsp){
            if(rsp.success){
               alert("결제가완료되었습니다.");
                $.ajax({
                   url : '/zipcock/mission_regist.do', 
                     type :'POST',
	                 data : formData,
                     processData: false,
                     contentType: false, 
                     dataType: 'html',
                     success: function(data){                        
                       document.location.href="/zipcock/HList.do";
                     },
                     error:function(request,status,error){
                       console.log("Insert ajax 통신 실패!!!");
                      	console.log("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

                     }
                }) //ajax
               
            }
            else{//결제 실패시
				alert(rsp.error_msg);
              	document.location.href="${referer}";
            }
         });//pay
      }); //check1 클릭 이벤트
   }); //doc.ready
</script>
</head>
<body>
<form name="form1" id="form1">
     <input type="hidden" name="mission_name" value="<%= name %>">
     <input type="hidden" name="mission_mission" value="<%= mission %>">
     <input type="hidden" name="mission_category" value="<%= category %>">
     <input type="hidden" name="mission_id" value="<%= id %>">
     <input type="hidden" name="mission_Hid" value="<%= hid %>">
     <input type="hidden" name="mission_sex" value="<%= sex %>">
     <input type="hidden" name="mission_waypoint0" value="<%= way0 %>">
     <input type="hidden" name="mission_waypoint1" value="<%= way1 %>">
     <input type="hidden" name="mission_waypoint2" value="<%= way2 %>">
     <input type="hidden" name="mission_end0" value="<%= end0 %>">
     <input type="hidden" name="mission_end1" value="<%= end1 %>">
     <input type="hidden" name="mission_end2" value="<%= end2 %>">
     <input type="hidden" name="mission_reservation" value="<%= reservation %>">
     <input type="hidden" name="mission_time" value="<%= time %>">
     <input type="hidden" name="mission_content" value="<%= content %>">
     <input type="hidden" name="ofile" value="<%= ofile %>">
     <input type="hidden" name="mission_cost" value="<%= cost %>">
</form>


</body>
</html>