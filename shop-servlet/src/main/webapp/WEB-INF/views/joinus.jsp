<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sidemenu.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/joinus.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp" %>
	</div>
	<div class="body__wrapper">
		<div class="path">
		<span>HOME</span>  &gt; <span>JOIN</span>
		</div>
		<div class="joinus__wrapper">
			<form id="joinus__form">
			<strong>기본정보</strong>
				<table>
					<tr>
						<td>아이디</td>
						<td>
							<input type="text" name="id">
							<button class="btn__idcheck" type="button">중복확인</button>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" name="pw2"></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name"></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td><input type="text" name="phone"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td><input type="text" name="address"></td>
					</tr>
				</table>
			<strong>추가정보</strong>
				<table>
					<tr>
						<td>성별</td>
						<td>
							<input type="radio" name="gender" value="M"><span>남자</span>
							<input type="radio" name="gender" value="F"><span>여자</span>
						</td>
					</tr>
					<tr>
						<td>계좌</td>
						<td>
							<select name="bank">
								<option value="none" selected disabled hidden="">은행</option>
								<option value="KB">KB</option>
								<option value="SH">SH</option>
								<option value="NH">NH</option>
							</select>
							<input type="text" name="account">
						</td>
					</tr>
				</table>
			</form>
			<button type="button" class="btn__regist">회원가입</button>
		</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>
	<script>
	$(loadedHandler);
	
	function loadedHandler(){
		$(".btn__idcheck").on("click",idcheck);
		$(".btn__regist").on("click",regist);
	}
	
	function regist(){
		$.ajax({
			url:"${pageContext.request.contextPath}/joinus",
			method:"post",
			data:$("#joinus__form").serialize(),
			success:(result)=>{
/* 				alert("로그인 페이지로 이동합니다.");
				location.href="${pageContext.request.contextPath}/login"; */
			},
			error:(request, status, error)=>{
				alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
			}
		});
	}
	
	function idcheck(){
		$.ajax({
			url:"${pageContext.request.contextPath}/idcheck",
			method:"post",
			data:{id:$("input[name=id]").val()},
			success:(result)=>{
				if(result=="0"){
					alert("사용가능한 아이디 입니다.");
				} else if(result="1") {
					alert("중복입니다.")
				} else {
					alert("오류가 발생했습니다.\n새로고침 해주세요.");
				}
			},
			error:(request, status, error)=>{
				alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
			}
		});
	}
	</script>
</body>
</html>