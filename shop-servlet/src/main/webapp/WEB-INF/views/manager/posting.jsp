<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>product</title>
<link href="${pageContext.request.contextPath}/resources/css/layout.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/sidemenu.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/posting.css"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://cdn.tiny.cloud/1/at6hlmq6p7gjgeng5egmr946vbn993yhb6rxhlywz7tp0jjw/tinymce/7/tinymce.min.js" referrerpolicy="origin"></script>
<script src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-jquery@2/dist/tinymce-jquery.min.js"></script>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp"%>
	</div>
	<div class="body__wrapper">
		<div class="path">
			<span>HOME</span> &gt; <span>SHIRTS</span>
		</div>
		
		    <section class="product__header">
			<div class="header__left">
				<form>
				<img id="mainImg" src="" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';">
				<input type="file" multiple="multiple" name="image" id="image" style="display: none;" accept="image/*">
				</form>
			</div>
			<div class="header__right">
				<div class="product__content">
				<form>
				<h2 id="myeditable-h1">title...</h2>
				<div id="myeditable-div">
					<p>content...</p>
				</div>
				</form>
				</div>
			</div>
			</section>
			
		<script>
/*       $('textarea#tiny').tinymce({
        height: 500,
        menubar: false,
        plugins: [
          'advlist', 'autolink', 'lists', 'link', 'image', 'charmap', 'preview',
          'anchor', 'searchreplace', 'visualblocks', 'fullscreen',
          'insertdatetime', 'media', 'table', 'code', 'help', 'wordcount'
        ],
        toolbar: 'undo redo | blocks | bold italic backcolor | ' +
          'alignleft aligncenter alignright alignjustify | ' +
          'bullist numlist outdent indent | removeformat | help'
      }); */
      
      tinymce.init({
    	    selector: '#myeditable-h1',
    	    inline: true,
    	    menubar: false,
    	    toolbar: 'undo redo'
    	  });

    	  tinymce.init({
    	    selector: '#myeditable-div',
    	    inline: true
    	  });
    	  
    	  $("#mainImg").click(function () {
    		    $("#image").trigger("click")
    		});
    		
    	  $("#image").on("change", function () {

    	        // input 태그의 파일 데이터
    	        const files = this.files

    	        // ajax submit용 form data
    	        const formData = new FormData()

    	        // input 태그 파일을 데이터 순회하며 form data에 추가
    	        // 첫번째 스트링 인자('image')는 서버에서 multipart file의 파라미터명으로 쓰이므로 주의
    	        for (let i=0; i<files.length; i++) {

    	            formData.append('image', files[i])
    	        }

    	        // ajax 호출
    	        $.ajax({
    	            // 요청 URL
    	            url: "${pageContext.request.contextPath}/manager/posting.img",

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
    	            success: function (imgs) {

    	                // 데이터를 반환받아 실행할 코드

    	            }
    	        })
    	    });
    </script>
		
		<section id="detail">
			<div class="header">
				<a href="#detail">DETAIL</a> <a href="#guide">GUIDE</a> <a
					href="#review">REVIEW</a> <a href="#qa">Q&amp;A</a>
			</div>
			<div class="body">wygiwys</div>
		</section>
		<section id="guide">
			<div class="header">
				<a href="#detail">DETAIL</a> <a href="#guide">GUIDE</a> <a
					href="#review">REVIEW</a> <a href="#qa">Q&amp;A</a>
			</div>
			<div class="body"></div>
		</section>
		<%@ include file="/WEB-INF/views/product/review.jsp"%>
		<%@ include file="/WEB-INF/views/product/qa.jsp"%>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp"%>

</body>
</html>