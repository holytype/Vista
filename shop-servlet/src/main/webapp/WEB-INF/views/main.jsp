<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<script type="text/javascript" src="http://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
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
					<c:if test="${empty slideImage}">
						<a><img src="" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';"></a>
					</c:if>
					<c:forEach items="${slideImage}" var="image">
						<a><img src="${image }" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';"></a>
					</c:forEach>
				</div>
			</div>
			<div class="slider__menu">
				<ul>
					<li><img src="${slideMenu[0].image}" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';"><span>${slideMenu[0].desc}</span></li>
					<li><img src="${slideMenu[1].image}" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';"><span>${slideMenu[1].desc}</span></li>
					<li><img src="${slideMenu[2].image}" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';"><span>${slideMenu[2].desc}</span></li>
					<li><img src="${slideMenu[3].image}" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';"><span>${slideMenu[3].desc}</span></li>
				</ul>
			</div>
		</section>
		<section class="grid__wrapper">
			<div class="grid__header">
				<strong>
				${gird__header}
				<c:if test="${empty gird__header }">
				no text
				</c:if>
				</strong>
				<p>
				${gird__header}
				<c:if test="${empty gird__header }">
				no text
				</c:if>
				</p>
			</div>
			<ul class="grid__box">
				<!-- <li class="item__box">
					<div class="image__box">
						<img src="https://upnormal.kr/web/product/medium/202404/b384d496282d7d97c615ce4f6feaf8e1.jpg">
					</div>
					<div class="desc__box">
						<div class="item__color">
							<span>흑</span>
							<span>백</span>
						</div>
						<strong class="item__title">제------목</strong>
						<span class="item__price">9999원</span>
						<p class="item__desc">차가운 도시의 남자<p>
					</div>
				</li> -->
			</ul>
		</section>
	</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>
<script type="text/javascript">
$.noConflict();
</script>
<script>
$(document).ready(function () {
	slick();
	listItems();
});

function slick(){
    var slider = $('.main__slider');

    // 슬라이더 초기화
   slider.on('init', function (event, slick) {
       slider.addClass('slick-autoplaying');
   });

   slider.slick({
       fade: true, // 페이드 인/아웃 효과를 활성화합니다.
       infinite: true, // 무한 반복 여부를 설정합니다.
       speed: 500, // 페이드 인/아웃 속도를 설정합니다.
       autoplay: true, // 자동 재생 여부를 설정합니다.
       autoplaySpeed: 1500, // 자동 재생 속도를 설정합니다.

       prevArrow: '<button type="button" class="slick-prev">Previous</button>',
       nextArrow: '<button type="button" class="slick-next">Next</button>',

       // dots 옵션 활성화
       dots: true,
       slide: 'a'
   });
}

function listItems(){
	$.ajax({
		url:"${pageContext.request.contextPath}/main",
		method:"post",
		dataType:"json",
		success:(data)=>{
/* 			console.log(data);
			console.log(data[0]);
			var item = data[0];
			console.log(item.title);
			console.log(item["title"]); */
			var htmlVal ='';
 			for(var idx in data){
 				console.log(idx);
 				var item = data[idx];
				htmlVal +=`
					<li class="item__box">
					<form class="item__form">
					<input type="hidden" name="boardId" value="\${item.boardId}">
					</form>
					<div class="image__box">
						<img src="\${item.imagePath}" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';">
					</div>
					<div class="desc__box">
						<div class="item__color">
							<span>흑</span>
							<span>백</span>
						</div>
						<strong class="item__title">\${item.title}</strong>
						<span class="item__price">\${item.price}원</span>
						<p class="item__desc">\${item.desc}<p>
					</div>
				</li>
				`;
			}
			
 			$(".grid__box").html(htmlVal);
		
		},
		error:(request, status, error)=>{
			alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
		}
	});
}
</script>
</body>
</html>