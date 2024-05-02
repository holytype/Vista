<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

		<div class="sidemenu">
			<h1><a class="sidemenu__logo" href="${pageContext.request.contextPath }/main"></a></h1>
			<div class="sidemenu__topmenu">
				<div>
					<c:choose>
						<c:when test="${empty loginLog }">
						<a href="${pageContext.request.contextPath }/login">LOGIN</a>
						<a href="${pageContext.request.contextPath }/joinus">JOIN US</a>
						</c:when>
						<c:otherwise>
						<a href="#" onclick="logoutFunction(); return false;">LOGOUT</a>
						<c:if test="${loginLog.memAuth==0 }">
								<a href="${pageContext.request.contextPath }/manager">MANAGER</a>
						</c:if>
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<a href="${pageContext.request.contextPath }/myorder">ORDER</a>
					<c:if test="${!empty loginLog }">
					<a href="${pageContext.request.contextPath }/mypage">MY PAGE<span></span></a>
					</c:if>
					<a href="https://www.doortodoor.co.kr/parcel/pa_004.jsp" target="_blank">DELIVERY</a>
				</div>
			</div>
			<div class="sidemenu__searchbox">
				<div class="sidemenu__search" autocomplete="off">
					<input type="text">
					<div><a></a><span></span></div>
				</div>
				<div class="sidemenu__cart"><a></a></div>
			</div>
			<div class="sidemenu__midmenu">
				<ul class="sidemenu__category">
				<li><span>CATEGORY</span></li>
					<c:forEach items="${menuCategory}" var="category">
					<li><a href="${pageContext.request.contextPath }/${fn:toLowerCase(category)}">${category }</a></li>
					</c:forEach>
				</ul>
				<div class="sidemenu__board">
				<span>BOARD</span>
					<a>NOTICE</a>
					<a>Q&A</a>
					<a>REVIEW</a>
					<a>MEMBERSHIP</a>
				</div>
			</div>
			<div class="sidemenu__info">
				<h4>-C/S CENTER</h4>
				<h3>070-7777-4505</h3>
				<p>
				mon-fri am 11:00 - 17:00
				lunch pm 01:00 - 02:00
				sat.sun.holiday closed
				</p>
			</div>
		</div>
		<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
		<script>
		function logoutFunction(){
			$.ajax({
				url: "${pageContext.request.contextPath}/logout",
				method: "post",
				success: ()=>{
					location.href="${pageContext.request.contextPath}/main";
				}
			});
		}
		</script>