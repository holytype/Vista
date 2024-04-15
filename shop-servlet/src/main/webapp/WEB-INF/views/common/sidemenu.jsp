<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

		<div class="sidemenu">
			<h1><a class="sidemenu__logo">UPNORMAL</a></h1>
			<div class="sidemenu__topmenu">
				<div>
					<c:choose>
						<c:when test="${empty loginLog }">
						<a href="${pageContext.request.contextPath }/login">LOGIN</a>
						</c:when>
						<c:otherwise>
						<a href="#" onclick="logoutFunction(); return false;">LOGOOUT</a>
						</c:otherwise>
					</c:choose>
					<a href="${pageContext.request.contextPath }/joinus">JOIN US</a><span>+2,000</span>
				</div>
				<div>
					<a>ORDER</a><a>MY PAGE<span></span></a><a>DELEVIERY</a>
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
				<div class="sidemenu__category">
				<span>CATEGORY</span>
					<a>NEW</a>
					<a>BEST_30</a>
					<a>OUTER</a>
					<a>SHIRTS</a>
					<a>TOP</a>
					<a>BOTTOM</a>
					<a>SHOES</a>
					<a>ACC</a>
				</div>
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