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

<!-- 주소 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
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
							<input type="text" name="id" autocomplete="off" spellcheck="false">
							<button class="btn__idcheck" type="button">중복확인</button>
							<span class="check id"></span>
						</td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="pw1" autocomplete="off" spellcheck="false"><span class="check pw1"></span></td>
					</tr>
					<tr>
						<td>비밀번호확인</td>
						<td><input type="password" name="pw2" autocomplete="off" spellcheck="false"><span class="check pw2"></span></td>
					</tr>
					<tr>
						<td>이름</td>
						<td><input type="text" name="name" autocomplete="off" spellcheck="false"></td>
					</tr>
					<tr>
						<td>휴대전화</td>
						<td><input type="text" name="phone" autocomplete="off" spellcheck="false"></td>
					</tr>
					<tr>
						<td>이메일</td>
						<td><input type="text" name="email" autocomplete="off" spellcheck="false"></td>
					</tr>
					<tr>
						<td>주소</td>
						<td>
							<input type="text" id="postno" placeholder="우편번호" name="address1" readonly>
							<input type="button" value="우편번호 찾기" id="addrBtn"><br>
							<input type="text" id="address" placeholder="주소" name="address2" readonly><input type="text" id="add" placeholder="참고항목" name="address3" readonly><br>
							<input type="text" id="detail" placeholder="상세주소" name="address4">
							
						</td>
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
								<option value="산업은행">산업은행</option>
								<option value="기업은행">기업은행</option>
								<option value="국민은행">국민은행</option>
								<option value="하나은행">하나은행</option>
								<option value="농협">농협</option>
								<option value="우리은행">우리은행</option>
								<option value="카카오뱅크">카카오뱅크</option>
								<option value="토스뱅크">토스뱅크</option>
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
	var isDuplicate = false;
	var isPwCheck = false;
	$(loadedHandler);
	
	function loadedHandler(){
		
		$(".btn__idcheck").attr("disabled",true);
		
		$(".btn__idcheck").on("click",idcheck);
		$(".btn__regist").on("click",regist);
		$("#addrBtn").on("click",addrBtn);
		formCheck();
	}
	
	function formCheck(){
		
		//아이디
		$("input[name=id]").on("input",function(){
			var inputText = $(this).val();
            if(inputText.length==0){
                $(".check.id").text("필수 입력 항목 입니다");
                $(".btn__idcheck").attr("disabled",true);
            } else {
                var regex = /^[a-zA-Z0-9]{4,16}$/;
                if(regex.test(inputText)){
                	$(".check.id").text("");
                	$(".btn__idcheck").attr("disabled",false);
                } else {
                	$(".check.id").text("영문 대소문자 숫자 4~16글자");
                	$(".btn__idcheck").attr("disabled",true);
                }
            }
        });
                
		//비밀번호
        $("input[name=pw1]").on("input",function(){
        	isPwCheck=false;
			var inputText = $(this).val();
            if(inputText.length==0){
                $(".check.pw1").text("필수 입력 항목 입니다");
            } else {
            	var regex = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
                if(regex.test(inputText)){
                	$(".check.pw1").text("");
                } else {
                	$(".check.pw1").text("영문 대소문자 숫자 특수문자 8~16글자");
                }
            }
        	
        });

        $("input[name=pw2]").on("input",function(){
        	isPwCheck=false;
			var inputText = $(this).val();
            if(inputText.length==0){
                $(".check.pw2").text("필수 입력 항목 입니다");
            } else {
            	var regex = /^[a-zA-Z0-9!@#$%^&*]{8,16}$/;
                if(regex.test(inputText)){
                	$(".check.pw2").text("");
                } else {
                	$(".check.pw2").text("영문 대소문자 숫자 특수문자 8~16글자");
                }
            }
        });

        $("input[name=pw1]").on("blur",function(){
            var inputText=$(this).val();
            
            if($("input[name=pw2]").val()==""){
            	isPwCheck=false;
            	return;
            }
            		
            if(inputText!=$("input[name=pw2]").val()){
            	$(".check.pw1").text("비밀번호가 일치하지 않습니다.");
            	isPwCheck=false;
            }
            	
            if(inputText==$("input[name=pw2]").val()){
            	$(".check.pw1").text("");
            	isPwCheck=true;
            }
        });


        $("input[name=pw2]").on("blur",function(){
            var inputText=$(this).val();
            
            if($("input[name=pw1]").val()==""){
            	isPwCheck=false;
            	return;
            }
            		
            if(inputText!=$("input[name=pw1]").val()){
            	$(".check.pw2").text("비밀번호가 일치하지 않습니다.");
            	isPwCheck=false;
            }
            	
            if(inputText==$("input[name=pw1]").val()){
            	$(".check.pw2").text("");
            	isPwCheck=true;
            }

        })
	}
	
	function addrBtn(){
		 new daum.Postcode({
	            oncomplete: function(data) {
	                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

	                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
	                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수

	                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }

	                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                    // 조합된 참고항목을 해당 필드에 넣는다.
	                    document.getElementById("add").value = extraAddr;
	                
	                } else {
	                    document.getElementById("add").value = '';
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('postno').value = data.zonecode;
	                document.getElementById("address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("detail").focus();
	            }
	        }).open();
	}
	
	function regist(){
		if(!isDuplicate){
			alert("아이디 중복체크를 해주세요.");
			return;
		}
		if($("input[name=id]").val()=="" ||
			$("input[name=pw1]").val()==""	||
			$("input[name=pw2]").val()==""	||
			$("input[name=name]").val()==""	||
			$("input[name=email]").val()==""	||
			$("input[name=phone]").val()==""	||
			$("input[name=address1]").val()==""	||
			$("input[name=address2]").val()==""	||
			$("input[name=address4]").val()==""){
			alert("기본정보를 모두 입력해주세요.");
			return;
		}
		if(!isPwCheck){
			alert("비밀번호가 일치하지 않습니다.");
			return;
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath}/joinus",
			method:"post",
			data:$("#joinus__form").serialize(),
			success:(result)=>{

				if(result=="1"){
					alert("성공적으로 회원가입되었습니다.\n로그인 페이지로 이동합니다.");
					location.href="${pageContext.request.contextPath}/login";
				} else {
					alert("error\n"result);
				}
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
					isDuplicate=true;
				} else if(result="1") {
					alert("중복입니다.")
					isDuplicate=false;
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