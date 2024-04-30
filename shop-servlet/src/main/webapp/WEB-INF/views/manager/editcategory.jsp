<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div id="overlay">
<div id="modalCategory">
	<ul></ul>
</div>
<button id="ctgrBtn" type="button">저장</button>
<div id="modalCategoryContent">
<%@ include file="/WEB-INF/views/manager/tagbox.jsp"%>
</div>
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
	   	$("#modalCategory").css({'position':'absolute','top':offsetY,'left':offsetX,'background':'#dedee0','cursor':'pointer'});
	   	$("#modalCategory").children().html($(".sidemenu__category").html());
	   	
	   	$("#modalCategory").click(function(){
	   		$(".tag").css('visibility','visible');
	   	})
		
	});
	
    // 모달을 클릭하면 모달을 닫습니다.
    $('#overlay').click(function(){
        $(this).fadeOut();
        $("#oldtag").html(oldtagHtmlVal);
        $orignalCategory.css('visibility','visible');
    });

    // 모달 내부 클릭 시 모달 닫기 방지
    $('#modalCategory,#modalCategoryContent,#ctgrBtn').click(function(event){
        event.stopPropagation();
    });
	
	$("#ctgrBtn").click(function(){
		let tagList=[];
		$(".tagName").each(function(){
			console.log($(this).text());
			tagList.push($(this).val());
		});
		/* $.ajax({
			url:"${pageContext.request.contextPath}/manager/category.edit",
			method:"post",
			data:,
			success:(result)=>{
				location.reload(true);
			},
			error:(request, status, error)=>{
				alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
			}
		}); */
	})
});

</script>