<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="tag" style="visibility:hidden">
<div class="list">
	<ul id="oldtag">
		<c:forEach items="${menuCategory}" var="category">
		<li class="tagItem"><span class="tagName">${category }</span><button class="xBtn" type="button">x</button></li>
		</c:forEach>
	</ul>
</div>
<div class="input">
	<ul id="newtag">
	<input id="tagmaker" type="text" placeholder="태그를 설정하세요">
	</ul>
</div>
</div>

<script>
	const oldtagHtmlVal = $("#oldtag").html();
	$("#tagmaker").keypress(function(event) {
	    if (event.which === 13) {
	       var tagName = $(this).val();
	       $(this).val('');
	       
	       if($(".tagName").filter(function() { return $(this).text().trim() === tagName; }).length > 0){
	    	   alert("해당태그가 존재합니다.");
	       }else{
		       var htmlVal = '';
		       htmlVal +=`
		    	<li class="tagItem"><span class="tagName">\${tagName}</span><button class="xBtn" type="button">x</button></li>
		       `;
		       
		       //$(this).parent().prepend(htmlVal);
		       $("#oldtag").append(htmlVal);
		       tagxBtn();
	       }
	    }
	});
	
	tagxBtn();
	
	function tagxBtn(){
		$(".xBtn").off().on("click",function(){
			$(this).parent().remove();
		})
	}
	
</script>