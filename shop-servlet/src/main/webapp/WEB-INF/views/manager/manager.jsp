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
<link href="${pageContext.request.contextPath}/resources/css/manager.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/editcategory.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/tagbox.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/manager/editcategory.jsp" %>
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
			<div class="grid category">
				<strong>CATEGORY</strong>
				<span>카테고리 관리</span>
			</div>
			
			<div class="grid banner">
				<strong>BANNER</strong>
				<span>메인 배너 관리</span>
			</div>
			
			<div class="grid under">
				<strong>BANNER2</strong>
				<span>배너2 관리</span>
			</div>
			
			<div class="grid posting">
				<strong>PRODUCT</strong>
				<span>상품 등록</span>
			</div>
		<input type="file" multiple="multiple" name="image" id="banner" style="display: none;" accept="image/*">
		<input type="file" multiple="multiple" name="image" id="banner2" style="display: none;" accept="image/*">
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
			linkCss("category");
			linkCss("posting");
			linkCss("under");
			linkCss("banner");
			
			linkUrl("posting");
		}
		
		function linkCss(url){
			$(".grid."+url).css({"cursor":"pointer","color":"white","border-color":"transparent","background":"#8e8984"})
			.hover(()=>{$(".grid."+url).css({"background":"#e5e5e5"})},
					()=>{$(".grid."+url).css({"color":"white","border-color":"transparent","background":"#8e8984"})});
		}
		
		function linkUrl(url){
			$(".grid."+url).on("click",function(){
				location.href="${pageContext.request.contextPath}/manager/"+url;
			})
		}
		
		$(".grid.banner").click(function () {
	        $("#banner").click();
    	});
			
		$("#banner").on('change', function(event) {
			var formData = new FormData();
    		
    		// 이미지 파일 추가
    		var fileInput = document.getElementById('banner');
    		
    		for(var idx in fileInput.files){
    			console.log(idx);
    			var file = fileInput.files[idx];
        		if(file!=undefined)
        			formData.append('image', file);
    		}

    		 // ajax 호출
	        $.ajax({
	            // 요청 URL
	            url: "${pageContext.request.contextPath}/manager/banner",

	            // 파일 전송 시
	            enctype: "multipart/form-data",

	            // data의 스트링화(stringify) 방지
	            processData: false,

	            // contentType header의 default 값 설정 방지
	            contentType: false,
	            
	            // 전송할 데이터
	            data: formData,
	            
	            // 데이터 전송 방식
	            type: "POST",
	            
	            // ajax 요청 성공 시 콜백함수
	            success: function (result) {

	                // 데이터를 반환받아 실행할 코드
	                alert("변경이 완료되었습니다.");

	            },
	            
	    		error:(request, status, error)=>{
	    			alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
	    		}
	            
	        });
		});
		
		$(".grid.under").click(function () {
	        $("#banner2").click();
    	});
			
		$("#banner2").on('change', function(event) {
			var formData = new FormData();
    		
    		// 이미지 파일 추가
    		var fileInput = document.getElementById('banner2');
    		
    		for(var idx in fileInput.files){
    			console.log(idx);
    			var file = fileInput.files[idx];
        		if(file!=undefined)
        			formData.append('image', file);
    		}

    		 // ajax 호출
	        $.ajax({
	            // 요청 URL
	            url: "${pageContext.request.contextPath}/manager/under",

	            // 파일 전송 시
	            enctype: "multipart/form-data",

	            // data의 스트링화(stringify) 방지
	            processData: false,

	            // contentType header의 default 값 설정 방지
	            contentType: false,
	            
	            // 전송할 데이터
	            data: formData,
	            
	            // 데이터 전송 방식
	            type: "POST",
	            
	            // ajax 요청 성공 시 콜백함수
	            success: function (result) {

	                // 데이터를 반환받아 실행할 코드
	            	alert("변경이 완료되었습니다.");

	            },
	            
	    		error:(request, status, error)=>{
	    			alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
	    		}
	            
	        });
		});
	</script>
</body>
</html>