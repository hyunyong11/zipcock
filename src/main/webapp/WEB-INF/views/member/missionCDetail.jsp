<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/header.jsp" %>
<%@ include file="/resources/commons/isLogin.jsp" %> 
<head>
     <title>요청내역</title>
    <!-- 리스트 삭제처리 -->
    <script type="text/javascript">
        function deleteList(num) {
            alert("취소하시겠습니까?");
            location.href='deleteAction.do?num='+ num;
        }
    </script>
    
</head>
<body>
<div class="container">
    
     <!-- =============== Price =============== -->
    <section id="Notice" class="">
    <!-- =============== container =============== -->
        <div class="container">
         <div class="row">
    
          <div class="col-xs-12 col-sm-12 col-md-12 wow zoomIn animated headding" data-wow-delay=".1s">
          <section class="cusMainFaqList">
          <br /><br /><br /><br /><br /><br /><br />
          
          <h3 class="subTitle4C">&nbsp;&nbsp;&nbsp;&nbsp;My Page</h3>
        <div class="container">
            <h2>요청내역</h2>
    <div class="card-body">
        <div class="table-responsive">
        <form name="writeFrm">
        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
            <colgroup>
                <col width="20%" />
                <col width="30%" />
                <col width="20%" />
                <col width="30%" />
            </colgroup>
            
            <tr>
                <td colspan="4" align="center" style="background-color: lightgray; font-weight: bold;"> 
                
                    집에서 심부름을 콕! 집콕!
                
                </td>
            </tr>
            <c:forEach items="${lists }" var="row">        
            <c:if test="${sessionScope.siteUserInfo.member_id eq row.mission_id}">
            <tr>
                <th style="background-color: #ffc654">심부름</th>
                <c:choose>
                <c:when test="${ row.mission_status eq 1 }">
                <td style="text-align: left; color: #FF4C00">매칭중</td>
                </c:when>
                <c:when test="${ row.mission_status eq 2 }">
                <td style="text-align: left; color: #FF4C00">매칭완료</td>
                </c:when>
                <c:when test="${ row.mission_status eq 3 }">
                <td style="text-align: left; color: #FF4C00">심부름완료</td>
                </c:when>
                </c:choose>
                <th style="background-color: #ffc654">작성자</th>
                <td style="text-align: left; color: #FF4C00">${row.mission_id }</td>          
            </tr>
            <tr>
                <th style="background-color: #ffc654">비용</th>
                <td style="text-align: left; color: #FF4C00">${row.mission_cost }원</td>            
                <th style="background-color: #ffc654">심부름 항목</th>
                <td style="text-align: left; color: #FF4C00">${row.mission_category }</td>
            </tr>
            <tr>
                <th style="background-color: #ffc654">제목</th>
                <td colspan="3" style="text-align: left; color: #FF4C00">
                    ${row.mission_name }
                </td>
            </tr>
            <tr>
                <th style="background-color: #ffc654">내용</th>
                <td colspan="3" style="height:150px; text-align: left; color: #FF4C00">
                    ${row.mission_content }
                </td>
            </tr> 
                
            <tr>
                <td colspan="4" align="center" style="background-color: lightgray"> 
                
                <button type="button" style="background-color: #ffc654; font-weight: bold"
                    onclick="location.href='./CInfoAll.do';">리스트보기</button>
                <c:choose>
                <c:when test="${ row.mission_status eq 3 }">
                <button class="button" style="background-color: #ffc654; font-weight: bold" >
                    <a href="write.do?mission_num=${row.mission_num }" >
                    리뷰작성하기</a>
                </button>
                </c:when>
                <c:when test="${ row.mission_status eq 1 }">
                <button type="button" style="background-color: #ffc654; font-weight: bold"
                    onclick="location.href='userEdit.do?num=${row.mission_num}';">요청변경</button>
                </c:when>
                </c:choose>
                <button type="button" style="background-color: #ffc654; font-weight: bold"
                    onclick="deleteList(${row.mission_num});">요청삭제</button>
                </td>
            </tr>
            </c:if>
            </c:forEach>
        </table>
        </form>   
        </div>
    </div>
</div>
</body>
</html>