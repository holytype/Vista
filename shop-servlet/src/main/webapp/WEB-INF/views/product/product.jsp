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
			<div class="body">wygiwys</div>
		</section>
		<section id="guide">
			<div class="header">
				<a href="#detail">DETAIL</a>
				<a href="#guide">GUIDE</a>
				<a href="#review">REVIEW</a>
				<a href="#qa">Q&amp;A</a>
			</div>
			<div class="body">
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