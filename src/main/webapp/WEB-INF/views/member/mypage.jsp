<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="/zipcock/resources/css/joinmember.css">
<style>
body{
	position: absolute;
	left: 50%;
	width: 700px;
	transform: translate(-50%);
	padding-top: 100px;
}
div{
  box-sizing: border-box;
}

/* alert badge */
.circle{
  display: inline-block;
  width: 5px;
  height: 5px;
  border-radius: 2.5px;
  background-color: #ff0000;
  position: absolute;
  top: -5px;
  left: 110%;
}

/* 녹색 텍스트 */
.green{
  color: #24855b;
}

.wrap{
  background-color: #F8F8F8;  
}
/* 녹색배경 */
.greenContainer{  
  height: 132px;
  background-color: #24855b;    
  
  display: flex;
  align-items: flex-end;
  padding: 16px;
}

.greenContainer .name{
   font-size: 20px;
  font-weight: bold;
  color: #ffffff;
} 
.greenContainer .modify{
  margin-left: auto;
}

/* 단골상점 , 상품후기 , 적립금 박스 */
.summaryContainer{
  background-color: white;  
  display: flex;  
  padding: 21px 16px;  
  height: 90px;
  margin-bottom: 10px;
}
/* 단골상점 , 상품후기 , 적립금 */
.summaryContainer .item{
  flex-grow: 1
}
/* 녹색 숫자 */
.summaryContainer .number{
  font-size: 19px;
  font-weight: bold;
  color: #24855b;
}
/* 텍스트 */
.summaryContainer .item > div:nth-child(2){
  font-size: 13px;
}

/* ================== 주문/배송조회 박스 시작 ==================== */
.shippingStatusContainer{
  padding: 21px 16px;
  background-color: white;
  margin-bottom: 10px;
}

/* 주문/배송조회 타이틀 */
.shippingStatusContainer .title{
  font-size: 16px;
  font-weight: bold;
  margin-bottom: 15px;
}

/* 장바구니 결제완료 배송중 구매확정 [로우] */
.shippingStatusContainer .status{
  display: flex;
  justify-content: space-between;
  margin-bottom: 21px;
}
/* 장바구니 결제완료 배송중 구매확정 [아이템]  */
.shippingStatusContainer .item{
  display: flex;
}

.shippingStatusContainer .number{
  font-size: 31px;
  font-weight: 500;
  text-align: center;
}
.shippingStatusContainer .text{
  font-size: 12px;
  font-weight: normal;
  color: #c2c2c2;
  text-align: center;
}
.shippingStatusContainer .icon{
  display: flex;
  align-items: center;
  padding: 20px;
  width: 16px;
  height: 16px;
}


/*=================== 주문목록 ~ 찜한상품 리스트 ==================*/
.listContainer{  
  padding: 0;
  background-color: #ffffff;
  margin-bottom: 10px;
}
.listContainer .item{  
  display: flex;
  align-items: center;
  padding: 16px;
  color: black;
  text-decoration: none;  
  height: 56px;
  box-sizing: border-box;
}
.listContainer .icon{  
  margin-right: 14px;
}
.listContainer .text{
  font-size: 16px;
  position: relative;
}
.listContainer .right{
  margin-left: auto;
}


/*=================== 내지갑의 보유 적립금 들어가는 부분 ================*/
.listContainer .smallLight{
  font-size: 14px;
  color: #c2c2c2;  
}
.listContainer .smallLight > span{
  margin-left: 10px;
}

.listContainer .right .blct{
  font-size: 14px;
  font-weight: bold;
  margin-right: 5px;
}



/* 공지사항 이용안내 고객센터 */
.infoContainer{
  background-color: white; 
  display: flex;
  height: 100px;
  margin-bottom: 10px;    
}

.infoContainer .item{
  flex-grow: 1;
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  font-size: 13px;
  text-decoration: none;
  color: black;
}
.infoContainer .item > div:first-child{
  margin-bottom: 2px;
}



/*  */
.listContainer .item:hover{
/*   background-color: #f8f8f8; */
}
.infoContainer .item:hover{
/*   background-color: #f8f8f8; */
}
</style>
</head>
<body>
<div class="wrap">
  <div class="greenContainer">
    <div>
      <div class="grade"><h2>마이 페이지</h2></div>
      
    </div>      
  </div>
  <div class="summaryContainer">
    <div class="item">
        <div class="number">${sessionScope.siteUserInfo.member_name }</div>
        <div>니이름</div>
      </div>
      <c:choose>
          <c:when test="${sessionScope.siteUserInfo.member_status eq 1 }">
         <div class="item">
           <div class="number">나는 사용자 내 요청사항</div>
           <div><a href="CInfoAll.do">아직 구현못함 ㅠ</a></div>
         </div>
         </c:when>
         <c:when test="${sessionScope.siteUserInfo.member_status eq 2 }">
         <div class="item">
           <div class="number">나는 헬퍼 내가 한 심부름들</div>
           <div><a href="HInfoAll.do">아직 구현못함 ㅠ</a></div>
         </div>
         </c:when>
         <c:otherwise>
         <div class="item">
           <div class="number">그외</div>
           <div>아직 구현못함 ㅠ</div>
         </div>
         </c:otherwise>
      </c:choose>
      <div class="item">
        <div class="number">${sessionScope.siteUserInfo.member_point }</div>
        <div>보유포인트</div>
      </div>
  </div>  
    
  </div>  
  <div class="listContainer">
    <a href="myPage.do" class="item">
        <div class="icon">ii</div>
        <div class="text">회원정보수정<span class="circle"></span></div>
        <div class="right"> > </div>
    </a>
    <a href="#" class="item">
        <div class="icon">ii</div>
        <div class="text">회원탈퇴</div>
        <div class="right"> > </div>
    </a>
    <c:choose>
       <c:when test="${sessionScope.siteUserInfo.member_status eq 1 }">
          <a href="CInfo.do" class="item">
              <div class="icon">ii</div>
              <div class="text">정보</div>
              <div class="right"> > </div>
            </a>
       </c:when>
       <c:when test="${sessionScope.siteUserInfo.member_status eq 2 }">
          <a href="review.do" class="item">
              <div class="icon">ii</div>
              <div class="text">리뷰보기</div>
              <div class="right"> > </div>
            </a>
       </c:when>
    </c:choose>
  </div>
  <div class="infoContainer">
    <a href="notice.do" class="item">
      <div>공지사항</div>
    </a>    
    <a href="serviceCenter.do" class="item">
      <div>FAQ</div>
    </a>    
    <a href="download.do" class="item">
      <div>앱 다운로드</div>
    </a>
  </div>
</div>
</body>
</html>