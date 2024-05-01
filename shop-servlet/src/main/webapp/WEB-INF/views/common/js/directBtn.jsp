<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div id="btn__direct" style="display:none">
	<a id="direct__up"><div></div></a>
	<a id="direct__down"><div></div></a>
</div>
<script>
	window.onscroll = ()=>{
		if(document.documentElement.scrollTop<800){
			$("#btn__direct").hide();
		} else {
			$("#btn__direct").show();
		}
	};
	
	$("#direct__up").on("click",()=>{
		window.scrollTo({
			top:0,
			left:0,
			behavior:'smooth'
		});
	});
	
	$("#direct__down").on("click",()=>{
		window.scrollTo({
			top:document.body.scrollHeight,
			left:0,
			behavior:'smooth'
		});
	});
</script>