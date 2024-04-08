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
.footer__wrapper {
	display: flex;
	flex-direction: column;
}
.footer__wrapper .footer__top{
	display:flex;
	flex-direction: row;
	height : 60px;
	align-items:center;
	border-top: 1px solid black;
	border-bottom: 1px solid black;
	padding: 0 100px 0 50px;
}

.footer__wrapper .footer__top a{
	padding-right: 20px;
	cursor: pointer;
}

.footer__wrapper .footer__mid{
	display: flex;
	flex-direction: row;
	height : 275px;
	padding: 61px 100px 0 50px;
}

.footer__wrapper .footer__mid div:nth-child(1){
	width: 280px;
	padding-right: 80px;
}

.footer__wrapper .footer__mid div:nth-child(2){
	width: 280px;
	padding-right: 80px;
}

.footer__wrapper .footer__mid div:nth-child(3){
	min-width: 420px;
	padding-right: 80px;
}

.footer__wrapper .footer__mid div:nth-child(4){
}

.footer__wrapper .footer__bottom{
	height:70px;
	padding: 0 100px 0 50px;
	display:flex;
	flex-direction:row;
	justify-content: space-between;
	align-items: center;
	background: #f9f9f9;
}

.footer__wrapper p {
	font-size: 10px;
	color: #737373;
}

.footer__wrapper h3 {
	font-size: 14px;
}

.footer__wrapper h4 {
	font-size: 10px;
}
</style>
</head>
<body>
<div class="footer__wrapper">
	<div class="footer__top">
		<a>HOME</a>
		<a>COMEPANY</a>
		<a>AGREEMENT</a>
		<a>PRIVACY POLICY</a>
		<a>GUIDE</a>
	</div>
	<div class="footer__mid">
		<div>
			<h4>C/S CENTER</h4>
			<h3>070-7777-4505</h3>
			<p>
				mon-fri am 11:00 - 17:00<br>
				lunch pm 01:00 - 02:00<br>
				sat.sun.holiday closed
			</p>
		</div>
		<div>
			<h4>ACCOUNT</h4>
			<p>
				국민 695002-02-260094
				holder:우진배
			</p>
		</div>
		<div>
			<h4>RETURN/EXCHANGE</h4>
			<p>
				교환/반품주소 : (07806) 서울시 강서구 공항대로222 발산W타워 918호 업노멀<br>
				※ 고객센터 통하여 먼저 접수 후 상품을 보내주셔야하며,<br>
				지정택배사를 이용해주시기 바랍니다.<br><br>
				CJ대한통운 1588-125 <a>[배송조회하기]</a>
			</p>
		</div>
		<div>
			<h2><a></a></h2>
			<p>
				COMPANY : 업노멀　OWNER : 배진우　TEL : 070-8777-5404　ADDRESS : 07806 서울특별시 강서구 공항대로 222 (마곡동) 발산W타워 918호 업노멀
				BUSINESS LICENSE : 190-02-00501　ONLINE ORDER LICENSE : 2016-서울강서-1097　[사업자정보확인]
				CHIEF PRIVACY OFFICER : 배진우　E-MAIL : upnormal@naver.com
				HOSTING BY 카페24(주)
			</p>
		</div>
	</div>
	<div class="footer__bottom">
		<div><p>copyright (c) 업노멀 all rights reserved. design by daydesign.</p></div>
		<div></div>
	</div>
</div>
</body>
</html>