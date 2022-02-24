<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/header.jsp" %>
<head>
    <title>${viewRow.mboard_title }</title>
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
			<h2>수행내역</h2>

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
	  		<c:if test="${sessionScope.siteUserInfo.member_id eq row.mission_Hid}">
			<tr>
				<th style="background-color: #ffc654">No</th>
				<td style="text-align: left; color: #FF4C00">${row.mission_num }</td>
				<th style="background-color: #ffc654">작성자</th>
				<td style="text-align: left; color: #FF4C00">${row.mission_id }</td>			
			</tr>
			<tr>
				<th style="background-color: #ffc654">비용</th>
				<td style="text-align: left; color: #FF4C00">${row.mission_cost }</td>			
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
			</c:if>
    		</c:forEach> 
			<tr>
				<td colspan="4" align="center" style="background-color: lightgray">	
				
					
				<button type="button" style="background-color: #ffc654; font-weight: bold"
					onclick="location.href='./HInfoAll.do';">리스트보기</button>
				</td>
			</tr>
		</table>
		</form>   
        </div>
    </div>
</div>
</body>
</html>