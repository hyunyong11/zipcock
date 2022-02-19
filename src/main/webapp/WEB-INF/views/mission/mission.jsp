<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>동네히어로 : 모든 심부름 보기</title>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>  
<script src="../js/headerTemplate.js"></script>
<script src="../js/footerTemplate.js"></script>

<link rel="stylesheet" href="/css/list.css">
<link rel="stylesheet" href="/css/index.css">
</head>

<body>
	<div id="headerBar"></div>
	
	<div id="content-wrap">
		<div id="body">			
			<div class="top">
				<button class="sort-button" @click="getDateDesc()">최근 등록된 순 보기</button>&nbsp;&nbsp;	
				<button class="sort-button" @click="getPayDesc()">금액 높은 순 보기</button>				
			</div>
			<table v-if="resData">
				<tr>
					<th>no.</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>분류</th>
					<th>제목</th>
					<th>금액</th>
					<th>상태</th>
				</tr>
				
				<tr class="tr-errand" v-for="(v, i) in errands">	
					<td>{{i+1}}</td>
					<td v-if="v.writerStatus==0">{{v.writer}}</td>
					<td v-if="v.writerStatus==1" style="color:gray;">탈퇴한 회원</td>
					<td>{{v.createdAt}}</td>
					<td>{{v.category}}</td>
					<td> <a v-bind:href="urlPart1+v.errandId">{{v.title}}</a></td>
					<td style="text-align: center;">{{v.pay}}</td>
					<td v-if="v.errandStatus==0"><span style="background-color: rgb(228, 232, 236); padding:3px; border-radius:3px;">지원자 대기중</span></td>
					<td v-if="v.errandStatus==1"><span style="background-color:rgb(178, 222, 252); color:rgb(2, 64, 116); padding:3px; border-radius:3px;">매칭 대기중</span></td>
					<td v-if="v.errandStatus==2"><span style="background-color: rgb(192, 252, 180); color:rgb(3, 63, 1); padding:3px; border-radius:3px;">매칭완료</span></td>
					<td v-if="v.errandStatus==3"><span style="background-color: rgb(253, 219, 230); color:rgb(63, 1, 11); padding:3px; border-radius:3px;">심부름 완료</span></td>
				</tr>
			</table>
			<div class="bottom">
				<button v-if="logInMember!=null"class="new-button" onclick="location.href='registration.html'">심부름 등록하기</button>
			</div>
		</div>
	</div>	
</body>
</html>