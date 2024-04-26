<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <section class="product__header">
			<div class="header__left">
				<img src="" onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/resources/images/errorimage.png';">
			</div>
			<div class="header__right">
				<div class="product__content">
					<h2>[MADE] 업 아킨 소프트 세미오버 코튼셔츠 (4color)</h2>
					<p>
						(자체제작 / 당일발송) 부드러운 착용감과 데일리한 세미오버 실루엣이에요:) 컬러감도 너무 좋습니다 !
						
						Check Point
						-부드럽고 편안한 착용감
						-바이오워싱 가공
						-네츄럴한 세미오버핏
						-레이어드 활용 가능
						-유니크한 컬러 구성
						-원포켓 디테일
						
						Size
						Free(100~105) 총기장 77/82cm 어깨 51cm 가슴 60cm 소매 61cm
						(해당 실측은 단면으로 측정한 사이즈이며, 측정 방법에 따라 1~3cm 차이가 발생할 수 있습니다)
						
						Fabric - 코튼 100%
						
						Model INFO
						178 cm / 68 kg (평소 상의 105착용 / 하의 30~31착용)
						
						모델 - Free(100~105) 착용
					</p>
				</div>
				<table class="product__option">
					<tr>
						<th>판매가</th>
						<td><span id="product__price">32,900</span>원</td>
					</tr>
					<tr>
						<th>Color</th>
						<td>
						<button class="product__color" type="button">블랙</button>
						<button class="product__color" type="button">그레이</button>
						<button class="product__color" type="button">블루</button>
						</td>
					</tr>
					<tr>
						<th>Size</th>
						<td>
						<button class="product__size" type="button" disabled>Free</button>
						<button class="product__size" type="button" disabled>M</button>
						<button class="product__size" type="button" disabled>L</button>
						<button class="product__size" type="button" disabled>XL</button>
						</td>
					</tr>
				</table>
				<ul class="choice__option">
				</ul>
				<div class="option__total">
				TOTAL(수량):<span id="total__price">0</span>원(<span id="total__count">0</span>개)
				</div>
				<div class="btn__wrapper">
					<div><button id="btn__payment">BUY IT NOW</button></div>
					<div>
						<button id="btn__cart">ADD TO CART</button>
						<button id="btn__wishlist">WISH LIST</button>
					</div>
				</div>
			</div>
		</section>
		
		<script>
	//제품 가격 텍스트 슬라이싱
	const price = $("#product__price").text();
	const numPrice = parseInt(price.replace(",",""));

	$("button[class=product__color]").on("click",function(){

		// 형제 버튼의 selected 속성을 제거한다.
		$(this).siblings().removeClass("selected");
		
		// selected 클래스를 토글한다.
		$(this).toggleClass("selected");
		
		// 선택되어있으면 사이즈 버튼들 활성화한다.
		if($(this).hasClass("selected")){
			$("button[class=product__size]").attr("disabled",false);
		}
		
		// 선택되어있지않으면 사이즈 버튼들 비활성화한다.
		if(!$(this).hasClass("selected")){
			$(".product__size").attr("disabled",true);
		}
		
		// 사이즈 버튼이 활성화 되어있으면 비활성화 한다.
		if($(".product__size.selected").length>0){
			$(".product__size.selected").removeClass("selected");
		}
		
	});
	
	$("button[class=product__size]").on("click",function(){
		
		//형제 버튼의 selected 속성을 제거한다.
		$(this).siblings().removeClass("selected");
		
		// selected 클래스를 토글한다.
		$(this).toggleClass("selected");
		
		// 색상과 사이즈가 선택되어 있으면 옵션리스트에 아이템을 추가한다.
		if($(".product__size.selected").length>0&&$(".product__color.selected").length>0){
			//선택한 색상
			var color = $(".product__color.selected").text();
			//선택한 사이즈
			var size = $(".product__size.selected").text();
			
			//해당 선택요소가 옵션리스트에 있는지 확인한다.
			if($(".option."+color+"."+size).length>0){
				alert("리스트에 이미 선택된 옵션이 존재합니다.\n삭제 후 다시 선택해주세요.")
			} else {
				//해당요소가 없다면 추가한다.
					
				//total에 수량과 가격을 합산한다.
				var totalPrice = $("#total__price").text();
				if(totalPrice=='0'){
					$("#total__price").text(price);
				} else{
					var numTotalPrice = parseInt(totalPrice.replace(",",""));
					var sumPrice = numPrice+numTotalPrice;
					$("#total__price").text(sumPrice.toLocaleString('ko-KR'));
				}
				
				var totalCount = parseInt($("#total__count").text());
				if(totalPrice==0){
					$("#total__count").text(1);
				} else{
					$("#total__count").text(++totalCount);
				}
				
				
				//추가할 아이템 html 태그들
				var htmlVal='';
				htmlVal+=`
					<li class="option \${color} \${size}">
						<div class="option__left">
							<p>
							[MADE] 업 아킨 소프트 세미오버 코튼셔츠 (4color)
							<br>
							 - 
							<span class="color">\${color}</span>/<span class="size">\${size}</span>
							</p>
						</div>
						<div class="option__mid">
							<div>
								<input type="text" class="option__count" value="1" readonly>
								<button type="button" class="count up">&#94;</button>
								<button type="button"  class="count down">&#94;</button>
							</div>
							<button  type="button" class="option__delete">x</button>
						</div>
						<div class="option__right">
							<span class="option__price">\${price}</span>원
						</div>
					</li>
				`;
				$(".choice__option").append(htmlVal);
				
				//이벤트 핸들링
				$(".option__delete").off("click",btnOptionDelete).on("click",btnOptionDelete);
				$(".count.up").off("click",btnCountUp).on("click",btnCountUp);
				$(".count.down").off("click",btnCountDown).on("click",btnCountDown);
			}
			
		}
	});
	
	$(".option__delete").on("click",btnOptionDelete);
	
	$(".count.up").on("click",btnCountUp);
	
	$(".count.down").on("click",btnCountDown);
	
	function btnOptionDelete(){
		$(this).parents(".option").remove();
		
		//현재 아이템의 가격과 수량을 가져옵니다.
		var itemCount = parseInt($(this).parent().find(".option__count").val());
		var itemPrice = $(this).parent().next().children(".option__price").text();
		var numItemPrice = parseInt(itemPrice.replace(",",""));

		//total에 수량과 가격을 합산합니다.
		var totalPrice = $("#total__price").text();
		var numTotalPrice = parseInt(totalPrice.replace(",",""));
		var sumPrice = numTotalPrice-numItemPrice;
		$("#total__price").text(sumPrice.toLocaleString('ko-KR'));

		var totalCount = parseInt($("#total__count").text())-itemCount;
		$("#total__count").text(totalCount);
	}
	
	function btnCountUp(){
		var num = parseInt($(this).prevAll(".option__count").val());
		
		if(num<99){
			$(this).prevAll(".option__count").val(++num);
			
			//현재 아이템의 가격을 가져와서 합산합니다.
			var $optionPrice = $(this).parents(".option__mid").next().children(".option__price");
			var itemPrice = $optionPrice.text();
			var numItemPrice = parseInt(itemPrice.replace(",",""));
			var modPrice = numItemPrice+numPrice;
			$optionPrice.text(modPrice.toLocaleString('ko-KR'));


			//total에 수량과 가격을 합산합니다.
			var totalPrice = $("#total__price").text();
			var numTotalPrice = parseInt(totalPrice.replace(",",""));
			var sumPrice = numTotalPrice+numPrice;
			$("#total__price").text(sumPrice.toLocaleString('ko-KR'));

			var totalCount = parseInt($("#total__count").text());
			$("#total__count").text(++totalCount);
			
		} else {
			alert("최대 선택 수량은 99개 입니다.");
		}
	}
	
	function btnCountDown(){
		var num = parseInt($(this).prevAll(".option__count").val());
		if(num>1){
			$(this).prevAll(".option__count").val(--num);
			
			//현재 아이템의 가격을 가져와서 합산합니다.
			var $optionPrice = $(this).parents(".option__mid").next().children(".option__price");
			var itemPrice = $optionPrice.text();
			var numItemPrice = parseInt(itemPrice.replace(",",""));
			var modPrice = numItemPrice-numPrice;
			$optionPrice.text(modPrice.toLocaleString('ko-KR'));


			//total에 수량과 가격을 합산합니다.
			var totalPrice = $("#total__price").text();
			var numTotalPrice = parseInt(totalPrice.replace(",",""));
			var sumPrice = numTotalPrice-numPrice;
			$("#total__price").text(sumPrice.toLocaleString('ko-KR'));

			var totalCount = parseInt($("#total__count").text());
			$("#total__count").text(--totalCount);
			
		} else {
			alert("최소 선택 수량은 1개 입니다.");
		}
	}
	
</script>