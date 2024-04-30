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
				<img id=preview src="" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';">
				<input type="file" multiple="multiple" name="image" id="uploadInput" style="display: none;" accept="image/*">
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
				<button id="btn" type="button">전송</button>
			</div>
			</section>
			
		<script>
		 const uploadInput = document.getElementById('uploadInput');
//		 const preview = document.getElementById('preview');

		  uploadInput.addEventListener('change', function(event) {
		    const file = event.target.files[0];
		    if (file) {
		      const reader = new FileReader();
		      reader.onload = function(e) {
		        const img = new Image();
		        img.src = e.target.result;
		        img.onload = function() {
		        	$('#preview').attr('src',img.src);
//		          preview.innerHTML = ''; // 이전에 표시된 이미지 제거
//		          preview.appendChild(img); // 새로운 이미지 추가
		        };
		      };
		      reader.readAsDataURL(file);
		    }
		  });
		  
		  $('#preview').css('cursor','pointer').on("click",function(){
			  $('#uploadInput').click();
		  })
		
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
    	  
    	  $("#btn").click(function () {
			//console.log($("h2")[0].outerHTML);
    		
    		var formData = new FormData();

    		// 제목과 내용 데이터 추가
    		var title = $("h2")[0].outerHTML;
    		var content = document.getElementById('myeditable-div').innerHTML;
    		formData.append('title', title);
    		formData.append('content', content);
    		
    		// 이미지 파일 추가
    		var fileInput = document.getElementById('uploadInput');
    		var file = fileInput.files[0];
    		if(file!=undefined)
    			formData.append('image', file);
    		
    		 // ajax 호출
	        $.ajax({
	            // 요청 URL
	            url: "${pageContext.request.contextPath}/manager/posting",

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
	                alert("전송내용 : "+result);

	            },
	            
	    		error:(request, status, error)=>{
	    			alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
	    		}
	            
	        });
	        
    		});
    		
    </script>
		
		<section id="detail">
			<div class="header">
				<a href="#detail">DETAIL</a> <a href="#guide">GUIDE</a> <a
					href="#review">REVIEW</a> <a href="#qa">Q&amp;A</a>
			</div>
			<div class="body">
			<%@ include file="/WEB-INF/views/manager/tagbox.jsp"%>
			</div>
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