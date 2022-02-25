<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/resources/commons/isLogin.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<script>
	function deleteRow(mission_num) {
		if (confirm("정말로 삭제하시겠습니까?")) {
			location.href="delete.do?idx="+ mission_num;
		}       
	}
</script>
<div class="container">
	<h3 class="text-center mt-5">Cock List</h3>
	
	<div class="text-center">
	<form method="get">
		<select name="searchField">
			<option value="mission_content">내용</option>
			<option value="mission_id">작성자</option>
		</select>
		<input type="text" name="searchTxt" />
		<input type="submit" value="검색" />
	</form>
	</div>
		
	<div style="text-align: right; margin: 5px auto;">
		<!-- 
			EL의 내장객체인 sessionScope를 통해 세션영역에 저장된 
			속성이 있는지 확인함. 단, 영역에 저장된 속성명이 유일할 결우
			내장 객체는 생략할 수 있으므로 필수사항으 아니다.
		 -->
		<c:choose>
			<c:when test="${ empty sessionScope.siteUserInfo }">
				<!-- 로그인되지 않았을 때.. -->
				<button class="btn btn-info"
					onclick="location.href='memberLogin.do';">
					로그인
				</button>
			</c:when>
			<c:otherwise>
				<!-- 세션영역에 속성이 있을 때, 즉 로그인되었을 때.. -->
				<button class="btn btn-danger"
					onclick="location.href='logout.do';">
					로그아웃
				</button>
			</c:otherwise>
		</c:choose>
		<button class="btn btn-warning" onclick="location.href=' mission_select.do?flag= ';">
			심부름 요청
		</button>
	</div>
	<!-- 방명록 반복 부분 s -->
	<c:forEach items="${lists }" var="row" >		
		<div class="border mt-2 mb-2">
			<div class="media">
			
				<div class="accordion" id="accordionExample">
					

				  <div class="accordion-item">
				    <h2 class="accordion-header" id="heading${row.mission_num }">
				      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapse${row.mission_num }" aria-expanded="false" aria-controls="collapse${row.mission_num }">
				        
				        <div class="media-left mr-3">
							<c:choose>
				        		<c:when test="${ row.mission_category eq '배달,장보기' }">
				        			<img src="/zipcock/resources/img/1.delivery.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		<c:when test="${ row.mission_category eq '청소,집안일' }">
				        			<img src="/zipcock/resources/img/2.clean.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		<c:when test="${ row.mission_category eq '설치,운반' }">
				        			<img src="/zipcock/resources/img/3.installation.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		<c:when test="${ row.mission_category eq '동행,돌봄' }">
				        			<img src="/zipcock/resources/img/4.together.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		<c:when test="${ row.mission_category eq '벌레,쥐잡기' }">
				        			<img src="/zipcock/resources/img/5.bug.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		<c:when test="${ row.mission_category eq '역할대행' }">
				        			<img src="/zipcock/resources/img/6.role.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		<c:when test="${ row.mission_category eq '과외,알바' }">
				        			<img src="/zipcock/resources/img/7.lesson.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		<c:when test="${ row.mission_category eq '기타' }">
				        			<img src="/zipcock/resources/img/8.etc.png" class="media-object" style="width:60px; margin: auto 10px;"><br>	
				        		</c:when>
				        		
				        	</c:choose>
							<!-- 케빈1 -->
						
							<p style="font-size: 0.8em; margin: 2px auto; text-align: center;">${ row.mission_category }</p>
						</div>
				        <h4 style="margin: 0">${ row.mission_name }</h4>
				        
				        <c:choose>
				        	<c:when test="${ row.mission_status eq 1 }">
				        		<span class="badge bg-danger m-2">
					        		매칭중
				        		</span>
				        	</c:when>
				        	<c:when test="${ row.mission_status eq 2 }">
				        		<span class="badge bg-info text-dark m-2">
					        		매칭완료
								</span>
				        	</c:when>
				        	<c:when test="${ row.mission_status eq 3 }">
				        		<span class="badge bg-secondary m-2">
					        		종료됨
								</span>
				        	</c:when>
				        </c:choose>
				      </button>
				    </h2>
				    <div id="collapse${row.mission_num }" class="accordion-collapse collapse" aria-labelledby="heading${row.mission_num }" data-bs-parent="#accordionExample">
				      <div class="accordion-body"  style="position: relative;">
				        <div align="right">
						<img src="/zipcock/resources/img/profile.png" style="width:20px"> ${ row.mission_id }
							<%-- ${row.member_age } --%>
							member_age
							<%-- <c:if test="${ member_sex eq 1 }">
								여성
							</c:if>
							<c:otherwise>
								남성
							</c:otherwise> --%>
							
							<!--  수정,삭제버튼 -->
							<!-- 작성자 본인에게만 수정/삭제 버튼 보임 처리 -->
							<c:if test="${ sessionScope.siteUserInfo.member_id eq row.mission_id}">
								<button class="btn btn-outline-primary btn-sm"
								onclick="location.href='modify.do?idx=${row.mission_num}';">
								수정</button>
								
								<!-- 삭제 버튼을 누를 경우 idx값을 JS의 함수로 전달한다. -->
								<button class="btn btn-outline-danger btn-sm"
								onclick="javascript:deleteRow(${row.mission_num});">
								삭제</button>
							</c:if>
							<c:if test="${ sessionScope.siteUserInfo.member_status eq 2 && row.mission_status eq 1 }" >
							<button class="btn btn-outline-primary" onclick="location.href='mypage.do';"  style="position: absolute; left: 90%; bottom: 2.75em;">
								지원하기
							</button>
							</c:if>
						</div>
						${row.mission_content } <br>
						위치: 도착지> ${ row.mission_end } <br>
						<c:if test="${ not empty row.mission_waypoint }">
							&nbsp;&nbsp;&nbsp;&nbsp;
							경유지> ${ row.mission_waypoint } <br>
						</c:if>
						
						일시: 
						<c:choose>
							<c:when test="${ row.mission_mission eq 1 }">
								즉시 <br>
							</c:when>
							<c:otherwise>
								예약> ${ row.mission_reservation } <br>
							</c:otherwise>
						</c:choose>
						
						예상소요시간: 
						<c:choose>
							<c:when test="${ row.mission_time eq 1 }">
								10분 이내 <br>
							</c:when>
							<c:when test="${ row.mission_time eq 2 }">
								10분 ~ 20분 <br>
							</c:when>
							<c:when test="${ row.mission_time eq 3 }">
								20분 ~ 40분 <br>
							</c:when>
							<c:when test="${ row.mission_time eq 4 }">
								40분 ~ 60분 <br>
							</c:when>
							<c:when test="${ row.mission_time eq 5 }">
								1시간 이상 <br>
							</c:when>
						</c:choose>
						
						
						비용: ${ row.mission_cost } 원 <br> 
						
						 
						
				      </div>
				    </div>
				  </div>
			  	</div>
				
				
			</div>
		</div>
	</c:forEach>
	
	<!-- 방명록 반복 부분 e -->
	<ul class="pagination justify-content-center">
		${pagingImg }
	</ul>
</div>
</body>
</html>