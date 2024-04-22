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
		<span>HOME</span>  &gt; <span>Shirts</span>
		</div>
		<section class="product__header">
			<div class="header__left">
				<img src="" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';">
			</div>
			<div class="header__right">
				<div class="product__content">
					<h2>[MADE] 업 아킨 소프트 세미오버 코튼셔츠 (4color)</h2>
					<p>
						(자체제작 / 당일발송) 부드러운 착용감과 데일리한 세미오버 실루엣이에요:) 컬러감도 너무 좋습니다 !
						
						Check Point
						-부드럽고 편안한 착용감
						-바이오워싱 가공
						-네츄럴한 세미오버핏
						-레이어드 활용 가능
						-유니크한 컬러 구성
						-원포켓 디테일
						
						Size
						Free(100~105) 총기장 77/82cm 어깨 51cm 가슴 60cm 소매 61cm
						(해당 실측은 단면으로 측정한 사이즈이며, 측정 방법에 따라 1~3cm 차이가 발생할 수 있습니다)
						
						Fabric - 코튼 100%
						
						Model INFO
						178 cm / 68 kg (평소 상의 105착용 / 하의 30~31착용)
						
						모델 - Free(100~105) 착용
					</p>
				</div>
				<table class="product__option">
					<tr>
						<th>판매가</th>
						<td>32,900원</td>
					<tr>
					<tr>
						<th>Color</th>
						<td>
						<button class="product__color" type="button">블랙</button>
						<button class="product__color" type="button">그레이</button>
						</td>
					<tr>
					<tr>
						<th>Size</th>
						<td><button class="product__size" type="button">Free</button></td>
					<tr>
				</table>
				<ul class="choice__option">
					<li class="option">
						<div class="option__left">
							<p>
							[MADE] 업 아킨 소프트 세미오버 코튼셔츠 (4color)
							<br>
							 - 
							<span class="colorSize">화이트/Free</span>
							</p>
						</div>
						<div class="option__mid">
							<span>
								<input type="text" class="option__count" value="1">
								<button type="button" class="count__up">&#94;</button>
								<button type="button"  class="count__down">&#94;</button>
							</span>
							<button  type="button" class="option__delete">x</button>
						</div>
						<div class="option__right">
							<span class="option__price">23,900</span>원
						</div>
					</li>
				</ul>
				<div class="option__total">
				TOTAL(수량):<sapn>32,900</sapn>원(<sapn>1</sapn>개)
				</div>
				<div class="btn__wrapper">
					<div><button id="btn__payment">BUY IT NOW</button></div>
					<div>
						<button id="btn__cart">ADD TO CART</button>
						<button id="btn__wishlist">WISH LIST</button>
					</div>
				</div>
			</div>
		</section>
		<section id="detail">
			<div class="header">
				<a href="#detail">DETAIL</a>
				<a href="#guide">GUIDE</a>
				<a href="#review">REVIEW</a>
				<a href="#qa">Q&A</a>
			</div>
			<div class="body">wysiwyg</div>
		</section>
		<section id="guide">
			<div class="header">
				<a href="#detail">DETAIL</a>
				<a href="#guide">GUIDE</a>
				<a href="#review">REVIEW</a>
				<a href="#qa">Q&A</a>
			</div>
			<div class="body">
			information
			</div>
		</section>
		<section id="review">
			<div class="header">
				<a href="#detail">DETAIL</a>
				<a href="#guide">GUIDE</a>
				<a href="#review">REVIEW</a>
				<a href="#qa">Q&A</a>
			</div>
			<div class="body">
			review
			</div>
		</section>
		<section id="qa">
			<div class="header">
				<a href="#detail">DETAIL</a>
				<a href="#guide">GUIDE</a>
				<a href="#review">REVIEW</a>
				<a href="#qa">Q&A</a>
			</div>
			<div>
				<strong>Q&A</strong>
				<span>상품에 대해 궁금한 점을 해결해 드립니다.</span>
			</div>
			<table>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
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
<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>
<script>

</script>
</body>
</html>