<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin:0;
	padding:0;
	border:0;
	box-sizing: border-box;
}

.body__wrapper{
	padding-left: 300px;
	background: purple;
	width: 100%;
	height: 5000px;
}

.sidemenu__wrapper {
	position: relative;
}

.sidemenu {
	position: fixed;
	padding: 50px;
	background: #dedee0;
	height:100%;
	width: 300px;
	display: flex;
	flex-direction: column;
}

.sidemenu__topmenu {
	margin-top: 10px;
}

.sidemenu__topmenu a{
	margin-right: 10px;
}

.sidemenu__searchbox{
	margin-top: 10px;
}

.sidemenu__midmenu{
	margin-top: 10px;
	display:flex;
	flex-direction: row;
	justify-content: space-between;
}

.sidemenu__category{
	display:flex;
	flex-direction: column;
}

.sidemenu__board{
	display:flex;
	flex-direction: column;
}

.sidemenu__info{
	margin-top:10px;
}

p, .sidemenu__topmenu a, .sidemenu__midmenu a {
	font-size: 10px;
	color: #737373;
}

.sidemenu__info h3 {
	font-size: 14px;
}

.sidemenu__info h4 {
	font-size: 10px;
}

</style>
</head>
<body>
<div>
	<div class="sidemenu__wrapper">
		<div class="sidemenu">
			<h1><a class="sidemenu__logo">UPNORMAL</a></h1>
			<div class="sidemenu__topmenu">
				<div>
					<a>LOGIN</a><a>JOIN US</a><span>+2,000</span>
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
	</div>
	<div class="body__wrapper"></div>
</div>
</body>
</html>