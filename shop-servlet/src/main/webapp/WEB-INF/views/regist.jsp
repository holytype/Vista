<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
<div>
<span>HOME  &gt; JOIN</span>
</div>
<strong>기본정보</strong>
<form id="joinus__form1">
<div>
	<div>
		<label>아이디</label>
		<input type="text" name="id">
	</div>
	<div>
		<label>비밀번호</label>
		<input type="password" name="pw">
	</div>
	<div>
		<label>비밀번호확인</label>
		<input type="password" name="pw2">
	</div>
	<div>
		<label>이름</label>
		<input type="text" name="name">
	</div>
	<div>
		<label>휴대전화</label>
		<input type="text" name="phone">
	</div>
	<div>
		<label>이메일</label>
		<input type="text" name="email">
	</div>
	<div>
		<label>주소</label>
		<input type="text" name="address">
	</div>
</div>
</form>
<strong>추가정보</strong>
<form id="joinus__form2">
<div>
	<div>
		<label>성별</label>
		<input type="radio" name="gender" value="남"><span>남자</span>
		<input type="radio" name="gender" value="여"><span>여자</span>
	</div>
	<div>
		<label>계좌</label>
		<select name="bank">
			<option value="none" selected disabled hidden>은행</option>
			<option value="KB">KB</option>
			<option value="SH">SH</option>
			<option value="NH">NH</option>
		</select>
		<input type="text" name="account">
	</div>
</div>
</form>
<button class="joinus__btn">회원가입</button>
<script>
$("joinus__btn").on("click",()=>{
	$.ajax({
		url:"${pageContext.request.contextPath}/regist",
		method:"post",
		data:$(".joinus__form1,.joinus__form1").serialize(),
		success:(result)=>{
			if(result=="null"||result=="0")
				alert("가입 실패");
			else
				window.location.href="${pageContext.request.contextPath}/login";
		},
		error:(request,status,error)=>{
			alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
		}
	});
})
</script>
</body>
</html>