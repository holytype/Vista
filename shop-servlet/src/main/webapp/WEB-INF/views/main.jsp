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
<link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script type="text/javascript"
	src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp" %>
	</div>
	<div class="body__wrapper">
	<div class="body__inner">
		<section class="slider__wrapper">
			<div class="slider__inner">
				<div class="main__slider">
					<a><img src="https://file.cafe24cos.com/banner-admin-live/upload/jinwoo3664/2fade598-8de5-4288-e5d5-1c2836580dd0.jpeg"></a>
					<a><img src="https://file.cafe24cos.com/banner-admin-live/upload/jinwoo3664/56cccd3a-5054-4fd0-e3a2-ccf752a1db9c.jpeg"></a>
					<a><img src="https://file.cafe24cos.com/banner-admin-live/upload/jinwoo3664/3df806c2-3830-4d56-cccb-74212ce0238e.jpeg"></a>
					<a><img src="https://file.cafe24cos.com/banner-admin-live/upload/jinwoo3664/7a0fc1b0-047b-44c0-bca2-662edd7792ad.jpeg"></a>
				</div>
			</div>
			<div class="slider__menu">
				<ul>
					<li><img src="https://upnormal.kr/web/upload/category/editor/2023/03/31/35bda086ff0705992afc8083b454307c.jpg"><span>Best_30</span></li>
					<li><img src="https://upnormal.kr/web/upload/category/editor/2023/03/31/ca03b71b8cd515e934d921b9f2a23bf1.jpg"><span>OUTER</span></li>
					<li><img src="https://upnormal.kr/web/upload/category/editor/2023/03/31/80b23a5a567dcfe7be6d05dab36e2f6f.jpg"><span>TOP</span></li>
					<li><img src="https://upnormal.kr/web/upload/category/editor/2022/09/12/bc28a781c3245909dc65f55d59004bf5.jpg"><span>BOTTOM</span></li>
				</ul>
			</div>
		</section>
	</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	
<script type="text/javascript">
$.noConflict();
</script>
<script>
$(document).ready(function () {
    var slider = $('.main__slider');

     // 슬라이더 초기화
    slider.on('init', function (event, slick) {
/* 		slider.width("1920px");
        slider.height("450px"); */
        slider.addClass('slick-autoplaying');
    });

    slider.slick({
        fade: true, // 페이드 인/아웃 효과를 활성화합니다.
        infinite: true, // 무한 반복 여부를 설정합니다.
        speed: 500, // 페이드 인/아웃 속도를 설정합니다.
        autoplay: true, // 자동 재생 여부를 설정합니다.
        autoplaySpeed: 2000, // 자동 재생 속도를 설정합니다.

        prevArrow: '<button type="button" class="slick-prev">Previous</button>',
        nextArrow: '<button type="button" class="slick-next">Next</button>',

        // dots 옵션 활성화
        dots: true,
        slide: 'a'
    });

});
</script>
</body>
</html>