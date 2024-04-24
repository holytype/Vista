<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main</title>
<link href="${pageContext.request.contextPath}/resources/css/layout.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/sidemenu.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/footer.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/registaddr.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
<body>
	<div class="sidemenu__wrapper">
		<%@ include file="/WEB-INF/views/common/sidemenu.jsp" %>
	</div>
	<div class="body__wrapper">
		<div class="path">
			<span>HOME</span>  &gt; <span>MY PAGE</span> &gt; <span>ADDRESS BOOK</span>
		</div>
	<div class="mypage__wrapper">
		<div class="header">
			<h2>ADDRESS BOOK</h2>
			<p>자주 쓰는 배송지를 등록 관리하실 수 있습니다.<p>
		</div>
		<form id="addr__form">
		<c:choose>
			<c:when test="${empty addrList }">
			
			<table data-table-no="1">
				<tr>
					<th>배송지명</th>
					<td><input type="text" class="addrName" name="addrname1" autocomplete="off" spellcheck="false"></td>
				</tr>
				<tr>
					<th>성명</th>
					<td><input type="text" class="recipient" name="recipient1" autocomplete="off" spellcheck="false"></td>
				</tr>
				<tr>
					<th>주소</th>
					<td>
						<input type="text" class="address post" placeholder="우편번호" name="post1" readonly>
						<input type="button" value="우편번호 찾기" class="addrBtn"><br>
						<input type="text" class="address main" placeholder="주소" name="main1" readonly> <input type="text" class="address ref"  placeholder="참고항목" name="ref1" readonly><br>
						<input type="text" class="address sub" placeholder="상세주소" name="sub1">
					</td>
				</tr>
				<tr>
					<th>휴대전화</th>
					<td><input type="text" class="phone" name="phone1" autocomplete="off" spellcheck="false"></td>
				</tr>
				<tr>
					<td colspan="2">
					<div>
						<div class="btn__wrapper">
							<button type="button" class="ctrl plus">+</button>
							<button type="button" class="ctrl minus">-</button>
						</div>
						<div class="radio__wrapper">
							<input type="radio" class="pin" name="pin1">
							<span>기본 배송지로 저장</span>
						</div>
					</div>
					</td>
				</tr>
			</table>
			
			</c:when>
			
			<c:otherwise>
				<c:forEach items="${addrList }" var="addr" varStatus="idx">
				
				<c:set var="dataAddr" value="${addr.address}" />
				<c:set var="before" value="${fn:indexOf(dataAddr, '(')}" />
				<c:set var="after" value="${fn:indexOf(dataAddr, ')')}" />
				<c:set var="length" value="${fn:length(dataAddr)}" />
				
				<c:set var="addrMain" value="${fn:substring(dataAddr, 0, before-1)}" />
				<c:set var="addrRef" value="${fn:substring(dataAddr, before, after+1)}" />
				<c:set var="addrSub" value="${fn:substring(dataAddr, after+2, length)}" />
				<table data-table-no="${idx.count }">
					<tr>
						<th>배송지명</th>
						<td><input type="text" class="addrName" value="${addr.addrName }" name="addrname${idx.count}" autocomplete="off" spellcheck="false"></td>
					</tr>
					<tr>
						<th>성명</th>
						<td><input type="text" class="recipient" value="${addr.name }" name="recipient${idx.count}" autocomplete="off" spellcheck="false"></td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" value="${addr.post}" class="address post" name="post${idx.count}" readonly>
							<input type="button" value="우편번호 찾기" class="addrBtn"><br>
							<input type="text" value="${addrMain}" class="address main" name="main${idx.count}" readonly> <input type="text" value="${addrRef}" class="address ref" name="ref${idx.count}" readonly><br>
							<input type="text" value="${addrSub}" class="address sub" name="sub${idx.count}">
						</td>
					</tr>
					<tr>
						<th>휴대전화</th>
						<td><input type="text" class="phone" value="${addr.phone }" name="phone${idx.count}" autocomplete="off" spellcheck="false"></td>
					</tr>
					<tr>
						<td colspan="2">
						<div>
							<div class="btn__wrapper">
								<button type="button" class="ctrl plus">+</button>
								<button type="button" class="ctrl minus">-</button>
							</div>
							<div class="radio__wrapper">
								<c:if test="${addr.addrPin eq 'N'}"><input class="pin" type="radio" name="pin${idx.count}"></c:if>
								<c:if test="${addr.addrPin eq 'Y'}"><input class="pin" type="radio" name="pin${idx.count}"  checked="checked"></c:if>
								<span>기본 배송지로 저장</span>
							</div>
						</div>
						</td>
					</tr>
				</table>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			
		</form>
		<div class="btn__wrapper2">
			<button type="button" id="saveBtn">저장</button>
			<button type="button" id="cancleBtn">취소</button>
		</div>
	</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>
	
	<script>
	if($("table").length==5){
		$(".ctrl.plus").attr("disabled",true);
	}
	if($("table").length==1){
		$(".ctrl.minus").attr("disabled",true);
	}
	
	$(".ctrl.plus").on("click",addForm);
	$(".ctrl.minus").on("click", function(){
		$(this).parents("table").remove();
		
		if($("table").length<5){
			$(".ctrl.plus").attr("disabled",false);
		}
		if($("table").length==1){
			$(".ctrl.minus").attr("disabled",true);
		}
		if($("table").length>1){
			$(".ctrl.minus").attr("disabled",false);
		}
		
		//테이블 커스텀 속성 데이터 부여
		$("table").each(function(idx){
			$(this).attr("data-table-no",idx+1);
			$(this).find(".addrName").attr("name","addrname"+(idx+1));
			$(this).find(".recipient").attr("name","recipient"+(idx+1));
			$(this).find(".phone").attr("name","phone"+(idx+1));
			$(this).find(".address.post").attr("name","post"+(idx+1));
			$(this).find(".address.main").attr("name","main"+(idx+1));
			$(this).find(".address.ref").attr("name","ref"+(idx+1));
			$(this).find(".address.sub").attr("name","sub"+(idx+1));
		})

	})
	$(".addrBtn").on("click", addrBtn);
	
	function addForm(){
		htmlVal='';
		htmlVal+=`
			<table>
			<tr>
				<th>배송지명</th>
				<td><input type="text" class="addrName" name="addrName" autocomplete="off" spellcheck="false"></td>
			</tr>
			<tr>
				<th>성명</th>
				<td><input type="text" class="recipient" autocomplete="off" spellcheck="false"></td>
			</tr>
			<tr>
				<th>주소</th>
				<td>
					<input type="text" class="address post" placeholder="우편번호" name="address1" readonly>
					<input type="button" value="우편번호 찾기" class="addrBtn"><br>
					<input type="text" class="address main" placeholder="주소" name="address2" readonly> <input type="text" class="address ref"  placeholder="참고항목" name="address3" readonly><br>
					<input type="text" class="address sub" placeholder="상세주소" name="address4">
				</td>
			</tr>
			<tr>
				<th>휴대전화</th>
				<td><input type="text" class="phone" autocomplete="off" spellcheck="false"></td>
			</tr>
			<tr>
				<td colspan="2">
				<div>
					<div class="btn__wrapper">
						<button type="button" class="ctrl plus">+</button>
						<button type="button" class="ctrl minus">-</button>
					</div>
					<div class="radio__wrapper">
						<input type="radio" name="pin" class="pin">
						<span>기본 배송지로 저장</span>
					</div>
				</div>
				</td>
			</tr>
		</table>
		`;
		$(this).parents("#addr__form").append(htmlVal);
		
		//이벤트 중첩때문에 버튼에 걸린 이벤트들을 제거
		$(".ctrl.plus").off("click");
		$(".ctrl.minus").off("click");
		$(".addrBtn").off("click");
		
		//다시 이벤트 핸들링
 		$(".ctrl.minus").on("click", function(){
			$(this).parents("table").remove();
			
			if($("table").length<5){
				$(".ctrl.plus").attr("disabled",false);
			}
			if($("table").length==1){
				$(".ctrl.minus").attr("disabled",true);
			}
			if($("table").length>1){
				$(".ctrl.minus").attr("disabled",false	);
			}
			
			//테이블 커스텀 속성 데이터 부여
			$("table").each(function(idx){
				$(this).attr("data-table-no",idx+1);
				$(this).find(".addrName").attr("name","addrname"+(idx+1));
				$(this).find(".recipient").attr("name","recipient"+(idx+1));
				$(this).find(".phone").attr("name","phone"+(idx+1));
				$(this).find(".address.post").attr("name","post"+(idx+1));
				$(this).find(".address.main").attr("name","main"+(idx+1));
				$(this).find(".address.ref").attr("name","ref"+(idx+1));
				$(this).find(".address.sub").attr("name","sub"+(idx+1));
			})
		});
		$(".ctrl.plus").on("click",addForm);
		$(".addrBtn").on("click", addrBtn);
		
		//talbe수가 5개가 되면 버튼 비활성화
		if($("table").length==5){
			$(".ctrl.plus").attr("disabled",true);
		}
		if($("table").length>1){
			$(".ctrl.minus").attr("disabled",false	);
		}
		
		//테이블 커스텀 속성 데이터 부여
		$("table").each(function(idx){
			$(this).attr("data-table-no",idx+1);
			$(this).find(".addrName").attr("name","addrname"+(idx+1));
			$(this).find(".recipient").attr("name","recipient"+(idx+1));
			$(this).find(".phone").attr("name","phone"+(idx+1));
			$(this).find(".pin").attr("name","pin"+(idx+1));
			$(this).find(".address.post").attr("name","post"+(idx+1));
			$(this).find(".address.main").attr("name","main"+(idx+1));
			$(this).find(".address.ref").attr("name","ref"+(idx+1));
			$(this).find(".address.sub").attr("name","sub"+(idx+1));
		})
	}
	
	function addrBtn(){
		var $clickedButton = $(this)
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
	                   // document.getElementById("add").value = extraAddr;
	                    $($clickedButton).nextAll(".address.ref").val(extraAddr);
	                
	                } else {
	                    //document.getElementById("add").value = '';
	                	$($clickedButton).nextAll(".address.ref").val('');
	                }

	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                
	                //document.getElementById('postno').value = data.zonecode;
	                $($clickedButton).prev(".address.post").val(data.zonecode);
	                //document.getElementById("address").value = addr;
	                $($clickedButton).nextAll(".address.main").val(addr);
	                // 커서를 상세주소 필드로 이동한다.
	                $($clickedButton).nextAll(".address.sub").val('');
	                $($clickedButton).nextAll(".address.sub").focus();
	            }
	        }).open();
	}
	
 	$("#saveBtn").on("click",function(){

 		if($("input[class=pin]:checked").length==1){
 			
 	       //객체를 담을 배열을 만든다.
 			const AddrList = [];
 			var obj = null;
 			
 			$("table").each(function(idx){
 				//$("input[class=pin]:checked").val()
 				// 만든 객체에 데이터를 넣은 후 배열에 담는다.

 				obj = new Object;
 				obj.memId = "${loginLog.memId}";
 				obj.addrName = $(this).find(".addrName").val();
 				obj.name = $(this).find(".recipient").val();
 				obj.phone = $(this).find(".phone").val();
 				obj.post = $(this).find(".post").val();
 				
 				var adrs = '';
 				adrs += $(this).find(".main").val();
 				
 				if($(this).find(".ref").val()!=''){
 					adrs += ' '+$(this).find(".ref").val();
 				}
 				
 				if($(this).find(".sub").val()!=''){
 					adrs += ' '+$(this).find(".sub").val();
 				}
 				
 				obj.address = adrs;
 				
 				if($(this).find(".pin").val()=='on'){
 					obj.addrPin = 'Y';
 				} else {
 					obj.addrPin = 'N';
 				}
 				
 				AddrList.push(obj);
 			});
 			
 			$.ajax({
 				method : "POST",
 		        url:"${pageContext.request.contextPath}/mypage/address.regist",
 		        data:JSON.stringify(AddrList),
 		        contentType: "application/json; charset=utf-8",
 		        success:(result)=>{
 		        	if(result==$("table").length){
 		        		location.href="${pageContext.request.contextPath}/mypage/address";
 		        	}else {
 		        		alert("데이터가 저장되지 않았습니다.\n다시 시도해 주세요.");
 		        		console.log(AddrList.length);
 		        		console.log($("table").length);
 		        	}

 		        },
 		       	error:(request, status, error)=>{
					alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
				}
 		       });
 			
/*  			var htmlVal='';
 			htmlVal+=`
 			<input type=hidden name="tableno" value="\${$("table").length}">
 			`;
 			$("#addr__form").append(htmlVal);
 			
 			$.ajax({
 				url:"${pageContext.request.contextPath}/mypage/address.regist",
 				method:"post",
 				data:$("#addr__form").serialize(),
 				success:(result)=>{

 					console.log(result);
 				},
 				error:(request, status, error)=>{
 					alert("code : "+request.status+"\nstatus : "+request.responseText+"\nerror : "+error);
 				}
 			}); */
 		} else {
 			alert("기본 배송지를 선택해 주세요.");
 		}
/*  		var isChecked=false;
  		$("input[name=pin]").each(function(){
  			if($(this).prop("checked")){
  				isChecked=true;
  				break;
  			}
 		});  */
	}) 
	
	
	$("#cancleBtn").on("click",function(){
		if(confirm("저장하지 않고 이전 페이지로 돌아가시겠습니까?")){
			location.href="${pageContext.request.contextPath}/mypage/address";
		} 
	})
	</script>
</body>
</html>