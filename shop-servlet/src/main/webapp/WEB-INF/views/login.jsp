<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet"> --%>
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<div class="login__wrapper">
	<div class="login__logo"></div>
	<div class="login__inner">
		<form id="login__form">
			<div>
				<label>아이디</label>
				<input type="text" name="id">
				<label>패스워드</label>
				<input type="password" name="pw">
			</div>
			<div>
				<input type="checkbox">
				<span>아이디저장</span>
			</div>
			<button type="button" class="btn__login">로그인</button>
		</form>
		<div>
			<a >아이디 찾기</a>
			<a>비밀번호 찾기</a>
			<a href="${pageContext.request.contextPath}/joinus">회원가입</a>
		</div>
	</div>
</div>
<script>
$(".btn__login").on("click",()=>{
	$.ajax({
		url:"${pageContext.request.contextPath}/login",
		method:"post",
		data:$("#login__form").serialize(),
		success:(result)=>{
			if(result=="null")
				alert("로그인 실패");
			else
				window.location.href="${pageContext.request.contextPath}/main";
		},
		error:(request, status, error)=>{
			alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
		}
	});
	
	href="${pageContext.request.contextPath }/main"
})

$(".login__logo").css("cursor","pointer")
.on("click",()=>{
	location.href="${pageContext.request.contextPath}/main";
});
</script>
</body>
</html>