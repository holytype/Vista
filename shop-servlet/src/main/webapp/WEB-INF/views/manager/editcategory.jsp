<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="overlay">
<div id="modalCategory">
	<ul></ul>
</div>
<div id="modalCategoryContent"></div>
</div>

<script>
$(document).ready(function(){
	
	$(".grid.category").on("click",function(){
		// 페이지 스크롤을 숨깁니다.
        $('body').css('overflow','hidden');
		
		// 화면을 어둡게 합니다.
		$("#overlay").css('display','block');
		
		//복제할 요소
		var $orignalCategory = $(".sidemenu__category");
		var offsetX = $orignalCategory.position().left;
		var offsetY = $orignalCategory.position().top;
			
		//기존 카테고리 비활성화.
		$orignalCategory.css('visibility','hidden');

		//모달로 클론카테고리를 띄웁니다.
	   	$("#modalCategory").css({'position':'absolute','top':offsetY,'left':offsetX,'background':'#dedee0'});
	   	$("#modalCategory").children().append($(".sidemenu__category").html())
		
	});
	
});

</script>