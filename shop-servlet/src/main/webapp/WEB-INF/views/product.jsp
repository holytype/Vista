<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product</title>
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sidemenu.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp" %>
	</div>
	<div class="body__wrapper">
		<div class="path">
		<span>HOME</span>  &gt; <span>JOIN</span>
		</div>
		<section class="product__detail">
			<div class="header__menu">
				<div class="header_detail"></div>
				<div class="header_guide"></div>
				<div class="header_review"></div>
				<div class="header_qa"></div>
			</div>
			<div>wysiwyg</div>
		</section>
		<section class="product__guide">
			<div class="header__menu">
				<div class="header_detail"></div>
				<div class="header_guide"></div>
				<div class="header_review"></div>
				<div class="header_qa"></div>
			</div>
			<div>
			information
			</div>
		</section>
		<section class="product__review">
			<div class="header__menu">
				<div class="header_detail"></div>
				<div class="header_guide"></div>
				<div class="header_review"></div>
				<div class="header_qa"></div>
			</div>
			<div>
			review
			</div>
		</section>
		<section class="product__qa">
						<div class="header__menu">
				<div class="header_detail"></div>
				<div class="header_guide"></div>
				<div class="header_review"></div>
				<div class="header_qa"></div>
			</div>
			<div>
				<strong>Q&A</strong>
				<span>상품에 대해 궁금한 점을 해결해 드립니다.</span>
			</div>
			<table>
				<th>
					<td>번호</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</th>
				<tr>
					<td>1</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>2</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>3</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>4</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
				<tr>
					<td>5</td>
					<td>제목</td>
					<td>작성자</td>
					<td>작성일</td>
				</tr>
			</table>
		</section>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
</body>
</html>