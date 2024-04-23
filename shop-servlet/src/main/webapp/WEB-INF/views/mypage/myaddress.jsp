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
<link href="${pageContext.request.contextPath}/resources/css/myaddress.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>

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
			<table class="table">
				<tr>
					<th>주소록고정</th>
					<th>배송지명</th>
					<th>수령인</th>
					<th>휴대전화</th>
					<th>주소</th>
				</tr>
				
			<c:choose>
				<c:when test="${empty addrList}">
					
					<tr>
						<td colspan="5">저장된 배송지가 없습니다.</td>
					</tr>
					
				</c:when>
				<c:otherwise>
				
				<c:forEach items="${addrList}" var="addr">
					<tr>
						<td>
						<c:if test="${addr.addrPin eq 'N'}"><input type="radio" name="pin"></c:if>
						<c:if test="${addr.addrPin eq 'Y'}"><input type="radio" name="pin"  checked="checked"></c:if>
						</td>
						<td><span>${addr.addrName }</span></td>
						<td><span>${addr.name }</span></td>
						<td><span>${addr.phone }</span></td>
						<td><span>${addr.address }</span><br><span>${addr.post }</span></td>
					</tr>
				</c:forEach>

				</c:otherwise>
			</c:choose>

			</table>
			<div class="btn__wrapper">
				<button type="button" id="btnRegist">배송지등록</button>
				<button type="button" id="btnPin">배송지고정</button>
			</div>
			<div class="notice__wrapper">
				<div> 배송주소록 유의사항</div>
				<ul>
					<!-- <li><span>1</span>배송 주소록은 최대 10개까지 등록할 수 있으며, 별도로 등록하지 않을 경우 최근 배송 주소록 기준으로 자동 업데이트 됩니다.</li> -->
					<!-- <li><span>2</span>자동 업데이트를 원하지 않을 경우 주소록 고정 선택을 선택하시면 선택된 주소록은 업데이트 대상에서 제외됩니다.</li> -->
					<!-- <li><span>3</span>배송지 고정은 1개만 저장됩니다. 다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.></li> -->
					<li><span>1</span>배송 주소록은 최대 5개까지 등록할 수 있습니다.</li>
					<li><span>2</span>주소록 고정 선택을 선택하시면 선택된 주소록이 기본 배송지로 등록됩니다.</li>
					<li><span>3</span>다른 배송지를 기본 배송지로 설정하시면 기본 배송지가 변경됩니다.></li>
				</ul>
			</div>	
		</div>
	</div>
	<div class="footer__wrapper">
		<%@ include file="/WEB-INF/views/common/footer.jsp" %>
	</div>
	<%@ include file="/WEB-INF/views/common/js/directBtn.jsp" %>
	<script>
		$("#btnRegist").on("click",()=>{
			location.href="${pageContext.request.contextPath}/mypage/address.regist"
		})
	</script>
</body>
</html>