<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
<script
	src="https://cdn.tiny.cloud/1/at6hlmq6p7gjgeng5egmr946vbn993yhb6rxhlywz7tp0jjw/tinymce/7/tinymce.min.js"
	referrerpolicy="origin"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@tinymce/tinymce-jquery@2/dist/tinymce-jquery.min.js"></script>
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
					<img id="preview-0" src=""
						onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';">
					<input type="file" multiple="multiple" name="image"
						id="uploadInput" style="display: none;" accept="image/*">
				</form>
			</div>
			<div class="header__right">
				<div class="product__content">
					<form>
						<h2 id="myeditable-h1">title...</h2>
						<select name="category">
							<option value="none" selected disabled hidden="">카테고리</option>
							<c:forEach items="${menuCategory}" var="category" varStatus="idx">
								<option value="${category }">${category }</option>
							</c:forEach>
						</select>
						<div id="myeditable-div">
							<p>content...</p>
						</div>
					</form>
				</div>
				<button id="btn" type="button">저장</button>
			</div>
		</section>
		<section id="detail">
			<div class="header">
				<a href="#detail">DETAIL</a> <a href="#guide">GUIDE</a> <a
					href="#review">REVIEW</a> <a href="#qa">Q&amp;A</a>
			</div>
			<div class="body">

			</div>
		</section>
		
				<script>

		  uploadInput.addEventListener('change', function(event) {
			  $("#detail").find("figure").each(function(){
				  $(this).remove();
			  })
			  
			  const files = event.target.files;

			// 파일 목록을 반복하여 처리합니다.
			for (let i = 0; i < files.length; i++) {
				
				if(i>0){
					var idx = 'preview-' + i;
					htmlVal='';
					htmlVal+=`
					<figure>
					  <img id="\${idx}" src="${pageContext.request.contextPath}/resources/images/errorimage.png" alt="Example Image">
					</figure>`;
					
					$("#detail").find(".body").append(htmlVal);
					
				}
				
			    const reader = new FileReader();
			    
			    // 파일을 읽을 때 발생하는 이벤트 핸들러를 설정합니다.
			    reader.onload = function(e) {
			        const img = new Image();
			        img.src = e.target.result;
			        img.onload = function() {
			            // 새로운 이미지를 추가합니다. 각 이미지는 서로 다른 요소에 추가됩니다.
			            $('#preview-' + i).attr('src', img.src);
			        };
			    };
			    
			    // 파일을 읽습니다.
			    reader.readAsDataURL(files[i]);
			}
		      
		    	  

		  });
		  
		  $('#preview-0').css('cursor','pointer').on("click",function(){
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
    		var category = $("select[name=category]").val();
    		console.log(category);
    		formData.append('title', title);
    		formData.append('content', content);
    		formData.append('category', category);
    		
    		// 이미지 파일 추가
    		var fileInput = document.getElementById('uploadInput');
    		var file = fileInput.files;
    		
    		for(var idx in fileInput.files){
    			console.log(idx);
    			var file = fileInput.files[idx];
        		if(file!=undefined)
        			formData.append('image', file);
    		}
    		
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
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp"%>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp"%>

</body>
</html>