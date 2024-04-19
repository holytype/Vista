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
<style>
.path{
	text-align: right;
	padding: 10% 10% 0 0;
}

.mypage__wrapper{
	display:flex;
	flex-direction: column;
	padding:0 50px;
}
</style>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp" %>
	</div>
	<div class="body__wrapper">
		<div class="path">
			<span>HOME</span>  &gt; <span>MY PAGE</span>
		</div>
	<div class="mypage__wrapper">

	</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>
</body>
</html>