<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Manager</title>
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sidemenu.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp" %>
	</div>
	<div class="body__wrapper">
		<div class="path">
			<span>HOME</span>  &gt; <span>Manager</span>
		</div>
	<div class="mypage__wrapper">
		<div class ="mypage__title"><strong>Manager</strong></div>
		<div class="mypage__menu grid">
			<div class="grid order">
				<strong>CATEGORY</strong>
				<span>카테고리 추가/제거/수정<span>
			</div>
			<div class="grid profile">
				<strong>PRODUCT</strong>
				<span>상품 등록/삭제/수정</span>
			</div>
			<div class="grid wishlist">
				<strong>NOTICE</strong>
				<span>공지사항 관리</span>
			</div>
			<div class="grid mileage">
				<strong>MILEAGE</strong>
				<span>회원 마일리지 현황</span>
			</div>
			<div class="grid board">
				<strong>ORDER</strong>
				<span>회원 주문 현황</span>
			</div>
		</div>
	</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>
	<script>
		$(loadedHandler);
		function loadedHandler(){
			linkurl("order");
			linkurl("profile");
			linkurl("wishlist");
			linkurl("mileage");
			linkurl("board");
			linkurl("address");
		}
		
		function linkUrl(url){
			$(".gird."+url).on("click",()=>{
				location.href="${pageContext.request.contextPath}/"+url;
			});
		}
	</script>
</body>
</html>