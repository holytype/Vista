<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
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
	<div class="mypage__wrapper">
		<div class="path">
		<span>HOME</span>  &gt; <span>MY PAGE</span>
		</div>
		<div class ="mypage__title"><strong>MY PAGE</strong></div>
		<section class="mileage__status">
			<div>
				<div><span>가용적립금</span><span>0원</span></div>
				<div><span>사용적립금</span><span>0원</span></div>
			</div>
			<div>
				<div><span>누적적립금</span><span>0원</span></div>
				<div><span>누적주문</span><span>0원</span></div>
			</div>
		</section>
		<section class="order__status">
			<div class="order__title">주문처리현황</div>
			<div class="order__status__inner">
				<div>
					<span>입금전</span>
					<a>0</a>
				</div>
				<div>
					<span>배송준비중</span>
					<a>0</a>
				</div>
				<div>
					<span>배송중</span>
					<a>0</a>
				</div>
				<div>
					<span>배송완료</span>
					<a>0</a>
				</div>
				<div>
					<div><span>취소</span><a>0</a></div>
					<div><span>교환</span><a>0</a></div>
					<div><span>반품</span><a>0</a></div>
				</div>
			</div>
		</section>
		<div class="mypage__menu grid">
			<div>order</div>
			<div>profile</div>
			<div>wishlist</div>
			<div>mileage</div>
			<div>board</div>
			<div>address</div>
		</div>
	</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>