<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product</title>
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sidemenu.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/product.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp" %>
	</div>
	<div class="body__wrapper">
		<div class="path">
		<span>HOME</span>  &gt; <span>SHIRTS</span>
		</div>
		<%@ include file="/WEB-INF/views/product/header.jsp" %>
		<section id="detail">
			<div class="header">
				<a href="#detail">DETAIL</a>
				<a href="#guide">GUIDE</a>
				<a href="#review">REVIEW</a>
				<a href="#qa">Q&amp;A</a>
			</div>
			<div class="body">
				<figure>
				  <img src="${pageContext.request.contextPath}/resources/images/errorimage.png" alt="Example Image">
				</figure>
				<figure>
				  <img src="${pageContext.request.contextPath}/resources/images/errorimage.png" alt="Example Image">
				</figure>
				<figure>
				  <img src="${pageContext.request.contextPath}/resources/images/errorimage.png" alt="Example Image">
				</figure>
				<figure>
				  <img src="${pageContext.request.contextPath}/resources/images/errorimage.png" alt="Example Image">
				</figure>
			</div>
		</section>
		<section id="guide">
			<div class="header">
				<a href="#detail">DETAIL</a>
				<a href="#guide">GUIDE</a>
				<a href="#review">REVIEW</a>
				<a href="#qa">Q&amp;A</a>
			</div>
			<div class="body">
			<div class="inner">
				<p>
				<strong>상품결제정보</strong><br>
				고액결제의 경우 안전을 위해 카드사에서 확인전화를 드릴 수도 있습니다. 확인과정에서 도난 카드의 사용이나 타인 명의의 주문등 정상적인 주문이 아니라고 판단될 경우 임의로 주문을 보류 또는 취소할 수 있습니다.  
				<br><br>
				무통장 입금은 상품 구매 대금은 PC뱅킹, 인터넷뱅킹, 텔레뱅킹 혹은 가까운 은행에서 직접 입금하시면 됩니다.  <br>
				주문시 입력한 입금자명과 실제입금자의 성명이 반드시 일치하여야 하며, 7일 이내로 입금을 하셔야 하며 입금되지 않은 주문은 자동취소 됩니다.<br>
				</p>
				<br><br><hr><br><br>
				<p>
				<strong>배송정보</strong><br>
				배송 방법 : 택배<br>
				배송 지역 : 전국지역<br>
				배송 비용 : 2,500원<br>
				배송 기간 : 3일 ~ 5일<br>
				배송 안내 :<br>
				※배송안내<br>
				<br>
				<br>
				<br>
				배송은 결제날 기준 다음날부터 2~5일정도 소요됩니다.<br>
				<br>
				인기상품은 더 지연 될 수 있습니다.<br>
				<br>
				토/일요일 및 공휴일은 배송기간에 해당되지 않습니다.<br>
				<br>
				(100000원 이상 구매 시 무료 / 제주,도서지역 추가 3000원)<br>
				</p>
				<br><br><hr><br><br>
				<p>
				<strong>교환 및 반품정보</strong><br>
				교환 및 반품이 가능한 경우<br>
				-불량상품 및 오 배송으로 인한 교환은 배송비 부담없이 교환해드립니다.<br>
				<br>
				-사이즈 교환은 동일 상품으로만 1회에 한해서 가능하면 왕복배송비 5000원을 상품에 동봉해 주셔야 합니다.<br>
				<br>
				교환 및 반품이 불가능한 경우<br>
				- 향수,땀,화장품 등의 흔적이 남아있는 상품일 경우<br>
				<br>
				-수선,얼룩,손상,오염이 있는상품일 경우<br>
				<br>
				-상품이 훼손된 경우<br>
				<br>
				-구매하시기 전 실측을 정확히 확인 후 구매하시길 부탁드립니다.<br>
				</p>
			</div>
			</div>
		</section>
		<%@ include file="/WEB-INF/views/product/review.jsp" %>
		<%@ include file="/WEB-INF/views/product/qa.jsp" %>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>

</body>
</html>